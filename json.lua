local dkjson = require("riftapi.lib.dkjson")
local M = {}

---@param s string
---@return string
function M._json_str(s)
    return dkjson.encode(s) --[[@as string]]
end

---@param strings string[]|nil
---@return string
function M._json_arr(strings)
    return dkjson.encode(strings or {}) --[[@as string]]
end

---@param v integer|nil
---@return integer|"null"
function M._json_opt_int(v)
    return v or "null"
end

---@param v boolean|nil
---@return string
function M._json_opt_bool(v)
    return dkjson.encode(v) --[[@as string]]
end

M.encode = dkjson.encode
M.decode = dkjson.decode

return M
