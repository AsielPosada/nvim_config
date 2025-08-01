local gdproject = io.open(vim.fn.getcwd() .. '/project.godot', 'r')
if gdproject then
  local godotcmd = vim.lsp.rpc.connect('127.0.0.1', 6005)
  local godotpipe = '/path/to/godot.pipe' -- I use /tmp/godot.pipe

  vim.lsp.start {
    name = 'Godot',
    cmd = godotcmd,
    root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
    on_attach = function(client, bufnr)
      vim.api.nvim_command('echo serverstart("' .. godotpipe .. '")')
    end,
  }
end
