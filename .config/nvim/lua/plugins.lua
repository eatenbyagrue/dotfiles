local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'morhetz/gruvbox'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'preservim/tagbar'
  use 'duggiefresh/vim-easydir'
  use 'lervag/vimtex'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
