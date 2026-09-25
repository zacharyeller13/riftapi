M.layout = {}

---@return boolean|nil
---@return string|nil
function M.layout.ascend()
    return M.execute({ layout = "ascend" })
end

---@return boolean|nil
---@return string|nil
function M.layout.descend()
    return M.execute({ layout = "descend" })
end

---@param direction "left"|"right"|"up"|"down"
---@return boolean|nil
---@return string|nil
function M.layout.move_node(direction)
    local cmd = { layout = { move_node = direction } }
    return M.execute(cmd)
end

---@param direction "left"|"right"|"up"|"down"
---@return boolean|nil
---@return string|nil
function M.layout.join_window(direction)
    local cmd = { layout = { join_window = direction } }
    return M.execute(cmd)
end

---@return boolean|nil
---@return string|nil
function M.layout.toggle_stack()
    return M.execute({ layout = "toggle_stack" })
end

---@return boolean|nil
---@return string|nil
function M.layout.toggle_orientation()
    return M.execute({ layout = "toggle_orientation" })
end

---@return boolean|nil
---@return string|nil
function M.layout.unjoin()
    return M.execute({ layout = "unjoin_windows" })
end

---@return boolean|nil
---@return string|nil
function M.layout.toggle_focus_float()
    return M.execute({ layout = "toggle_focus_floating" })
end

---@param delta number
---@return boolean|nil
---@return string|nil
function M.layout.adjust_master_ratio(delta)
    local cmd = { layout = { adjust_master_ratio = delta } }
    return M.execute(cmd)
end

---@param delta integer
---@return boolean|nil
---@return string|nil
function M.layout.adjust_master_count(delta)
    local cmd = { layout = { adjust_master_count = { delta = delta } } }
    return M.execute(cmd)
end

---@return boolean|nil
---@return string|nil
function M.layout.promote_to_master()
    return M.execute({ layout = "promote_to_master" })
end

---@return boolean|nil
---@return string|nil
function M.layout.swap_master_stack()
    return M.execute({ layout = "swap_master_stack" })
end

---@param a { idx: integer, pid: integer } e.g. `{ pid: 123, idx: 456 }`
---@param b { idx: integer, pid: integer } e.g. `{ pid: 123, idx: 456 }`
---@return boolean|nil
---@return string|nil
function M.layout.swap_windows(a, b)
    local cmd = { layout = { swap_windows = { a, b } } }
    return M.execute(cmd)
end

---@param delta number
---@return boolean|nil
---@return string|nil
function M.layout.scroll_strip(delta)
    local cmd = { layout = { scroll_strip = { delta = delta } } }
    return M.execute(cmd)
end

---@return boolean|nil
---@return string|nil
function M.layout.snap_strip()
    return M.execute({ layout = "snap_strip" })
end

---@return boolean|nil
---@return string|nil
function M.layout.center_selection()
    return M.execute({ layout = "center_selection" })
end
