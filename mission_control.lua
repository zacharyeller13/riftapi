M.mission_control = {}

---@return boolean|nil
---@return string|nil
function M.mission_control.show_all()
    return M.execute_legacy('{"Reactor":"show_mission_control_all"}')
end

---@return boolean|nil
---@return string|nil
function M.mission_control.show_current()
    return M.execute_legacy('{"Reactor":"show_mission_control_current"}')
end

---@return boolean|nil
---@return string|nil
function M.mission_control.dismiss()
    return M.execute_legacy('{"Reactor":"dismiss_mission_control"}')
end
