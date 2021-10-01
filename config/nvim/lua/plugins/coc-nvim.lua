return function()
  node_path = os.getenv("NODE_EXEC_PATH")
  if node_path then
    vim.g.coc_node_path = node_path
  end
end
