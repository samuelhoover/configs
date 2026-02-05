return {
  "letieu/jira.nvim",
  opts = {
    -- Your setup options...
    jira = {
      base = "https://tristar-ai.atlassian.net", -- Base URL of your Jira instance
      email = "sam@tristar.ai", -- Your Jira email (Optional for PAT)
      token = "ATATT3xFfGF0W4lbhwFYGISRg_NKxYgnDNJfZisDMetpSZ-NfpRHMbHH7NBn7m1wubmsIco17cbB5CFVGO63O6qZb7OgYXwFScUIbhur5zAXg8XMWAf0Sjys-5J02l2_2OF-nxC4JN4SMqsqRVCdMhnFGkKEqGF8oNjOMBqUR5jj-y1rvzmEF0c=6B15B239", -- Your Jira API token or PAT
      type = "basic", -- Authentication type: "basic" (default) or "pat"
      limit = 200, -- Global limit of tasks per view (default: 200)
    },
  },
}
