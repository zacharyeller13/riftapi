local dkjson = require("riftapi.lib.dkjson")
local M = {}

M.encode = dkjson.encode
M.decode = dkjson.decode

---@class JsonNull
---@type JsonNull
M.null = dkjson.null

---@param strings? string[]
---@return string
function M._json_arr(strings)
    return M.encode(strings or {}) --[[@as string]]
end

---@param v integer|nil
---@return integer|JsonNull
function M._json_opt_int(v)
    return v or M.null
end

---@param v boolean|nil
---@return boolean|JsonNull
function M._json_opt_bool(v)
    if v == nil then
        return M.null
    end
    return v
end

return M
