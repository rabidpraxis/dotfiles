return function()
  vim.g['test#strategy'] = 'tslime'
  vim.g['test#preserve_screen'] = 0
  vim.g['test#ruby#rspec#options'] = {
    'file', '--format documentation'
  }
end
