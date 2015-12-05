
local version = 2.08
  local author = "Ensuluyn"
  local SCRIPT_NAME = "KeyboardMasterLib"
  local AUTOUPDATE = true
  local UPDATE_HOST = "raw.github.com"
  local UPDATE_PATH = "/Lonsemaria/scripts/master/KeyboardMasterLib.lua".."?rand="..math.random(1,10000)
  local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
  local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
  function Say(text)
    print("<font color=\"#FF0000\"><b>Keyboard Master Lib:</b></font> <font color=\"#FFFFFF\">" .. text .. "</font>")
  end
  
  if AUTOUPDATE then
    local ServerData = GetWebResult(UPDATE_HOST, "/Lonsemaria/scripts/master/version/Packet.version")
    if ServerData then
      ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
      if ServerVersion then
        if tonumber(version) < ServerVersion then
          Say("New version available "..ServerVersion)
          Say("Updating, please don't press F9")
          DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () Say("Successfully updated., press F9 twice to load the updated version.") end) end, 3)
        else
          Say("-Welcome, You have got the latest version ")
        end
      end
    else 
      Say("Error downloading version info")
    end
  end
  
  _G.LevelSpell = function(id)
    local offsets = { 
    [_Q] = 0x61,
    [_W] = 0x81,
    [_E] = 0xA1,
    [_R] = 0xC1,
  }
  local p = CLoLPacket(0x0033)
  p.vTable = 0xEECE14
  p:EncodeF(myHero.networkID)
  p:Encode1(0x73)
  for i = 1, 4 do p:Encode1(0xF9) end
  for i = 1, 4 do p:Encode1(0x1E) end
  p:Encode1(offsets[id])
  for i = 1, 4 do p:Encode1(0x99) end
  for i = 1, 4 do p:Encode1(0x00) end
  SendPacket(p)
end
function SendSkinPacket(mObject, skinPB, networkID)
  if (string.find(GetGameVersion(), 'Releases/5.20') ~= nil) then
    local mP = CLoLPacket(0xDC);

    mP.vTable = 0xEF5D84;

    mP:EncodeF(networkID);
    
    mP:Encode1(0xC3);
    mP:Encode4(0x00000000);
    mP:Encode1(0x09);
    if (skinPB == nil) then
      mP:Encode4(0xE5E5E5E5);
    else
      mP:Encode1(skinPB);
      for I = 1, 3 do
        mP:Encode1(skinH);
      end;
    end;
    mP:Encode1(0xB4);

    for I = 1, string.len(mObject) do
      mP:Encode1(string.byte(string.sub(mObject, I, I)));
    end;

    for I = 1, (16 - string.len(mObject)) do
      mP:Encode1(0x00);
    end;

    mP:Encode4(0x0000000E);
    mP:Encode4(0x0000000F);
    mP:Encode4(0x00000000);
    
    mP:Hide();
    RecvPacket(mP);
  elseif (string.find(GetGameVersion(), 'Releases/5.21') ~= nil) then
      local mP = CLoLPacket(0x12A);

      mP.vTable = 0xEA298C;

      mP:EncodeF(networkID);
      
      mP:Encode4(0x00000000);
      mP:Encode2(0x0000);

      for I = 1, string.len(mObject) do
        mP:Encode1(string.byte(string.sub(mObject, I, I)));
      end;

      for I = 1, (16 - string.len(mObject)) do
        mP:Encode1(0x00);
      end;

      mP:Encode4(0x0000000E);
      mP:Encode4(0x0000000F);
      if (skinPB == nil) then
        mP:Encode4(0x4E4E4E4E);
      else
        mP:Encode1(skinPB);
        for I = 1, 3 do
          mP:Encode1(skinH);
        end;
      end;
      mP:Encode4(0x00000000);
      mP:Encode1(0x00);

      mP:Hide();
      RecvPacket(mP);
  end;
end;
if (string.find(GetGameVersion(), 'Releases/5.20') ~= nil) then
  skinsPB = {
    [1] = 0xE6,
    [2] = 0x06,
    [3] = 0x26,
    [4] = 0x36,
    [5] = 0x46,
    [6] = 0x66,
    [7] = 0x76,
    [8] = 0x86,
    [9] = 0xA6,
    [10] = 0xB6,
    [11] = 0xC6,
    [12] = 0xF6,
  };
  skinObjectPos = 17;
  skinHeader = 0xDC;
  dispellHeader = 0x73;
  skinH = 0xE6;
  skinHPos = 12;
elseif (string.find(GetGameVersion(), 'Releases/5.21') ~= nil) then
    skinsPB = {
      [1] = 0x52,
      [2] = 0x3E,
      [3] = 0x42,
      [4] = 0x5E,
      [5] = 0x62,
      [6] = 0xAE,
      [7] = 0xB2,
      [8] = 0xBE,
      [9] = 0xC2,
      [10] = 0xCE,
      [11] = 0xD2,
      [12] = 0xDE,
    };
    skinObjectPos = 12;
    skinHeader = 0x12A;
    dispellHeader = 0x79;
    skinH = 0x52;
    skinHPos = 36;
end;
