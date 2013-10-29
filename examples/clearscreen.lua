local linenoise = require("linenoise")
local line
print("Hello!")
print("Type 'clear' to clear the screen")
while true do
    line = linenoise.linenoise(">>> ")
    if line then
        if line == "clear" then
            linenoise.linenoiseClearScreen()
        else
            print("You said: '" .. line .. "'")
        end
    else
        print("Bye!")
        break
    end
end
