local ffi = require("ffi")
local libln = ffi.load("linenoise")

ffi.cdef([[
void free(void *p);
typedef void(linenoiseCompletionCallback)(const char *, void *);
void linenoiseSetCompletionCallback(linenoiseCompletionCallback *);
void linenoiseAddCompletion(void *, char *);
char *linenoise(const char *prompt);
int linenoiseHistoryAdd(const char *line);
int linenoiseHistorySetMaxLen(int len);
int linenoiseHistorySave(char *filename);
int linenoiseHistoryLoad(char *filename);
void linenoiseClearScreen(void);
void linenoiseSetMultiLine(int ml);
]])

function stocharp(s)
    local b = ffi.new("char[?]", #s)
    ffi.copy(b, s)
    return b
end

local linenoise = {}

linenoise.linenoise = function(prompt, history) 
    local line = libln.linenoise(prompt or "")
    if line ~= nil then 
        local s = ffi.string(line)
        ffi.C.free(line)
        return s
    else -- returned NULL
        return nil
    end
end

linenoise.linenoiseHistoryAdd = function (line)
    return libln.linenoiseHistoryAdd(stocharp(line)) == 1
end

linenoise.linenoiseHistorySetMaxLen = function (len) 
    return libln.linenoiseHistorySetMaxLen(len) == 1
end

linenoise.linenoiseHistorySave = function(filename)
    return libln.linenoiseHistorySave(stocharp(filename)) == 0
end

linenoise.linenoiseHistoryLoad = function(filename)
    return libln.linenoiseHistoryLoad(stocharp(filename)) == 0
end

linenoise.linenoiseClearScreen = function ()
    libln.linenoiseClearScreen()
end

linenoise.linenoiseSetCompletionCallback = function (cb)
    libln.linenoiseSetCompletionCallback(function (buf, lc)
        local line = ffi.string(buf)
        cb(line, lc)
    end)
end

linenoise.linenoiseAddCompletion = function (lc, s)
    libln.linenoiseAddCompletion(lc, stocharp(s))
end

return linenoise
