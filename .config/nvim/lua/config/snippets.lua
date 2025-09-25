local ls = require("luasnip")
ls.add_snippets(
    -- Define snippets for LaTeX
    "tex",
    {
        -- \emph{}
        ls.snippet("em", {
            ls.t("\\emph{"),
            ls.i(1), -- Placeholder for user input
            ls.t("}"),
        }),

        -- \texttt{}
        ls.snippet("tt", {
            ls.t("\\texttt{"),
            ls.i(1), -- Placeholder for user input
            ls.t("}"),
        }),

        -- \textit{}
        ls.snippet("it", {
            ls.t("\\textit{"),
            ls.i(1), -- Placeholder for user input
            ls.t("}"),
        }),

        -- \textbf{}
        ls.snippet("bf", {
            ls.t("\\textbf{"),
            ls.i(1), -- Placeholder for user input
            ls.t("}"),
        }),

        -- \ac{}
        ls.snippet("ac", {
            ls.t("\\ac{"),
            ls.i(1), -- Placeholder for user input
            ls.t("}"),
        }),

        -- et\,al.
        ls.snippet("etal", {
            ls.t("et\\,al."),
        }),

        -- e.\,g.,
        ls.snippet("eg", {
            ls.t("e.\\,g.,"),
        }),

        -- i.\,e.,
        ls.snippet("ie", {
            ls.t("i.\\,e.,"),
        }),
    }
)

require("luasnip.loaders.from_vscode").lazy_load()

require("luasnip.loaders.from_vscode").lazy_load({
  paths = { vim.fn.stdpath("config") .. "/snippets" },
})
