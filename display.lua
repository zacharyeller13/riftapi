M.display = {}

---@param direction? "left"|"right"|"up"|"down"
---@param index? integer
---@param uuid? string
---@return boolean|nil
---@return string|nil
function M.display.focus(direction, index, uuid)
    if not direction and not index and not uuid then
        return nil, "display.focus requires direction, index, or uuid"
    end
    -- DisplaySelector is an untagged union of Direction|Index|Uuid
    local cmd = { reactor = { focus_display = direction or index or uuid } }
    return M.execute(cmd)
end

---@param index integer
---@return boolean|nil
---@return string|nil
function M.display.move_mouse_to_index(index)
    -- DisplaySelector is an untagged union of Direction|Index|Uuid
    local cmd = { reactor = { move_mouse_to_display = index } }
    return M.execute(cmd)
end

---@param uuid string
---@return boolean|nil
---@return string|nil
function M.display.move_mouse_to_uuid(uuid)
    local cmd = { reactor = { move_mouse_to_display = uuid } }
    return M.execute(cmd)
end

---@param direction? "left"|"right"|"up"|"down"
---@param index? integer one of
---@param uuid? string one of
---@param window_id? integer one of
---@return boolean|nil
---@return string|nil
function M.display.move_window(direction, index, uuid, window_id)
    if not direction and not index and not uuid then
        return nil, "display.move_window requires direction, index, or uuid"
    end
    local cmd =
        { reactor = { move_window_to_display = { selector = direction or index or uuid, window_id = window_id } } }
    return M.execute(cmd)
end
