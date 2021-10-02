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
-- DEEPCOPY FUNCTION (from http://lua-users.org/wiki/CopyTable)
-----------------------------------
-- param: orig - any Lua value (table or otherwise) that should be copied and returned
-- returns: an exact copy of the original value
-----------------------------------
-- This function is extremely useful if you need to stage edits to a table, but
-- roll them back if there was an error or if the user cancelled the action.
-- Create a copy of the table you want to edit, edit the copy, and then do nothing
-- if the changes should be ignored; but if the changes should be saved, deep copy the
-- edited copy again, and set that equal to the original value you were trying to edit.
-----------------------------------
local function deepcopy(orig)
    -- http://lua-users.org/wiki/CopyTable
    local orig_type = type(orig)
    local copy

    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end

        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end

    return copy
end

-----------------------------------
-- CREATE ERROR DIALOG
-----------------------------------
-- param: str - a string value that will be displayed to the user (usually an error message)
-- param: dialog - the Dialog object (if any) that spawned this error message
-- param: exit - a boolean value; 0 to keep dialog open, and 1 to close dialog
-----------------------------------
-- This function creates a simple dialog window that will alert the user of an error that occured.
-- If you call this from a Dialog function, you can optionally close the dialog to end user interaction
-- and prevent further errors (making the user try again).
-----------------------------------
local function create_error(str, dialog, exit)
    app.alert(str)
    if (exit == 1) then dialog:close() end
end

-----------------------------------
-- CREATE CONFIRM DIALOG
-----------------------------------
-- param: str - a string value that will be displayed to the user (usually a question if they'd like to confirm an action)
-- returns: true, if the user clicked "Confirm"; nil, if the user clicked "Cancel" or closed the dialog
-----------------------------------
-- This function creates a simple dialog window that will display a message, along with two buttons: "Cancel" and "Confirm".
-- You can observe whether or not the user closed the dialog in this way:
-- local confirmed = create_confirm("Would you like to continue?")
-- if (not confirmed) then
-- end
-----------------------------------
local function create_confirm(str)
    local confirm = Dialog("Confirm?")

    confirm:label {
        id="text",
        text=str
    }

    confirm:button {
        id="cancel",
        text="Cancel",
        onclick=function()
            confirm:close()
        end
    }

    confirm:button {
        id="confirm",
        text="Confirm",
        onclick=function()
            confirm:close()
        end
    }

    -- show to grab centered coordinates
    confirm:show{ wait=true }

    return confirm.data.confirm
end