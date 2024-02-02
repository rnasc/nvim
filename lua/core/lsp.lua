local M = {}

function LaunchLsp()
  local root_dir = '/Users/rogerio/.asdf/installs/nodejs/16.14.0/.npm/bin'

  vim.lsp.start({
    name = 'tsserver',
    cmd = { 'typescript-language-server', '--stdio'},
    root_dir = root_dir
  })
end

return M
