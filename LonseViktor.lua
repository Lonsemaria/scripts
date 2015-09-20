--Script Name:LonseViktor
--Script Version:0.01
--Script Author:Ensuluyn
--I'm really new on scripting thats why feel free to give me some feedbacks on forum :)
local version = 0.01
local author = "Ensuluyn"
local SCRIPT_NAME = "LonseViktor"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/Lonsemaria/scripts/master/Zed.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

function Say(text)
  print("<font color=\"#FF0000\"><b>LonseViktor:</b></font> <font color=\"#FFFFFF\">" .. text .. "</font>")
end

if AUTOUPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/Lonsemaria/scripts/master/version/Viktor.version")
  if ServerData then
    ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
    if ServerVersion then
      if tonumber(version) < ServerVersion then
        Say("New version available "..ServerVersion)
        Say("Updating, please don't press F9")
        DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () Say("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
      else
        Say("You have got the latest version (v"..ServerVersion..") of LonseViktor by " .. author)
      end
    end
  else
    Say("Error downloading version info")
  end
end
player = GetMyHero()
if myHero.charName ~= "Viktor" then return
end
local ts,tsq,tsw,tse,tsr
function OnLoad()
 if not RequireSimpleLib() then return end
   Drawdmglib()
   Targetselection()
   Menu()
   findorbwalker()
   print("<font color=\"#00BAE4\"><b> LonseViktor - </b></font><font color=\"#CBF6FF\"> LonseViktor V 1.0 is loaded.Enjoy your time :)")
   print("<font color=\"#00BAE4\"><b> LonseViktor - </b></font><font color=\"#CBF6FF\"> I'm really new on scripting thats why feel free to give me some feedbacks on forum :)")
end
function findorbwalker()
 if _G.Reborn_Loaded then
    SAC=true and
    print("<font color=\"#00BAE4\"><b> LonseViktor - </b></font><font color=\"#CBF6FF\">SACR has been found")
  elseif not _G.Reborn_Loaded and FileExist(LIB_PATH .. "SxOrbWalk.lua") then
    SxOrb=true
    require("SxOrbWalk")
    DelayAction(function() Config:addSubMenu("SxOrbWalk","orbWalk") end,5)
    DelayAction(function() _G.SxOrb:LoadToMenu(Config.orbWalk) end,5)
  elseif SAC~=true and SxOrb~= true then
    p("=================")
    p("=================")
    p("SxOrb or SAC:R is required.")
    p("=================")
    p("=================")
  end
end
    function Drawdmglib()
  if(FileExist(LIB_PATH.."DrawDamageLib.lua"))then
    check=1
  else
    check=0
  end 
   if _Required():Add({Name = "DrawDamageLib", Url = "raw.githubusercontent.com/innerout/BotOfLegends/master/DrawDamageLib.lua"}):Check():IsDownloading() then return end 
end
function Targetselection()
  ts= TargetSelector(TARGET_LESS_CAST_PRIORITY, 525, DAMAGE_PHYSICAL, false, true)
  tsq= TargetSelector(TARGET_LESS_CAST_PRIORITY, 600, DAMAGE_PHYSICAL, false, true)
  tsw= TargetSelector(TARGET_CLOSEST, 700, DAMAGE_MAGIC, false, true)
  tse= TargetSelector(TARGET_LESS_CAST_PRIORITY, 650, DAMAGE_MAGIC, false, true)
  tsr= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_MAGIC, false, true) 
   QSpell = _Spell({Slot = _Q, DamageName = "Q", Range = math.huge, Width = 1, Delay = 0, Speed = math.huge, Collision = true, Aoe = false, Type = SPELL_TYPE.TARGETTED})
   WSpell = _Spell({Slot = _W, DamageName = "W", Range = math.huge, Width = 125, Delay = 0.5, Speed = 750, Collision = false, Aoe = true, Type = SPELL_TYPE.CIRCULAR})
   ESpell = _Spell({Slot = _E, DamageName = "E", Range = math.huge, Width = 90, Delay = 0, Speed = math.huge, Collision = true, Aoe = false, Type = SPELL_TYPE.LINEAR})
   RSpell = _Spell({Slot = _R, DamageName = "R", Range =700, Width = 0, Delay = 0.25, Speed = 1000, Collision = false, Aoe = true, Type = SPELL_TYPE.CIRCULAR})
   Ignite = _Spell({Slot = FindSummonerSlot("summonerdot"), DamageName = "IGNITE", Range = 600, Type = SPELL_TYPE.TARGETTED})
end

-- handles script logic, a pure high speed loop
function OnTick()
 if(   Config.combo.combokey )then
    combo()
  end
  if(Config.laneclear.laneclearkey)then
    LaneClear()
  end
  if(Config.killsteal.ks ) then
    killsteal()
  end
  if(Config.harass.toggle==true or Config.harass.harasskey  ) then
    harass()
  end
    end
function Menu()
      Config=scriptConfig("LonseViktor","menu")
    
      Config:addSubMenu("Combo Settings", "combo")
      Config.combo:addParam("combokey", "Combo Key", SCRIPT_PARAM_ONKEYDOWN, false, 32)
      Config.combo:addParam("useQ", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
      Config.combo:addParam("useW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
      Config.combo:addParam("useE", "Use E in combo", SCRIPT_PARAM_ONOFF, true)
      Config.combo:addParam("useR", "Use R in combo", SCRIPT_PARAM_ONOFF, true)
      Config.combo:addParam("useI", "Use Ignite if target killable", SCRIPT_PARAM_ONOFF, true)
      
      Config:addSubMenu("Harass Settings", "harass")
      Config.harass:addParam("harasskey", "Smart Harass Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
      Config.harass:addParam("toggle", "Toggle Harass", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("L"))
      Config.harass:addParam("useQ", "Harass With Q", SCRIPT_PARAM_ONOFF, true)
      Config.harass:addParam("useE", "Harass With E", SCRIPT_PARAM_ONOFF, true)
      
      Config:addSubMenu("Laneclear Settings","laneclear")
      Config.laneclear:addParam("laneclearkey", "Laneclear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
      Config.laneclear:addParam("useQ","Use Q on Laneclear",SCRIPT_PARAM_ONOFF,true)
      Config.laneclear:addParam("useE","Use E on Laneclear",SCRIPT_PARAM_ONOFF,true)
      
      Config:addSubMenu("KillSteal Settings", "killsteal")
      Config.killsteal:addParam("ks","Killsteal On/Off",SCRIPT_PARAM_ONOFF,true)
      Config.killsteal:addParam("useQ", "Steal With Q", SCRIPT_PARAM_ONOFF, true)
      Config.killsteal:addParam("useE", "Steal With E", SCRIPT_PARAM_ONOFF, true)
      Config.killsteal:addParam("useR", "Steal With R", SCRIPT_PARAM_ONOFF, true)
      Config.killsteal:addParam("useI", "Steal With Ignite", SCRIPT_PARAM_ONOFF, true)
      Config:addSubMenu("Other Settings","other")
      Config.other:addSubMenu("Show Damage On Hp Bar", "HPBAR")
      Config.other.HPBAR:addParam("key","ON/OFF",SCRIPT_PARAM_ONOFF,true)
      
      Config:addSubMenu("Targetselectors","targetsel")
    ts.name  = "Viktor"
    tsq.name = "ViktorQ"
    tsw.name = "ViktorW"
    tse.name = "ViktorE"
    tsr.name = "ViktorR"
    Config.targetsel:addTS(ts)
    Config.targetsel:addTS(tsq)
    Config.targetsel:addTS(tsw)
    Config.targetsel:addTS(tse)
    Config.targetsel:addTS(tsr) 
    Config:addSubMenu("Keys Settings", "Keys")
    OrbwalkManager:LoadCommonKeys(Config.Keys)
    
end
function OnDraw()
  if(Config.other.HPBAR.key and check==1 )then
    drawDamage() 
  end
end
function combo()
      tsq:update()
    if( tsq.target~=nil  and Config.combo.useQ and Config.combo.combokey  )then
        CastQ(tsq.target)
    end
    tse:update()
    if(tse.target~=nil and Config.combo.useE and Config.combo.combokey  )then
        CastE(tse.target)
    end
    tsw:update()
    if(tsw.target~=nil and Config.combo.useW and  Config.combo.combokey  )then
        CastW(tsw.target)
    end
    if(Config.combo.useR and Config.combo.combokey )then
    for _, unit in pairs(GetEnemyHeroes()) do
      local dmgR =getDmg("R",unit,myHero)+ ((myHero.ap)*0.55) 
      local health=unit.health
      if(health<dmgR and Config.combo.useR and GetDistance(unit)<700)then
        CastR(unit)
    end
    end
    if(Config.combo.useI and Config.combo.combokey )then
    for _, unit in pairs(GetEnemyHeroes()) do
      local dmgI =(50+ ((myHero.level)*20))
      local health=unit.health
      if(health<dmgI and Config.combo.useI and GetDistance(unit)<600)then
        CastI(unit)
    end
    end
end
end
end
function CastQ(unit)
  QSpell:Cast(unit)
end

function CastW(unit)
  WSpell:Cast(unit)
end

function CastE(unit)
  ESpell:Cast(unit)
end

function CastR(unit)
  RSpell:Cast(unit)
end
function CastI(unit)
  Ignite:Cast(unit)
end
function killsteal()
for _, unit in pairs(GetEnemyHeroes()) do
    local health = unit.health
    local dmgE = getDmg("E", unit, myHero) + ((myHero.ap)*0.7) + ((getDmg("E", unit, myHero) + ((myHero.ap)*0.7))*0.4)
      if(health<dmgW and Config.killsteal.useE   and Config.killsteal.ks)then
        CastE(unit)  
      end
      local dmgQ = getDmg("Q", unit, myHero) + ((myHero.ap)*0.30)
      if(health<dmgQ and Config.killsteal.useQ and Config.killsteal.ks )then
        CastQ(unit)  
      end
       local dmgI =(50+ ((myHero.level)*20))
      if(health<dmgI and Config.killsteal.useI and Config.killsteal.ks and GetDistance(unit)<600)then
        CastI(unit)
      end
      local dmgR =getDmg("R",unit,myHero)+((myHero.ap)*0.55) 
      if(health<dmgR and Config.killsteal.useR and Config.killsteal.ks and GetDistance(unit)<700)then
        CastR(unit)
      end
   end
end

function harass()
  ts:update()
  tsq:update()
  if Config.harass.harasskey or Config.harass.toggle then
      if(tsq.target~=nil and Config.harass.useQ ) then        
        CastQ(tsq.target)
      end   
      tse:update()
      if(tse.target~=nil and Config.harass.useE )then
         CastE(tse.target) 
      end
    end   
  end
function LaneClear()
  if Config.laneclear.useQ then
    QSpell:LaneClear()
  end
if Config.laneclear.useE then
    ESpell:LaneClear()
end
end
function OnProcessAttack(unit, spell) 
  
  if unit.isMe and spell ~= nil then
     if spell.name:lower():find("attack") then
    tsq:update()
    if(tsq.target~=nil  and Config.combo.useQ and Config.combo.combokey )then
    QSpell:Cast(tsq.target)
    end
   end
  end 
  if unit.isMe and spell ~= nil then
     if spell.name:lower():find("attack") then
    tse:update()
    if(tse.target~=nil and Config.combo.useW and Config.combo.combokey  )then
    ESpell:Cast(tse.target)
    end
   end
  end 
  if unit.isMe and spell ~= nil then
     if spell.name:lower():find("attack") then
    tsw:update()
    if(tsw.target~=nil  and Config.combo.useW and Config.combo.combokey )then
    WSpell:Cast(tsw.target)
    end
   end
  end 
 
  if unit.isMe and spell ~= nil then
     if spell.name:lower():find("attack") then
    tsr:update()
    if(tsr.target~=nil  and Config.combo.useR and Config.combo.combokey )then
    RSpell:Cast(tsr.target)
    end
   end
  end 
  
 
  
end
function RequireSimpleLib()
    if FileExist(LIB_PATH.."SimpleLib.lua") and not FileExist(SCRIPT_PATH.."SimpleLib.lua") then
        require "SimpleLib"
        if _G.SimpleLibVersion == nil then 
            print("Your SimpleLib file is wrong.")
            return false
        end
        if _G.SimpleLibVersion < 1.02 then
            print("You need the lastest version of SimpleLib.")
            return false
        end
        return true
    elseif FileExist(LIB_PATH.."SimpleLib.lua") and FileExist(SCRIPT_PATH.."SimpleLib.lua") then
        print("SimpleLib.lua should not be in Custom Script (Only on Common folder), delete it from there...")
        return false
    else
        local function Base64Encode2(data)
            local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
            return ((data:gsub('.', function(x)
                local r,b='',x:byte()
                for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
                return r;
            end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
                if (#x < 6) then return '' end
                local c=0
                for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
                return b:sub(c+1,c+1)
            end)..({ '', '==', '=' })[#data%3+1])
        end
        local SavePath = LIB_PATH.."SimpleLib.lua"
        local ScriptPath = '/BoL/TCPUpdater/GetScript5.php?script='..Base64Encode2("raw.githubusercontent.com/jachicao/BoL/master/SimpleLib.lua")..'&rand='..math.random(99999999)
        local GotScript = false
        local LuaSocket = nil
        local Socket = nil
        local Size = nil
        local RecvStarted = false
        local Receive, Status, Snipped = nil, nil, nil
        local Started = false
        local File = ""
        local NewFile = ""
        if not LuaSocket then
            LuaSocket = require("socket")
        else
            Socket:close()
            Socket = nil
            Size = nil
            RecvStarted = false
        end
        Socket = LuaSocket.tcp()
        if not Socket then
            print('Socket Error')
        else
            Socket:settimeout(0, 'b')
            Socket:settimeout(99999999, 't')
            Socket:connect('sx-bol.eu', 80)
            Started = false
            File = ""
        end
        AddTickCallback(function()
            if GotScript then return end
            Receive, Status, Snipped = Socket:receive(1024)
            if Status == 'timeout' and not Started then
                Started = true
                print("Downloading a library called SimpleLib. Please wait...")
                Socket:send("GET "..ScriptPath.." HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
            end
            if (Receive or (#Snipped > 0)) and not RecvStarted then
                RecvStarted = true
            end

            File = File .. (Receive or Snipped)
            if File:find('</si'..'ze>') then
                if not Size then
                    Size = tonumber(File:sub(File:find('<si'..'ze>') + 6, File:find('</si'..'ze>') - 1))
                end
                if File:find('<scr'..'ipt>') then
                    local _, ScriptFind = File:find('<scr'..'ipt>')
                    local ScriptEnd = File:find('</scr'..'ipt>')
                    if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
                    local DownloadedSize = File:sub(ScriptFind + 1,ScriptEnd or -1):len()
                end
            end
            if File:find('</scr'..'ipt>') then
                local a,b = File:find('\r\n\r\n')
                File = File:sub(a,-1)
                NewFile = ''
                for line,content in ipairs(File:split('\n')) do
                    if content:len() > 5 then
                        NewFile = NewFile .. content
                    end
                end
                local HeaderEnd, ContentStart = NewFile:find('<sc'..'ript>')
                local ContentEnd, _ = NewFile:find('</scr'..'ipt>')
                if not ContentStart or not ContentEnd then
                else
                    local newf = NewFile:sub(ContentStart + 1,ContentEnd - 1)
                    local newf = newf:gsub('\r','')
                    if newf:len() ~= Size then
                        return
                    end
                    local newf = Base64Decode(newf)
                    if type(load(newf)) ~= 'function' then
                    else
                        local f = io.open(SavePath, "w+b")
                        f:write(newf)
                        f:close()
                        print("Required library downloaded. Please reload with 2x F9.")
                    end
                end
                GotScript = true
            end
        end)
        return false
    end
end