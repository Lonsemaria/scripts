--Script Name:LonseViktor
--Script Author:Ensuluyn
--I'm really new on scripting thats why feel free to give me some feedbacks on forum :)
local version = 1.08
local author = "Ensuluyn"
local SCRIPT_NAME = "LonseViktor"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/Lonsemaria/scripts/master/LonseViktor.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
require 'HPrediction'
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
   itemfix()
   Drawdmglib()
   Targetselection()
   Menu()
   findorbwalker()
   print("<font color=\"#FF0000\"><b> LonseViktor - </b></font><font color=\"#CBF6FF\"> I'm really new on scripting thats why feel free to give me some feedbacks on forum :)")
end
function findorbwalker()
 if _G.Reborn_Loaded then
    SAC=true and
    print("<font color=\"#FF0000\"><b> LonseViktor - </b></font><font color=\"#CBF6FF\">SACR has been found")
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
  tsw= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_MAGIC, false, true)
  tse= TargetSelector(TARGET_LESS_CAST_PRIORITY, 1200, DAMAGE_MAGIC, false, true)
  tsr= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_MAGIC, false, true) 
   QSpell = _Spell({Slot = _Q, DamageName = "Q", Range = math.huge, Width = 1, Delay = 0, Speed = math.huge, Collision = true, Aoe = false, Type = SPELL_TYPE.TARGETTED})
   WSpell = _Spell({Slot = _W, DamageName = "W", Range = math.huge, Width = 125, Delay = 0.5, Speed = 750, Collision = false, Aoe = true, Type = SPELL_TYPE.CIRCULAR})
   ESpell = _Spell({Slot = _E, DamageName = "E", Range = 1200, Width = 90, Delay = 0, Speed = math.huge, Collision = true, Aoe = false, Type = SPELL_TYPE.LINEAR}):AddDraw()
   RSpell = _Spell({Slot = _R, DamageName = "R", Range =700, Width = 0, Delay = 0.25, Speed = 1000, Collision = false, Aoe = true, Type = SPELL_TYPE.CIRCULAR})
   Ignite = _Spell({Slot = FindSummonerSlot("summonerdot"), DamageName = "IGNITE", Range = 600, Type = SPELL_TYPE.TARGETTED})
   HPred = HPrediction()
   E = {Range1 = 550, Range2 = 700, width = 180, ready}
   ERange = E.Range1+E.Range2
--|> Minion Managers
    enemyMinions   = minionManager(MINION_ENEMY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    allyMinions    = minionManager(MINION_ALLY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    jungleMinions  = minionManager(MINION_JUNGLE,  650, myHero, MINION_SORT_MAXHEALTH_DEC)
    otherMinions   = minionManager(MINION_OTHER,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    end
-- handles script logic, a pure high speed loop
function OnTick()
     autozhonya()
 if(Config.combo.combokey )then
    combo()
  end
  if(Config.laneclear.laneclearkey)then
    LaneClear()
  end
    if(Config.jungleclear.jungleclearkey)then
    JungleClear()
  end
  if(Config.killsteal.ks ) then
    killsteal()
  end
  if(Config.harass.harasskey  ) then
    harass()
  end
    end
function Menu()
      Config=scriptConfig("LonseViktor","menu")
      Config:addSubMenu("Hitchance", "hit")
      Config.hit:addParam("E", "E HitChance (Default value = 1.6)", SCRIPT_PARAM_SLICE, 1.6, 1, 3, 2)
     
      Config:addSubMenu("Combo Settings", "combo")
      Config.combo:addParam("combokey", "Combo Key", SCRIPT_PARAM_ONKEYDOWN, false, 32)
      Config.combo:addParam("useQ", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
      Config.combo:addParam("useW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
      Config.combo:addParam("useE", "Use E in combo", SCRIPT_PARAM_ONOFF, true)
      Config.combo:addParam("useR", "Use R in combo", SCRIPT_PARAM_ONOFF, true)
      Config.combo:addParam("useI", "Use Ignite if target killable", SCRIPT_PARAM_ONOFF, true)
      Config.combo:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 10, 10, 100, 0)
      
      Config:addSubMenu("Harass Settings", "harass")
      Config.harass:addParam("harasskey", "Smart Harass Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
      Config.harass:addParam("useQ", "Harass With Q", SCRIPT_PARAM_ONOFF, true)
      Config.harass:addParam("useE", "Harass With E", SCRIPT_PARAM_ONOFF, true)
      Config.harass:addParam("E", "E HitChance (Default value = 2)", SCRIPT_PARAM_SLICE, 2, 1, 3, 2)
      Config.harass:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      
      Config:addSubMenu("LaneClear Settings","laneclear")
      Config.laneclear:addParam("laneclearkey", "Lane Clear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
      Config.laneclear:addParam("useQ","Use Q on Laneclear",SCRIPT_PARAM_ONOFF,true)
      Config.laneclear:addParam("useE","Use E on Laneclear",SCRIPT_PARAM_ONOFF,true)
      Config.laneclear:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      
      Config:addSubMenu("JungleClear Settings","jungleclear")
      Config.jungleclear:addParam("jungleclearkey", "JungleClear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
      Config.jungleclear:addParam("useQ","Use Q on jungleclear",SCRIPT_PARAM_ONOFF,true)
      Config.jungleclear:addParam("useE","Use E on jungleclear",SCRIPT_PARAM_ONOFF,true)
      Config.jungleclear:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
       
      Config:addSubMenu("KillSteal Settings", "killsteal")
      Config.killsteal:addParam("ks","Killsteal On/Off",SCRIPT_PARAM_ONOFF,true)
      Config.killsteal:addParam("useQ", "Steal With Q", SCRIPT_PARAM_ONOFF, true)
      Config.killsteal:addParam("useE", "Steal With E", SCRIPT_PARAM_ONOFF, true)
      Config.killsteal:addParam("useR", "Steal With R", SCRIPT_PARAM_ONOFF, true)
      Config.killsteal:addParam("useI", "Steal With Ignite", SCRIPT_PARAM_ONOFF, true)
      
      Config:addSubMenu("Item Settings", "item")
      Config.item:addParam("enableautozhonya", "Auto Zhonya", SCRIPT_PARAM_ONOFF, false)
      Config.item:addParam("autozhonya", "Zhonya if Health under -> %", SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
     
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
    Config:addParam("Version", "Version", SCRIPT_PARAM_INFO, "1.08[5.20]")
end
function OnDraw()
  if(Config.other.HPBAR.key and check==1 )then
    drawDamage() 
  end
end
function combo()
      tsq:update()
    if(QSpell:IsReady() and (myHero.mana / myHero.maxMana > Config.combo.Mana /100 )and tsq.target~=nil  and Config.combo.useQ and Config.combo.combokey  )then
        CastQ(tsq.target)
    end
    tse:update()
    if(ESpell:IsReady() and (myHero.mana / myHero.maxMana > Config.combo.Mana /100 )and tse.target~=nil and Config.combo.useE and Config.combo.combokey  )then
        CastE(tse.target)
    end
    tsw:update()
    if(WSpell:IsReady() and (myHero.mana / myHero.maxMana > Config.combo.Mana /100 ) and tsw.target~=nil and Config.combo.useW and  Config.combo.combokey  )then
        CastW(tsw.target)
    end
    if(RSpell:IsReady() and (myHero.mana / myHero.maxMana > Config.combo.Mana /100 ) and Config.combo.useR and Config.combo.combokey )then
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
 
  if unit.dead or unit.health == 0 then
    return
  end
  
  if GetDistance(unit, myHero) > E.Range1-5 then
   EStartPos = CircleIntersection(myHero, unit, myHero, E.Range1-5)
  else
   EStartPos = Vector(unit.x, unit.y, unit.z)
  end
  
   EPos, EHitChance = HPred:GetPredict(HPred.Presets['Viktor']["E"], unit, EStartPos)
  
  if mode == "Combo" and EHitChance >= Config.hit.E or mode == "Harass" and EHitChance >= Config.harass.E or  mode == nil and EHitChance > 1 then
    CastSpell3(_E, D3DXVECTOR3(EStartPos.x, 0, EStartPos.z), D3DXVECTOR3(EPos.x, 0, EPos.z))
  end
  
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
      if(tse.target ~= nil and  ESpell:IsReady() and health<dmgE and Config.killsteal.useE   and Config.killsteal.ks)then
        CastE(unit)  
      end
      local dmgQ = getDmg("Q", unit, myHero) + ((myHero.ap)*0.30)
      if(tsq.target ~= nil and  QSpell:IsReady() and health<dmgQ and Config.killsteal.useQ and Config.killsteal.ks )then
        CastQ(unit)  
      end
       local dmgI =(50+ ((myHero.level)*20))
      if(health<dmgI and Config.killsteal.useI and Config.killsteal.ks and GetDistance(unit)<600)then
        CastI(unit)
      end
      local dmgR =getDmg("R",unit,myHero)+((myHero.ap)*0.55) 
      if(tsr.target ~= nil and  RSpell:IsReady() and health<dmgR and Config.killsteal.useR and Config.killsteal.ks and GetDistance(unit)<700)then
        CastR(unit)
      end
   end
end

function harass()
  ts:update()
  tsq:update()
  if Config.harass.harasskey then
      if(QSpell:IsReady() and (myHero.mana / myHero.maxMana > Config.harass.Mana /100 ) and tsq.target~=nil and Config.harass.useQ ) then        
        CastQ(tsq.target)
      end   
      tse:update()
       if(ESpell:IsReady() and (myHero.mana / myHero.maxMana > Config.harass.Mana /100 ) and tse.target ~= nil and Config.harass.useE  and ValidTarget(tse.target, ERange)) then
      CastE(tse.target)
  end

      end
    end   
 
function LaneClear()
 local cleartarget = nil
    enemyMinions:update()
    otherMinions:update()
    jungleMinions:update()
    for i, minion in ipairs(enemyMinions.objects) do
      if ValidTarget(minion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = minion
      end
    end
    for i, jungleminion in ipairs(jungleMinions.objects) do
      if ValidTarget(jungleminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = jungleminion
      end
    end
    for i, otherminion in ipairs(otherMinions.objects) do
      if ValidTarget(otherminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = otherminion
      end
    end
    if cleartarget ~= nil then
      if(QSpell:IsReady() and Config.laneclear.useQ and Config.laneclear.laneclearkey) and (myHero.mana / myHero.maxMana > Config.laneclear.Mana /100 ) then
        CastQ(cleartarget)
      end
     if cleartarget ~= nil then
      if(ESpell:IsReady() and Config.laneclear.useE and Config.laneclear.laneclearkey) and (myHero.mana / myHero.maxMana > Config.laneclear.Mana /100 ) then
      local BestPos, BestHit = GetBestLineFarmPosition(ESpell.Range, ESpell.Width, enemyMinions.objects )
      if BestPos ~= nil and BestHit >= 1 then
       CastSpell(_E, BestPos.x, BestPos.z)
      end
    end
  end
  end
  end
  function JungleClear()
 local cleartarget = nil
    enemyMinions:update()
    otherMinions:update()
    jungleMinions:update()
    for i, jungleminion in ipairs(jungleMinions.objects) do
      if ValidTarget(jungleminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = jungleminion
      end
    end
    end
    if cleartarget ~= nil then
      if(QSpell:IsReady() and Config.jungleclear.useQ and Config.jungleclear.jungleclearkey) and (myHero.mana / myHero.maxMana > Config.jungleclear.Mana /100 ) then
        CastQ(cleartarget)
      end
      if cleartarget ~= nil then
      if(ESpell:IsReady() and Config.jungleclear.useE and Config.jungleclear.jungleclearkey) and (myHero.mana / myHero.maxMana > Config.jungleclear.Mana /100 ) then
        CastE(cleartarget)
      end
    end
  end
function GetBestLineFarmPosition(range, width, objects)
    local BestPos 
    local BestHit = 2
    for i, object in ipairs(objects) do
        local EndPos = Vector(myHero.pos) + range * (Vector(object) - Vector(myHero.pos)):normalized()
        local hit = CountObjectsOnLineSegment(myHero.pos, EndPos, width, objects)
        if hit > BestHit then
            BestHit = hit
            BestPos = Vector(object)
            if BestHit == #objects then
               break
            end
         end
    end

    return BestPos, BestHit
end

function CountObjectsOnLineSegment(StartPos, EndPos, width, objects)
    local n = 0
    for i, object in ipairs(objects) do
        local pointSegment, pointLine, isOnSegment = VectorPointProjectionOnLineSegment(StartPos, EndPos, object)
        if isOnSegment and GetDistanceSqr(pointSegment, object) < width * width then
            n = n + 1
        end
    end

    return n
end
function GetBestCircularFarmPosition(range, radius, objects)
    local BestPos 
    local BestHit = 0
    for i, object in ipairs(objects) do
        local hit = CountObjectsNearPos(object.pos or object, range, radius, objects)
        if hit > BestHit then
            BestHit = hit
            BestPos = Vector(object)
            if BestHit == #objects then
               break
            end
         end
    end
    return BestPos, BestHit
end
function CountObjectsNearPos(pos, range, radius, objects)
    local n = 0
    for i, object in ipairs(objects) do
        if GetDistanceSqr(pos, object) <= radius * radius then
            n = n + 1
        end
    end
    return n
end

function autozhonya()
  if Config.item.enableautozhonya then
    if myHero.health <= (myHero.maxHealth * Config.item.autozhonya / 100) then CastItem(3157) 
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
function GetSlotItem(id, unit)
  
  unit    = unit or myHero

  if (not ItemNames[id]) then
    return ___GetInventorySlotItem(id, unit)
  end

  local name  = ItemNames[id]
  
  for slot = ITEM_1, ITEM_7 do
    local item = unit:GetSpellData(slot).name
    if ((#item > 0) and (item:lower() == name:lower())) then
      return slot
    end
  end

end
function itemfix()

  ItemNames       = {
    [3303]        = "ArchAngelsDummySpell",
    [3007]        = "ArchAngelsDummySpell",
    [3144]        = "BilgewaterCutlass",
    [3188]        = "ItemBlackfireTorch",
    [3153]        = "ItemSwordOfFeastAndFamine",
    [3405]        = "TrinketSweeperLvl1",
    [3411]        = "TrinketOrbLvl1",
    [3166]        = "TrinketTotemLvl1",
    [3450]        = "OdinTrinketRevive",
    [2041]        = "ItemCrystalFlask",
    [2054]        = "ItemKingPoroSnack",
    [2138]        = "ElixirOfIron",
    [2137]        = "ElixirOfRuin",
    [2139]        = "ElixirOfSorcery",
    [2140]        = "ElixirOfWrath",
    [3184]        = "OdinEntropicClaymore",
    [2050]        = "ItemMiniWard",
    [3401]        = "HealthBomb",
    [3363]        = "TrinketOrbLvl3",
    [3092]        = "ItemGlacialSpikeCast",
    [3460]        = "AscWarp",
    [3361]        = "TrinketTotemLvl3",
    [3362]        = "TrinketTotemLvl4",
    [3159]        = "HextechSweeper",
    [2051]        = "ItemHorn",
    --[2003]      = "RegenerationPotion",
    [3146]        = "HextechGunblade",
    [3187]        = "HextechSweeper",
    [3190]        = "IronStylus",
    [2004]        = "FlaskOfCrystalWater",
    [3139]        = "ItemMercurial",
    [3222]        = "ItemMorellosBane",
    [3042]        = "Muramana",
    [3043]        = "Muramana",
    [3180]        = "OdynsVeil",
    [3056]        = "ItemFaithShaker",
    [2047]        = "OracleExtractSight",
    [3364]        = "TrinketSweeperLvl3",
    [2052]        = "ItemPoroSnack",
    [3140]        = "QuicksilverSash",
    [3143]        = "RanduinsOmen",
    [3074]        = "ItemTiamatCleave",
    [3800]        = "ItemRighteousGlory",
    [2045]        = "ItemGhostWard",
    [3342]        = "TrinketOrbLvl1",
    [3040]        = "ItemSeraphsEmbrace",
    [3048]        = "ItemSeraphsEmbrace",
    [2049]        = "ItemGhostWard",
    [3345]        = "OdinTrinketRevive",
    [2044]        = "SightWard",
    [3341]        = "TrinketSweeperLvl1",
    [3069]        = "shurelyascrest",
    [3599]        = "KalistaPSpellCast",
    [3185]        = "HextechSweeper",
    [3077]        = "ItemTiamatCleave",
    [2009]        = "ItemMiniRegenPotion",
    [2010]        = "ItemMiniRegenPotion",
    [3023]        = "ItemWraithCollar",
    [3290]        = "ItemWraithCollar",
    [2043]        = "VisionWard",
    [3340]        = "TrinketTotemLvl1",
    [3090]        = "ZhonyasHourglass",
    [3154]        = "wrigglelantern",
    [3142]        = "YoumusBlade",
    [3157]        = "ZhonyasHourglass",
    [3512]        = "ItemVoidGate",
    [3131]        = "ItemSoTD",
    [3137]        = "ItemDervishBlade",
    [3352]        = "RelicSpotter",
    [3350]        = "TrinketTotemLvl2",
  }
  
  _G.ITEM_1       = 06
  _G.ITEM_2       = 07
  _G.ITEM_3       = 08
  _G.ITEM_4       = 09
  _G.ITEM_5       = 10
  _G.ITEM_6       = 11
  _G.ITEM_7       = 12
  
  ___GetInventorySlotItem = rawget(_G, "GetInventorySlotItem")
  _G.GetInventorySlotItem = GetSlotItem
  
  
end
function CircleIntersection(v1, v2, c, radius)
  assert(VectorType(v1) and VectorType(v2) and VectorType(c) and type(radius) == "number", "CircleIntersection: wrong argument types (<Vector>, <Vector>, <Vector>, integer expected)")
  
  local x1, y1, x2, y2, x3, y3 = v1.x, v1.z or v1.y, v2.x, v2.z or v2.y, c.x, c.z or c.y
  local r = radius
  local xp, yp, xm, ym = nil, nil, nil, nil
  local IsOnSegment = nil
  
  if x1 == x2 then
  
    local B = math.sqrt(r^2-(x1-x3)^2)
    
    xp, yp, xm, ym = x1, y3+B, x1, y3-B
  else
  
    local m = (y2-y1)/(x2-x1)
    local n = y1-m*x1
    local A = x3-m*(n-y3)
    local B = math.sqrt(A^2-(1+m^2)*(x3^2-r^2+(n-y3)^2))
    
    xp, xm = (A+B)/(1+m^2), (A-B)/(1+m^2)
    yp, ym = m*xp+n, m*xm+n
  end
  
  if x1 <= x2 then
    IsOnSegment = x1 <= xp and xp <= x2
  else
    IsOnSegment = x2 <= xp and xp <= x1        
  end
    if IsOnSegment then
    return Vector(xp, 0, yp)
  else
    return Vector(xm, 0, ym)
  end
  
end


