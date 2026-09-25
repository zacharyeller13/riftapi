local rift = require("riftapi")
---busted
describe("Test reactor commands #reactor #needsrift", function()
    local client_ok = rift.get_client()
    if not client_ok then
        ---@diagnostic disable-next-line: missing-parameter
        pending("rift server is not running, skipping dependent tests")
        return
    end

    describe("Test debug_layout_tree", function()
        it("executes successfully", function()
            local ok, err = rift.debug_layout_tree()
            assert.is_true(ok)
            assert.is_nil(err)
        end)
    end)
    describe("Test serialize_state", function()
        it("executes successfully", function()
            local ok, err = rift.serialize_state()
            assert.is_true(ok)
            assert.is_nil(err)
        end)
    end)
    describe("Test toggle_space_activated", function()
        it("executes successfully", function()
            local ok, err = rift.toggle_space_activated()
            assert.is_true(ok)
            assert.is_nil(err)
            -- make sure to return the activated state to what it was before
            rift.toggle_space_activated()
        end)
    end)
end)
