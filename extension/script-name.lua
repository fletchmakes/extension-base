-- MIT License

-- Copyright (c) 2021 David Fletcher

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

-----------------------------------
-- USER DEFINED PREFERENCES
-----------------------------------
-- In this file, we receive a reference to the table plugin.preferences (from ./plugin.lua).
-- In Lua, when a parameter is a table, it is passed by reference.
-- This allows us to mutate the parameter, and the original object will be mutated as well;
-- Thus, we do not need to have a "return value" from this script
-----------------------------------
-- If you need to stage edits to the preferences table, but don't want them saved in certain situations,
-- consider creating a deep copy of the preferences table at the start of your script,
-- editing the copy, and if you'd like to save your changes, deep copy the edited copy you made, and
-- save it back to the original preferences table; an implementation of a deep copy function
-- can be found in ./helpers.lua
-----------------------------------
local prefs = ...
if (prefs == nil) then
    prefs = {}
end

-- define your custom script below
app.alert("hello world!")
