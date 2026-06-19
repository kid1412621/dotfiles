return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "oxfmt" },
        ["javascriptreact"] = { "oxfmt" },
        -- Add other filetypes like "typescript", "json", etc. as needed
      },
    },
  },
}
