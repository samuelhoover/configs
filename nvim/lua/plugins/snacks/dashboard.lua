return {
  enabled = true,
  preset = {
    header = [[


                              ██                              
                              ████                            
                               ███                            
                                ███                           
                                ████                          
     ██                 ███      ████                         
   ▓████               ███████    ████              ██    ▒   
    ████               ███████    ████▓            ▓███ ▒██   
     ███               ███████    ████▓            ████████   
     ██▓                ▓█████   ▓█████         ████████▓     
   ▓█████               ███████████████          ████         
    ███████            ███████████████              ██        
   ████████          █████████████████           ███████▒     
   ██████████████▓ ███████████████████     ▓██████████████    
 ███████████████████████████████████████████████████████████  
 █████████████████████████████████████████████████████████████
██████████████████████████████████████████████████████████████
██████████████████████████████████████████████████████████████
██████████████████████████████████████████████████████████████
    ]],
  },
  sections = {
    { section = "header", height = 16, width = 10 },
    {
      icon = " ",
      title = "Keymaps",
      section = "keys",
      indent = 2,
      padding = 1,
    },
    {
      icon = " ",
      title = "Recent Files",
      section = "recent_files",
      indent = 2,
      padding = 1,
    },
    -- {
    --   icon = " ",
    --   title = "Projects",
    --   section = "projects",
    --   indent = 2,
    --   padding = 1,
    -- },
    {
      section = "terminal",
      cmd = "curl -s 'wttr.in/Cambridge,MA,USA?0u'",
      indent = 15,
    },
    { section = "startup" },

    function()
      local in_git = Snacks.git.get_root() ~= nil
      local cmds = {
        {
          title = "Git Graph",
          icon = " ",
          cmd = [[echo -e "$(git-graph --style round --color always --wrap 48 0 8 -f 'oneline')"]],
          indent = 0,
          height = 53,
        },
      }
      return vim.tbl_map(function(cmd)
        return vim.tbl_extend("force", {
          pane = 2,
          section = "terminal",
          enabled = function()
            return in_git and vim.o.columns > 130
          end,
          padding = 1,
          -- ttl = 5 * 60,
        }, cmd)
      end, cmds)
    end,
  },
}
