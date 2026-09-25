local rift = require("riftapi")

local function read_config()
    local config_file = ("%s/%s"):format(os.getenv("HOME"), ".config/rift/config.toml")
    local fd, err = io.open(config_file, "r")
    if err ~= nil or fd == nil then
        error(err or "fd is nil")
    end
    -- "animate" key will be the 2nd line
    _ = fd:read()
    local animate = fd:read()
    fd:close()
    return animate
end

---busted
describe("Test config commands #config #needsrift", function()
    local client_ok = rift.get_client()
    if not client_ok then
        ---@diagnostic disable-next-line: missing-parameter
        pending("rift server is not running, skipping dependent tests")
        return
    end

    describe("Test config.get", function()
        it("executes successfully", function()
            local ok, err = rift.config.get()
            assert.True(ok)
            assert.is_nil(err)
        end)
    end)
    describe("Test config.save", function()
        it("executes successfully", function()
            local ok, err = rift.config.save()
            assert.True(ok)
            assert.is_nil(err)
        end)
    end)
    describe("Test config.set", function()
        it("executes successfully", function()
            -- Set allows arbitrary key-value pairs
            local ok, err = rift.config.set("foo", "bar")
            assert.True(ok)
            assert.is_nil(err)
        end)
        it("sets nested keys (settings.animate)", function()
            -- Gets set to true
            local ok, err = rift.config.set("settings.animate", true)
            assert.True(ok)
            assert.is_nil(err)

            ok, err = rift.config.save()
            assert.True(ok)
            assert.is_nil(err)

            local animate = read_config()
            assert.equal("animate = true", animate)

            -- Then gets set to false
            ok, err = rift.config.set("settings.animate", false)
            assert.True(ok)
            assert.is_nil(err)

            ok, err = rift.config.save()
            assert.True(ok)
            assert.is_nil(err)

            animate = read_config()
            assert.equal("animate = false", animate)
        end)
    end)
    describe("Test config.reload", function()
        it("executes successfully", function()
            local ok, err = rift.config.reload()
            assert.True(ok)
            assert.is_nil(err)
        end)
    end)
end)
