local wezterm = require 'wezterm'

return {
  -- https://wezfurlong.org/wezterm/colorschemes/index.html
  -- 必須条件
  -- 1. 日本語のIME入力中に見やすいこと
  -- 2. リンクが見やすいこと
  color_scheme = "Whimsy",

  font = wezterm.font_with_fallback {
    'Moralerspace Argon NF',
    'MONASPACE ARGON',
    'Fira Code',
    'Source Code Pro',
  },
  font_size = 13.4,
  line_height = 1.1,

  default_cursor_style = 'SteadyBar',

  initial_cols = 100,
  initial_rows = 60,

  window_close_confirmation = 'NeverPrompt',

  keys = {
    -- 横分割
    {
      key = '\\',
      mods = 'CTRL',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- 縦分割
    {
      key = '-',
      mods = 'CTRL',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- ペーンを閉じる
    {
      key = 'w',
      mods = 'CMD',
      action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    -- ペーンセレクトモード
    {
      key='o',
      mods='CTRL',
      action=wezterm.action{ PaneSelect = {} }
    },
  },

  hyperlink_rules = {
    -- Linkify things that look like URLs and the host has a TLD name.
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
      format = '$0',
    },

    -- linkify email addresses
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
      format = 'mailto:$0',
    },

    -- file:// URI
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\bfile://\S*\b]],
      format = '$0',
    },

    -- match the URL with a PORT
    -- such 'http://localhost:3000/index.html'
    {
      regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",
      format = "$0",
    },
  },
}
