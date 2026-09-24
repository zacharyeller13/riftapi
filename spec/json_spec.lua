---busted
local json = require("riftapi.json")
describe("Test json module", function()
    describe("Test _json_opt_int", function()
        it("returns 'null' for nil", function()
            assert.equal(json._json_opt_int(nil), json.null)
        end)
        it("returns int for int", function()
            assert.equal(json._json_opt_int(1), 1)
        end)
        it("returns correct nested json with nil", function()
            local a = { a = { b = nil } }
            local b = { a = { b = json.null } }
            local c = { a = { b = json._json_opt_int(nil) } }

            assert.equal(json.encode(a), [[{"a":[]}]])
            assert.equal(json.encode(b), [[{"a":{"b":null}}]])
            assert.equal(json.encode(c), [[{"a":{"b":null}}]])

            assert.are_not.equal(json.encode(a), json.encode(b))
            assert.are_not.equal(json.encode(a), json.encode(c))
            assert.equal(json.encode(b), json.encode(c))
        end)
    end)
    describe("Test _json_opt_bool", function()
        it("returns 'null' for nil", function()
            assert.equal(json._json_opt_bool(nil), json.null)
        end)
        it("returns true/false for true/false", function()
            assert.equal(json._json_opt_bool(true), true)
            assert.equal(json._json_opt_bool(false), false)
        end)
        it("returns correct nested json with false", function()
            local a = { a = { b = false } }
            local b = { a = { b = json._json_opt_bool(false) } }

            assert.equal(json.encode(a), json.encode(b), [[{"a":{"b":false}}]])
        end)
        it("returns correct nested json with true", function()
            local a = { a = { b = true } }
            local b = { a = { b = json._json_opt_bool(true) } }

            assert.equal(json.encode(a), json.encode(b), [[{"a":{"b":true}}]])
        end)
        it("returns correct nested json with nil", function()
            local a = { a = { b = nil } }
            local b = { a = { b = json.null } }
            local c = { a = { b = json._json_opt_bool(nil) } }

            assert.equal(json.encode(a), [[{"a":[]}]])
            assert.equal(json.encode(b), [[{"a":{"b":null}}]])
            assert.equal(json.encode(c), [[{"a":{"b":null}}]])
            assert.equal(json.encode(b), json.encode(c))
            assert.are_not.equal(json.encode(a), json.encode(b))
            assert.are_not.equal(json.encode(a), json.encode(c))
        end)
    end)
    describe("Test _json_arr", function()
        it("returns '[]' for nil", function()
            assert.equal(json._json_arr(nil), "[]")
        end)
        it("returns array of strings for string[]", function()
            assert.equal(json._json_arr({ "a", "b" }), '["a","b"]')
        end)
    end)
    describe("Test encode/decode", function()
        it("encodes nested tables", function()
            assert.equal(
                json.encode({ a = "b", c = { d = { "e", "f" } } }, { keyorder = { "a", "c", "d" } }),
                [[{"a":"b","c":{"d":["e","f"]}}]]
            )
        end)
        it("decodes nested tables", function()
            assert.same(json.decode([[{"a":"b","c":{"d":["e","f"]}}]]), { a = "b", c = { d = { "e", "f" } } })
        end)
    end)
end)
