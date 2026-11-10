local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Log = require(ReplicatedStorage.Common.Log)

local function Start()
	Log.info("Hello from TestService!")
end

Start()
return nil
