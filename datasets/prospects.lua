local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")

local function SetTeam(teamName)
    replicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", teamName)
end

local function movePlayer(destination, duration)
    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
        local tweenGoal = { CFrame = destination }
        local tween = tweenService:Create(humanoidRootPart, tweenInfo, tweenGoal)
        tween:Play()
        tween.Completed:Wait()
    else
        warn("HumanoidRootPart not found. Character may not be loaded.")
    end
end

local startPosition = CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828)
local endPosition = CFrame.new(-474.928925, 150.898499, 312.700775, -0.0384129211, 0.0390699878, 0.998497844, 1.75728928e-07, 0.999235392, -0.0390988514, -0.999261975, -0.0015017027, -0.0383835621)

local function TravelToDressrosa()
    replicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
