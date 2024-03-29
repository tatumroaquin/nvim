local status_ok, mason_registry = pcall(require, "mason-registry")
if not status_ok then
	vim.notify([[failed to load mason-registry]])
	return
end

-- https://github.com/mfussenegger/nvim-dap/wiki/Cookbook#making-debugging-net-easier
-- https://stackoverflow.com/questions/77216161/how-to-setup-envs-in-neovim-dap-configs-for-dotnet-c
vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to *.csproj ', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        -- return vim.fn.input('Path to dll file', vim.fn.getcwd(), '/bin/Debug/')
        return vim.fn.input('Path to dll ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end

    return vim.g['dotnet_last_dll_path']
end

local netcoredbg = mason_registry.get_package("netcoredbg")
local server_path = netcoredbg:get_install_path()
vim.notify(server_path)

return {
  name = "coreclr",
  adapter = {
		type = "executable",
    command = server_path .. "/netcoredbg",
    args = {'--interpreter=vscode'}
  },
  configuration = {
    {
			-- cwd = "${workspaceFolder}",
   --    justMyCode = false,
   --    stopAtEntry = false,

      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      -- console = "externalTerminal",
      program = function()
          if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
              vim.g.dotnet_build_project()
          end
          return vim.g.dotnet_get_dll_path()
      end,
      -- env = {
      --   ASPNETCORE_ENVIRONMENT = function()
      --     return "Development"
      --   end,
      --   ASPNETCORE_URLS = function()
      --     return "http://localhost:5050"
      --   end,
      -- },
    },
  }
}
