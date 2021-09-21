-- Paste your license here!

function init(plugin)
    print("Aseprite is initializing YOUR PLUGIN")
  
    plugin:newCommand {
        id="Plugin Name Here",
        title="Plugin Title Here",
        group="GROUP",
        onclick=function()
            local executable = app.fs.joinPath(app.fs.userConfigPath, "extensions", "extension-name", "script-name.lua")
            dofile(executable)
        end
    }
end
  
function exit(plugin)
    print("Aseprite is closing YOUR PLUGIN")
end