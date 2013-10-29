local linenoise = require("linenoise")
local line
print("Hello!")
while true do
    line = linenoise.linenoise(">>> ")
    if line then
        print("You said: '" .. line .. "'")
    else
        print("Bye!")
        break
    end
end
