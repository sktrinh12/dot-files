vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.relativenumber = true


vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"


vim.cmd [[ set noswapfile ]]


-- Function to reload Neovim configuration
function _G.reload_config()
  vim.cmd('source $MYVIMRC') -- Use $MYVIMRC for reliable sourcing of the main init.lua
  vim.notify("Neovim configuration reloaded!", vim.log.levels.INFO) -- Using vim.notify for better feedback
end


-- Set the commentstring for SQL files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.bo.commentstring = "-- %s"
  end,


-- nextflow file type
vim.filetype.add({
  extension = {
    nf = "groovy",
  },
  pattern = {
    [".*%.nf%.test"] = "groovy",
  },
})
