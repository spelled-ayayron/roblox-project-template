--[=[
	@class UIController
	Creates the UI scope and mounts the example HUD under PlayerGui.
]=]
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.Fusion)
local Log = require(ReplicatedStorage.Common.Log)

local CounterButton = require(script.Parent.Parent.UI.Components.CounterButton)

type Use = (any) -> any

-- Fusion's generic peek doesn't instantiate under the new solver.
local peek = Fusion.peek :: (any) -> any

local UIController = {}

local started = false

--[=[
	Mounts the UI once; later calls do nothing.
	@within UIController
]=]
function UIController.Start()
	if started then
		return
	end
	started = true

	local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
	local scope = Fusion.scoped(Fusion)
	local clicks = scope:Value(0)

	scope:New("ScreenGui")({
		Name = "Hud",
		ResetOnSpawn = false,
		ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = playerGui,
		[Fusion.Children] = CounterButton.new(scope, {
			text = scope:Computed(function(use: Use)
				return `Hello from Fusion! Clicked {use(clicks)} times`
			end),
			onActivated = function()
				clicks:set(peek(clicks) + 1)
			end,
		}),
	})

	Log.debug("Initialized UI under", playerGui:GetFullName())
end

UIController.Start()
return UIController
