---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim

local packer = require("packer")
packer.startup(
  {
    -- 所有插件的安装都书写在 function 中
    function()
      -- 包管理器
      use("wbthomason/packer.nvim")

      --  中文文档
      use("yianwillis/vimcdoc")

      --  主题
      use {
        "folke/tokyonight.nvim",
        config = function()
          require("plugin.colorscheme")
        end
      }

      use {
        "kyazdani42/nvim-tree.lua",
        requires = {
          -- 依赖: 图标插件
          "kyazdani42/nvim-web-devicons"
        },
        config = function()
          require("plugin.nvim-tree")
        end
      }
    end,

    config = {
      -- 使用浮动窗口
      display = {
        open_fn = require("packer.util").float
      },

      git = {
        -- default_url_format = "https://hub.fastgit.xyz/%s",
        -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
        -- default_url_format = "https://gitcode.net/mirrors/%s",
        default_url_format = "https://gitclone.com/github.com/%s",
      }
    }
  }
)

-- 实时生效配置
vim.cmd(
  [[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
  ]]
)
