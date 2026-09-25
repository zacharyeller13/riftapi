M.workspace = {}

---@param workspace_id integer 0-based
---@return boolean|nil
---@return string|nil
function M.workspace.switch(workspace_id)
    local cmd = { layout = { switch_to_workspace = workspace_id } }
    return M.execute(cmd)
end

---@param skip_empty? boolean
---@return boolean|nil
---@return string|nil
function M.workspace.next(skip_empty)
    local cmd = { layout = { next_workspace = M.json._json_opt_bool(skip_empty) } }
    return M.execute(cmd)
end

---@param skip_empty? boolean
---@return boolean|nil
---@return string|nil
function M.workspace.prev(skip_empty)
    local cmd = { layout = { prev_workspace = M.json._json_opt_bool(skip_empty) } }
    return M.execute(cmd)
end

---@return boolean|nil
---@return string|nil
function M.workspace.create()
    return M.execute({ layout = "create_workspace" })
end

---@return boolean|nil
---@return string|nil
function M.workspace.last()
    return M.execute({ layout = "switch_to_last_workspace" })
end

---@param workspace_selector integer|string The workspace index or workspace name
---@param follow boolean
---@param window_id? integer e.g. window_server_id from M.query.windows()
---@return boolean|nil
---@return string|nil
function M.workspace.move_window(workspace_selector, follow, window_id)
    local cmd = {
        layout = {
            move_window_to_workspace = { workspace = workspace_selector, follow = follow, window_id = window_id },
        },
    }
    return M.execute(cmd)
end

---@param workspace_id? integer nil = active workspace
---@param mode "traditional"|"bsp"|"stack"|"master_stack"|"scrolling"
---@return boolean|nil
---@return string|nil
function M.workspace.set_layout(workspace_id, mode)
    local cmd = { layout = { set_workspace_layout = { workspace = workspace_id, mode = mode } } }
    return M.execute(cmd)
end
