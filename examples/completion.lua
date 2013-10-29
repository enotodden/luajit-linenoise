local linenoise = require("linenoise")

local completion_words = {
    "Hello", 
    "World", 
    "Linenoise",
    "Lua",
    "ABCDEFG",
    "Foo",
    "foo",
    "BAR",
    "bAr"
}

linenoise.linenoiseSetCompletionCallback(function (line, lc) 
    local s, e
    for _, v in ipairs(completion_words) do
        s = string.find(v:lower(), line:lower(), 1)
        if s == 1 then
            linenoise.linenoiseAddCompletion(lc, v)
        end
    end
end)

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
