local ls = require("luasnip")     -- Import LuaSnip
local s = ls.snippet              -- Snippet definition
local t = ls.text_node            -- Static text
local i = ls.insert_node          -- Insertable text

ls.add_snippets("markdown", {     -- Markdown filetype snippets
    s("t", { t("- [ ] "), i(1) }) -- "t" expands to "- [ ] " with cursor after
})
