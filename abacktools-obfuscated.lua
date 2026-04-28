-- =====================================================
-- JOO MUSIC - WindUI Edition (الأكواد مخفية بالكامل)
-- =====================================================

-- تحميل مكتبة WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- تعريف الثيم
WindUI:AddTheme({
    Name = "JOO Theme",
    Accent = Color3.fromHex("#FF4668"),
    Background = Color3.fromHex("#0A0A0A"),
    Outline = Color3.fromHex("#FFFFFF"),
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#1E1E1E"),
    Icon = Color3.fromHex("#FF4668"),
})

-- نافذة رئيسية
local Window = WindUI:CreateWindow({
    Title = "🎵 JOO MUSIC HUB",
    Icon = "music",
    Author = "JOO & Amrke",
    Folder = "JooMusicHub",
    Background = "",
    Size = UDim2.fromOffset(580, 580),
    MinSize = Vector2.new(520, 500),
    MaxSize = Vector2.new(850, 700),
    Transparent = true,
    Theme = "JOO Theme",
    Resizable = true,
    SideBarWidth = 180,
    BackgroundImageTransparency = 1,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function() print("User button clicked") end,
    },
})

-- تخصيص زر الفتح
Window:EditOpenButton({
    Title = "JOO MUSIC 🎧",
    Icon = "music",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("#FF4668"), Color3.fromHex("#FF8C42")),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

-- ==================== دوال أساسية ====================
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Mouse = lp:GetMouse()

-- تشغيل أغنية (سكوتر)
local function playMusic(id, type)
    pcall(function()
        local remote = ReplicatedStorage:WaitForChild("RE",3):FindFirstChild("1NoMoto1rVehicle1s")
        if remote then
            remote:FireServer(type or "SkateBoard")
            task.wait(0.3)
            remote:FireServer("PickingScooterMusicText", tostring(id))
        end
    end)
end

-- الاسم المتلون
local function setRPName(name, bio)
    pcall(function()
        local RE = ReplicatedStorage:WaitForChild("RE", 5)
        if RE then
            local nameEvent = RE:FindFirstChild("1RPNam1eTex1t")
            if nameEvent then
                nameEvent:FireServer("RolePlayName", name)
                task.wait(0.3)
                nameEvent:FireServer("RolePlayBio", bio)
            end
        end
    end)
end

local rainbowActive = true
local function startRainbowName()
    pcall(function()
        local RE = ReplicatedStorage:WaitForChild("RE", 5)
        if not RE then return end
        local colorRemote = RE:FindFirstChild("1RPNam1eColo1r")
        if not colorRemote then return end
        local hue = 0
        task.spawn(function()
            while rainbowActive do
                hue = hue + 0.02
                local color = Color3.fromHSV(hue % 1, 1, 1)
                colorRemote:FireServer("PickingRPNameColor", color)
                colorRemote:FireServer("PickingRPBioColor", color)
                task.wait(0.1)
            end
        end)
    end)
end

setRPName("ⓙⓞⓞ ⓜⓤⓢⓘⓒ ⓗⓤⓑ ⓢⓒⓡⓘⓟⓣ", "Script by JOO & Amrke")
task.wait(0.5)
startRainbowName()

-- ==================== تبويب قائمه رئيسيه ====================
local MainTab = Window:Tab({
    Title = "🏠 قائمه رئيسيه",
    Icon = "home",
    Locked = false,
})

MainTab:Paragraph({
    Title = "📢 رسالة من المطور",
    Text = "اتمنا يعجبكم سكربت و بحاول انشاء الله اخليه احسن\nسكربت لسه تحت إنشاء و انشاء الله بصلح اي مشاكل",
    Locked = false,
})

MainTab:Paragraph({
    Title = "⭐ شكر خاص",
    Text = "JOO & Amrke\nباستخدام WindUI Library",
    Locked = false,
})

-- ==================== تبويب الأغاني (بدون إظهار الأكواد) ====================
local PresetTab = Window:Tab({
    Title = "🎵 قوائم",
    Icon = "music",
    Locked = false,
})

-- دالة إضافة زر مع إخفاء الـ ID تماماً
local function addSong(name, id)
    PresetTab:Button({
        Title = name,
        Desc = "",   -- إخفاء الـ ID
        Locked = false,
        Callback = function() playMusic(id) end
    })
end

-- الأغاني العشوائية
local randomSongs = {
    {"افخم فونك", "17647322226"},
    {"فونك غضب", "115859025716354"},
    {"فونك عالمي", "76578817848504"},
    {"فونك ممتاز", "102402883551679"},
    {"فونك ازعاج", "85682109892034"},
    {"BATTLE OF EGYPT JumpSTYLE", "98965852907043"},
    {"LAZERSTYLERZ MIX", "72205284895340"},
    {"JUMPSTYLE 2003 (SLOWED)", "133557915783857"},
    {"MAYHEM EXEC", "76333126810079"},
    {"LOST", "106586241621814"},
    {"CRYPTDUST.MID", "138397903891342"},
    {"JumpStyling 10.06.08", "99352274208551"},
    {"JUMPSTYLE LORD (SPED UP)", "94533013083491"},
    {"HOLLOW DISTORTION", "106489098327460"},
    {"2004ASHEN BOOTLeG.WEBP", "135881205397136"},
    {"AVENGER", "135881205397136"},
    {"افشخ اغنيه", "121755260609793"},
    {"اغنيه حلوه موت", "82696338249251"},
    {"HEAVENLY JUMPSTYLE (SLOWED + REVERBED)", "124956832051872"},
    {"MONTAGEM TENTA (Slowed)", "95799488312338"},
    {"MONTAGEM E", "73211638025913"},
    {"MONTAGEM DO KARMA (SLOWED)", "79148752172118"},
    {"DJ MONTAGEM FUNK! (8D)", "80640214873696"},
    {"MONTAGEM TSUNAMI GIGANTE", "107424491541808"},
    {"MONTAGEM MARIO", "122192366231455"},
    {"PASSINHO BEM SOLTO", "106185171358009"},
    {"MONTAGEM YOSHO HAI", "126971857595847"},
    {"Midnight Winter", "115590187881251"},
    {"Unknown ID", "98468932764512"},
    {"الآء 20.7", "134763052215450"},
    {"Robot Phonkstep", "105300007125743"},
    {"PPFKT 3345", "119372546759640"},
    {"BASS DA DA DA", "138410854139543"},
    {"HEAVENLY JUMPSTYLE (new)", "139945126932727"},
    {"Better off alone x Slaughter House mix", "112439283898361"},
    {"Hztk 8021", "104704891783894"},
    {"OWTR 7322", "135047699123451"},
    {"The forgotten treasure", "74658666970693"},
    {"Charlie Kirky Funk", "113458227429706"},
    {"坤坤专属（慢速版）", "82944401312241"},
    {"Hunter Eyes", "139957878565852"},
    {"Trillium", "115440201770223"},
    {"#Voyuitwaaien", "123181826801671"},
    {"Unknown 1", "123267035671850"},
    {"Unknown 2", "85341099264298"},
}
for _, song in ipairs(randomSongs) do
    addSong(song[1], song[2])
end

-- الأغاني العربية والمصرية (مع الأغاني الجديدة)
PresetTab:Button({Title = "--- الاغاني العربيه | المصريه ---", Locked = true, Callback = function() end})
local arabicSongs = {
    {"دمرتي حياتي", "124482316940059"},
    {"تصدق كرهتك", "113478978326245"},
    {"اه يا حلو", "93620598835551"},
    {"اكبر غلطه", "127085435747898"},
    {"ليه جي", "92304349905750"},
    {"هات الدكتور", "8776769631"},
    {"علي كيفك", "123487073954032"},
    {"بخطار بس قني بروك", "125693571824719"},
    {"أغنية جديدة 1", "138648345036748"},
    {"أغنية جديدة 2", "113052183515304"},
    {"أغنية جديدة 3", "114316100741483"},
    {"أغنية جديدة 4", "70646100859753"},
}
for _, song in ipairs(arabicSongs) do
    addSong(song[1], song[2])
end

-- الأغاني العراقية
PresetTab:Button({Title = "--- اغاني عراقيه ---", Locked = true, Callback = function() end})
local iraqiSongs = {
    {"راب عراقي 🧩", "116272643488592"},
    {"اخذت بدنيا تعناط ودروس", "112254940188047"},
    {"شراره 🎻", "81023003196738"},
    {"عراقي 🔥", "116815742960163"},
    {"عراقي حب ❤", "105956659839019"},
    {"ميت انا من فراقك", "98313375960954"},
    {"دم حزني", "99123490695024"},
    {"الحجني يا شرطي", "120675895107276"},
    {"ريمكس عراقي", "136909019669593"},
    {"شعر عراقي", "83309655997452"},
    {"ازعاج عراقي", "127840997774724"},
    {"عراقي حزين", "106271890575602"},
    {"عود عراقي", "94546035218751"},
    {"قول الصواري", "135009652401688"},
    {"قررنا رحيلك", "87510423075068"},
    {"تراني سكران 😂", "111811908070601"},
}
for _, song in ipairs(iraqiSongs) do
    addSong(song[1], song[2])
end

-- اغاني سب
PresetTab:Button({Title = "--- اغاني سب ---", Locked = true, Callback = function() end})
local insultSongs = {
    {"سب 1", "91611648163631"},
    {"كشلي امك", "71491005545506"},
    {"سب 2", "131794008455004"},
    {"سب 3", "88304661583351"},
    {"سب 4", "94943308357738"},
}
for _, song in ipairs(insultSongs) do
    addSong(song[1], song[2])
end

-- اغاني اجنبيه
PresetTab:Button({Title = "--- اغاني اجنبيه ---", Locked = true, Callback = function() end})
local foreignSongs = {
    {"اجنبي حزين", "72320758533508"},
    {"my money", "1846687233"},
    {"ريمكس", "120871403922972"},
    {"فونك GTA", "109337680029292"},
    {"فونك قوي", "138361625716987"},
    {"كرسمس", "135528953872601"},
}
for _, song in ipairs(foreignSongs) do
    addSong(song[1], song[2])
end

-- اغاني ازعاج (مع الأغنية الجديدة)
PresetTab:Button({Title = "--- اغاني ازعاج ---", Locked = true, Callback = function() end})
local noisySongs = {
    {"get out", "99796748877356"},
    {"علي البي", "105438850576001"},
    {"ازعاج فونك", "120576436665675"},
    {"ازعاج جديد", "110307806482688"},
}
for _, song in ipairs(noisySongs) do
    addSong(song[1], song[2])
end

-- ==================== تبويب تشغيل يدوي ====================
local ManualTab = Window:Tab({
    Title = "🎧 يدوي",
    Icon = "edit",
    Locked = false,
})

ManualTab:Paragraph({
    Title = "📍 تشغيل أغنية يدوياً",
    Text = "أدخل معرف الأغنية (ID) ثم اضغط تشغيل",
    Locked = false,
})

local musicIdInput = ""
ManualTab:Input({
    Title = "🎵 معرف الأغنية",
    Placeholder = "أدخل الرقم هنا",
    Locked = false,
    Callback = function(value)
        musicIdInput = value
    end
})

ManualTab:Button({
    Title = "▶ تشغيل",
    Desc = "يركب السكوتر ويشغل الأغنية",
    Locked = false,
    Callback = function()
        if musicIdInput == "" then
            StarterGui:SetCore("SendNotification", {Title = "تنبيه", Text = "أدخل معرف الأغنية أولاً", Duration = 3})
            return
        end
        playMusic(musicIdInput)
        StarterGui:SetCore("SendNotification", {Title = "تم التشغيل", Text = "ID: " .. musicIdInput, Duration = 2})
    end
})

-- ==================== تبويب الأدوات ====================
local ToolsTab = Window:Tab({
    Title = "🛠️ الأدوات",
    Icon = "settings",
    Locked = false,
})

local clickTeleportActive = false
local clickConn = nil
local function startClickTeleport()
    if clickConn then clickConn:Disconnect() end
    clickConn = Mouse.Button1Down:Connect(function()
        if not clickTeleportActive then return end
        local target = Mouse.Target
        if target then
            local pos = target.Position
            local char = lp.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(pos.X, pos.Y + 3, pos.Z)
                    hrp.AssemblyLinearVelocity = Vector3.zero
                end
            end
        end
    end)
end
local function stopClickTeleport()
    if clickConn then clickConn:Disconnect(); clickConn = nil end
end
ToolsTab:Button({
    Title = "🔮 تفعيل Click Teleport",
    Desc = "اضغط على أي مكان للانتقال إليه",
    Locked = false,
    Callback = function()
        if clickTeleportActive then
            clickTeleportActive = false; stopClickTeleport()
            StarterGui:SetCore("SendNotification", {Title = "Click Teleport", Text = "تم إيقاف التفعيل", Duration = 2})
        else
            clickTeleportActive = true; startClickTeleport()
            StarterGui:SetCore("SendNotification", {Title = "Click Teleport", Text = "التفعيل نشط! اضغط على أي مكان", Duration = 2})
        end
    end
})

-- ==================== تبويب سكربتات خارجية ====================
local ScriptsTab = Window:Tab({
    Title = "🔥 سكربتات",
    Icon = "zap",
    Locked = false,
})

ScriptsTab:Button({Title = "🔥 VR7 On Top 🔥", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VR7ss/OMK/refs/heads/main/VR7-ON-TOP"))()
end})
ScriptsTab:Button({Title = "🔥 أقوا سكربت صملات 🔥", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zenix-points-AFK-194181"))()
end})
ScriptsTab:Button({Title = "👔 نسخ سكنات (IllusionDev DUELS v3)", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pro628713-arch/Test-nine-hub/main/IllusionDev_DUELS_v3.json"))()
end})
ScriptsTab:Button({Title = "🐭 Mickey Music Stealer", Locked = false, Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Gaurav-0196/Stealer/refs/heads/main/MickeyStealer"))()
end})

-- موسيقى ترحيبية (اختياري)
local SoundService = game:GetService("SoundService")
local welcomeSound = Instance.new("Sound")
welcomeSound.SoundId = "rbxassetid://4503761646"
welcomeSound.Volume = 1
welcomeSound.Looped = false
welcomeSound.Parent = SoundService
welcomeSound:Play()

print("✅ JOO MUSIC (جميع الأكواد مخفية تحت أسماء الأغاني) loaded successfully!")
