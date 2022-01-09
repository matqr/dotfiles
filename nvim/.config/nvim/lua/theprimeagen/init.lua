require("theprimeagen.telescope")
require("theprimeagen.cmp")
require("theprimeagen.lsp")
require("theprimeagen.treesitter")
require("theprimeagen.comment")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
