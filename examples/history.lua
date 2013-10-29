local linenoise = require("linenoise")
local line
linenoise.linenoiseHistoryLoad("example.history")
print("Hello!")
while true do
    line = linenoise.linenoise(">>> ")
    if line then
        print("You said: '" .. line .. "'")
        linenoise.linenoiseHistoryAdd(line)
    else
        print("Bye!")
        break
    end
end
linenoise.linenoiseHistorySave("example.history")

