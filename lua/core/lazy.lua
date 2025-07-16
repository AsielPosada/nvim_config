-- [[ Install and configure lazy.nvim ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim
-- Helper function to automatically load all plugin modules
local function load_plugins()
  local plugins = {}
  -- Get Neovim config path
  local config_path = vim.fn.stdpath('config')
  -- Get all files in plugins directory
  local plugin_path = config_path .. '/lua/plugins'
  local plugin_files = vim.fn.readdir(plugin_path)
  
  for _, file in ipairs(plugin_files) do
    -- Only process .lua files
    if file:match("%.lua$") then
      -- Remove .lua extension and require the module
      local module_name = file:gsub("%.lua$", "")
      table.insert(plugins, require('plugins.' .. module_name))
    end
  end
  
  return plugins
end

require('lazy').setup(load_plugins(), {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
