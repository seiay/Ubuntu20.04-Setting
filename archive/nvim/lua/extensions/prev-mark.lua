require("prev-mark").setup(
  {
    server = {
      port = 8001,
    },
    preview = {
      open_browser = false, -- do not open the browser
      show_url = true, -- show the url in the small window
    },
  }
)

--require("prev-mark").setup(
--  {
--    verbose = false,
--    server = {
--      port = 8000,
--      wait_limit = 1000, -- limit time in ms to wait for server to start
--    },
--    preview = {
--      directory = "<plugin_dir>/.preview", -- directory to place preview temporaly files
--      css = "<plugin_dir>/node/config/preview.css", -- CSS attached to the preview
--      open_browser = true, -- open browser if true, otherwise do not open
--      browse_command = "", -- command to start browser
--      show_url = false, -- show the preview file URL in the small window
--    },
--  }
--)
