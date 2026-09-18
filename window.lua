M.window = {}

---@return boolean|nil
---@return string|nil
function M.window.next()
    return M.execute({ layout = "next_window" })
end

---@return boolean|nil
---@return string|nil
function M.window.prev()
    return M.execute({ layout = "prev_window" })
end

---@param direction "left"|"right"|"up"|"down"
---@return boolean|nil
---@return string|nil
function M.window.focus(direction)
    local cmd = { layout = { move_focus = direction } }
    return M.execute(cmd)
end

---@return boolean|nil
---@return string|nil
function M.window.toggle_float()
    return M.execute({ layout = "toggle_window_floating" })
end

---@return boolean|nil
---@return string|nil
function M.window.toggle_fullscreen()
    return M.execute({ layout = "toggle_fullscreen" })
end

---@return boolean|nil
---@return string|nil
function M.window.toggle_fullscreen_within_gaps()
    return M.execute({ layout = "toggle_fullscreen_within_gaps" })
end

---@param direction "horizontal"|"vertical"|"smart"
---@return boolean|nil
---@return string|nil
function M.window.resize_grow(direction)
    return M.execute({ layout = { resize_window_grow = direction } })
end

---@param direction "horizontal"|"vertical"|"smart"
---@return boolean|nil
---@return string|nil
function M.window.resize_shrink(direction)
    return M.execute({ layout = { resize_window_shrink = direction } })
end

---@param amount number positive = grow, negative = shrink (fraction of current size)
---@return boolean|nil
---@return string|nil
function M.window.resize_by(amount)
    local cmd = { layout = { resize_window_by = { amount = amount } } }
    return M.execute(cmd)
end

---@param window_id? integer
---@return boolean|nil
---@return string|nil
function M.window.close(window_id)
    local cmd = { reactor = { close_window = { window_server_id = M.json._json_opt_int(window_id) } } }
    return M.execute(cmd)
end
