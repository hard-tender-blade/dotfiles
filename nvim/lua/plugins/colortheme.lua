return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false,
  priority = 1000,
  config = function()
    require('github-theme').setup({
      options = {
        styles = {
          comments = 'italic',
          keywords = 'bold',
        },
      },
    })

    vim.cmd('colorscheme github_dark_dimmed') -- or github_light
  end,
}
