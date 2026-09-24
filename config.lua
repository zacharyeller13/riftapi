M.config = {}

---Serialize the config to the rift logs (does not return it to the client)
function M.config.get()
    local cmd = { config = "get_config" }
    return M.execute(cmd)
end

---set arbitrary config key
---@param key string dot-separated path
---@param value any any JSON-serializable value including json.null
---@return boolean|nil
---@return string|nil
function M.config.set(key, value)
    local cmd = { config = { set = { key = key, value = value } } }
    return M.execute(cmd)
end

---Save the current config to file
---@return boolean|nil
---@return string|nil
function M.config.save()
    return M.execute({ config = "save_config" })
end

---Reload the config from file
---@return boolean|nil
---@return string|nil
function M.config.reload()
    return M.execute({ config = "reload_config" })
end
