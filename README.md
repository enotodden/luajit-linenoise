luajit-linenoise - linenoise bindings
=====================================

Simple bindings for [linenoise](https://github.com/antirez/linenoise).


### Dependencies:

Linenoise compiled as a shared library. (See [https://github.com/enotodden/linenoise/Makefile]() for a makefile..)


### Example:

    local linenoise = require("linenoise")
    local line
    while true do
        line = linenoise.linenoise(">>> ")
        if line then
            print("You said: " .. line)
        else
            break
        end
    end

More examples in the `examples/` directory.

### Notes:

- Same function names and arguments as the linenoise C functions, but integer
  return values are converted to boolean.
- `linenoise.linenoise()` returns `nil` instead of `NULL` for convinience.
  (Since `NULL` is truthy)
