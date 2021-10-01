return function()
  vim.g['test#strategy'] = 'dispatch'

  -- vim.g['test#preserve_screen'] = 0
  vim.g['test#ruby#rspec#options'] = {
    'file', '--format documentation --backtrace'
  }
end
