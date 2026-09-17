---@return boolean|nil
---@return string|nil
function M.show_timing()
    return M.execute({ metrics = "show_timing" })
end
