return {
  "ahmedkhalf/project.nvim",
  opts = {
    detection_methods = { "pattern", "lsp" },
    patterns = { ".git", "package.json", "Makefile", ".svn" },
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension("projects")

    -- Replace the default picker with one that cds + restores session on <CR>
    require("telescope").extensions.projects.projects = function(picker_opts)
      picker_opts = picker_opts or {}
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local state = require("telescope.actions.state")
      local entry_display = require("telescope.pickers.entry_display")
      local history = require("project_nvim.utils.history")
      local project = require("project_nvim.project")

      local results = history.get_recent_projects()
      for i = 1, math.floor(#results / 2) do
        results[i], results[#results - i + 1] = results[#results - i + 1], results[i]
      end

      local displayer = entry_display.create({
        separator = " ",
        items = { { width = 30 }, { remaining = true } },
      })

      pickers.new(picker_opts, {
        prompt_title = "Recent Projects",
        finder = finders.new_table({
          results = results,
          entry_maker = function(entry)
            local name = vim.fn.fnamemodify(entry, ":t")
            return {
              display = function(e)
                return displayer({ e.name, { e.value, "Comment" } })
              end,
              name = name,
              value = entry,
              ordinal = name .. " " .. entry,
            }
          end,
        }),
        previewer = false,
        sorter = conf.generic_sorter(picker_opts),
        attach_mappings = function(prompt_bufnr, _)
          actions.select_default:replace(function()
            local selected = state.get_selected_entry(prompt_bufnr)
            if not selected then return end
            actions.close(prompt_bufnr)
            project.set_pwd(selected.value, "telescope")
            require("nvim-tree.api").tree.change_root(selected.value)
            vim.cmd("silent! SessionRestore")
          end)
          return true
        end,
      }):find()
    end
  end,
}
