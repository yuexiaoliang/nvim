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
          -- 设置主题
          vim.cmd([[colorscheme tokyonight]])
        end
      }

      -- 文件树
      use {
        "kyazdani42/nvim-tree.lua",
        requires = {
          -- 依赖: 图标插件
          "kyazdani42/nvim-web-devicons"
        },
        config = function()
          require("keybind.nvim_tree")
        end
      }

      -- 标签页
      use {
        "akinsho/bufferline.nvim", 
        requires = { 
          "kyazdani42/nvim-web-devicons", 
          "moll/vim-bbye" 
        },
        config = function()
          require("plugin.bufferline")
          require("keybind.bufferline")
        end
      }

      -- 状态栏
      use({ 
        "nvim-lualine/lualine.nvim", 
        requires = { "kyazdani42/nvim-web-devicons" },
        config =function()
          require("plugin.lualine")
        end
      })
    end,

    config = {
      -- 使用浮动窗口
      display = {
        open_fn = require("packer.util").float
      },

      -- git 代理
      git = {
        -- default_url_format = "https://hub.fastgit.xyz/%s",
        -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
        -- default_url_format = "https://gitcode.net/mirrors/%s",
        default_url_format = "https://gitclone.com/github.com/%s",
      }
    }
  }
)

-- 修改本文件, 实时生效配置
vim.cmd(
  [[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
  ]]
)
