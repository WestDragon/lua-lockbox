local Stream = require("lockbox.util.stream");
local Digest = require("lockbox.digest.md4");
local String = require("string");

local test = {};
test[""] = "31d6cfe0d16ae931b73c59d7e0c089c0";
test["a"] = "bde52cb31de33e46245e05fbdbd6fb24";
test["abc"] = "a448017aaf21d8525fc10ae87aa6729d";
test["message digest"] = "d9130a8164549fe818874806e1c7014b";
test["abcdefghijklmnopqrstuvwxyz"] = "d79e1c308aa5bbcdeea8ed63df412da9";
test["ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"] = "043f8582f241db351ce627e153e7f0e4";
test["12345678901234567890123456789012345678901234567890123456789012345678901234567890"] = "e33b4ddc9c38f2199c3e7b164fcc0536";

for k,v in pairs(test) do
	local message = k;
	local expected = v;
	local actual = Digest()
					.update(Stream.fromString(k))
					.finish()
					.asHex(); 

	assert(actual == expected, String.format("Test failed! MESSAGE(%s) Expected(%s) Actual(%s)",message,expected,actual));


end

