--[=[
	@class CounterButton
	Fusion component: a rounded text button centred near the top of the screen.
]=]
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.Fusion)

type Scope = Fusion.Scope<typeof(Fusion)>
type UsedAs<T> = Fusion.UsedAs<T>

--[=[
	@interface Props
	@within CounterButton
	.text UsedAs<string> -- label text
	.onActivated () -> () -- called when the button is pressed
]=]
export type Props = {
	text: UsedAs<string>,
	onActivated: () -> (),
}

local CounterButton = {}

--[=[
	Builds the button; destroy it by cleaning up `scope`.
	@param scope Scope -- owns the created instances
	@param props Props
	@return TextButton
	@within CounterButton
]=]
function CounterButton.new(scope: Scope, props: Props): TextButton
	return scope:New("TextButton")({
		Name = "CounterButton",
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.fromScale(0.5, 0.2),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(242, 244, 245),
		Text = props.text,
		TextSize = 28,
		FontFace = Font.fromEnum(Enum.Font.GothamBlack),
		TextColor3 = Color3.fromRGB(96, 97, 98),
		[Fusion.OnEvent("Activated")] = props.onActivated,
		[Fusion.Children] = {
			scope:New("UIPadding")({
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
			}),
			scope:New("UICorner")({ CornerRadius = UDim.new(0, 8) }),
		},
	}) :: TextButton
end

return CounterButton
