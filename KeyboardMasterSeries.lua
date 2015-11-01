

-- One Click to Challenger
-- Keyboard Master Series by Ensuluyn

--Credits to Nebelwolfi for mentoring <3

local Version = "2.01"  
local LVersion = "5.21"
local Scriptname = "Keyboard Master Series"
local Author = "Ensuluyn"
local list = "Leblanc , Lissandra , Viktor"
local link = "Go to http://forum.botoflegends.com/forum/20-champion-scripts/ then you can see my topic "..Scriptname.." on the first or second page."
local date = "01.11.2015"
global_ticks = 0
-- starting script
--auto update
local version = 2.01
local author = "Ensuluyn"
local SCRIPT_NAME = "KeyboardMasterSeries"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/Lonsemaria/scripts/master/KeyboardMasterSeries.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
function Say(text)
  print("<font color=\"#FF0000\"><b>Keyboard Master Series:</b></font> <font color=\"#FFFFFF\">" .. text .. "</font>")
end

if AUTOUPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/Lonsemaria/scripts/master/version/Bundle.version")
  if ServerData then
    ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
    if ServerVersion then
      if tonumber(version) < ServerVersion then
        Say("New version available "..ServerVersion)
        Say("Updating, please don't press F9")
        DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () Say("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
      else
        Say("-Welcome, You have got the latest version (v"..ServerVersion..") of "..Scriptname.." , updated at ("..date..") by " .. author)
      end
    end
  else 
    Say("Error downloading version info")
  end
end
function OnLoad()
        if not RequireSimpleLib() then return end
        itemfix()
         if _G[myHero.charName] then
                _G[myHero.charName]()
        else
         print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\"> :This champion is not supported. Currently supported champions are: "..list.." " )
        DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\">Feel free to check my forum topic and ask a new champion or give feedback") end, 0.5)
        DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\">"..link.."") end, 0.5)
        end
end
-- ------------------------------------------------------LeBlanc Starting----------------------------------------------------------------------
-- ------------------------------------------------------LeBlanc Starting----------------------------------------------------------------------
-- ------------------------------------------------------LeBlanc Starting----------------------------------------------------------------------
-- ------------------------------------------------------LeBlanc Starting----------------------------------------------------------------------
class "Leblanc"
function Leblanc:__init()
self.ts= TargetSelector(TARGET_LESS_CAST_PRIORITY, 525, DAMAGE_PHYSICAL, false, true)
  self.tsq= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_PHYSICAL, false, true)
 self.tsw= TargetSelector(TARGET_LESS_CAST_PRIORITY, 600, DAMAGE_MAGIC, false, true)
  self.tse= TargetSelector(TARGET_LESS_CAST_PRIORITY, 925, DAMAGE_MAGIC, false, true)
  self.tsr= TargetSelector(TARGET_LESS_CAST_PRIORITY, 925, DAMAGE_MAGIC, false, true) 
  self.tsg= TargetSelector(TARGET_LESS_CAST_PRIORITY, 950, DAMAGE_MAGIC, false, true) 
   self.QSpell = _Spell({Slot = _Q, DamageName = "Q", Range = 700, Width = 1, Delay = 0, Speed = math.huge, Collision = false, Aoe = false, Type = SPELL_TYPE.TARGETTED})
   self.WSpell = _Spell({Slot = _W, DamageName = "W", Range = 600, Width = 125, Delay = 0.5, Speed = 1300, Radius = 250 , Collision = false, Aoe = true, Type = SPELL_TYPE.TARGETTED})
   self.ESpell = _Spell({Slot = _E, DamageName = "E", Range = 925, Width = 55, Delay = 0.25, Speed = 1600, Collision = true, Aoe = false, Type = SPELL_TYPE.LINEAR})
   self.RSpell = _Spell({Slot = _R, DamageName = "R", Range =600, Width = 125, Delay = 0.5, Speed = 1300, Collision = false, Aoe = true, Type = SPELL_TYPE.TARGETTED})
   self.Ignite = _Spell({Slot = FindSummonerSlot("summonerdot"), DamageName = "IGNITE", Range = 600, Type = SPELL_TYPE.TARGETTED})
   self.leblancW, self.leblancImage, self.cloneId = nil, nil, nil
--|> Minion Managers
    self.enemyMinions   = minionManager(MINION_ENEMY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self.allyMinions    = minionManager(MINION_ALLY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self.jungleMinions  = minionManager(MINION_JUNGLE,  650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self.otherMinions   = minionManager(MINION_OTHER,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self:LoadMenu()
      self:findorbwalker()
    
      AddTickCallback(function() self:Tick() end)
  AddDrawCallback(function() self:Draw() end)
  AddMsgCallback(function(msg,Key) self:WndMsg(msg,Key) end)
  --AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
  --AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
  --AddApplyBuffCallback(function(source, unit, buff) self:OnApplyBuff(source, unit, buff) end)
  --AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
  --AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end) 
    end
    function Leblanc:LoadMenu()
      self.Config=scriptConfig(""..Scriptname.."","menu")

      self.Config:addSubMenu("Combo Settings", "combo")
      self.Config.combo:addParam("useQ", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useE", "Use E in combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useR", "Use R in combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useI", "Use Ignite if target killable", SCRIPT_PARAM_ONOFF, true)
      --self.Config.combo:addParam("gapclose", "Use W as a gapclose ( Beta )", SCRIPT_PARAM_ONOFF, false)
      self.Config.combo:addParam("logic", "Combo logic", SCRIPT_PARAM_LIST, 1, {"Q>E>W>R", "Q>R>E>W", "E>Q>W>R", "E>W>Q>R" ,"Random Skill Order"})
      self.Config.combo:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 10, 10, 100, 0)
      
      self.Config:addSubMenu("Harass Settings", "harass")
      self.Config.harass:addParam("useQ", "Harass With Q", SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("useW", "Harass With W", SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 10, 10, 100, 0)
      
      self.Config:addSubMenu("LaneClear Settings","laneclear")
      self.Config.laneclear:addParam("useQ","Use Q on Laneclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.laneclear:addParam("useW","Use W on Laneclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.laneclear:addParam("useR","Use R on Laneclear",SCRIPT_PARAM_ONOFF,false)
      self.Config.laneclear:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      
      self.Config:addSubMenu("JungleClear Settings","jungleclear")
      self.Config.jungleclear:addParam("useQ","Use Q on jungleclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.jungleclear:addParam("useW","Use W on Laneclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.jungleclear:addParam("useE","Use E on jungleclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.jungleclear:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      
      self.Config:addSubMenu("Escape Settings","escape")
      self.Config.escape:addParam("useW","Use W While Escape",SCRIPT_PARAM_ONOFF,true)
      self.Config.escape:addParam("useR","Use R While Escape",SCRIPT_PARAM_ONOFF,true)

      
      self.Config:addSubMenu("KillSteal Settings", "killsteal")
      self.Config.killsteal:addParam("ks","Killsteal On/Off",SCRIPT_PARAM_ONOFF,true)
      self.Config.killsteal:addParam("useQ", "Steal With Q", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useW", "Steal With W", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useE", "Steal With E", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useR", "Steal With R", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useQW", "Steal With QW", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useI", "Steal With Ignite", SCRIPT_PARAM_ONOFF, true)
      
      self.Config:addSubMenu("Item Settings", "item")
      self.Config.item:addParam("enableautozhonya", "Auto Zhonya", SCRIPT_PARAM_ONOFF, false)
      self.Config.item:addParam("autozhonya", "Zhonya if Health under -> %", SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
     
      self.Config:addSubMenu("Draw Settings","other")
      --self.Config.other:addSubMenu("Show Damage On Hp Bar", "HPBAR")
      --self.Config.other.HPBAR:addParam("key","ON/OFF",SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addSubMenu("Skill Drawing Settings", "draw")
      self.Config.other.draw:addParam("qdraw","Q Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("wdraw","W Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("edraw","E Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("rdraw","R Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("aadraw","Auto Attack Range",SCRIPT_PARAM_ONOFF,false)
      self.Config.other:addSubMenu("Draw Permabox", "perma")
      self.Config.other.perma:addParam("perma","Draw Permabox ( Needs 2x F9 )",SCRIPT_PARAM_ONOFF,true)
      
      self.Config:addSubMenu("Targetselectors","targetsel")
      self.Config.targetsel:addParam("infoK2", "", SCRIPT_PARAM_INFO,"")
      self.Config.targetsel:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
      self.Config.targetsel:addParam("ts","Left Click For Target Selection",SCRIPT_PARAM_ONOFF,false)
    self.ts.name  = "Leblanc"
    self.tsq.name = "LeblancQ"
    self.tsw.name = "LeblancW"
    self.tse.name = "LeblancE"
    self.tsr.name = "LeblancR"
    self.Config.targetsel:addTS(self.ts)
    self.Config.targetsel:addTS(self.tsq)
    self.Config.targetsel:addTS(self.tsw)
    self.Config.targetsel:addTS(self.tse)
    self.Config.targetsel:addTS(self.tsr) 
    
        self.Config:addSubMenu("Keys Settings", "Keys")
    self.Config.Keys:addParam("infoK3", "<------------------Combo Key Settings------------------>", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("combokey", "Combo Key", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    self.Config.Keys:addParam("onlye", "Only use E Skill (Only Stun)", SCRIPT_PARAM_ONKEYDOWN,false, string.byte("O"))
    self.Config.Keys:addParam("infoK4", "<------------------Harass Key Settings------------------>", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("harasskey", "Smart Harass Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
   -- self.Config.Keys:addParam("harasstoglekey", "Harass Togle Key", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
    self.Config.Keys:addParam("infoK5", "<------------------Clear Key Settings-------------------->", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("laneclearkey", "LaneClear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    self.Config.Keys:addParam("jungleclearkey", "JungleClear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
    --self.Config.Keys:addParam("lasthitkey", "Lasthit Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    self.Config.Keys:addParam("infoK6", "<------------------Other Key Settings-------------------->", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("escapekey", "Escape Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Y"))
    self.Config.Keys:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("infoK2", "Make Sure That Your Orbwalker Keys are Same As Here", SCRIPT_PARAM_INFO,"")
    self.Config:addSubMenu("OrwWalkerKey Settings", "Keys2")
    
    OrbwalkManager:LoadCommonKeys(self.Config.Keys2)
    
         self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
     self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "") 
     self.Config:addParam("infobox2", "                 Script Version:  "..Version.. "         ", SCRIPT_PARAM_INFO,"")
     self.Config:addParam("infobox6", "            Script was made by  "..Author.. "         ", SCRIPT_PARAM_INFO,"")
     self.Config:addParam("infobox5", "       Leauge Of Legends Version:  "..LVersion.. "         ", SCRIPT_PARAM_INFO,"")
     
     if self.Config.other.perma.perma then
     self.Config:permaShow("infobox")
    self.Config.Keys:permaShow("combokey")
    --self.Config.Keys:permaShow("harasstoglekey")
     self.Config.Keys:permaShow("harasskey")
  end
end
--drawing settings start
function Leblanc:Draw()
   if self.Config.other.draw.qdraw and self.QSpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 650, 1,red)
  end

  if self.Config.other.draw.wdraw and self.WSpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 600, 1, red)
  end

  if self.Config.other.draw.edraw and self.ESpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 925, 1, red)
  end
  
  if self.Config.other.draw.rdraw and self.RSpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 700,1, red)
  end
  if self.Config.other.draw.aadraw then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 550,1, ARGB(255, 255,0,0))
  end
end
--drawing settings end
function Leblanc:Tick()
     self:autozhonya()
      self:checkts()
     self:gapclose()
 if(self.Config.Keys.combokey   )then
    self:combo()
  end
   if(self.Config.Keys.onlye   )then
    self:onlye()
  end
  if(self.Config.Keys.laneclearkey )then
    self:LaneClear()
  end
  if(self.Config.Keys.escapekey )then
    self:escape()
  end
    if(self.Config.Keys.jungleclearkey )then
   self:JungleClear()
  end
  if(self.Config.killsteal.ks ) then
    self:killsteal()
  end
  if(self.Config.Keys.harasskey   ) then
    self:harass()
  end
    end
function Leblanc:checkts()
if not self.tsg.target~=nil or not self.Config.targetsel.ts then
target = self.tsw.target
elseif self.tsg.target~=nil or self.selectedTar then
target = self.selectedTar
end
end
function Leblanc:onlye()
       self.tse:update()
        if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.onlye   and self.ESpell:IsReady()) then
        self:CastE(self.tse.target)
end
end
function Leblanc:combo()
if self.Config.combo.logic == 1 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) then
self:comboQEWR()
end
if self.Config.combo.logic == 2 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) then
self:comboQREW()
end
if self.Config.combo.logic == 3 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) then
self:comboEQWR()
end
if self.Config.combo.logic == 4 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) then
self:comboEWQR()
end
if self.Config.combo.logic == 5 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) then
self:randomcombo()
end
    if(self.Config.combo.useI and self.Config.Keys.combokey   )then
    for _, unit in pairs(GetEnemyHeroes()) do
      local dmgI =(50+ ((myHero.level)*20))
      local health=unit.health
      if(health<dmgI and self.Config.combo.useI and GetDistance(unit)<600)then
        self:CastI(unit)
    end
    end
end
end
function Leblanc:comboQREW()
 self.tsw:update()
if (self.tsw.target ~= nil )then
self:CastQR(target)
end
if(self.tsw.target ~= nil ) and self:QRused() then
self:CastEW(target)
end
end
function Leblanc:comboEWQR()
 self.tsw:update()
if (self.tsw.target ~= nil )then
self:CastEW(target)
end
if(self.tsw.target ~= nil ) and self:EWused() then
self:CastQR(target)
end
end
function Leblanc:comboEQWR()
 self.tsw:update()
if (self.tsw.target ~= nil )then
self:CastEQ(target)
end
if(self.tsw.target ~= nil ) and self:EQused() then
self:CastWR(target)
end
end
function Leblanc:comboQEWR()
 self.tsw:update()
if (self.tsw.target ~= nil )then
self:CastQE(target)
end
if(self.tsw.target ~= nil ) and self:QEused() then
self:CastWR(target)
end
end
function Leblanc:CastQ(unit)
  self.QSpell:Cast(unit)
end
function Leblanc:CastQE(unit)
      self.tsq:update()
     self.tsw:update()
    if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey    and self.QSpell:IsReady())then
        self:CastQ(target)
   end
       self.tse:update()
        if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.combokey   and self.ESpell:IsReady()) then
        self:CastE(target)
        end
        end
function Leblanc:CastEW(unit)
      self.tse:update()
    if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.combokey    and self.ESpell:IsReady())then
        self:CastE(target)
   end
       self.tsw:update()
        if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey   and not self:wUsed() and self.WSpell:IsReady()) then
        self:CastW(target)
        end
end
function Leblanc:randomcombo()
      self.tsq:update()
    if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey    and self.QSpell:IsReady())then
        self:CastQ(target)     
        end
        self.tsw:update()
    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey    and self.WSpell:IsReady())then
        self:CastW(target)      
        end
        self.tse:update()
    if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.combokey    and self.ESpell:IsReady())then
        self:CastE(target)    
        end
         self.tsr:update()
    if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey    and self.QSpell:IsReady())then
        self:CastR(target)
        end
end
function Leblanc:CastQR(unit)
      self.tsq:update()
       self.tsw:update()
    if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey    and self.QSpell:IsReady())then
        self:CastQ(target)
   end
       self.tsr:update()
        if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey   and self.RSpell:IsReady()) then
        self:CastR(target)
        end
end
function Leblanc:CastWR(unit)
      self.tsw:update()
    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey    and self.WSpell:IsReady()and not self:wUsed())then
        self:CastW(target)
   end
       self.tsr:update()
        if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey   and self.RSpell:IsReady()) then
        self:CastR(target)
        end
end
function Leblanc:CastQWH()
      self.tsq:update()
    if(self.tsq.target~=nil and self.Config.harass.useQ and  self.Config.Keys.harasskey  and self.QSpell:IsReady())then
        self:CastQ(target)
   end
      self.tsw:update()
    if(self.tsw.target~=nil and self.Config.harass.useW and  self.Config.Keys.harasskey  and self.WSpell:IsReady())then
       self:CastW(target)
   end
end
function Leblanc:CastQWK(unit)
      self.tsq:update()
    if(self.tsq.target~=nil and self.Config.killsteal.useQW and  self.Config.killsteal.ks and self.QSpell:IsReady())then
        self:CastQ(target)
   end
      self.tsw:update()
    if(self.tsw.target~=nil and self.Config.killsteal.useQW and  self.Config.killsteal.ks and self.WSpell:IsReady())then
        self:CastW(target)
   end
end
function Leblanc:CastEQ(unit)
      self.tse:update()
      self.tsw:update()
    if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.combokey    and self.ESpell:IsReady())then
        self:CastE(target)
   end
       self.tsq:update()
        if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey   and self.QSpell:IsReady()) then
        self:CastQ(target)
        end
end
function Leblanc:CastW(unit)
  self.WSpell:Cast(unit)
end

function Leblanc:CastE(unit)
 self.ESpell:Cast(unit)
  
end

function Leblanc:CastR(unit)
  self.RSpell:Cast(unit)
end

function Leblanc:CastI(unit)
  self.Ignite:Cast(unit)
end
function Leblanc:killsteal()
for _, unit in pairs(GetEnemyHeroes()) do
    local health = unit.health
    local dmgE = getDmg("E", unit, myHero) + ((myHero.ap)*0.5) + (getDmg("E", unit, myHero) + ((myHero.ap)*0.5))
      if(self.tse.target ~= nil and  self.ESpell:IsReady() and not self.Config.Keys.combokey   and health<dmgE and self.Config.killsteal.useE   and self.Config.killsteal.ks)then
        self:CastE(unit)  
      end
      local dmgQ = getDmg("Q", unit, myHero) + ((myHero.ap)*0.40)
      if(self.tsq.target ~= nil and  self.QSpell:IsReady() and not self.Config.Keys.combokey   and health<dmgQ and self.Config.killsteal.useQ and self.Config.killsteal.ks )then
        self:CastQ(unit)  
      end
       local dmgQW = getDmg("Q", unit, myHero) + ((myHero.ap)*0.40)+(getDmg("W", unit, myHero) + ((myHero.ap)*0.60)+(getDmg("Q", unit, myHero) + ((myHero.ap)*0.40)))
      if(self.tsw.target ~= nil and  health<dmgQ and not self.Config.Keys.combokey   and self.Config.killsteal.useQW and self.Config.killsteal.ks )then
        self:CastQWK(tsw.target)  
      end
            local dmgW = getDmg("W", unit, myHero) + ((myHero.ap)*0.60)
      if(self.tsw.target ~= nil and  self.WSpell:IsReady() and not self.Config.Keys.combokey   and health<dmgQ and self.Config.killsteal.useW and self.Config.killsteal.ks )then
        self:CastW(unit)  
      end
       local dmgI =(50+ ((myHero.level)*20))
      if(health<dmgI and self.Config.killsteal.useI and self.Config.killsteal.ks and GetDistance(unit)<600)then
        self:CastI(unit)
      end
      local dmgR =getDmg("R",unit,myHero)+((myHero.ap)*0.60) 
      if(self.tsr.target ~= nil and  self.RSpell:IsReady() and not self.Config.Keys.combokey   and health<dmgR and self.Config.killsteal.useR and self.Config.killsteal.ks and GetDistance(unit)<600)then
        self:CastR(unit)
      end
   end
end
function Leblanc:harass()
  self.tsq:update()
   self.tsw:update()
  if self.Config.Keys.harasskey  and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 )  then
  self:CastQWH()
    end   
 end
 function Leblanc:LaneClear()
local cleartarget = self.cleartarget
self.enemyMinions:update()
 self.otherMinions:update()
    self.jungleMinions:update()
    for i, minion in ipairs(self.enemyMinions.objects) do
      if ValidTarget(minion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = minion
      end
    end
    for i, minion in pairs(self.enemyMinions.objects) do
      if ValidTarget(minion) and minion ~= nil then
        if self.Config.Keys.laneclearkey  and self.Config.laneclear.useQ and (myHero.mana / myHero.maxMana > self.Config.laneclear.Mana /100 ) and GetDistance(minion) <= self.QSpell.Range then 
           self:CastQ(cleartarget)
        end
        if self.Config.Keys.laneclearkey  and self.Config.laneclear.useW and (myHero.mana / myHero.maxMana > self.Config.laneclear.Mana /100 ) and GetDistance(minion) <= self.WSpell.Range then 
          local BestPos, BestHit = GetBestCircularFarmPosition(self.WSpell.Range, self.WSpell.Width, self.enemyMinions.objects)
          if BestPos ~= nil then
            CastSpell(_W, BestPos.x, BestPos.z)
        end
      end
      if self.Config.Keys.laneclearkey  and self.Config.laneclear.useR and (myHero.mana / myHero.maxMana > self.Config.laneclear.Mana /100 ) and GetDistance(minion) <= self.WSpell.Range then 
          local BestPos, BestHit = GetBestCircularFarmPosition(self.WSpell.Range, self.WSpell.Width, self.enemyMinions.objects)
          if BestPos ~= nil then
            CastSpell(_R, BestPos.x, BestPos.z)
        end
      end        
    end
  end
end

function Leblanc:JungleClear()
local cleartarget = nil
    self.enemyMinions:update()
    self.otherMinions:update()
    self.jungleMinions:update()
    for i, minion in ipairs(self.enemyMinions.objects) do
      if ValidTarget(minion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = minion
      end
    end
    for i, jungleminion in ipairs(self.jungleMinions.objects) do
      if ValidTarget(jungleminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = jungleminion
      end
    end
    for i, otherminion in ipairs(self.otherMinions.objects) do
      if ValidTarget(otherminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = otherminion
      end
    end
    if cleartarget ~= nil then
      if(self.QSpell:IsReady() and self.Config.jungleclear.useQ and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.jungleclear.Mana /100 ) then
        self:CastQ(cleartarget)
      end
      if cleartarget ~= nil then
      if(self.WSpell:IsReady() and self.Config.jungleclear.useW and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.jungleclear.Mana /100 ) then
        self:CastW(cleartarget)
      end
      if cleartarget ~= nil then
      if(self.ESpell:IsReady() and self.Config.jungleclear.useE and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.jungleclear.Mana /100 ) then
        self:CastE(cleartarget)
      end
    end
  end
end
end
function Leblanc:wUsed() 
  local leblancW = myHero:GetSpellData(_W)
  if leblancW.name == "leblancslidereturn" then 
    return true 
  else 
    return false
  end
end
function Leblanc:rUsed() 
  local leblancR = myHero:GetSpellData(_R)
  if leblancR.name == "LeblancSlideM" then 
    return false
  else 
    return true
  end
end
function Leblanc:QEused() 
  local leblancQ = self.QSpell:IsReady()
  local leblancE = self.ESpell:IsReady()
  if (leblancQ and leblancE) then 
    return false 
  else 
    return true
  end
end
function Leblanc:EQused() 
  local leblancW = self.ESpell:IsReady()
  local leblancE = self.QSpell:IsReady()
  if (leblancW and leblancE) then 
    return false 
  else 
    return true
  end
end
function Leblanc:EWused() 
  local leblancW = self.ESpell:IsReady()
  local leblancE = self.WSpell:IsReady()
  if (leblancW and leblancE) then 
    return false 
  else 
    return true
  end
end
function Leblanc:QRused() 
  local leblancW = self.QSpell:IsReady()
  local leblancE = self.RSpell:IsReady()
  if (leblancW and leblancE) then 
    return false 
  else 
    return true
  end
end
function Leblanc:autozhonya()
  if self.Config.item.enableautozhonya then
   for _ = ITEM_1, ITEM_7 do
    if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
  end
  end
  end
  end
  function Leblanc:escapeforgap()
if self.Config.Keys.combokey  and self.Config.combo.gapclose and not self:wUsed() then
CastSpell(_W,mousePos.x,mousePos.z)
end
end
function Leblanc:escape()
if self.Config.Keys.escapekey  and self.Config.escape.useW and not self:wUsed() then
CastSpell(_W,mousePos.x,mousePos.z)
end
if self.Config.Keys.escapekey  then 
self:walk()
end
if self.Config.Keys.escapekey  and self.Config.escape.useR and not  self:rUsed() then
CastSpell(_R,mousePos.x,mousePos.z)
end
end
function Leblanc:walk()
  myHero:MoveTo(mousePos.x,mousePos.z)
end
function Leblanc:gapclose()
if target and GetDistance(target,myHero)>800 then 
self:escapeforgap()
    end 

end
function Leblanc:TARGETCS()
    local Target = nil
    if self.selectedTar then Target = self.selectedTar
    else Target = self.tsw.target
    end
end
function Leblanc:WndMsg(Msg, Key)
if self.Config.targetsel.ts then      
        if Msg == WM_LBUTTONDOWN then
            local minD = 10
            local starget = nil
            for i, enemy in ipairs(GetEnemyHeroes()) do
                if ValidTarget(enemy) then
                    if GetDistance(enemy, mousePos) <= minD or starget == nil then
                        minD = GetDistance(enemy, mousePos)
                        starget = enemy
                    end
                end
            end     
            if starget and minD < 500 then
                if self.selectedTar and starget.charName == self.selectedTar.charName then
                    self.selectedTar = nil
                    print("<font color=\"#CBF6FF\">Target <b>is no loger selected.</b>: "..starget.charName.."</font>")
                else
                    self.selectedTar = starget               
                    print("<font color=\"#CBF6FF\">New target <b>selected.</b>: "..starget.charName.."</font>")
                end
            end
        end
    end
    end
-- All classic necesseries start
-- ------------------------------------------------------LeBlanc Ending----------------------------------------------------------------------
-- ------------------------------------------------------LeBlanc Ending----------------------------------------------------------------------
-- ------------------------------------------------------LeBlanc Ending----------------------------------------------------------------------
-- ------------------------------------------------------LeBlanc Ending----------------------------------------------------------------------

-- ------------------------------------------------------Lisandra starting----------------------------------------------------------------------
-- ------------------------------------------------------Lisandra starting----------------------------------------------------------------------
-- ------------------------------------------------------Lisandra starting----------------------------------------------------------------------
-- ------------------------------------------------------Lisandra starting----------------------------------------------------------------------
class "Lissandra"
function Lissandra:__init()
 self.ts= TargetSelector(TARGET_LESS_CAST_PRIORITY, 550, DAMAGE_PHYSICAL, false, true)
self.tsq= TargetSelector(TARGET_LESS_CAST_PRIORITY, 725, DAMAGE_PHYSICAL, false, true)
self.tsw= TargetSelector(TARGET_LESS_CAST_PRIORITY, 450, DAMAGE_MAGIC, false, true)
self.tse= TargetSelector(TARGET_LESS_CAST_PRIORITY, 1050, DAMAGE_MAGIC, false, true)
self.tsr= TargetSelector(TARGET_LESS_CAST_PRIORITY, 550, DAMAGE_MAGIC, false, true) 
   self.QSpell = _Spell({Slot = _Q, DamageName = "Q", Range = 725, Width = 20, Delay = 0.25, Speed = math.huge, Collision = false, Aoe = false, Type = SPELL_TYPE.LINEAR})
   self.WSpell = _Spell({Slot = _W, DamageName = "W", Range = 450, Width = 0, Delay = 0.5, Speed = math.huge, Collision = false, Aoe = true, Type = SPELL_TYPE.SELF})
   self.ESpell = _Spell({Slot = _E, DamageName = "E", Range = 1050, Width = 110, Delay = .25, Speed = math.huge, Collision = false, Aoe = false, Type = SPELL_TYPE.LINEAR})
   self.RSpell = _Spell({Slot = _R, DamageName = "R", Range =550, Width = 0, Delay = 0.25, Speed = math.huge, Collision = false, Aoe = true, Type = SPELL_TYPE.TARGETTED})
   self.RSSpell = _Spell({Slot = _R, DamageName = "R", Range =550, Width = 0, Delay = 0.25, Speed = math.huge, Collision = false, Aoe = true, Type = SPELL_TYPE.TARGETTED})
   self.Ignite = _Spell({Slot = FindSummonerSlot("summonerdot"), DamageName = "IGNITE", Range = 600, Type = SPELL_TYPE.TARGETTED})
--|> Minion Managers
    self.enemyMinions   = minionManager(MINION_ENEMY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self.allyMinions    = minionManager(MINION_ALLY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self.jungleMinions  = minionManager(MINION_JUNGLE,  650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self.otherMinions   = minionManager(MINION_OTHER,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
        self:LoadMenu()
          self:findorbwalker()
    
      AddTickCallback(function() self:Tick() end)
  AddDrawCallback(function() self:Draw() end)
  --AddMsgCallback(function(msg,Key) self:WndMsg(msg,Key) end)
  --AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
  --AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
  --AddApplyBuffCallback(function(source, unit, buff) self:OnApplyBuff(source, unit, buff) end)
  --AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
  --AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end) 
    end
    function Lissandra:Tick()
     self:autozhonya()
     self:engagewithr()
     self:autoR()
     self:autoq()
 if(self.Config.Keys.combokey )then
    self:combo()
  end
      if(self.Config.Keys.jungleclearkey )then
   self:JungleClear()
  end
    if(self.Config.Keys.laneclearkey )then
    self:LaneClear()
  end
   if(self.Config.Keys.combokeyr )then
    self:engagewithr()
  end
    if(self.Config.Keys.escapekey)then
    self:escape()
  end
  if(self.Config.killsteal.ks ) then
    self:killsteal()
  end
  if(self.Config.Keys.harasskey or self.Config.Keys.harasstoglekey  ) then
    self:harass()
  end
    end
    function Lissandra:LoadMenu()
      self.Config=scriptConfig(""..Scriptname.."","menu")
      
      self.Config:addSubMenu("Combo Settings", "combo")
      self.Config.combo:addParam("useQ", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useE", "Use E in combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useR", "Use R in combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useI", "Use Ignite if target killable", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 10, 10, 100, 0)

      
      self.Config:addSubMenu("Harass Settings", "harass")
      self.Config.harass:addParam("useQ", "Harass With Q", SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("useW", "Harass With W", SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("useE", "Harass With E", SCRIPT_PARAM_ONOFF, false)
      self.Config.harass:addParam("autoq", "Auto Harass with Q", SCRIPT_PARAM_ONOFF, false)
      self.Config.harass:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      
      self.Config:addSubMenu("Skill Logics", "skilllogic")
      self.Config.skilllogic:addSubMenu("E Skill Logic", "Elogic")
      self.Config.skilllogic.Elogic:addParam("combo", "E Logic for combo mode", SCRIPT_PARAM_LIST, 2, {"Engage with second E", "Do not use Second E ( Recomended)" })
      self.Config.skilllogic.Elogic:addParam("harass", "E Logic for Harass mode", SCRIPT_PARAM_LIST, 1, {"Do not use Second E ( Recomended)", "Engage with second E" })
      self.Config.skilllogic.Elogic:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.skilllogic.Elogic:addParam("infoE", "Engage with second E option is still on Beta..", SCRIPT_PARAM_INFO,"")
      self.Config.skilllogic:addSubMenu("R Skill Logic", "Rlogic")
      self.Config.skilllogic.Rlogic:addParam("Rlogic", "R Logic for combo mode", SCRIPT_PARAM_LIST, 1, {"Smart", "save for yourself", "Use for enemy" })
      self.Config.skilllogic.Rlogic:addParam("enableautoR", "Auto R for yourself", SCRIPT_PARAM_ONOFF, true)
      self.Config.skilllogic.Rlogic:addParam("autoR", "AutoR if Health under -> %", SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
      self.Config.skilllogic.Rlogic:addParam("infoR2", "", SCRIPT_PARAM_INFO,"")
      self.Config.skilllogic.Rlogic:addParam("infoR", "For using Smart R logic, AutoR should be open..", SCRIPT_PARAM_INFO,"")
      self.Config.skilllogic:addSubMenu("W Skill Logic", "Wlogic") 
      self.Config.skilllogic.Wlogic:addParam("useW", "Use W for Anti GapClose", SCRIPT_PARAM_ONOFF, false)
      self.Config.skilllogic.Wlogic:addParam("infow2", "", SCRIPT_PARAM_INFO,"")
      self.Config.skilllogic.Wlogic:addParam("infoW3", "This Function is on beta..", SCRIPT_PARAM_INFO,"")
      
       self.Config:addSubMenu("Escape Settings","escape")
      self.Config.escape:addParam("useE","Use E While Escape",SCRIPT_PARAM_ONOFF,true)
      self.Config.escape:addParam("useW","Use W While Escape",SCRIPT_PARAM_ONOFF,true)
      
      self.Config:addSubMenu("Farm Settings", "farm")
      
      self.Config.farm:addSubMenu("LaneClear Settings","laneclear")
      self.Config.farm.laneclear:addParam("useQ","Use Q on Laneclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.laneclear:addParam("useW","Use W on Laneclear",SCRIPT_PARAM_ONOFF,false)
      --self.Config.farm.laneclear:addParam("useE","Use E on Laneclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.laneclear:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      
      self.Config.farm:addSubMenu("JungleClear Settings","jungleclear")
      self.Config.farm.jungleclear:addParam("useQ","Use Q on jungleclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.jungleclear:addParam("useW","Use W on jungleclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.jungleclear:addParam("useE","Use E on jungleclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.jungleclear:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      
      --self.Config.farm:addSubMenu("Lasthit Settings","lasthit")
      --self.Config.farm.lasthit:addParam("useQ","Use Q on Lasthit",SCRIPT_PARAM_ONOFF,true)
      --self.Config.farm.lasthit:addParam("useW","Use W on Lasthit",SCRIPT_PARAM_ONOFF,true)
      --self.Config.farm.lasthit:addParam("useE","Use E on Lasthit",SCRIPT_PARAM_ONOFF,true)
      --self.Config.farm.lasthit:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
       
      self.Config:addSubMenu("KillSteal Settings", "killsteal")
      self.Config.killsteal:addParam("ks","Killsteal On/Off",SCRIPT_PARAM_ONOFF,true)
      self.Config.killsteal:addParam("useQ", "Steal With Q", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useE", "Steal With E", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useR", "Steal With R", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useI", "Steal With Ignite", SCRIPT_PARAM_ONOFF, true)
      
      self.Config:addSubMenu("Item Settings", "item")
      self.Config.item:addParam("enableautozhonya", "Auto Zhonya", SCRIPT_PARAM_ONOFF, false)
      self.Config.item:addParam("autozhonya", "Zhonya if Health under -> %", SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
     
      self.Config:addSubMenu("Draw Settings","other")
      --self.Config.other:addSubMenu("Show Damage On Hp Bar", "HPBAR")
      --self.Config.other.HPBAR:addParam("key","ON/OFF",SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addSubMenu("Skill Drawing Settings", "draw")
      self.Config.other.draw:addParam("qdraw","Q Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("wdraw","W Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("edraw","E Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("rdraw","R Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("aadraw","Auto Attack Range",SCRIPT_PARAM_ONOFF,false)

      
      self.Config:addSubMenu("Targetselectors","targetsel")
    self.ts.name  = "Lissandra General"
    self.tsq.name = "Lissandra Q Skill"
    self.tsw.name = "Lissandra W Skill"
    self.tse.name = "Lissandra E Skill"
    self.tsr.name = "Lissandra R Skill"
    self.Config.targetsel:addTS(self.ts)
    self.Config.targetsel:addTS(self.tsq)
    self.Config.targetsel:addTS(self.tsw)
    self.Config.targetsel:addTS(self.tse)
    self.Config.targetsel:addTS(self.tsr) 
    
    self.Config:addSubMenu("Keys Settings", "Keys")
    self.Config.Keys:addParam("infoK3", "<------------------Combo Key Settings------------------>", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("combokey", "Combo Key", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    self.Config.Keys:addParam("combokeyr", "Start Engage With Your Ulti ", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("U"))
    self.Config.Keys:addParam("infoK4", "<------------------Harass Key Settings------------------>", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("harasskey", "Smart Harass Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    self.Config.Keys:addParam("harasstoglekey", "Harass Togle Key", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
    self.Config.Keys:addParam("infoK5", "<------------------Clear Key Settings-------------------->", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("laneclearkey", "LaneClear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    self.Config.Keys:addParam("jungleclearkey", "JungleClear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
    --self.Config.Keys:addParam("lasthitkey", "Lasthit Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    self.Config.Keys:addParam("infoK6", "<------------------Other Key Settings-------------------->", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("escapekey", "Escape Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Y"))
    self.Config.Keys:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
    self.Config.Keys:addParam("infoK2", "Make Sure That Your Orbwalker Keys are Same As Here", SCRIPT_PARAM_INFO,"")
    
        self.Config:addSubMenu("Orbwalker Key Settings", "Keys2")
    OrbwalkManager:LoadCommonKeys(self.Config.Keys2)
    self.Config.Keys2:addParam("infoK4", "", SCRIPT_PARAM_INFO,"")
    self.Config.Keys2:addParam("infoK22", "Make Sure That Your Script Keys are Same As Here", SCRIPT_PARAM_INFO,"")
        
         self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
     self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "") 
     self.Config:addParam("infobox2", "                 Script Version:  "..Version.. "         ", SCRIPT_PARAM_INFO,"")
     self.Config:addParam("infobox6", "            Script was made by  "..Author.. "         ", SCRIPT_PARAM_INFO,"")
     self.Config:addParam("infobox5", "       Leauge Of Legends Version:  "..LVersion.. "         ", SCRIPT_PARAM_INFO,"")
     
     self.Config:permaShow("infobox")
     self.Config.Keys:permaShow("combokey")
     self.Config.Keys:permaShow("harasstoglekey")
     self.Config.Keys:permaShow("harasskey")
  

end
function Lissandra:autozhonya()
  if self.Config.item.enableautozhonya then
   for _ = ITEM_1, ITEM_7 do
    if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
  end
  end
  end
  end
function Lissandra:autoR()
  if ( self.Config.skilllogic.Rlogic.enableautoR and (self.Config.skilllogic.Rlogic.Rlogic == 2 or self.Config.skilllogic.Rlogic.Rlogic == 1)) then
    if myHero.health <= (myHero.maxHealth * self.Config.skilllogic.Rlogic.autoR / 100) then self:CastRS(myHero)
    end
  end
  end

function Lissandra:engagewithr()
 self.tsq:update()
 if self.Config.Keys.combokeyr then
 self:walk()
 end
    if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tsq.target~=nil  and self.Config.combo.useQ and self.Config.Keys.combokeyr  )then
        self:CastQ(self.tsq.target)
    end
    self.tse:update()
    if(self.ESpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tse.target~=nil and self.Config.combo.useE and self.Config.Keys.combokeyr )then
              local Ticker = GetTickCount()
if (global_ticks + 2000) < Ticker then
if (myHero:CanUseSpell(_E) == READY ) then
   CastSpell(_E, self.tse.target.x, self.tse.target.z)
   global_ticks = Ticker
        DelayAction(function() CastSpell(_E) end, 1.5)
    end
    end
    end
    self.tsw:update()
    if(self.WSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokeyr  )then
        self:CastW(self.tsw.target)
    end
    self.tsr:update()
    if(self.RSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokeyr )then
        self:CastR(self.tsr.target)
end
end
function Lissandra:Draw()
    if self.Config.other.draw.qdraw and self.QSpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 725, 1,red)
  end

  if self.Config.other.draw.wdraw and self.WSpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 1050, 1, red)
  end

  if self.Config.other.draw.edraw and self.ESpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 420, 1, red)
  end
  
  if self.Config.other.draw.rdraw and self.RSpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 500,1, red)
  end
  if self.Config.other.draw.aadraw then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 550,1, ARGB(255, 255,0,0))
  end
end
function Lissandra:antigapw()
    if(self.WSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tsw.target~=nil  and self.Config.skilllogic.Wlogic.useW  )then
        self:CastW(self.tsw.target)
    end
end
function Lissandra:combo()
      self.tsq:update()
    if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tsq.target~=nil  and self.Config.combo.useQ and self.Config.Keys.combokey  )then
        self:CastQ(self.tsq.target)
    end
    self.tse:update()
    if(self.Config.skilllogic.Elogic.combo == 1 and  (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.Config.combo.useE and self.Config.Keys.combokey  )then
    local Ticker = GetTickCount()
if (global_ticks + 2000) < Ticker then
if (myHero:CanUseSpell(_E) == READY and self.tse.target~=nil) then
   CastSpell(_E, self.tse.target.x, self.tse.target.z)
   global_ticks = Ticker
        DelayAction(function() CastSpell(_E) end, 1.5)
        end
        end
        end
       if(self.Config.skilllogic.Elogic.combo == 2 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.Config.combo.useE and self.Config.Keys.combokey  )then
       local Ticker = GetTickCount()
if (global_ticks + 2000) < Ticker then
if (myHero:CanUseSpell(_E) == READY and self.tse.target~=nil) then
   CastSpell(_E, self.tse.target.x, self.tse.target.z)
   global_ticks = Ticker
        DelayAction(function() CastSpell(_E) end, 2)
    end
    end
    end
    self.tsw:update()
    if(self.WSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey   )then
        self:CastW(self.tsw.target)
    end
    if(self.Config.skilllogic.Rlogic.Rlogic == 3 or self.Config.skilllogic.Rlogic.Rlogic == 1 and self.RSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.Config.combo.useR and self.Config.Keys.combokey  )then
    for _, unit in pairs(GetEnemyHeroes()) do
      local dmgR =getDmg("R",unit,myHero)+ ((myHero.ap)*0.70) 
      local health=unit.health
      if(health<dmgR and self.Config.combo.useR and GetDistance(unit)<550)then
        self:CastR(unit)
    elseif (self.Config.skilllogic.Rlogic.Rlogic == 2 and  myHero.health <= (myHero.maxHealth * self.Config.skilllogic.Rlogic.autoR / 100)) then 
     self:CastRS(myHero)
        end
    end
    end
    
    if(self.Config.combo.useI and self.Config.Keys.combokey  )then
    for _, unit in pairs(GetEnemyHeroes()) do
      local dmgI =(50+ ((myHero.level)*20))
      local health=unit.health
      if(health<dmgI and self.Config.combo.useI and GetDistance(unit)<600)then
        self:CastI(unit)
    end
    end
end
end
function Lissandra:CastQ(unit)
  self.QSpell:Cast(unit)
end

function Lissandra:CastW(unit)
  self.WSpell:Cast(unit)
end

function Lissandra:CastE(unit)
  self.ESpell:Cast(unit)
end

function Lissandra:CastR(unit)
  self.RSpell:Cast(unit)
end
function Lissandra:CastRS(unit)
 CastSpell(_R , myHero)
end

function Lissandra:CastI(unit)
  self.Ignite:Cast(unit)
end
function Lissandra:killsteal()
for _, unit in pairs(GetEnemyHeroes()) do
    local health = unit.health
    local dmgE = getDmg("E", unit, myHero) + ((myHero.ap)*0.6) 
      if(self.tse.target ~= nil and  self.ESpell:IsReady() and health<dmgE and self.Config.killsteal.useE   and self.Config.killsteal.ks)then
        self:CastE(unit)  
      end
      local dmgQ = getDmg("Q", unit, myHero) + ((myHero.ap)*0.65)
      if(self.tsq.target ~= nil and  self.QSpell:IsReady() and health<dmgQ and self.Config.killsteal.useQ and self.Config.killsteal.ks )then
        self:CastQ(unit)  
      end
      local dmgW = getDmg("W", unit, myHero) + ((myHero.ap)*0.40)
      if(self.tsw.target ~= nil and  self.WSpell:IsReady() and health<dmgQ and self.Config.killsteal.useW and self.Config.killsteal.ks )then
        self:CastW(unit)  
      end
       local dmgI =(50+ ((myHero.level)*20))
      if(health<dmgI and self.Config.killsteal.useI and self.Config.killsteal.ks and GetDistance(unit)<600)then
        self:CastI(unit)
      end
      local dmgR =getDmg("R",unit,myHero)+((myHero.ap)*0.70) 
      if(self.tsr.target ~= nil and  self.RSpell:IsReady() and health<dmgR and self.Config.killsteal.useR and self.Config.killsteal.ks and GetDistance(unit)<550)then
        self:CastR(unit)
      end
   end
end

function Lissandra:escape()
local Ticker = GetTickCount()
if (global_ticks + 2000) < Ticker then
if self.Config.Keys.escapekey and self.Config.escape.useE  then
if (myHero:CanUseSpell(_E) == READY ) then
   CastSpell(_E,mousePos.x,mousePos.z)
   global_ticks = Ticker
        DelayAction(function() CastSpell(_E) end, 1.5)
end
end
end
if self.Config.Keys.escapekey then 
self:walk()
end
if self.Config.Keys.escapekey and self.Config.escape.useW and self.tsw.target~=nil then
CastSpell(_W,tsw.target)
end
end
function Lissandra:walk()
  myHero:MoveTo(mousePos.x,mousePos.z)
end
function Lissandra:harass()
  self.ts:update()
  self.tsq:update()
   self.tsw:update()
    self.tse:update()
  if self.Config.Keys.harasskey or self.Config.Keys.harasstoglekey then
      if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 ) and self.tsq.target~=nil and self.Config.harass.useQ ) then        
        self:CastQ(self.tsq.target)
      end   
      end
  if self.Config.Keys.harasskey or self.Config.Keys.harasstoglekey then
      if(self.WSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 ) and self.tsw.target~=nil and self.Config.harass.useW ) then        
        self:CastW(self.tsw.target)
      end  
      end 
        if self.Config.Keys.harasskey or self.Config.Keys.harasstoglekey  then
      if(self.Config.skilllogic.Elogic.harass == 1  and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 )  and self.Config.harass.useE ) then        
       local Ticker = GetTickCount()
if (global_ticks + 2000) < Ticker then
if (myHero:CanUseSpell(_E) == READY and self.tse.target~=nil) then
   CastSpell(_E, self.tse.target.x, self.tse.target.z)
   global_ticks = Ticker
        DelayAction(function() CastSpell(_E) end, 2)
        end
        end
        end
        end
         if self.Config.Keys.harasskey or self.Config.Keys.harasstoglekey  then
             if(self.Config.skilllogic.Elogic.harass == 2 and   (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 )  and self.Config.harass.useE ) then        
       local Ticker = GetTickCount()
if (global_ticks + 2000) < Ticker then
if (myHero:CanUseSpell(_E) == READY and self.tse.target~=nil) then
   CastSpell(_E, self.tse.target.x, self.tse.target.z)
   global_ticks = Ticker
        DelayAction(function() CastSpell(_E) end, 1.5)
    end
    end
    end
    end
    end
function Lissandra:LaneClear()
 local cleartarget = nil
self.enemyMinions:update()
 self.otherMinions:update()
    self.jungleMinions:update()
    for i, minion in ipairs(self.enemyMinions.objects) do
      if ValidTarget(minion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = minion
      end
    end
    for i, minion in pairs(self.enemyMinions.objects) do
      if ValidTarget(minion) and minion ~= nil then
        if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.Mana /100 ) and GetDistance(minion) <= self.QSpell.Range then 
       local BestPos, BestHit = GetBestLineFarmPosition(self.QSpell.Range, self.QSpell.Width, self.enemyMinions.objects )
      if BestPos  and BestHit > 0 then
       CastSpell(_Q, BestPos.x, BestPos.z)
        end
      if cleartarget ~= nil then
      if(self.WSpell:IsReady() and self.Config.farm.laneclear.useW and self.Config.Keys.laneclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.Mana /100 ) then
        self:CastW(cleartarget)
      end
      end
      end
      end
      end
end
function Lissandra:autoq()

      if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 ) and self.tsq.target~=nil and self.Config.harass.autoq ) then        
        self:CastQ(self.tsq.target)
    end
end
function Lissandra:JungleClear()
local cleartarget = nil
    self.enemyMinions:update()
    self.otherMinions:update()
    self.jungleMinions:update()
    for i, minion in ipairs(self.enemyMinions.objects) do
      if ValidTarget(minion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = minion
      end
    end
    for i, jungleminion in ipairs(self.jungleMinions.objects) do
      if ValidTarget(jungleminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = jungleminion
      end
    end
    for i, otherminion in ipairs(self.otherMinions.objects) do
      if ValidTarget(otherminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = otherminion
      end
    end
    if cleartarget ~= nil then
      if(self.QSpell:IsReady() and self.Config.farm.jungleclear.useQ and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.Mana /100 ) then
        self:CastQ(cleartarget)
      end
      if cleartarget ~= nil then
      if(self.WSpell:IsReady() and self.Config.farm.jungleclear.useW and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.Mana /100 ) then
        self:CastW(cleartarget)
      end
      if cleartarget ~= nil then
      if(self.ESpell:IsReady() and self.Config.farm.jungleclear.useE and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.Mana /100 ) then
        self:CastE(cleartarget)
      end
    end
  end
end
end
-- ------------------------------------------------------Lisandra ending----------------------------------------------------------------------
-- ------------------------------------------------------Lisandra ending----------------------------------------------------------------------
-- ------------------------------------------------------Lisandra ending----------------------------------------------------------------------
-- ------------------------------------------------------Lisandra ending----------------------------------------------------------------------

-- ------------------------------------------------------Viktor Start----------------------------------------------------------------------
-- ------------------------------------------------------Viktor Start----------------------------------------------------------------------
-- ------------------------------------------------------Viktor Start----------------------------------------------------------------------
-- ------------------------------------------------------Viktor Start----------------------------------------------------------------------
class "Viktor"
require 'HPrediction'
function Viktor:__init()
 self.ts= TargetSelector(TARGET_LESS_CAST_PRIORITY, 525, DAMAGE_PHYSICAL, false, true)
  self.tsq= TargetSelector(TARGET_LESS_CAST_PRIORITY, 600, DAMAGE_PHYSICAL, false, true)
  self.tsw= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_MAGIC, false, true)
  self.tse= TargetSelector(TARGET_LESS_CAST_PRIORITY, 1200, DAMAGE_MAGIC, false, true)
  self.tsr= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_MAGIC, false, true) 
   self.QSpell = _Spell({Slot = _Q, DamageName = "Q", Range = math.huge, Width = 1, Delay = 0, Speed = math.huge, Collision = true, Aoe = false, Type = SPELL_TYPE.TARGETTED})
   self.WSpell = _Spell({Slot = _W, DamageName = "W", Range = math.huge, Width = 125, Delay = 0.5, Speed = 750, Collision = false, Aoe = true, Type = SPELL_TYPE.CIRCULAR})
   self.ESpell = _Spell({Slot = _E, DamageName = "E", Range = 1200, Width = 90, Delay = 0, Speed = math.huge, Collision = true, Aoe = false, Type = SPELL_TYPE.LINEAR})
   self.RSpell = _Spell({Slot = _R, DamageName = "R", Range =700, Width = 0, Delay = 0.25, Speed = 1000, Collision = false, Aoe = true, Type = SPELL_TYPE.CIRCULAR})
   self.Ignite = _Spell({Slot = FindSummonerSlot("summonerdot"), DamageName = "IGNITE", Range = 600, Type = SPELL_TYPE.TARGETTED})
   self.HPred = HPrediction()
   self.E = {Range1 = 550, Range2 = 700, width = 180, ready}
   self.ERange = self.E.Range1+self.E.Range2
--|> Minion Managers
    self.enemyMinions   = minionManager(MINION_ENEMY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self.allyMinions    = minionManager(MINION_ALLY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self.jungleMinions  = minionManager(MINION_JUNGLE,  650, myHero, MINION_SORT_MAXHEALTH_DEC)
    self.otherMinions   = minionManager(MINION_OTHER,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
            self:LoadMenu()
            self:findorbwalker()
    
      AddTickCallback(function() self:Tick() end)
  AddDrawCallback(function() self:Draw() end)
  --AddMsgCallback(function(msg,Key) self:WndMsg(msg,Key) end)
  --AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
  --AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
  --AddApplyBuffCallback(function(source, unit, buff) self:OnApplyBuff(source, unit, buff) end)
  --AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
  --AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end) 
    end
-- handles script logic, a pure high speed loop
function Viktor:Tick()
     self:autozhonya()
 if(self.Config.combo.combokey )then
    self:combo()
  end
  if(self.Config.laneclear.laneclearkey)then
    self:LaneClear()
  end
    if(self.Config.jungleclear.jungleclearkey)then
    self:JungleClear()
  end
  if(self.Config.killsteal.ks ) then
    self:killsteal()
  end
  if(self.Config.harass.harasskey or self.Config.harass.harasstogle ) then
    self:harass()
  end
    end
function Viktor:LoadMenu()
      self.Config=scriptConfig(""..Scriptname.."","menu")
      self.Config:addSubMenu("Hitchance", "hit")
      self.Config.hit:addParam("E", "E HitChance (Default value = 1.6)", SCRIPT_PARAM_SLICE, 1.6, 1, 3, 2)
     
      self.Config:addSubMenu("Combo Settings", "combo")
      self.Config.combo:addParam("combokey", "Combo Key", SCRIPT_PARAM_ONKEYDOWN, false, 32)
      self.Config.combo:addParam("useQ", "Use Q in Combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useW", "Use W in Combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useE", "Use E in combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useR", "Use R in combo", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useI", "Use Ignite if target killable", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("logic", "Ulti Logic", SCRIPT_PARAM_LIST, 1, {"Use Ulti If Target Is Killable",}) --("Use Ulti Directly" })
      self.Config.combo:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 10, 10, 100, 0)
      
      self.Config:addSubMenu("Harass Settings", "harass")
      self.Config.harass:addParam("harasskey", "Smart Harass Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
      self.Config.harass:addParam("harasstogle", "Smart Auto Harass",   SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
      self.Config.harass:addParam("useQ", "Harass With Q", SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("useE", "Harass With E", SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("E", "E HitChance (Default value = 2)", SCRIPT_PARAM_SLICE, 2, 1, 3, 2)
      self.Config.harass:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      
      self.Config:addSubMenu("LaneClear Settings","laneclear")
      self.Config.laneclear:addParam("laneclearkey", "Lane Clear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
      self.Config.laneclear:addParam("useQ","Use Q on Laneclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.laneclear:addParam("useE","Use E on Laneclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.laneclear:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      
      self.Config:addSubMenu("JungleClear Settings","jungleclear")
      self.Config.jungleclear:addParam("jungleclearkey", "JungleClear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
      self.Config.jungleclear:addParam("useQ","Use Q on jungleclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.jungleclear:addParam("useE","Use E on jungleclear",SCRIPT_PARAM_ONOFF,true)
      self.Config.jungleclear:addParam("Mana","Mana Manager %",SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
       
      self.Config:addSubMenu("KillSteal Settings", "killsteal")
      self.Config.killsteal:addParam("ks","Killsteal On/Off",SCRIPT_PARAM_ONOFF,true)
      self.Config.killsteal:addParam("useQ", "Steal With Q", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useE", "Steal With E", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useR", "Steal With R", SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useI", "Steal With Ignite", SCRIPT_PARAM_ONOFF, true)
      
      self.Config:addSubMenu("Item Settings", "item")
      self.Config.item:addParam("enableautozhonya", "Auto Zhonya", SCRIPT_PARAM_ONOFF, false)
      self.Config.item:addParam("autozhonya", "Zhonya if Health under -> %", SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
     
      self.Config:addSubMenu("Draw Settings","other")
      --self.Config.other:addSubMenu("Show Damage On Hp Bar", "HPBAR")
      --self.Config.other.HPBAR:addParam("key","ON/OFF",SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addSubMenu("Skill Drawing Settings", "draw")
      self.Config.other.draw:addParam("qdraw","Q Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("wdraw","W Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("edraw","E Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("rdraw","R Skill Drawings",SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("aadraw","Auto Attack Range",SCRIPT_PARAM_ONOFF,false)
      
      self.Config:addSubMenu("Targetselectors","targetsel")
   self.ts.name  = "Viktor"
    self.tsq.name = "ViktorQ"
    self.tsw.name = "ViktorW"
    self.tse.name = "ViktorE"
    self.tsr.name = "ViktorR"
    self.Config.targetsel:addTS(self.ts)
    self.Config.targetsel:addTS(self.tsq)
    self.Config.targetsel:addTS(self.tsw)
    self.Config.targetsel:addTS(self.tse)
    self.Config.targetsel:addTS(self.tsr) 
    self.Config:addSubMenu("Keys Settings", "Keys")
    OrbwalkManager:LoadCommonKeys(self.Config.Keys)
         self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
     self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "") 
     self.Config:addParam("infobox2", "                 Script Version:  "..Version.. "         ", SCRIPT_PARAM_INFO,"")
     self.Config:addParam("infobox6", "            Script was made by  "..Author.. "         ", SCRIPT_PARAM_INFO,"")
     self.Config:addParam("infobox5", "       Leauge Of Legends Version:  "..LVersion.. "         ", SCRIPT_PARAM_INFO,"")
     
     self.Config:permaShow("infobox")
     self.Config.combo:permaShow("combokey")
     self.Config.harass:permaShow("harasstogle")
     self.Config.harass:permaShow("harasskey")
  
end
function Viktor:Draw()
    if self.Config.other.draw.qdraw and self.QSpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 600, 1,red)
  end

  if self.Config.other.draw.wdraw and self.WSpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 700, 1, red)
  end

  if self.Config.other.draw.edraw and self.ESpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 1200, 1, red)
  end
  
  if self.Config.other.draw.rdraw and self.RSpell:IsReady() then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 700,1, red)
  end
  if self.Config.other.draw.aadraw then
    DrawCircle3D(myHero.x, myHero.y, myHero.z, 525,1, ARGB(255, 255,0,0))
  end
end
function Viktor:autozhonya()
  if self.Config.item.enableautozhonya then
   for _ = ITEM_1, ITEM_7 do
    if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
  end
  end
  end
  end
  function Viktor:onlyr()
  if (self.RSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.Config.combo.useR and self.Config.combo.combokey and GetDistance(self.tsr.target)<700 )then
    self:CastR(self.tsr.target)
    end
  end
function Viktor:combo()
      self.tsq:update()
    if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tsq.target~=nil  and self.Config.combo.useQ and self.Config.combo.combokey  )then
        self:CastQ(self.tsq.target)
    end
    self.tse:update()
    if(self.ESpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tse.target~=nil and self.Config.combo.useE and self.Config.combo.combokey  )then
        self:CastE(self.tse.target)
    end
    self.tsw:update()
    if(self.WSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.tsw.target~=nil and self.Config.combo.useW and  self.Config.combo.combokey  )then
        self:CastW(self.tsw.target)
    end
    if( self.RSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.Config.combo.useR and self.Config.combo.combokey )then
    for _, unit in pairs(GetEnemyHeroes()) do
      local dmgR =getDmg("R",unit,myHero)+ ((myHero.ap)*0.55) 
      local health=unit.health
      if(health<dmgR and self.Config.combo.logic == 1 and self.Config.combo.useR and GetDistance(unit)<700)then
        self:CastR(unit)
     end
     end
     if (self.Config.combo.logic == 2 and self.tsr.target~=nil) then
     self:onlyr()
    end
  
    if(self.Config.combo.useI and self.Config.combo.combokey )then
    for _, unit in pairs(GetEnemyHeroes()) do
      local dmgI =(50+ ((myHero.level)*20))
      local health=unit.health
      if(health<dmgI and self.Config.combo.useI and GetDistance(unit)<600)then
        self:CastI(unit)
    end
    end
end
end
end
function Viktor:CastQ(unit)
  self.QSpell:Cast(unit)
end

function Viktor:CastW(unit)
  self.WSpell:Cast(unit)
end

function Viktor:CastE(unit)
 
  if unit.dead or unit.health == 0 then
    return
  end
  
  if GetDistance(unit, myHero) > self.E.Range1-5 then
   EStartPos = CircleIntersection(myHero, unit, myHero, self.E.Range1-5)
  else
   EStartPos = Vector(unit.x, unit.y, unit.z)
  end
  
   EPos, EHitChance = self.HPred:GetPredict(self.HPred.Presets['Viktor']["E"], unit, EStartPos)
  
  if mode == "Combo" and EHitChance >= self.Config.hit.E or mode == "Harass" and EHitChance >= self.Config.harass.E or  mode == nil and EHitChance > 1 then
    CastSpell3(_E, D3DXVECTOR3(EStartPos.x, 0, EStartPos.z), D3DXVECTOR3(EPos.x, 0, EPos.z))
  end
  
end

function Viktor:CastR(unit)
  self.RSpell:Cast(unit)
end
function Viktor:CastI(unit)
  self.Ignite:Cast(unit)
end
function Viktor:killsteal()
for _, unit in pairs(GetEnemyHeroes()) do
    local health = unit.health
    local dmgE = getDmg("E", unit, myHero) + ((myHero.ap)*0.7) + ((getDmg("E", unit, myHero) + ((myHero.ap)*0.7))*0.4)
      if(self.tse.target ~= nil and  self.ESpell:IsReady() and health<dmgE and self.Config.killsteal.useE and GetDistance(unit)<700   and self.Config.killsteal.ks)then
        self:CastE(unit)  
      end
      local dmgQ = getDmg("Q", unit, myHero) + ((myHero.ap)*0.30)
      if(self.tsq.target ~= nil and  self.QSpell:IsReady() and health<dmgQ and self.Config.killsteal.useQ and self.Config.killsteal.ks )then
        self:CastQ(unit)  
      end
       local dmgI =(50+ ((myHero.level)*20))
      if(health<dmgI and self.Config.killsteal.useI and self.Config.killsteal.ks and GetDistance(unit)<600)then
        self:CastI(unit)
      end
      local dmgR =getDmg("R",unit,myHero)+((myHero.ap)*0.55) 
      if(self.tsr.target ~= nil and  self.RSpell:IsReady() and health<dmgR and self.Config.killsteal.useR and self.Config.killsteal.ks and GetDistance(unit)<700)then
        self:CastR(unit)
      end
   end
end

function Viktor:harass()
  self.ts:update()
  self.tsq:update()
  if self.Config.harass.harasskey or self.Config.harass.harasstogle  then
      if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 ) and self.tsq.target~=nil and self.Config.harass.useQ ) then        
        self:CastQ(self.tsq.target)
      end   
      self.tse:update()
       if(self.ESpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 ) and self.tse.target ~= nil and self.Config.harass.useE  and ValidTarget(self.tse.target, self.ERange)) then
      self:CastE(self.tse.target)
  end

      end
    end   
 
function Viktor:LaneClear()
 local cleartarget = nil
    self.enemyMinions:update()
    self.otherMinions:update()
    self.jungleMinions:update()
    for i, minion in ipairs(self.enemyMinions.objects) do
      if ValidTarget(minion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = minion
      end
    end
    for i, jungleminion in ipairs(self.jungleMinions.objects) do
      if ValidTarget(jungleminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = jungleminion
      end
    end
    for i, otherminion in ipairs(self.otherMinions.objects) do
      if ValidTarget(otherminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = otherminion
      end
    end
    if cleartarget ~= nil then
      if(self.QSpell:IsReady() and self.Config.laneclear.useQ and self.Config.laneclear.laneclearkey) and (myHero.mana / myHero.maxMana > self.Config.laneclear.Mana /100 ) then
        self:CastQ(cleartarget)
      end
     if cleartarget ~= nil then
      if(self.ESpell:IsReady() and self.Config.laneclear.useE and self.Config.laneclear.laneclearkey) and (myHero.mana / myHero.maxMana > self.Config.laneclear.Mana /100 ) then
      local BestPos, BestHit = GetBestLineFarmPosition(self.ESpell.Range, self.ESpell.Width, self.enemyMinions.objects )
      if BestPos ~= nil and BestHit >= 1 then
       CastSpell(_E, BestPos.x, BestPos.z)
      end
    end
  end
  end
  end
  function Viktor:JungleClear()
 local cleartarget = nil
    self.enemyMinions:update()
    self.otherMinions:update()
    self.jungleMinions:update()
    for i, jungleminion in ipairs(self.jungleMinions.objects) do
      if ValidTarget(jungleminion, 600) and (cleartarget == nil or not ValidTarget(cleartarget)) then
        cleartarget = jungleminion
      end
    end
    if cleartarget ~= nil then
      if(self.QSpell:IsReady() and self.Config.jungleclear.useQ and self.Config.jungleclear.jungleclearkey) and (myHero.mana / myHero.maxMana > self.Config.jungleclear.Mana /100 ) then
        self:CastQ(cleartarget)
      end
      if cleartarget ~= nil then
      if(self.ESpell:IsReady() and self.Config.jungleclear.useE and self.Config.jungleclear.jungleclearkey) and (myHero.mana / myHero.maxMana > self.Config.jungleclear.Mana /100 ) then
        self:CastE(cleartarget)
      end
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
function GetBestLineFarmPosition(range, width, objects)
    local BestPos 
    local BestHit = 0
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
function CountObjectsNearPos(pos, range, radius, objects)
    local n = 0
    for i, object in ipairs(objects) do
        if GetDistanceSqr(pos, object) <= radius * radius then
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

-- -------------------------------------------orb walk settings start------------------------------------------------------------------

function Viktor:findorbwalker()
 if _G.Reborn_Loaded then
    SAC=true and
    DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry has been found") end, 2)
        DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry integration has been finished succesfully") end, 8)
  elseif not _G.Reborn_Loaded and FileExist(LIB_PATH .. "SxOrbWalk.lua") then
    SxOrb=true and 
  DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk has been found") end, 2)
          DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk integration has been finished succesfully") end, 4)
    require("SxOrbWalk")
    DelayAction(function()  self.Config:addSubMenu("SxOrbWalk","orbWalk") end,5)
    DelayAction(function() _G.SxOrb:LoadToMenu(self.Config.orbWalk) end,5)
  elseif SAC~=true and SxOrb~= true then
    p("=================")
    p("=================")
    p("SxOrb or SAC:R is required.")
    p("=================")
    p("=================")
  end
end
function Lissandra:findorbwalker()
 if _G.Reborn_Loaded then
    SAC=true and
    DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry has been found") end, 2)
        DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry integration has been finished succesfully") end, 8)
  elseif not _G.Reborn_Loaded and FileExist(LIB_PATH .. "SxOrbWalk.lua") then
    SxOrb=true and 
  DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk has been found") end, 2)
          DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk integration has been finished succesfully") end, 4)
    require("SxOrbWalk")
    DelayAction(function()  self.Config:addSubMenu("SxOrbWalk","orbWalk") end,5)
    DelayAction(function() _G.SxOrb:LoadToMenu(self.Config.orbWalk) end,5)
  elseif SAC~=true and SxOrb~= true then
    p("=================")
    p("=================")
    p("SxOrb or SAC:R is required.")
    p("=================")
    p("=================")
  end
end
function Leblanc:findorbwalker()
 if _G.Reborn_Loaded then
    SAC=true and
    DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry has been found") end, 2)
        DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry integration has been finished succesfully") end, 8)
  elseif not _G.Reborn_Loaded and FileExist(LIB_PATH .. "SxOrbWalk.lua") then
    SxOrb=true and 
  DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk has been found") end, 2)
          DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk integration has been finished succesfully") end, 4)
    require("SxOrbWalk")
    DelayAction(function()  self.Config:addSubMenu("SxOrbWalk","orbWalk") end,5)
    DelayAction(function() _G.SxOrb:LoadToMenu(self.Config.orbWalk) end,5)
  elseif SAC~=true and SxOrb~= true then
    p("=================")
    p("=================")
    p("SxOrb or SAC:R is required.")
    p("=================")
    p("=================")
  end
end
-- -------------------------------------------orb walk settings start------------------------------------------------------------------
 function Drawdmglib()
  if(FileExist(LIB_PATH.."DrawDamageLib.lua"))then
    check=1
  else
    check=0
  end 
   if _Required():Add({Name = "DrawDamageLib", Url = "raw.githubusercontent.com/innerout/BotOfLegends/master/DrawDamageLib.lua"}):Check():IsDownloading() then return end 
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

--iskeydownfix start
local originalKD = _G.IsKeyDown;
_G.IsKeyDown = function(theKey)
  if (type(theKey) ~= 'number') then
    local theNumber = tonumber(theKey);
    if (theNumber ~= nil) then
      return originalKD(theNumber);
    else
      return originalKD(GetKey(theKey));
    end;
  else
    return originalKD(theKey);
  end;
end;
--iskeydownfix end
-- All classic necesseries end
