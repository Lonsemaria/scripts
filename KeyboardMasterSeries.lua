
---//==================================================\\---
--|| KeyMasterLib Download                             ||--
---\\==================================================//---
if FileExist(LIB_PATH .. "KeyboardMasterLib.lua") then
  require("KeyboardMasterLib")
else
  skinload = true
  DelayAction(DownloadFile, 0, {
    "https://raw.githubusercontent.com/Lonsemaria/scripts/master/KeyboardMasterLib.lua",
    LIB_PATH.."\\KeyboardMasterLib.lua",
    function ()
      print("<font color=\"#00FFFF\"><b>[KeyboardMasterLib]</b></font> <font color=\"#FFFFFF\">KeyboardMasterLib.lua is necessery, please wait while downloading.</font>")
      DelayAction(function()print("<font color=\"#00FFFF\"><b>[KeyboardMasterLib]</b></font> <font color=\"#FFFFFF\">KeyboardMasterLib.lua has been downloaded, Please reload (2xF9)</font>") end, 5.5)
    end
  })
end
---//==================================================\\---
--|| > Script Start                                       ||--
---\\==================================================//---
local Version = "4.02"
local LVersion = " " .. currentpatch..""
local Scriptname = "Keyboard Master Series"
local Author = "Ensuluyn"
local list = "Leblanc , Lissandra , Viktor, Akali, Diana"
local link = "Go to http://forum.botoflegends.com/forum/20-champion-scripts/ then you can see my topic "..Scriptname.." on the first or second page."
local date = "06.02.2016"
global_ticks = 0
local lastTimeTickCalled = 0
local skinload = false
if skinload then
  local skinsPB = {};
  local skinObjectPos = nil;
  local skinHeader = nil;
  local dispellHeader = nil;
  local skinH = nil;
  local skinHPos = nil;
end
local lang = "eng"
local ava_languages = {"eng", "tr","gr"}


---//==================================================\\---
--|| > English Translation details               ||--
---\\==================================================//---
local loc_eng = {
  --General Menu(Combo) // 8 // 1
  "Combo Settings", "Use Q in Combo", "Use W in Combo", "Use E in Combo", "Use R in Combo" ,
  "Use Ignite if target killable","Combo logic","Mana Manager %",
  --General Menu(Harass) // 5 // 9
  "Harass Settings","Harass With Q","Harass With W","Harass With E","Harass With R",
  --General Menu(Clear) // 16 // 14
  "Farm Settings","LaneClear Settings","Use Q on Laneclear","Use W on Laneclear","Use E on Laneclear","Use R on Laneclear",
  "JungleClear Settings","Use Q on jungleclear","Use W on jungleclear","Use E on jungleclear","Use R on jungleclear",
  "Lasthit Settings","Use Q on Lasthit","Use W on Lasthit","Use E on Lasthit","Use R on Lasthit",
  --General Menu(Escape) // 5 // 30
  "Escape Settings","Use Q While Escape","Use W While Escape","Use E While Escape","Use R While Escape",
  --General Menu(Killsteal) // 7 // 35
  "KillSteal Settings","Killsteal On/Off","Steal With Q","Steal With W","Steal With E","Steal With R","Steal With Ignite",
  --General Menu(İtem Settings) // 5 // 42
  "Item Settings","Auto Zhonya", "Zhonya if Health under -> %", "Use Hextech Gunblade", "Use Bilgewater Cutlass",
  --General Menu(Vıp Settings) // 19 // 47
  "VIP Settings","Use Packet Casting","To use vip settings, Packet Casting should be open.", "Auto Level Settings","Use Auto Level",
  "Select Skill Order","Skin Hack Settings","Use Skin Hack","Make sure that using packet casting is ON.",
  "To use vip settings, You need to be a VIP user on BOL community.","Select Skin",
  "Focus Q>W>E", "Focus Q>E>W","Focus W>Q>E","Focus W>E>Q","Focus E>W>Q", "Focus E>Q>W", "Smart" ,
  --General Menu(Draw Settings) // 12 // 65
  "Draw Settings","Skill Drawing Settings","Q Skill Drawings","W Skill Drawings","E Skill Drawings","R Skill Drawings","Auto Attack Range",
  "Draw Combo Mode","Draw Permabox","Draw Permabox ( Needs 2x F9 )","Draw circle for target selected","Target calculation",
  --General Menu(Target Selectors) // 2 // 77
  "Targetselectors","Left Click For Target Selection",
  --General Menu(Key Settings) // 13 // 79
  "Keys Settings", "<------------------Combo Key Settings------------------>","Combo Key","<------------------Harass Key Settings------------------>",
  "Smart Harass Key","<------------------Clear Key Settings-------------------->","LaneClear Key","JungleClear Key",
  "<------------------Other Key Settings-------------------->","Escape Key", "Make Sure That Your Orbwalker Keys are Same As Here","OrwWalkerKey Settings",
  "Auto Harass Q",
  --General Menu(Misc Settings) // 7 // 92
  "Misc Settings", "[" .. myHero.charName.. "] - Auto-Interrupt","Interrupt with Q Skill","Interrupt with W Skill","Interrupt with E Skill",
  "Interrupt with R Skill","                  [Supported Skills]",
  -- General Menu(Skill Logic) // 6 // 99
  "Skill Logics","Q Skill Logic","W Skill Logic","E Skill Logic","R Skill Logic","Health Manager %",
  -- General Menu(Hitchance Settings) // 5 // 105
  "Hitchance","Q Hitchance","W Hitchance","E Hitchance","R Hitchance",
  -- General Menu(Orbwalk Settings) // 5  // 110
  "OrbWalkerKey Settings",
  "                 Script Version:  "..Version.. "         ","            Script was made by  "..Author.. "         ",
  "       Leauge Of Legends Version:  "..LVersion.. "         ","Current Orbwalker:                      Sidas Auto Carry",
  "Current Orbwalker:                             SxOrbWalk",
  -- Leblanc Menu // 13 // 116
  "Q>E>W>R", "Q>R>E>W", "E>Q>W>R", "E>W>Q>R" ,"Random Skill Order","W Skill turn back settings","Turn back to W spot on Q>E>W>R mode ",
  "Turn back to W spot on Q>R>E>W mode ","Turn back to W spot on E>Q>W>R mode ","Turn back to W spot on E>W>Q>R mode ",
  "Turn back to W spot on Random Skill Order mode ","Steal With QW","Only use E Skill (Only Stun)"," Select Combomode Key",
  -- Akali Menu // 9
  "2 enemy", "3 enemy" , "4 enemy","5 enemy","Use R if Q is on target", "Rush Skills","Use Stealth if enemy >","Use Stealth if healt %","Use Stealth (W)",
  -- Diana Menu // 4
  "Smart Combo", "Use R if target marked" , "Spam everything fast","Use E only if enemy distance > 280",
  -- Lissandraa Menu // 17
  "E Logic for combo mode","E Logic for harass mode","Engage with second E", "Do not use Second E ( Recomended)" ,
  "Do not use Second E ( Recomended)", "Engage with second E" ,"Smart", "save for yourself", "Use for enemy" ,"Auto R for yourself",
  "AutoR if Health under -> %", "Engage with second E option is still on Beta..", "R Logic for combo mode", "For using Smart R logic, AutoR should be open..",
  "Use W for Anti GapClose","This Function is on beta..",
  -- Viktor Menu // 5
  "Ulti Logic","Use Ulti If Target Is Killable","Use Ulti Directly" ,"E HitChance (Default value = 1.6)","E HitChance (Default value = 2)","Smart Auto Harass",
  -- language menu// 5
  "Language(Needs 2xF9)","English", "Turkish","German","Korean",
  -- Extrass//
  "Start Engage With Your Ulti ",
  -- rework// 171
  "Auto W back if health >","Always","Depends on local Settings","Never","Enemy Number","Auto W back if enemy >","                        [Local Settings]","Turn back to W spot on W>R>Q>E mode ",
  "Turn back to W spot on W>Q>R>E mode ","Minimum minion to Q >","Minimum minion to W >","Minimum minion to E >","Minimum minion to R >","                        [Mana Manager]",
  "Q Skill Mana Manager  %","W Skill Mana Manager  %","E Skill Mana Manager  %","R Skill Mana Manager  %","Use Auto Lasthit","Only if cannot AA","Lasthit Logic","Auto Potion","Use Auto Potion",
  "Auto Potion if Health under -> %","Anti-AFK Settings","Use Anti Afk","E -Target draw","Color Settings","Q Color","W Color","E Color","R Color","E -Target Color","Auto Attack Color",
  "Selected Target Color","Draw Width Settings","E -Target Width","Selected Target Width","Auto Attack Width","Q Skill Width","W Skill Width","E Skill Width","R Skill Width","Draw Damage Indicator",
  "Lasthit Key","Click For Instructions","Use if needed","Clear Key Settings","[" .. myHero.charName.. "] - Anti Gap-Close","Gap-Close With W Skill","Humanizer for Anti Gap Close",
  "Auto W Settings","Use Auto W ","Auto W if enemy >","R -Target draw","R -Target Color","R -Target Width"
}

---//==================================================\\---
--|| > Turkish Translation details               ||--
---\\==================================================//---
local loc_tr = {
  --General Menu(Combo) // 8
  "Kombo Ayarlari", "Komboda Q kullan", "Komboda W kullan", "Komboda E kullan", "Komboda R kullan" ,
  "Hedef olucekse tutustur kullan","Kombonu sec ","Mana Menajeri %",
  --General Menu(Harass) // 5
  "Durtme Ayarlari","Rakibi Q ile durt","Rakibi W ile durt","Rakibi E ile durt","Rakibi R ile durt",
  --General Menu(Clear) // 16
  "Farm Ayarlari","Koridor Temizleme Ayarlari","Q skilini Kullan","W skilini Kullan","E skilini Kullan","R skilini Kullan",
  "Orman Temizleme Ayarlari","Q skilini Kullan","W skilini Kullan","E skilini Kullan","R skilini Kullan",
  "Son Vurus Ayarlari","Q skilini Kullan","W skilini Kullan","E skilini Kullan","R skilini Kullan",
  --General Menu(Escape) // 5
  "Kacis Ayarlari","Kacarken Q kullan","Kacarken W kullan","Kacarken E kullan","Kacarken R kullan",
  --General Menu(Killsteal) // 7
  "Kill Calma Ayarlari","Kill Calma Kapali / Acik","Q skilini Kullan","W skilini Kullan","E skilini Kullan","R skilini Kullan","Tutustur Kullan",
  --General Menu(İtem Settings) // 5
  "Item Ayarlari","Otomatik Zhonya", "Zhonya Eger can -> %", "Hextech Gunblade kullan", "Bilgewater Cutlass kullan",
  --General Menu(Vıp Settings) // 19
  "VIP Ayarlari","Packet Casting Kullan","Vip ayarlarini kullanmak icin packet casting acik olmalidir.", "Otomatik Seviye Ayarlari","Otomatik Seviye",
  "Yetenek Duzeninin Secin","Kostum Hack Ayarlari","Kostum Hack Kullan","Packet Casting acik oldugundan emin olunuz",
  "Vip ayarlarini kullanmak icin BOL Vip uyesi olmaniz gerekmektedir.","Kostum sec",
  "Q>W>E ", "Q>E>W","W>Q>E","W>E>Q","E>W>Q", "E>Q>W", "Akilli" ,
  --General Menu(Draw Settings) // 11
  "Cizim Ayarlari","Yetenek Cizim Ayarlari","Q Yetenek menzilini ciz","W Yetenek menzilini ciz","E Yetenek menzilini ciz","R Yetenek menzilini ciz","Otomatik Saldiri Menzili",
  "Kombo Modunu Ciz","Permabox Ciz","Permabox Ciz ( 2x F9 Gerekir )","Secili hedefi daire icine al","Hedef hasar hesapla",
  --General Menu(Target Selectors) // 2
  "Hedef Secici","Sol tik ile hedef sec",
  --General Menu(Key Settings) // 13
  "Tus Ayarlari", "<------------------Kombo Tus Ayarlari------------------>","Kombo Tusu","<------------------Durtme Tus Ayari------------------>",
  "Durtme Tusu","<------------------Temizleme Tus Ayarlari-------------------->","Koridor Temizleme Tusu","Orman Temizleme Tusu",
  "<------------------Diger Tus Ayarlari-------------------->","Kacis Tusu", "Orbwalker Tuslariniz Burayla Ayni Olmalidir.","OrwWalkerKey Ayarlari",
  "Otomatik Q Durtme",
  --General Menu(Misc Settings) // 7
  "Ekstra Ayarlar", "[" .. myHero.charName.. "] - Otomatik Durdurma","Q Yetenegi ile durdur","W Yetenegi ile durdur","E Yetenegi ile durdur",
  "R Yetenegi ile durdur","                  [Desteklenen Yetenekler]",
  -- General Menu(Skill Logic) // 6
  "Yetenek Ayarlari","Q Yetenegi Ayarlari","W Yetenegi Ayarlari","E Yetenegi Ayarlari","R Yetenegi Ayarlari","Health Menajeri %",
  -- General Menu(Hitchance Settings) // 5
  "Tutturma Orani","Q Tutturma Orani","W Tutturma Orani","E Tutturma Orani","R Tutturma Orani",
  -- General Menu(Orbwalk Settings) // 5
  "OrbWalker Tus Ayarlari",
  "                 Script Versiyonu:  "..Version.. "         ","            Script "..Author.. " tarafindan yapilmistir.        ",
  "       Leauge Of Legends Versiyonu:  "..LVersion.. "         ","Kullanilan Orbwalker:                      Sidas Auto Carry",
  "Kullanilan Orbwalker:                             SxOrbWalk",
  -- Leblanc Menu // 13
  "Q>E>W>R", "Q>R>E>W", "E>Q>W>R", "E>W>Q>R" ,"Rastgele Yetenek Duzeni","W yetenegi geri donme ayarlari"," Q>E>W>R modunda W yerine geri don ",
  "Q>R>E>W modunda W yerine geri don ","E>Q>W>R modunda W yerine geri don","E>W>Q>R modunda W yerine geri don ",
  "Rastgele Yetenek modunda W yerine geri dön ","QW ile cal","Sadece E Kullan (Sadece Sersemlet)"," Kombo Modu Tusu",
  -- Akali Menu // 9
  "2 dusman", "3 dusman" , "4 dusman","5 dusman","Q Hedefteyse R Kullan", "Yetenekleri Direk Kullan","Görunmezlik(W) kullan hedef >","Görunmezlik(W) kullan Can %",
  "Görunmezlik(W) kullan",
  -- Diana Menu // 4
  "Akilli Kombo", "Hedef isaretli ise R kullan" , "Butun yetenekleri hizlica kullan","E yetenegini mesafe > 280 kullan",
  -- Lissandraa Menu // 17
  "Kombo modu icin E ayarlari","Durtme modu icin E ayarlari","2. E ile basla", "2. E'yi kullanma ( önerilen)" ,
  "2. E'yi kullanma (onerilen)", "2. E ile basla" ,"Akilli", "Kendini koru", "Dusman icin kullan" ,"Kendine otomatik R",
  "Otomatik R can altindaysa -> %", "2. E ile basla ayari test asamasindadir..", "Kombo modu icin R ayarlari", "Akilli R ayarlari için kendine otomatik R acik olmalidir.",
  "W kullanarak dusmani uzak tut","Bu ozellik hala test asamasindadir..",
  -- Viktor Menu // 5
  "Ulti Ayarlari","Hedef olucek ise Ulti Kullan","Ultiyi Direk Kullan" ,"E Tutturma Orani (Normali = 1.6)","E Tutturma Orani (Normali = 2)","Otomatik durtme",
  -- language menu// 5
  "Dil Secimi(2xF9 Gerekmektedir.)","Ingilizce", "Turkce","Almanca","Korece",
  -- Extrass//
  "Komboyu ulti ile baslat ",
  -- rework// 171
  "Otomatik w eger can >","Her zaman","Local Ayarlara Bagli","Asla","Dusman Sayisi","Otomatik W Eger Dusman >","                        [Local Ayarlar]","W>R>Q>E modunda W yerine geri don",
  "W>Q>R>E modunda W yerine geri don ","Q icin minimum minion  >","W icin minimum minion  >","E icin minimum minion  >","R icin minimum minion >","                        [Mana Menajeri]",
  "Q Yetenegi Mana Menajeri  %","W Yetenegi Mana Menajeri  %","E Yetenegi Mana Menajeri  %","R Yetenegi Mana Menajeri  %","Otomatik Son Vurus","Eger otomatik Saldiri Yapamiyorsa","Son Vurus Ayarlari","Otomatik Pot","Otomatik Pot Kullan",
  "Auto Potion if Health under -> %","Anti-AFK Ayarlari","Anti Afk Kullan","E -Hedef Cizimi","Renk Ayarlari","Q Rengi","W Rengi","E Rengi","R Rengi","E -Hedef Rengi","Otomatik Saldiri Rengi",
  "Secili Karakter Rengi","Kalinlik Ayarlari","E -Hedef Kalinlik","Secili Karakter Kalinlik","Otomatik Saldiri Kalinlik","Q Yetenegi kalinlik","W Yetenegi kalinlik","E Yetenegi kalinlik",
  "R Yetenegi kalinlik","Hasar cizimi goster",
  "Son vurus tusu","Talimatlar icin tiklayiniz","Gerekli ise kullan","Farm Tus Ayarlari","[" .. myHero.charName.. "] - Anti Gap-Close","W Yetenegi ile Anti Gap-Close","Anti Gap-Close icin insanlastirma",
  "Otomatik W Ayarlari","Otomatik W Kullan ","Otomatik W Eger Dusman >","R -Hedef Cizim","R -Hedef Rengi","R -Hedef Kalinlik"
}
---//==================================================\\---
--|| > German Translation details               ||--
---\\==================================================//---
local loc_gr = {
  --General Menu(Combo) // 8 // 1
  "Combo Einstellungen", "Benutze Q im Combo Modus", "Benutze W im Combo Modus", "Benutze E im Combo Modus", "Benutze R im Combo Modus" ,
  "Benutze Ignite wenn das Ziel dadurch stirbt","Combo Logik","Mana Manager %",
  --General Menu(Harass) // 5 // 9
  "Harass Einstellungen","Harass mit Q","Harass mit W","Harass mit E","Harass mit R",
  --General Menu(Clear) // 16 // 14
  "Farm Einstellungen","LaneClear Einstellungen","Benutze Q im Laneclear Modus","Benutze W im Laneclear Modus","Benutze E im Laneclear Modus","Benutze im Laneclear Modus",
  "JungleClear Einstellungen","Benutze Q im jungleclear Modus","Benutze W im jungleclear Modus","Benutze E im jungleclear Modus","Benutze R im jungleclear Modus",
  "Lasthit Einstellungen","Benutze Q im Lasthit Modus","Benutze W im Lasthit Modus","Benutze E im Lasthit Modus","Benutze R im Lasthit Modus",
  --General Menu(Escape) // 5 // 30
  "Escape Einstellungen","Benutze Q beim Fliehen","Benutze W beim Fliehen","Benutze E beim Fliehen","Benutze R beim Fliehen",
  --General Menu(Killsteal) // 7 // 35
  "KillSteal Einstellungen","Killsteal Ein/Aus","Stiehl mit Q","Stiehl mit W","Stiehl mit E","Stiehl mit R","Stiehl mit Ignite",
  --General Menu(item) // 5 // 42
  "Item Einstellungen","Auto Zhonya", "Benutzte Zhonya wenn Leben unter -> %", "Benutze Hextech Gunblade", "Benutze Bilgewater Cutlass",
  --General Menu(vip Einstellungen) // 19 // 47
  "VIP Einstellungen","Benutze Packet Casting","Um VIP Einstellungen, zu benutzten muss Package Casting moglich sein", "Auto Level Einstellungen","Benutze Auto Level",
  "Select Skill Order","Skin Hack Einstellungen","Benutze Skin Hack","Stelle sicher, dass Packet Casting activiert ist",
  "Um VIP Einstellungen zu benutzten, musst du VIP sein","Wahle einen Skin",
  "Focus Q>W>E", "Focus Q>E>W","Focus W>Q>E","Focus W>E>Q","Focus E>W>Q", "Focus E>Q>W", "Smart" ,
  --General Menu(Graphik Einstellungen) // 12 // 65
  "Graphik Einstellungen","Skill Anzeige Einstellungen","Q Anzeigen","W  Anzeigen","E Anzeigen","R Anzeigen","Standart Attacken Reichweite",
  "Zeige Combo Modus","Zeige Permabox","Zeige Permabox ( Benotigt 2x F9 )","Zeichne Zirkel um dein gewahltes Ziel","Ziel berechnung",
  --General Menu(Target Selectors) // 2 // 77
  "Ziel Sortierung","Linksclick fur manuelles Auswahlen von Zielen",
  --General Menu(Key Einstellungen) // 13 // 79
  "Key Einstellungen", "<------------------Combo Key Einstellungen------------------>","Combo Key","<------------------Harass Key Einstellungen------------------>",
  "Smart Harass Key","<------------------Clear Key Einstellungen-------------------->","LaneClear Key","JungleClear Key",
  "<------------------Andere Key Einstellungen-------------------->","Escape Key", "Stelle sicher, dass deine Orbwalker Keys die gleichen wie hier sind.","OrwWalkerKey Einstellungen",
  "Auto Harass Q",
  --General Menu(Misc Einstellungen) // 7 // 92
  "Andere Einstellungen", "[" .. myHero.charName.. "] - Auto-Abrechen","Abruch mit Q","Abruch mit W","Abruch mit E",
  "Abruch mit R","                  [Supported Skills]",
  -- General Menu(Skill Logic) // 6 // 99
  "Skill Logik","Q Logik","W Logik","E Logik","R Logik","Health Manager %",
  -- General Menu(Hitchance Einstellungen) // 5 // 105
  "Trefferchance","Q Trefferchance","W Trefferchance","E Trefferchance","R Trefferchance",
  -- General Menu(Orbwalk Einstellungen) // 5  // 110
  "OrbWalkerKey Einstellungen",
  "                 Script Version:  "..Version.. "         ","            Script wurde gemacht von  "..Author.. "         ",
  "       Leauge Of Legends Version:  "..LVersion.. "         ","Aktueller Orbwalker:                      Sidas Auto Carry",
  "Aktueller Orbwalker:                             SxOrbWalk",
  -- Leblanc Menu // 13 // 116
  "Q>E>W>R", "Q>R>E>W", "E>Q>W>R", "E>W>Q>R" ,"Zufällige Benutzung","W Skill zuruckkomm Einstellungen","Gehe zuruck zum W Spot im Q>E>W>R modus ",
  "Gehe zuruck zum W Spot im Q>R>E>W modus ","Gehe zuruck zum W Spot im E>Q>W>R modus ","Gehe zuruck zum W Spot im E>W>Q>R modus",
  "Gehe zuruck zum W Spot im Zufälligen Modus ","Stiehl mit QW","Benutze nur E (Nur Stunnen)"," Wähle Combomodus Key",
  -- Akali Menu // 9
  "2 Gegner", "3 Gegner" , "4 Gegner","5 Gegner","Benutze R wenn Q das Ziel getroffen hat", "Rush Skills","Benutze Verbergen wenn gegner >","Benutze Verbergen wenn Leben %","Benutze Verbergen (W)",
  -- Diana Menu // 4
  "Smart Combo", "Benutze R wenn Ziel markiert" , "Benutzte alles schnell hintereinander","Benutze E nur wenn die Distanz zum gegner > 280",
  -- Lissandraa Menu // 17
  "E Logik fur combo modus","E Logic fur harass modus","Engage mit Zweiten E", "Benutze nicht den Zweiten E ( Empfohlen)" ,
  "Benutze nicht den Zweiten E ( Empfohlen)", "Engage mit Zweiten E" ,"Smart", "Rette dich selbst", "Benutze gegen Gegner" ,"Auto R fur dichselbst",
  "AutoR wenn Leben unter -> %", "Die 'Engage mit Zweiten E' Option ist im Beta Stadium", "R Logik fur den combo modus", "Um Smart R Logik zu benutzten, sollte AutoR aktiviert sein",
  "Benutze W fur Anti-GapClose","Diese Function befindet sich in der Beta Phase",
  -- Viktor Menu // 5
  "Ulti Logik","Benutze Ultimate wenn das Ziel dadurch stribt","Benutze die Ultimate direkt" ,"E Trefferwarscheinlichkeit (Standart Wert = 1.6)","E Trefferwarscheinlichkeit (Standart Wert = 2)","Smart Auto Harass",
  -- language menu// 5
  "Sprachen(2xF9)","English", "Turkish","Deutsch","Korean",
  -- Extrass//
  "Starte Engange's mit deiner Ultimate",
  -- rework// 171
  "Auto W back if health >","Always","Depends on local Settings","Never","Enemy Number","Auto W back if enemy >","                        [Local Settings]","Turn back to W spot on W>R>Q>E mode ",
  "Turn back to W spot on W>Q>R>E mode ","Minimum minion to Q >","Minimum minion to W >","Minimum minion to E >","Minimum minion to R >","                        [Mana Manager]",
  "Q Skill Mana Manager  %","W Skill Mana Manager  %","E Skill Mana Manager  %","R Skill Mana Manager  %","Use Auto Lasthit","Only if cannot AA","Lasthit Logic","Auto Potion","Use Auto Potion",
  "Auto Potion if Health under -> %","Anti-AFK Settings","Use Anti Afk","E -Target draw","Color Settings","Q Color","W Color","E Color","R Color","E -Target Color","Auto Attack Color",
  "Selected Target Color","Draw Width Settings","E -Target Width","Selected Target Width","Auto Attack Width","Q Skill Width","W Skill Width","E Skill Width","R Skill Width","Draw Damage Indicator",
  "Lasthit Key","Click For Instructions","Use if needed","Clear Key Settings","[" .. myHero.charName.. "] - Anti Gap-Close","Gap-Close With W Skill","Humanizer for Anti Gap Close",
  "Auto W Settings","Use Auto W ","Auto W if enemy >","R -Target draw","R -Target Color","R -Target Width"
}
local loc_choosen = {}
loc_choosen = loc_end -- Fallback on errors
---//==================================================\\---
--|| > Auto Update                           ||--
---\\==================================================//---
local version = 4.02
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
lbspot = {
  {x = 3078.2177734375 , y = 95.748046875, z = 4303.9643554688},
  {x = 2153.0966796875 , y = 95.748046875, z = 4493.1884765625},
  {x = 4395.9223632813 , y = 95.748168945313, z = 3125.4541015625},
  {x = 4524.7241210938 , y = 95.748168945313, z = 2084.6958007813},
  {x = 5380.0322265625 , y = 51.261352539063, z = 2490.5747070313},
  {x = 6214.2373046875 , y = 50.011840820313, z = 3461.103515625},
  {x = 6281.7963867188 , y = 48.528076171875, z = 5089.8540039063},
  {x = 7254.994140625 , y = 52.451171875, z = 5991.65625},
  {x = 8116.4321289063 , y = 52.890258789063, z = 5751.265625},
  {x = 8965.8251953125 , y = 52.623413085938, z = 4474.44921875},
  {x = 9034.9921875 , y = 53.795166015625, z = 3890.2607421875},
  {x = 9287.0341796875 , y = 58.37451171875, z = 3511.9157714844},
  {x = 9867.59765625 , y = 57.9990234375, z = 3118.6665039063},
  {x = 8189.5307617188 , y = 51.60595703125, z = 3209.5812988281},
  {x = 3359.3425292969 , y = 52.47412109375, z = 6241.1318359375},
  {x = 3771.423828125 , y = 51.000732421875, z = 7254.4926757813},
  {x = 4495.3837890625 , y = 49.123657226563, z = 8071.3657226563},
  {x = 5118.5659179688 , y = 51.157348632813, z = 7832.5595703125},
  {x = 5629.3662109375 , y = 51.654296875, z = 7679.3193359375},
  {x = 8539.6025390625 , y = 51.1298828125, z = 2087.4418945313},
  {x = 10205.384765625 , y = 49.22314453125, z = 2187.3041992188},
  {x = 7604.810546875 , y = 51.273681640625, z = 2096.0678710938},
  {x = 7557.9194335938 , y = 48.730102539063, z = 4686.337890625},
  {x = 2212.1691894531 , y = 50.411865234375, z = 7797.4438476563},
  {x = 1652.8302001953 , y = 52.838134765625, z = 8647.6708984375},
  {x = 2160.7019042969 , y = 53.1201171875, z = 10001.190429688},
  {x = 2514.5668945313 , y = 51.77490234375, z = 9193.083984375},
  {x = 3071.609375 , y = 52.812622070313, z = 9864.0703125},
  {x = 2831.2150878906 , y = 54.32568359375, z = 10353.356445313},
  {x = 8954.75390625 , y = 51.528076171875, z = 4903.7778320313},
  {x = 8418.10546875 , y = 53.97119140625, z = 3763.158203125},
  -- -------------------------------------mavi taraf bitti
  {x = 10224.888671875 , y = 91.430053710938, z = 12704.100585938},
  {x = 10429.840820313 , y = 91.429809570313, z = 11703.564453125},
  {x = 11582.235351563 , y = 91.429809570313, z = 10554.192382813},
  {x = 12668.779296875 , y = 91.430053710938, z = 10328.741210938},
  {x = 11852.047851563 , y = 50.3076171875, z = 8894.05859375},
  {x = 12117.778320313 , y = 52.48046875, z = 8043.8427734375},
  {x = 11148.4140625 , y = 52.204711914063, z = 7751.361328125},
  {x = 10362.048828125 , y = 61.070068359375, z = 8575.6318359375},
  {x = 10950.1953125 , y = 52.203979492188, z = 7506.3989257813},
  {x = 10353.25390625 , y = 51.999267578125, z = 6711.8408203125},
  {x = 10437.215820313 , y = 53.444458007813, z = 9096.6904296875},
  {x = 12971.645507813 , y = 51.981201171875, z = 6886.2333984375},
  {x = 13101.166015625 , y = 53.143432617188, z = 5653.0639648438},
  {x = 12408.293945313 , y = 51.729370117188, z = 5222.7763671875},
  {x = 12139.694335938 , y = 51.7294921875, z = 4567.697265625},
  {x = 11617.538085938 , y = 51.679321289063, z = 5176.0625},
  {x = 9070.85546875 , y = 53.036010742188, z = 7165.3149414063},
  {x = 7072.7900390625 , y = 52.87255859375, z = 8811.623046875},
  {x = 7598.4057617188 , y = 52.872436523438, z = 8878.0712890625},
  {x = 8826.94140625 , y = 52.596069335938, z = 9295.0693359375},
  {x = 8573.7900390625 , y = 51.770141601563, z = 11260.03515625},
  {x = 9409.0888671875 , y = 52.306396484375, z = 12289.697265625},
  {x = 6559.1030273438 , y = 53.944580078125, z = 11621.458007813},
  {x = 5281.6518554688 , y = 56.848266601563, z = 11749.409179688},
  {x = 6328.6049804688 , y = 54.5703125, z = 12774.705078125},
  {x = 7206.1005859375 , y = 56.4765625, z = 12770.250976563},
  {x = 4976.4399414063 , y = 56.671020507813, z = 11446.337890625},
  {x = 5699.2983398438 , y = 56.692016601563, z = 10907.643554688},
  {x = 5812.009765625 , y = 54.16015625, z = 10189.111328125},
  {x = 7286.1147460938 , y = 51.417358398438, z = 10186.866210938}












}

lbspotend = {
  {x = 3360.7543945313 , y = 54.14990234375, z = 4812.75},
  {x = 2190.0805664063 , y = 52.7880859375, z = 5119.3852539063},
  {x = 4987.3720703125 , y = 50.947265625, z = 3204.5400390625},
  {x = 5115.9340820313 , y = 51.991333007813, z = 2112.9604492188},
  {x = 6006.2861328125 , y = 52.13916015625, z = 2439.6027832031},
  {x = 6717.298828125 , y = 48.523559570313, z = 3892.9299316406},
  {x = 6118.3544921875 , y = 51.7763671875, z = 5708.7084960938},
  {x = 7109.2329101563 , y = 53.19287109375, z = 5437.3901367188},
  {x = 8229.4609375 , y = -71.240600585938, z = 6389.2055664063},
  {x = 9430.9189453125 , y = -71.240600585938, z = 4516.9462890625},
  {x = 9438.8330078125 , y = -70.579711914063, z = 4275.380859375},
  {x = 9656.0322265625 , y = -70.806518554688, z = 4005.1967773438},
  {x = 9739.7646484375 , y = 49.222900390625, z = 2702.9108886719},
  {x = 8254.1640625 , y = 51.130126953125, z = 2679.1723632813},
  {x = 2864.1623535156 , y = 57.044799804688, z = 5993.6665039063},
  {x = 3698.5791015625 , y = 52.7587890625, z = 7761.037109375},
  {x = 4003.1398925781 , y = 51.234252929688, z = 7891.3862304688},
  {x = 5114.298828125 , y = -40.389038085938, z = 8537.78515625},
  {x = 5995.3530273438 , y = -68.9873046875, z = 8241.912109375},
  {x = 8574.029296875 , y = 49.453735351563, z = 1673.580078125},
  {x = 10102.54296875 , y = 50.260009765625, z = 1717.2194824219},
  {x = 7392.90625 , y = 49.446655273438, z = 1641.5682373047},
  {x = 7658.3383789063 , y = 53.982421875, z = 4227.2319335938},
  {x = 2337.2009277344 , y = 51.789916992188, z = 8228.5986328125},
  {x = 2047.6506347656 , y = 51.777587890625, z = 8631.96875},
  {x = 1683.5931396484 , y = 52.83837890625, z = 10189.442382813},
  {x = 2872.6669921875 , y = 50.676025390625, z = 9213.484375},
  {x = 3521.923828125 , y = -66.380126953125, z = 10094.618164063},
  {x = 3020.0129394531 , y = -70.343872070313, z = 10846.442382813},
  {x = 9041.140625 , y = -71.240600585938, z = 5496.4653320313},
  {x = 8034.2280273438 , y = 53.720825195313, z = 3940.2602539063},
  -- ---------------------------------------mavi taraf bitti
  {x = 9689.9365234375 , y = 52.322875976563, z = 12663.056640625},
  {x = 9955.4375 , y = 52.30615234375, z = 11460.467773438},
  {x = 11371.384765625 , y = 52.306274414063, z = 10065.577148438},
  {x = 12632.4765625 , y = 52.306274414063, z = 9777.009765625},
  {x = 11431.650390625 , y = 59.111206054688, z = 8522.919921875},
  {x = 11585.361328125 , y = 52.824584960938, z = 8031.7602539063},
  {x = 10906.69921875 , y = 62.66259765625, z = 8239.5224609375},
  {x = 10791.670898438 , y = 63.077880859375, z = 8360.7275390625},
  {x = 10998.96875 , y = 51.723510742188, z = 7037.748046875},
  {x = 10872.008789063 , y = 51.72265625, z = 6888.4609375},
  {x = 10173.395507813 , y = 52.117553710938, z = 9537.7919921875},
  {x = 12673.555664063 , y = 51.702758789063, z = 6491.19921875},
  {x = 12617.803710938 , y = 52.173828125, z = 5782.1801757813},
  {x = 11973.099609375 , y = 53.644165039063, z = 5227.3408203125},
  {x = 11925.876953125 , y = -68.921142578125, z = 4045.8798828125},
  {x = 11377.123046875 , y = -71.240600585938, z = 4801.3989257813},
  {x = 8648.61328125 , y = -71.240600585938, z = 6735.1474609375},
  {x = 6728.6801757813 , y = -71.240600585938, z = 8495.57421875},
  {x = 7703.7436523438 , y = 52.408813476563, z = 9384.001953125},
  {x = 8699.5771484375 , y = 50.383911132813, z = 9775.046875},
  {x = 8129.8115234375 , y = 50.467163085938, z = 10956.14453125},
  {x = 8863.501953125 , y = 56.47705078125, z = 12406.870117188},
  {x = 6391.2529296875 , y = 56.47705078125, z = 12191.615234375},
  {x = 5376.2807617188 , y = 56.460815429688, z = 12158.2109375},
  {x = 6293.357421875 , y = 52.837890625, z = 13276.076171875},
  {x = 7261.732421875 , y = 52.838134765625, z = 13321.002929688},
  {x = 4941.2719726563 , y = -71.240478515625, z = 10840.948242188},
  {x = 5309.9711914063 , y = -71.240600585938, z = 10677.38671875},
  {x = 5346.1616210938 , y = -71.240600585938, z = 10363.08984375},
  {x = 7158.8759765625 , y = 56.380126953125, z = 10707.299804688}










}
---//==================================================\\---
--|| > Onload Function                               ||--
---\\==================================================//---
function OnLoad()
  if not RequireSimpleLib() then return end
  itemfix()
  readcfg()
  chnglang()
  if _G[myHero.charName] then
    _G[myHero.charName]()
    -- DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> Skin Hack currently disabled until the next update") end, 14)
  else
    print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\"> :This champion is not supported. Currently supported champions are: "..list.." " )
    DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\">Feel free to check my forum topic and ask a new champion or give feedback") end, 0.5)
    DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\">"..link.."") end, 0.5)
  end
end
---//==================================================\\---
--|| > ScriptStatus.Net                             ||--
---\\==================================================//---
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIKAAAABgBAAEFAAAAdQAABBkBAAGUAAAAKQACBBkBAAGVAAAAKQICBHwCAAAQAAAAEBgAAAGNsYXNzAAQNAAAAU2NyaXB0U3RhdHVzAAQHAAAAX19pbml0AAQLAAAAU2VuZFVwZGF0ZQACAAAAAgAAAAgAAAACAAotAAAAhkBAAMaAQAAGwUAABwFBAkFBAQAdgQABRsFAAEcBwQKBgQEAXYEAAYbBQACHAUEDwcEBAJ2BAAHGwUAAxwHBAwECAgDdgQABBsJAAAcCQQRBQgIAHYIAARYBAgLdAAABnYAAAAqAAIAKQACFhgBDAMHAAgCdgAABCoCAhQqAw4aGAEQAx8BCAMfAwwHdAIAAnYAAAAqAgIeMQEQAAYEEAJ1AgAGGwEQA5QAAAJ1AAAEfAIAAFAAAAAQFAAAAaHdpZAAEDQAAAEJhc2U2NEVuY29kZQAECQAAAHRvc3RyaW5nAAQDAAAAb3MABAcAAABnZXRlbnYABBUAAABQUk9DRVNTT1JfSURFTlRJRklFUgAECQAAAFVTRVJOQU1FAAQNAAAAQ09NUFVURVJOQU1FAAQQAAAAUFJPQ0VTU09SX0xFVkVMAAQTAAAAUFJPQ0VTU09SX1JFVklTSU9OAAQEAAAAS2V5AAQHAAAAc29ja2V0AAQIAAAAcmVxdWlyZQAECgAAAGdhbWVTdGF0ZQAABAQAAAB0Y3AABAcAAABhc3NlcnQABAsAAABTZW5kVXBkYXRlAAMAAAAAAADwPwQUAAAAQWRkQnVnc3BsYXRDYWxsYmFjawABAAAACAAAAAgAAAAAAAMFAAAABQAAAAwAQACBQAAAHUCAAR8AgAACAAAABAsAAABTZW5kVXBkYXRlAAMAAAAAAAAAQAAAAAABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAUAAAAIAAAACAAAAAgAAAAIAAAACAAAAAAAAAABAAAABQAAAHNlbGYAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAtAAAAAwAAAAMAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABgAAAAYAAAAGAAAABgAAAAUAAAADAAAAAwAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAIAAAACAAAAAgAAAAIAAAAAgAAAAUAAABzZWxmAAAAAAAtAAAAAgAAAGEAAAAAAC0AAAABAAAABQAAAF9FTlYACQAAAA4AAAACAA0XAAAAhwBAAIxAQAEBgQAAQcEAAJ1AAAKHAEAAjABBAQFBAQBHgUEAgcEBAMcBQgABwgEAQAKAAIHCAQDGQkIAx4LCBQHDAgAWAQMCnUCAAYcAQACMAEMBnUAAAR8AgAANAAAABAQAAAB0Y3AABAgAAABjb25uZWN0AAQRAAAAc2NyaXB0c3RhdHVzLm5ldAADAAAAAAAAVEAEBQAAAHNlbmQABAsAAABHRVQgL3N5bmMtAAQEAAAAS2V5AAQCAAAALQAEBQAAAGh3aWQABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEJgAAACBIVFRQLzEuMA0KSG9zdDogc2NyaXB0c3RhdHVzLm5ldA0KDQoABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAXAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAADAAAAAwAAAANAAAADQAAAA0AAAAOAAAADgAAAA4AAAAOAAAACwAAAA4AAAAOAAAADgAAAA4AAAACAAAABQAAAHNlbGYAAAAAABcAAAACAAAAYQAAAAAAFwAAAAEAAAAFAAAAX0VOVgABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAoAAAABAAAAAQAAAAEAAAACAAAACAAAAAIAAAAJAAAADgAAAAkAAAAOAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))() ScriptStatus("TGJJOKHGFJF")

function chnglang()
  -- print "denem123"
  if lang == "eng" then
    loc_choosen = {}
    loc_choosen = loc_eng
  elseif lang == "tr" then
    loc_choosen = {}
    -- print "asd"
    loc_choosen = loc_tr
  elseif lang == "gr" then
    loc_choosen = {}
    --print "asd"
    loc_choosen = loc_gr
  else
    print("Error in Localization got: "..lang)
  end
end
function readcfg()
  -- print("Read file")
  local file = io.open(SCRIPT_PATH.."\\".."config.cfg", "r")
  if not file then
    print("Creating First Time Config")
    Leblanc:writecfg("ftc")
    Viktor:writecfg("ftc")
    Akali:writecfg("ftc")
    Diana:writecfg("ftc")
    Lissandra:writecfg("ftc")
    return
  end
  for line in file:lines() do

    lang = line
    -- print("Read: "..lang)
  end
end
---//==================================================\\---
--|| > Leblanc Start- Variables                          ||--
---\\==================================================//---
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
  self.ESpell = _Spell({Slot = _E, DamageName = "E", Range = 925, Width = 55, Delay = 0.25, Speed = 1750, Collision = true, Aoe = false, Type = SPELL_TYPE.LINEAR})
  self.RSpell = _Spell({Slot = _R, DamageName = "R", Range =600, Width = 125, Delay = 0.5, Speed = 1300, Collision = false, Aoe = true, Type = SPELL_TYPE.TARGETTED})
  self.RESpell = _Spell({Slot = _R, DamageName = "R", Range =925, Width = 55, Delay = 0.25, Speed = 1750, Collision = true, Aoe = false, Type = SPELL_TYPE.LINEAR})
  self.Ignite = _Spell({Slot = FindSummonerSlot("summonerdot"), DamageName = "IGNITE", Range = 600, Type = SPELL_TYPE.TARGETTED})
  self.leblancW, self.leblancImage, self.cloneId = nil, nil, nil
  --|> Minion Managers
  self.enemyMinions   = minionManager(MINION_ENEMY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
  self.allyMinions    = minionManager(MINION_ALLY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
  self.jungleMinions  = minionManager(MINION_JUNGLE,  650, myHero, MINION_SORT_MAXHEALTH_DEC)
  self.otherMinions   = minionManager(MINION_OTHER,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
  self:LoadMenu()
  self:findorbwalker()
  Last_LevelSpell = 0
  Clock = os.clock()
  AddTickCallback(function() self:Tick() end)
  AddUnloadCallback(function() self:Unload() end )
  AddDrawCallback(function() self:Draw() end)
  AddMsgCallback(function(msg,Key) self:WndMsg(msg,Key) end)
  --AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
  --AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
  --AddApplyBuffCallback(function(source, unit, buff) self:OnApplyBuff(source, unit, buff) end)
  --AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
  --AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end)
end
---//==================================================\\---
--|| > Leblanc Menu                                   ||--
---\\==================================================//---
function Leblanc:writecfg(param)
  local file = io.open(SCRIPT_PATH.."\\".."config.cfg", "w")
  if not file then
    -- print("Error in Write CFG")
  end
  if param ~= "ftc" then
    file:write(ava_languages[self.Config.lang])
    --print("Written: "..ava_languages[self.Config.lang])
  else
    file:write("eng")
    -- print("W: English")
  end
  file:close()
end
function Leblanc:LoadMenu()
  self.Config=scriptConfig(""..Scriptname.." [" .. myHero.charName.."]" ,"menu")

  self.Config:addSubMenu(loc_choosen[1], "combo")
  self.Config.combo:addParam("useQ", loc_choosen[2], SCRIPT_PARAM_ONOFF, true)
  self.Config.combo:addParam("useW", loc_choosen[3], SCRIPT_PARAM_ONOFF, true)
  self.Config.combo:addParam("useE", loc_choosen[4], SCRIPT_PARAM_ONOFF, true)
  self.Config.combo:addParam("useR", loc_choosen[5], SCRIPT_PARAM_ONOFF, true)
  self.Config.combo:addParam("useI", loc_choosen[6], SCRIPT_PARAM_ONOFF, true)
  --self.Config.combo:addParam("gapclose", "Use W as a gapclose ( Beta )", SCRIPT_PARAM_ONOFF, false)
  self.Config.combo:addParam("logic", loc_choosen[7], SCRIPT_PARAM_LIST, 1, {loc_choosen[116], loc_choosen[117], loc_choosen[118], loc_choosen[119] ,"W>R>Q>E","W>Q>R>E","Q>R>W>E","Double Stun",loc_choosen[120]})
  self.Config.combo:addSubMenu(loc_choosen[121], "turnw")
  self.Config.combo.turnw:addParam("wbackhp", loc_choosen[171], SCRIPT_PARAM_LIST, 1, {loc_choosen[172],loc_choosen[173],loc_choosen[174]})
  self.Config.combo.turnw:addParam("hp",loc_choosen[104],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
  self.Config.combo.turnw:addParam("wbackcp", loc_choosen[176], SCRIPT_PARAM_LIST, 1, {loc_choosen[172],loc_choosen[173],loc_choosen[174]})
  self.Config.combo.turnw:addParam("enemy",loc_choosen[175], SCRIPT_PARAM_LIST, 1, {loc_choosen[130], loc_choosen[131] , loc_choosen[132],loc_choosen[133] })
  self.Config.combo.turnw:addParam("info2", loc_choosen[177], SCRIPT_PARAM_INFO,"")
  self.Config.combo.turnw:addParam("w1",loc_choosen[122],SCRIPT_PARAM_ONOFF,false)
  self.Config.combo.turnw:addParam("w2",loc_choosen[123],SCRIPT_PARAM_ONOFF,false)
  self.Config.combo.turnw:addParam("w3",loc_choosen[124],SCRIPT_PARAM_ONOFF,false)
  self.Config.combo.turnw:addParam("w4",loc_choosen[125],SCRIPT_PARAM_ONOFF,false)
  self.Config.combo.turnw:addParam("w5",loc_choosen[178],SCRIPT_PARAM_ONOFF,false)
  self.Config.combo.turnw:addParam("w6",loc_choosen[179],SCRIPT_PARAM_ONOFF,false)
  self.Config.combo.turnw:addParam("w7","Turn back to W spot on Q>R>E>W mode ",SCRIPT_PARAM_ONOFF,false)
  self.Config.combo.turnw:addParam("w8","Turn back to W spot on Double Stun mode ",SCRIPT_PARAM_ONOFF,false)
  self.Config.combo.turnw:addParam("w9",loc_choosen[126],SCRIPT_PARAM_ONOFF,false)
  self.Config.combo:addParam("delay", "Delay For Double Stun", SCRIPT_PARAM_SLICE, 1650, 0, 3000, 0)
  self.Config.combo:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 10, 10, 100, 0)

  self.Config:addSubMenu(loc_choosen[9], "harass")
  self.Config.harass:addParam("logic","Harass Logic", SCRIPT_PARAM_LIST, 1, {"[ Q-W ]","[ Q-E ]","[ W-R ]"})
  self.Config.harass:addParam("useQ", loc_choosen[10], SCRIPT_PARAM_ONOFF, true)
  self.Config.harass:addParam("useW", loc_choosen[11], SCRIPT_PARAM_ONOFF, true)
  self.Config.harass:addParam("useE", loc_choosen[12], SCRIPT_PARAM_ONOFF, true)
  self.Config.harass:addParam("useR", loc_choosen[13], SCRIPT_PARAM_ONOFF, true)
  self.Config.harass:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 10, 10, 100, 0)

  self.Config:addSubMenu(loc_choosen[14], "farm")

  self.Config.farm:addSubMenu(loc_choosen[15],"laneclear")
  self.Config.farm.laneclear:addParam("useQ",loc_choosen[16],SCRIPT_PARAM_ONOFF,true)
  self.Config.farm.laneclear:addParam("useW",loc_choosen[17],SCRIPT_PARAM_ONOFF,true)
  self.Config.farm.laneclear:addParam("wcount",loc_choosen[181],SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
  self.Config.farm.laneclear:addParam("useR",loc_choosen[19],SCRIPT_PARAM_ONOFF,false)
  self.Config.farm.laneclear:addParam("rcount",loc_choosen[183],SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
  self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
  self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
  self.Config.farm.laneclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
  self.Config.farm.laneclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
  self.Config.farm.laneclear:addParam("WMana",loc_choosen[186],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
  self.Config.farm.laneclear:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
  self.Config.farm.laneclear:addParam("RMana",loc_choosen[188],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

  self.Config.farm:addSubMenu(loc_choosen[20],"jungleclear")
  self.Config.farm.jungleclear:addParam("useQ",loc_choosen[21],SCRIPT_PARAM_ONOFF,true)
  self.Config.farm.jungleclear:addParam("useW",loc_choosen[22],SCRIPT_PARAM_ONOFF,true)
  self.Config.farm.jungleclear:addParam("useE",loc_choosen[23],SCRIPT_PARAM_ONOFF,true)
  self.Config.farm.jungleclear:addParam("useR",loc_choosen[24],SCRIPT_PARAM_ONOFF,true)
  self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
  self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
  self.Config.farm.jungleclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
  self.Config.farm.jungleclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
  self.Config.farm.jungleclear:addParam("WMana",loc_choosen[186],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
  self.Config.farm.jungleclear:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
  self.Config.farm.jungleclear:addParam("RMana",loc_choosen[188],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

  self.Config.farm:addSubMenu(loc_choosen[25],"lasthit")
  self.Config.farm.lasthit:addParam("autolasthit",loc_choosen[189],SCRIPT_PARAM_ONOFF,false)
  self.Config.farm.lasthit:addParam("useQ",loc_choosen[26],SCRIPT_PARAM_ONOFF,true)
  self.Config.farm.lasthit:addParam("useE",loc_choosen[28],SCRIPT_PARAM_ONOFF,true)
  self.Config.farm.lasthit:addParam("lasthitlogic",loc_choosen[191], SCRIPT_PARAM_LIST, 1, {loc_choosen[172],loc_choosen[190],loc_choosen[174]})
  self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
  self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
  self.Config.farm.lasthit:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
  self.Config.farm.lasthit:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
  self.Config.farm.lasthit:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

  self.Config:addSubMenu(loc_choosen[30],"escape")
  self.Config.escape:addParam("useW",loc_choosen[32],SCRIPT_PARAM_ONOFF,true)
  self.Config.escape:addParam("useR",loc_choosen[34],SCRIPT_PARAM_ONOFF,true)


  self.Config:addSubMenu(loc_choosen[35], "killsteal")
  self.Config.killsteal:addParam("ks",loc_choosen[36],SCRIPT_PARAM_ONOFF,true)
  self.Config.killsteal:addParam("useQ", loc_choosen[37], SCRIPT_PARAM_ONOFF, true)
  self.Config.killsteal:addParam("useW", loc_choosen[38], SCRIPT_PARAM_ONOFF, true)
  self.Config.killsteal:addParam("useE", loc_choosen[39], SCRIPT_PARAM_ONOFF, true)
  self.Config.killsteal:addParam("useR", loc_choosen[40], SCRIPT_PARAM_ONOFF, true)
  self.Config.killsteal:addParam("useQW", loc_choosen[127], SCRIPT_PARAM_ONOFF, true)
  self.Config.killsteal:addParam("useI", loc_choosen[41], SCRIPT_PARAM_ONOFF, true)

  self.Config:addSubMenu(loc_choosen[42], "item")
  self.Config.item:addSubMenu(loc_choosen[192], "autopot")
  self.Config.item.autopot:addParam("enableautopothp", loc_choosen[193], SCRIPT_PARAM_ONOFF, false)
  self.Config.item.autopot:addParam("autopothp", loc_choosen[194], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
  self.Config.item:addParam("enableautozhonya", loc_choosen[43], SCRIPT_PARAM_ONOFF, false)
  self.Config.item:addParam("autozhonya", loc_choosen[44], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
  self.Config.item:addParam("usehg", loc_choosen[45], SCRIPT_PARAM_ONOFF, false)
  self.Config.item:addParam("usebg", loc_choosen[46], SCRIPT_PARAM_ONOFF, false)

  self.Config:addSubMenu(loc_choosen[92], "misc")
  self.Config.misc:addSubMenu("[" .. myHero.charName.. "] - Wall Jump Settings", "walljump")
  self.Config.misc.walljump:addParam("Draw", "Draw Wall Jump Locations", SCRIPT_PARAM_ONOFF, true)
  self.Config.misc.walljump:addParam("Drawr", "Use Range While Drawing", SCRIPT_PARAM_ONOFF, false)
  self.Config.misc.walljump:addParam("Drawrrange", "Draw Locations If Range >", SCRIPT_PARAM_SLICE, 10, 1000, 10000, 0)
  self.Config.misc.walljump:addParam("blank", "", SCRIPT_PARAM_INFO,"")
  self.Config.misc.walljump:addParam("blank", "                     [Color Settings]", SCRIPT_PARAM_INFO,"")
  self.Config.misc.walljump:addParam("fcolor", "Location 1 Color", SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
  self.Config.misc.walljump:addParam("f2color", "Location 2 Color", SCRIPT_PARAM_COLOR,{255, 255, 255, 255})



  Clock = os.clock()
  if VIP_USER then
    self.Config:addSubMenu(loc_choosen[47], "vip")
    self.Config.vip:addParam("packet",loc_choosen[48],SCRIPT_PARAM_ONOFF,false)
    self.Config.vip:addParam("info1", "", SCRIPT_PARAM_INFO,"")
    self.Config.vip:addParam("info2", loc_choosen[49], SCRIPT_PARAM_INFO,"")
    self.Config.vip:addSubMenu(loc_choosen[50], "level")
    self.Config.vip.level:addParam("key",loc_choosen[51],SCRIPT_PARAM_ONOFF,false)
    self.Config.vip.level:addParam("logic", loc_choosen[52], SCRIPT_PARAM_LIST, 7, {loc_choosen[58], loc_choosen[59],loc_choosen[60],loc_choosen[61],loc_choosen[62], loc_choosen[63], loc_choosen[64]  })
    self.Config.vip:addSubMenu(loc_choosen[53], "skin")
    self.Config.vip.skin:addParam("key",loc_choosen[54],SCRIPT_PARAM_ONOFF,false)
    self.Config.vip.skin:addParam('selected' .. myHero.charName .. 'Skin', loc_choosen[57], SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
    self.Config.vip.skin:addParam("info5", loc_choosen[55], SCRIPT_PARAM_INFO,"")
    --self.Config.vip:addParam("info5", "Skin Hack temporary disabled until next update. .", SCRIPT_PARAM_INFO,"")
    self.Config.vip:addSubMenu(loc_choosen[195], "antiafk")
    self.Config.vip.antiafk:addParam("antiafk",loc_choosen[196],SCRIPT_PARAM_ONOFF,false)
    self.Config.vip:addParam("info3", "", SCRIPT_PARAM_INFO,"")
    self.Config.vip:addParam("info4", loc_choosen[56], SCRIPT_PARAM_INFO,"")
  end
  self.Config:addSubMenu(loc_choosen[65],"other")
  --self.Config.other:addSubMenu("Show Damage On Hp Bar", "HPBAR")
  --self.Config.other.HPBAR:addParam("key","ON/OFF",SCRIPT_PARAM_ONOFF,true)
  self.Config.other:addSubMenu(loc_choosen[66], "draw")
  self.Config.other.draw:addParam("qdraw",loc_choosen[67],SCRIPT_PARAM_ONOFF,true)
  self.Config.other.draw:addParam("wdraw",loc_choosen[68],SCRIPT_PARAM_ONOFF,true)
  self.Config.other.draw:addParam("edraw",loc_choosen[69],SCRIPT_PARAM_ONOFF,true)
  self.Config.other.draw:addParam("rdraw",loc_choosen[70],SCRIPT_PARAM_ONOFF,true)
  self.Config.other.draw:addParam("aadraw",loc_choosen[71],SCRIPT_PARAM_ONOFF,false)
  self.Config.other.draw:addParam("rtdraw",loc_choosen[197],SCRIPT_PARAM_ONOFF,false)
  self.Config.other:addSubMenu(loc_choosen[198], "color")
  self.Config.other.color:addParam("Qcolor", loc_choosen[199], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
  self.Config.other.color:addParam("Wcolor", loc_choosen[200], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
  self.Config.other.color:addParam("Ecolor", loc_choosen[201], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
  self.Config.other.color:addParam("Rcolor", loc_choosen[202], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
  self.Config.other.color:addParam("E2color", loc_choosen[203], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
  self.Config.other.color:addParam("AAcolor", loc_choosen[204], SCRIPT_PARAM_COLOR,{255, 255,0,0})
  self.Config.other.color:addParam("targetselect", loc_choosen[205], SCRIPT_PARAM_COLOR,{255, 255,0,0})
  self.Config.other:addParam("lfc","Lag Free Circles Width", 4, 3, 1, 5, 0)
  self.Config.other:addParam("LFCsnap", "LFC - Length Before Snapping", 4, 100, 50, 510, 0)
  self.Config.other:addParam("combomode",loc_choosen[72],SCRIPT_PARAM_ONOFF,true)
  self.Config.other:addSubMenu(loc_choosen[73], "perma")
  self.Config.other.perma:addParam("perma",loc_choosen[74],SCRIPT_PARAM_ONOFF,true)
  self.Config.other:addParam("target",loc_choosen[75],SCRIPT_PARAM_ONOFF,true)
  self.Config.other:addParam("damage",loc_choosen[214],SCRIPT_PARAM_ONOFF,true)
  self.Config.other:addParam("targetcal",loc_choosen[76],SCRIPT_PARAM_ONOFF,true)

  self.Config:addSubMenu(loc_choosen[77],"targetsel")
  self.Config.targetsel:addParam("infoK2", "", SCRIPT_PARAM_INFO,"")
  self.Config.targetsel:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
  self.Config.targetsel:addParam("ts",loc_choosen[78],SCRIPT_PARAM_ONOFF,false)
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

  self.Config:addSubMenu(loc_choosen[79], "Keys")
  self.Config.Keys:addParam("infoK3", loc_choosen[80], SCRIPT_PARAM_INFO,"")
  self.Config.Keys:addParam("combokey", loc_choosen[81], SCRIPT_PARAM_ONKEYDOWN, false, 32)
  self.Config.Keys:addParam("onlye", loc_choosen[128], SCRIPT_PARAM_ONKEYDOWN,false, string.byte("O"))
  self.Config.Keys:addParam("combomode", loc_choosen[129], SCRIPT_PARAM_ONKEYDOWN,false, string.byte("2"))
  self.Config.Keys:addParam("infoK4", loc_choosen[82], SCRIPT_PARAM_INFO,"")
  self.Config.Keys:addParam("harasskey", loc_choosen[83], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  -- self.Config.Keys:addParam("harasstoglekey", "Harass Togle Key", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
  self.Config.Keys:addParam("infoK5", loc_choosen[84], SCRIPT_PARAM_INFO,"")
  self.Config.Keys:addParam("lasthitkey",loc_choosen[215], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  self.Config.Keys:addParam("laneclearkey", loc_choosen[85], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  self.Config.Keys:addParam("jungleclearkey", loc_choosen[86], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  --self.Config.Keys:addParam("lasthitkey", "Lasthit Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  self.Config.Keys:addParam("infoK6", loc_choosen[87], SCRIPT_PARAM_INFO,"")
  self.Config.Keys:addParam("escapekey", loc_choosen[88], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Y"))
  self.Config.Keys:addParam("wallkey", "Wall Jump Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
  self.Config.Keys:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
  self.Config.Keys:addParam("infoK2", loc_choosen[89], SCRIPT_PARAM_INFO,"")
  self.Config:addSubMenu(loc_choosen[110], "Keys2")

  OrbwalkManager:LoadCommonKeys(self.Config.Keys2)
  self.Config:addParam("lang", loc_choosen[165], SCRIPT_PARAM_LIST, 1, {loc_choosen[166], loc_choosen[167],loc_choosen[168]})
  self.Config:addParam("instruct", loc_choosen[216], SCRIPT_PARAM_ONOFF, false)

  if self.Config.other.perma.perma then
    DelayAction(function() self.Config:permaShow("infobox") end, 1)
    DelayAction(function() self.Config.Keys:permaShow("combokey")  end, 1.2)
    --self.Config.Keys:permaShow("harasstoglekey")
    DelayAction(function() self.Config.Keys:permaShow("harasskey")  end, 1.2)
  end
end
---//==================================================\\---
--|| > Leblanc Drawings                                ||--
---\\==================================================//---
function Leblanc:combomode()
  local drawpos = GetUnitHPBarPos(myHero)
  if self.Config.combo.logic == 1 then
    DrawText("Current Combo Mode: Q>E>W>R", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
    if self.Config.combo.logic == 2 then
      DrawText("Current Combo Mode: Q>R>E>W", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
      if self.Config.combo.logic == 3 then
        DrawText("Current Combo Mode: E>Q>W>R", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
        if self.Config.combo.logic == 4 then
          DrawText("Current Combo Mode: E>W>Q>R", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
          if self.Config.combo.logic == 5 then
            DrawText("Current Combo Mode: W>R>Q>E", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
            if self.Config.combo.logic == 6 then
              DrawText("Current Combo Mode: W>Q>R>E", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
              if self.Config.combo.logic == 7 then
                DrawText("Current Combo Mode: Q>R>W>E", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
                if self.Config.combo.logic == 8 then
                  DrawText("Current Combo Mode: Double Stun", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
                  if self.Config.combo.logic == 9 then
                    DrawText("Current Combo Mode: Random Skill Order", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
                  end
                  function Leblanc:Draw()
                    if self.Config.other.combomode then
                      local drawpos = GetUnitHPBarPos(myHero)
                      self:combomode()
                    end
                    if self.Config.misc.walljump.Draw then
                      if self.Config.misc.walljump.Drawr then
                        for k, v in pairs(lbspot) do
                          if GetDistance(v, myHero) < self.Config.misc.walljump.Drawrrange then
                            self:DrawCircle(v.x, v.y, v.z, 100,ARGB(table.unpack(self.Config.misc.walljump.fcolor)))
                          end
                        end
                        for k, v in pairs(lbspotend) do
                          if GetDistance(v, myHero) < self.Config.misc.walljump.Drawrrange then
                            self:DrawCircle(v.x, v.y, v.z, 100, ARGB(table.unpack(self.Config.misc.walljump.f2color)))
                          end
                        end
                      elseif not self.Config.misc.walljump.Drawr then
                        for k, v in pairs(lbspot) do
                          self:DrawCircle(v.x, v.y, v.z, 100,ARGB(table.unpack(self.Config.misc.walljump.fcolor)))
                        end
                        for k, v in pairs(lbspotend) do
                          self:DrawCircle(v.x, v.y, v.z, 100, ARGB(table.unpack(self.Config.misc.walljump.f2color)))
                        end
                      end
                    end
                    if self.Config.other.draw.qdraw and self.QSpell:IsReady() then
                      self:DrawCircle(myHero.x, myHero.y, myHero.z, 650,ARGB(table.unpack(self.Config.other.color.Qcolor)))
                    end

                    if self.Config.other.draw.wdraw and self.WSpell:IsReady() then
                      self:DrawCircle(myHero.x, myHero.y, myHero.z, 600,ARGB(table.unpack(self.Config.other.color.Wcolor)))
                    end

                    if self.Config.other.draw.edraw and self.ESpell:IsReady() then
                      self:DrawCircle(myHero.x, myHero.y, myHero.z, 925, ARGB(table.unpack(self.Config.other.color.Ecolor)))
                    end

                    if self.Config.other.draw.rdraw and self.RSpell:IsReady() then
                      self:DrawCircle(myHero.x, myHero.y, myHero.z, 700, ARGB(table.unpack(self.Config.other.color.Rcolor)))
                    end
                    if self.Config.other.draw.aadraw then
                      self:DrawCircle(myHero.x, myHero.y, myHero.z, 550, ARGB(table.unpack(self.Config.other.color.AAcolor)))
                    end
                    if self.Config.other.target and self.selectedTar ~= nil then
                      self:DrawCircle(self.selectedTar.x, self.selectedTar.y, self.selectedTar.z, 80, ARGB(table.unpack(self.Config.other.color.targetselect)))
                    end
                    if self.Config.other.draw.rtdraw and self.ESpell:IsReady()  then
                      if self.tse.target~=nil then
                        DrawLine3D(myHero.x, myHero.y, myHero.z,self.tse.target.x, self.tse.target.y, self.tse.target.z,3,ARGB(table.unpack(self.Config.other.color.E2color)))
                      end
                    end
                    for _, target in pairs(GetEnemyHeroes()) do
                      if ValidTarget(target, 15000) then
                        if target.visible and not target.dead and self.Config.other.damage then
                          currLine = 1
                          DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
                          DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
                          currLine = currLine + 1
                        end
                      end
                    end
                    if self.Config.other.targetcal and not myHero.dead then
                      if target and target ~= nil then
                        local drawpos=WorldToScreen(D3DXVECTOR3(target.x, target.y, target.z))
                        local comboText,color = self:GetDraws(target)
                        if comboText then
                          DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
                        end
                      end
                    end
                    if PopUp1 then
                      local w, h1, h2 = (WINDOW_W*0.50), (WINDOW_H*.15), (WINDOW_H*.9)
                      DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
                      DrawLine(w, h1, w, h2/2, w/1.8, ARGB(150, 235, 183, 63))
                      DrawTextA(tostring("Welcome to KeyboardMaster Series 3.0"), WINDOW_H*.028, (WINDOW_W/2), (WINDOW_H*.18), ARGB(255, 96, 48, 0),"center","center")
                      DrawTextA(tostring("Little informatation about KeyboardMaster Series"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.194), ARGB(255, 96, 48, 0))
                      DrawTextA(tostring("Its a bundle that produced by ensuluyn"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.210), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("Currently it supported only mid champs "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.225), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("I focus Quality rather than Quantity"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.240), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("I need your feedbacks to improve it"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.255), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("I care every single feedback and try to add everything"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.270), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("Hope you are enjoy my script.."), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.285), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("You can change every settings to your like :)"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.300), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("Did you like my script > Upvote me on scriptstatus and on forum"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.315), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("Don't forget these are VIP;"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.330), ARGB(255, 96, 48, 0))
                      DrawTextA(tostring("  Anti-Afk"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.345), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("  Auto Leveler "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.360), ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("  Skin Changer "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.375), ARGB(255, 255, 255, 255))
                      local w, h1, h2 = (WINDOW_W*0.49), (WINDOW_H*.70), (WINDOW_H*.75)
                      DrawLine(w, h1/1.775, w, h2/1.68, w*.11, ARGB(255, 0, 0, 0))
                      DrawRectangleButton(WINDOW_W*0.467, WINDOW_H/2.375, WINDOW_W*.047, WINDOW_H*.041, ARGB(255, 255, 255, 255))
                      DrawTextA(tostring("OK"), WINDOW_H*.02, (WINDOW_W/2)*.98, (WINDOW_H/2.375), ARGB(255, 0, 0, 0 ),"center","center")
                      DrawTextA(tostring("                                                                                               Credits"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.395), ARGB(255, 96, 48, 0))
                      DrawTextA(tostring("                                                                              Furry- For this awesome popup"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.410), ARGB(255, 255, 255, 255))
                    end
                  end
                  function Leblanc:DrawCircle(x, y, z, radius, color)
                    local vPos1 = Vector(x, y, z)
                    local vPos2 = Vector(cameraPos.x, cameraPos.y, cameraPos.z)
                    local tPos = vPos1 - (vPos1 - vPos2):normalized() * radius
                    local sPos = WorldToScreen(D3DXVECTOR3(tPos.x, tPos.y, tPos.z))
                    if OnScreen({x = sPos.x, y = sPos.y}, {x = sPos.x, y = sPos.y}) then
                      self:DrawCircleNextLvl(x, y, z, radius, self.Config.other.lfc, color, self.Config.other.LFCsnap)
                    end
                  end

                  function Leblanc:DrawCircleNextLvl(x, y, z, radius, width, color, chordlength)
                    radius = radius or 300
                    quality = math.max(8, self:Round(180 / math.deg((math.asin(chordlength / (2 * radius))))))
                    quality = 2 * math.pi / quality
                    radius = radius * 0.92
                    local points = {}
                    for theta = 0, 2 * math.pi + quality, quality do
                      local c = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(theta), y, z - radius * math.sin(theta)))
                      points[#points + 1] = D3DXVECTOR2(c.x, c.y)
                    end
                    DrawLines2(points, width or 1, color or 4294967295)
                  end
                  function Leblanc:Round(number)
                    if number >= 0 then
                      return math.floor(number + 0.5)
                    else
                      return math.ceil(number - 0.5)
                    end
                  end
                  function Leblanc:GetDraws(target)
                    local qdamage = self:GetQDmg(target)
                    local q2damage =self:GetQ2Dmg(target)
                    local wdamage = self:GetWDmg(target)
                    local edamage = self:GetEDmg(target)
                    local rdamage = self:GetRDmg(target)
                    local Idmg=(50+ ((myHero.level)*20))

                    if qdamage >target.health then
                      return 'Q', RGBA(0, 255, 0, 255)
                    elseif qdamage+ Idmg>target.health then
                      return 'Q + Ignite', RGBA(0, 255, 0, 255)
                    elseif wdamage >target.health then
                      return 'W', RGBA(0, 255, 0, 255)
                    elseif wdamage+ Idmg>target.health then
                      return 'W + Ignite', RGBA(0, 255, 0, 255)
                    elseif edamage >target.health then
                      return 'E', RGBA(0, 255, 0, 255)
                    elseif edamage + Idmg>target.health then
                      return 'E + Ignite', RGBA(0, 255, 0, 255)
                    elseif rdamage  >target.health then
                      return 'R', RGBA(0, 255, 0, 255)
                    elseif rdamage + Idmg>target.health then
                      return 'R + Ignite', RGBA(0, 255, 0, 255)
                    elseif rdamage +edamage  >target.health then
                      return 'R + E',RGBA(0, 255, 0, 255)
                    elseif rdamage +edamage+ Idmg>target.health then
                      return 'R + E + Ignite',RGBA(0, 255, 0, 255)
                    elseif edamage+wdamage >target.health then
                      return 'E + W',RGBA(0, 255, 0, 255)
                    elseif edamage+wdamage+ Idmg>target.health then
                      return 'E + W + Ignite',RGBA(0, 255, 0, 255)
                    elseif rdamage+wdamage >target.health then
                      return 'R + W',RGBA(0, 255, 0, 255)
                    elseif rdamage+wdamage+ Idmg>target.health then
                      return 'R + W + Ignite',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+wdamage >target.health then
                      return 'Q + W',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+edamage>target.health then
                      return 'Q + E',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+rdamage >target.health then
                      return 'Q + R',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+wdamage+ Idmg>target.health then
                      return 'Q + W + Ignite',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+edamage+ Idmg>target.health then
                      return 'Q + E + Ignite',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+rdamage+ Idmg>target.health then
                      return 'Q + R + Ignite',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+edamage+wdamage >target.health then
                      return 'Q + W + E',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+rdamage+wdamage >target.health then
                      return 'Q + W + R',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+edamage+rdamage >target.health then
                      return 'Q + R + E',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+edamage+wdamage+ Idmg>target.health then
                      return 'Q + W + E + Ignite',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+wdamage+edamage+rdamage >target.health then
                      return 'Kill with full combo',RGBA(0, 255, 0, 255)
                    elseif qdamage+q2damage+wdamage+edamage+rdamage+Idmg>target.health then
                      return 'Full Combo + Ignite',RGBA(0, 255, 0, 255)
                    else
                      return "Cant Kill yet", RGBA(0, 255, 0, 255)
                    end
                  end
                  ---//==================================================\\---
                  --|| > Leblanc Tick Function                             ||--
                  ---\\==================================================//---
                  function Leblanc:Tick()
                    self:autowback()
                    if self.Config.Keys.wallkey then self:walljump() end
                    self:autopot()
                    if VIP_USER then self:Antiafk() end
                    self:autozhonya()
                    self:checkts()
                    self:items()
                    if VIP_USER then self:autolevel() end
                    if VIP_USER then self:skinhack() end
                    --self:gapclose()
                    if(self.Config.Keys.combokey   )then
                      self:combo()
                    end
                    if(self.Config.Keys.lasthitkey or self.Config.farm.lasthit.autolasthit )then
                      self:LastHit()
                    end
                    if(self.Config.Keys.onlye   )then
                      self:onlye()
                    end
                    if(self.Config.Keys.laneclearkey )then
                      self:LaneClear()
                    end
                    if self.Config.instruct then
                      self.Config.instruct = false
                      PopUp1 = true
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
                  function Leblanc:autowback()
                    if myHero:GetSpellData(_W).name == "leblancslidereturn" then
                      if self.Config.combo.turnw.wbackhp == 1 and self.Config.Keys.combokey then
                        if myHero.health <= (myHero.maxHealth * self.Config.combo.turnw.hp / 100) then
                          CastSpell(_W)
                        end
                      end
                    end
                    if myHero:GetSpellData(_W).name == "leblancslidereturn" then
                      if self.Config.combo.turnw.wbackcp == 1 and self.Config.Keys.combokey then
                        if self.Config.combo.turnw.enemy == 1 then
                          if CountEnemyHeroInRange(550) >= 2 then
                            CastSpell(_W)
                          end
                        elseif self.Config.combo.turnw.enemy == 2 then
                          if CountEnemyHeroInRange(550) >= 3 then
                            CastSpell(_W)
                          end
                        elseif self.Config.combo.turnw.enemy == 3 then
                          if CountEnemyHeroInRange(550) >= 4 then
                            CastSpell(_W)
                          end
                        elseif self.Config.combo.turnw.enemy == 4 then
                          if CountEnemyHeroInRange(550) >= 5 then
                            CastSpell(_W)
                          end
                        end
                      end
                    end
                  end
                  function Leblanc:Antiafk()
                    if os.clock() < Clock or not self.Config.vip.antiafk.antiafk then return end
                    Clock = os.clock() + math.random(60,120)
                    myHero:MoveTo(myHero.x, myHero.z)
                  end
                  function Leblanc:GetQDmg(target)
                    if myHero:GetSpellData(_Q).level < 1 then
                      return 0
                    end
                    if self.QSpell:IsReady() then
                      local FinalDamage = (30 + (myHero:GetSpellData(_Q).level * 25) + (myHero.ap + (myHero.ap * myHero.apPercent) )*.4)
                      return myHero:CalcMagicDamage(target, FinalDamage)
                    else
                      return 0
                    end
                  end
                  function Leblanc:GetQ2Dmg(target)
                    if myHero:GetSpellData(_Q).level < 1 then
                      return 0
                    end
                    if self.QSpell:IsReady() then
                      local FinalDamage = (30 + (myHero:GetSpellData(_Q).level * 25) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .4)
                      return myHero:CalcMagicDamage(target, FinalDamage)
                    else
                      return 0
                    end
                  end
                  function Leblanc:GetWDmg(target)
                    if myHero:GetSpellData(_W).level < 1 then
                      return 0
                    end
                    if self.WSpell:IsReady() then
                      local FinalDamage = (45 + (myHero:GetSpellData(_W).level * 40) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .6)
                      return myHero:CalcMagicDamage(target, FinalDamage)
                    else
                      return 0
                    end
                  end
                  function Leblanc:GetEDmg(target)
                    if myHero:GetSpellData(_E).level < 1 then
                      return 0
                    end
                    if self.ESpell:IsReady() then
                      local FinalDamage = 2*(15 + (myHero:GetSpellData(_E).level * 25) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .5)
                      return myHero:CalcMagicDamage(target, FinalDamage)
                    else
                      return 0
                    end
                  end
                  function Leblanc:GetE2Dmg(target)
                    if myHero:GetSpellData(_E).level < 1 then
                      return 0
                    end
                    if self.ESpell:IsReady() then
                      local FinalDamage = (15 + (myHero:GetSpellData(_E).level * 25) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .5)
                      return myHero:CalcMagicDamage(target, FinalDamage)
                    else
                      return 0
                    end
                  end
                  function Leblanc:GetRDmg(target)
                    if myHero:GetSpellData(_R).level < 1 then
                      return 0
                    end
                    if self.RSpell:IsReady() and myHero:GetSpellData(_R).name == "LeblancSoulShackleM" then
                      local FinalDamage = ((myHero:GetSpellData(_R).level * 100) + (myHero.ap + (myHero.ap * myHero.apPercent) )*.6)
                      return myHero:CalcMagicDamage(target, FinalDamage)
                    elseif self.RSpell:IsReady() and myHero:GetSpellData(_R).name == "LeblancSlideM" then
                      local FinalDamage = ((myHero:GetSpellData(_R).level * 150) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .9)
                      return myHero:CalcMagicDamage(target, FinalDamage)
                    elseif self.RSpell:IsReady() and myHero:GetSpellData(_R).name == "LeblancChaosOrbM" then
                      local FinalDamage = ((myHero:GetSpellData(_R).level * 100) + (myHero.ap + (myHero.ap * myHero.apPercent)) * .6)
                      return myHero:CalcMagicDamage(target, FinalDamage)
                    else
                      return 0
                    end
                  end
                  function Leblanc:GetMyDmg(target)
                    if self.QSpell:IsReady() and self.WSpell:IsReady() and self.RSpell:IsReady() and self.ESpell:IsReady() then
                      return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target) + self:GetEDmg(target) + self:GetQ2Dmg(target)
                    elseif self.QSpell:IsReady() and self.WSpell:IsReady() and self.RSpell:IsReady() then
                      return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target) + self:GetQ2Dmg(target)
                    elseif self.QSpell:IsReady() and self.WSpell:IsReady() and self.ESpell:IsReady() then
                      return self:GetQDmg(target) + self:GetWDmg(target) + self:GetEDmg(target) + self:GetQ2Dmg(target)
                    elseif self.QSpell:IsReady() and self.RSpell:IsReady() and self.ESpell:IsReady() then
                      return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target) + self:GetQ2Dmg(target)
                    elseif self.RSpell:IsReady() and self.WSpell:IsReady() and self.ESpell:IsReady() then
                      return self:GetRDmg(target) + self:GetWDmg(target) + self:GetEDmg(target)
                    elseif self.QSpell:IsReady() and self.WSpell:IsReady() then
                      return self:GetQDmg(target) + self:GetWDmg(target) + self:GetQ2Dmg(target)
                    elseif self.ESpell:IsReady() and self.WSpell:IsReady() then
                      return self:GetEDmg(target) + self:GetWDmg(target)
                    elseif self.RSpell:IsReady() and self.WSpell:IsReady() then
                      return self:GetRDmg(target) + self:GetWDmg(target)
                    elseif self.QSpell:IsReady() and self.RSpell:IsReady() then
                      return self:GetQDmg(target) + self:GetRDmg(target)+ self:GetQ2Dmg(target)
                    elseif self.ESpell:IsReady() and self.RSpell:IsReady() then
                      return self:GetEDmg(target) + self:GetRDmg(target)
                    elseif self.QSpell:IsReady() and self.ESpell:IsReady() then
                      return self:GetQDmg(target) + self:GetEDmg(target) + self:GetQ2Dmg(target)
                    elseif self.RSpell:IsReady() then
                      return self:GetRDmg(target)
                    elseif self.ESpell:IsReady() then
                      return self:GetEDmg(target)
                    elseif self.QSpell:IsReady() then
                      return self:GetQDmg(target)
                    elseif self.WSpell:IsReady() then
                      return self:GetWDmg(target)
                    else
                      return 0
                    end
                  end
                  function Leblanc:checkts()
                    self.ts:update()
                    self.tse:update()
                    self.tsq:update()
                    self.tsr:update()
                    self.tsw:update()
                    self.tsg:update()
                    if not self.tsg.target~=nil or not self.Config.targetsel.ts then
                      target = self.tsw.target
                    elseif self.tsg.target~=nil or self.selectedTar then
                      target = self.selectedTar
                    end
                  end
                  function Leblanc:skinhack()
                    if not skinload then
                      if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
                        lastTimeTickCalled = CurrentTimeInMillis()
                        if self.Config.vip.skin.key and self.Config.vip.packet  then
                          if self.Config.vip.skin['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
                            lastSkin = self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']
                            SendSkinPacket(myHero.charName, skinsPB[self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']], myHero.networkID);
                          end
                        end
                      end
                    end
                  end
                  function Leblanc:onlye()
                    self.tse:update()
                    if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.onlye   and self.ESpell:IsReady()) then
                      self:CastE(self.tse.target)
                    end
                  end
                  ---//==================================================\\---
                  --|| > Leblanc Combo                             ||--
                  ---\\==================================================//---
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
                      self:comboWRQE()
                    end
                    if self.Config.combo.logic == 6 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) then
                      self:comboWQRE()
                    end
                    if self.Config.combo.logic == 7 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) then
                      self:comboQRWE()
                    end
                    if self.Config.combo.logic == 8 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) then
                      self:comboDB()
                    end
                    if self.Config.combo.logic == 9 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) then
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
                  function Leblanc:comboQRWE()
                    self.tsw:update()
                    if not self.Config.combo.turnw.w7 then
                      if (self.tsw.target ~= nil )then
                        self:CastQR(target)
                      end
                      if(self.tsw.target ~= nil ) and self:QRused() then
                        self:CastWE(target)
                      end
                    end
                    if self.Config.combo.turnw.w7 then
                      if (self.tsw.target ~= nil )then
                        self:CastQR(target)
                      end
                      if(self.tsw.target ~= nil ) and self:QRused() then
                        self:CastWEB(target)
                      end
                    end
                  end
                  function Leblanc:comboDB() -- QWER
                    self.tsw:update()
                    if not self.Config.combo.turnw.w8 then
                      if(self.tsw.target ~= nil )  then
                        self:CastQW(target)
                      end
                      if (self.tsw.target ~= nil ) and self:QWused()then
                        self:CastER(target)
                      end
                    end
                    if self.Config.combo.turnw.w8 then
                      if(self.tsw.target ~= nil ) then
                        self:CastQWB(target)
                      end
                      if (self.tsw.target ~= nil ) and self:QWused()then
                        self:CastER(target)
                      end
                    end
                  end
                  function Leblanc:comboQREW()
                    self.tsw:update()
                    if not self.Config.combo.turnw.w2 then
                      if (self.tsw.target ~= nil )then
                        self:CastQR(target)
                      end
                      if(self.tsw.target ~= nil ) and self:QRused() then
                        self:CastEW(target)
                      end
                    end
                    if self.Config.combo.turnw.w2 then
                      if (self.tsw.target ~= nil )then
                        self:CastQR(target)
                      end
                      if(self.tsw.target ~= nil ) and self:QRused() then
                        self:CastEWB(target)
                      end
                    end
                  end
                  function Leblanc:comboEWQR()
                    self.tsw:update()
                    if not self.Config.combo.turnw.w4 then
                      if (self.tsw.target ~= nil )then
                        self:CastEW(target)
                      end
                      if(self.tsw.target ~= nil ) and self:EWused() then
                        self:CastQR(target)
                      end
                    end
                    if  self.Config.combo.turnw.w4 then
                      if (self.tsw.target ~= nil )then
                        self:CastEWB(target)
                      end
                      if(self.tsw.target ~= nil ) and self:EWused() then
                        self:CastQR(target)
                      end
                    end
                  end
                  function Leblanc:comboEQWR()
                    self.tsw:update()
                    if not self.Config.combo.turnw.w3 then
                      if (self.tsw.target ~= nil )then
                        self:CastEQ(target)
                      end
                      if(self.tsw.target ~= nil ) and self:EQused() then
                        self:CastWR(target)
                      end
                    end
                    if  self.Config.combo.turnw.w3 then
                      if (self.tsw.target ~= nil )then
                        self:CastEQ(target)
                      end
                      if(self.tsw.target ~= nil ) and self:EQused() then
                        self:CastWRB(target)
                      end
                    end
                  end
                  function Leblanc:comboQEWR()
                    self.tsw:update()
                    if not self.Config.combo.turnw.w1 then
                      if (self.tsw.target ~= nil )then
                        self:CastQE(target)
                      end
                      if(self.tsw.target ~= nil ) and self:QEused() then
                        self:CastWR(target)
                      end
                    end
                    if self.Config.combo.turnw.w1 then
                      if (self.tsw.target ~= nil )then
                        self:CastQE(target)
                      end
                      if(self.tsw.target ~= nil ) and self:QEused() then
                        self:CastWRB(target)
                      end
                    end
                  end
                  function Leblanc:comboWRQE()
                    self.tsw:update()
                    if not self.Config.combo.turnw.w5 then
                      if(self.tsw.target ~= nil )  then
                        self:CastWR2(target)
                      end
                      if (self.tsw.target ~= nil ) and self:R2used() then
                        self:CastQE(target)
                      end
                    end
                    if self.Config.combo.turnw.w5 then
                      if(self.tsw.target ~= nil ) then
                        self:CastWRB2(target)
                      end
                      if (self.tsw.target ~= nil ) and self:R2used() then
                        self:CastQE(target)
                      end
                    end
                  end
                  function Leblanc:comboWQRE()
                    self.tsw:update()
                    if not self.Config.combo.turnw.w6 then
                      if(self.tsw.target ~= nil )  then
                        self:CastWQ(target)
                      end
                      if (self.tsw.target ~= nil ) and self:Qused()then
                        self:CastRE(target)
                      end
                    end
                    if self.Config.combo.turnw.w6 then
                      if(self.tsw.target ~= nil ) then
                        self:CastWQB(target)
                      end
                      if (self.tsw.target ~= nil ) and self:Qused()then
                        self:CastRE(target)
                      end
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
                  function Leblanc:CastEWB(unit)
                    self.tse:update()
                    if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.combokey    and self.ESpell:IsReady())then
                      self:CastE(target)
                    end
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey  and self.WSpell:IsReady()) then
                      self:CastW(target)
                    end
                  end
                  function Leblanc:CastQW(unit)
                    self.tsq:update()
                    if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey    and self.QSpell:IsReady())then
                      self:CastQ(target)
                    end
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey   and not self:wUsed() and self.WSpell:IsReady()) then
                      self:CastW(target)
                    end
                  end
                  function Leblanc:CastQWB(unit)
                    self.tsq:update()
                    if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey    and self.QSpell:IsReady())then
                      self:CastQ(target)
                    end
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey  and self.WSpell:IsReady()) then
                      self:CastW(target)
                    end
                  end
                  function Leblanc:CastWE(unit)
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey   and not self:wUsed() and self.WSpell:IsReady()) then
                      self:CastW(target)
                    end
                    self.tse:update()
                    if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.combokey    and self.ESpell:IsReady())then
                      self:CastE(target)
                    end
                  end
                  function Leblanc:CastWEB(unit)
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey  and self.WSpell:IsReady()) then
                      self:CastW(target)
                    end
                    self.tse:update()
                    if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.combokey    and self.ESpell:IsReady())then
                      self:CastE(target)
                    end
                  end
                  function Leblanc:randomcombo()
                    if self.Config.combo.turnw.w9 then
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
                    if not self.Config.combo.turnw.w9 then
                      self.tsq:update()
                      if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey    and self.QSpell:IsReady())then
                        self:CastQ(target)
                      end
                      self.tsw:update()
                      if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey and not self:wUsed() and self.WSpell:IsReady())then
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
                    if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey   and self.RSpell:IsReady()) and not self:rUsed()  then
                      self:CastR(target)
                    end
                  end
                  function Leblanc:CastWR2(unit)
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey    and self.WSpell:IsReady()and not self:wUsed())then
                      self:CastW(target)
                    end
                    self.tsr:update()
                    if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey   and self.RSpell:IsReady()) then
                      self:CastR(target)
                    end
                  end
                  function Leblanc:CastWQ(unit)
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey    and self.WSpell:IsReady()and not self:wUsed())then
                      self:CastW(target)
                    end
                    self.tsq:update()
                    if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey   and self.QSpell:IsReady())  then
                      self:CastQ(target)
                    end
                  end
                  function Leblanc:CastRE(unit)
                    self.tsr:update()
                    if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey   and self.RSpell:IsReady())   then
                      self:CastR(target)
                    end
                    self.tse:update()
                    if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.combokey   and self.ESpell:IsReady()) then
                      self:CastE(target)
                    end
                  end
                  function Leblanc:CastER(unit)
                    self.tse:update()
                    if(self.tse.target~=nil and self.Config.combo.useE and  self.Config.Keys.combokey   and self.ESpell:IsReady()) then
                      self:CastE(target)
                    end
                    self.tsr:update()
                    if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey   and myHero:GetSpellData(_R).name == "LeblancSoulShackleM" and self.RSpell:IsReady())   then
                      DelayAction(function() self:CastRE(target)end ,self.Config.combo.delay/1000)
                    end
                  end
                  function Leblanc:CastWRB(unit)
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey    and self.WSpell:IsReady())then
                      self:CastW(target)
                    end
                    self.tsr:update()
                    if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey   and self.RSpell:IsReady()) and not self:rUsed()  then
                      self:CastR(target)
                    end
                  end
                  function Leblanc:CastWRB2(unit)
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey    and self.WSpell:IsReady())then
                      self:CastW(target)
                    end
                    self.tsr:update()
                    if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey   and self.RSpell:IsReady()) then
                      self:CastR(target)
                    end
                  end
                  function Leblanc:CastWQB(unit)
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey    and self.WSpell:IsReady())then
                      self:CastW(target)
                    end
                    self.tsq:update()
                    if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey   and self.QSpell:IsReady())  then
                      self:CastQ(target)
                    end
                  end
                  function Leblanc:CastQWH()
                    self.tsq:update()
                    if(self.tsq.target~=nil and self.Config.harass.useQ and  self.Config.Keys.harasskey  and self.QSpell:IsReady() and self.WSpell:IsReady())then
                      self:CastQ(target)
                    end
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.harass.useW and  self.Config.Keys.harasskey  and self.WSpell:IsReady() and not self.QSpell:IsReady())then
                      self:CastW(target)
                    end
                  end
                  function Leblanc:buff(unit)
                    return TargetHaveBuff('leblancchaosorb', unit)
                  end
                  function Leblanc:CastQEH()
                    self.tsq:update()
                    if(self.tsq.target~=nil and self.Config.harass.useQ and  self.Config.Keys.harasskey  and self.QSpell:IsReady() and self.ESpell:IsReady())then
                      self:CastQ(target)
                    end
                    self.tse:update()
                    if(self.tse.target~=nil and self.Config.harass.useE and  self.Config.Keys.harasskey and self:buff(target) and self.ESpell:IsReady() and not self.QSpell:IsReady())then
                      self:CastE(target)
                    end
                  end
                  function Leblanc:CastWRH()
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.harass.useW and  self.Config.Keys.harasskey  and self.WSpell:IsReady() and not self:wUsed() and self.RSpell:IsReady())then
                      self:CastW(target)
                    end
                    self.tsr:update()
                    if(self.tsr.target~=nil and self.Config.harass.useR and  self.Config.Keys.harasskey  and self.RSpell:IsReady() )then
                      self:CastR(target)
                    end
                    if not self.RSpell:IsReady() then
                      self:CastW(target)
                    end
                  end
                  function Leblanc:CastQWK(unit)
                    self.tsq:update()
                    if(self.tsq.target~=nil and self.Config.killsteal.useQW and  self.Config.killsteal.ks and self.QSpell:IsReady())then
                      self:CastQ(target)
                    end
                    self.tsw:update()
                    if(self.tsw.target~=nil and self.Config.killsteal.useQW and not self:wUsed() and self.Config.killsteal.ks and self.WSpell:IsReady())then
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
                  function Leblanc:CastRE(unit)
                    self.RESpell:Cast(unit)
                  end

                  function Leblanc:CastI(unit)
                    self.Ignite:Cast(unit)
                  end
                  function Leblanc:killsteal()
                    for _, unit in pairs(GetEnemyHeroes()) do
                      local health = unit.health
                      local dmgE = self:GetEDmg(unit)
                      if(self.tse.target ~= nil and  self.ESpell:IsReady() and not self.Config.Keys.combokey   and health<dmgE and self.Config.killsteal.useE   and self.Config.killsteal.ks)then
                        self:CastE(unit)
                      end
                      local dmgQ = self:GetQDmg(unit)
                      if(self.tsq.target ~= nil and  self.QSpell:IsReady() and not self.Config.Keys.combokey   and health<dmgQ and self.Config.killsteal.useQ and self.Config.killsteal.ks )then
                        self:CastQ(unit)
                      end
                      local dmgQW = self:GetQDmg(unit)+self:GetWDmg(unit)
                      if(self.tsw.target ~= nil and  health<dmgQ and not self.Config.Keys.combokey   and self.Config.killsteal.useQW and self.Config.killsteal.ks )then
                        self:CastQWK(unit)
                      end
                      local dmgW = self:GetWDmg(unit)
                      if(self.tsw.target ~= nil and  self.WSpell:IsReady() and not self.Config.Keys.combokey and not self:wUsed()   and health<dmgQ and self.Config.killsteal.useW and self.Config.killsteal.ks )then
                        self:CastW(unit)
                      end
                      local dmgI =(50+ ((myHero.level)*20))
                      if(health<dmgI and self.Config.killsteal.useI and self.Config.killsteal.ks and GetDistance(unit)<600)then
                        self:CastI(unit)
                      end
                      local dmgR =self:GetRDmg(unit)
                      if(self.tsr.target ~= nil and  self.RSpell:IsReady() and not self.Config.Keys.combokey   and health<dmgR and self.Config.killsteal.useR and self.Config.killsteal.ks and GetDistance(unit)<600)then
                        self:CastR(unit)
                      end
                    end
                  end
                  function Leblanc:walljump()
                    if not self.WSpell:IsReady() or self:wUsed() then return end
                    for k, loc in pairs(lbspot) do
                      if GetDistance(loc, myHero) < 250 and GetDistance(loc, myHero) > 50 then
                        myHero:MoveTo(loc.x, loc.z)
                      end
                      if GetDistance(loc, myHero) < 20 and not self:wUsed()  then
                        CastSpell(_W, lbspotend[k].x, lbspotend[k].z)
                        --myHero:MoveTo(lbspotend[k].x, lbspotend[k].z)
                      end
                    end

                    for k, loc in pairs(lbspotend) do
                      if GetDistance(loc, myHero) < 250 and GetDistance(loc, myHero) > 50 then
                        myHero:MoveTo(loc.x, loc.z)
                      end
                      if GetDistance(loc, myHero) < 20 and not self:wUsed()  then
                        CastSpell(_W, lbspot[k].x, lbspot[k].z)
                        --myHero:MoveTo(lbspot[k].x, lbspot[k].z)
                      end
                    end
                  end
                  function Leblanc:harass()
                    self.tsq:update()
                    self.tsw:update()
                    if self.Config.harass.logic == 1 then
                      if self.Config.Keys.harasskey  and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 )  then
                        self:CastQWH()
                      end
                    elseif self.Config.harass.logic == 2 then
                      if self.Config.Keys.harasskey  and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 )  then
                        self:CastQEH()
                      end
                    elseif self.Config.harass.logic == 3 then
                      if self.Config.Keys.harasskey  and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 )  then
                        self:CastWRH()
                      end
                    end
                  end
                  function Leblanc:LaneClear(tab)
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
                        if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.QMana /100 ) and GetDistance(minion) <= self.QSpell.Range then
                          self:CastQ(cleartarget)
                        end
                        local NumberOfHits = self.Config.farm.laneclear.wcount
                        if NumberOfHits >= 1 and #self.enemyMinions.objects >= NumberOfHits then

                          if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useW and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.WMana /100 ) and GetDistance(minion) <= self.WSpell.Range then
                            local BestPos, BestHit = GetBestCircularFarmPosition(self.WSpell.Range, self.WSpell.Width, self.enemyMinions.objects)
                            if BestPos ~= nil and  BestHit >= NumberOfHits then
                              CastSpell(_W, BestPos.x, BestPos.z)
                            end
                          end
                        end
                        local NumberOfHits = self.Config.farm.laneclear.rcount
                        if NumberOfHits >= 1 and #self.enemyMinions.objects >= NumberOfHits then
                          if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useR and myHero:GetSpellData(_R).name == "LeblancSlideM" and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.RMana /100 ) and GetDistance(minion) <= self.WSpell.Range then
                            local BestPos, BestHit = GetBestCircularFarmPosition(self.WSpell.Range, self.WSpell.Width, self.enemyMinions.objects)
                            if BestPos ~= nil and BestHit >= NumberOfHits then
                              CastSpell(_R, BestPos.x, BestPos.z)
                            end
                          end
                        end
                      end
                    end
                  end
                  function Leblanc:LastHit()
                    self.enemyMinions:update()
                    if self.Config.farm.lasthit.lasthitlogic == 1 then
                      for _, target in pairs(self.enemyMinions.objects) do
                        local Qdamage = self:GetQDmg(target)
                        if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 ) and ValidTarget(target,self.QSpell.Range)  and GetDistanceSqr(target) <= self.QSpell.Range * self.QSpell.Range and Qdamage >= target.health) then
                          self:CastQ(target)
                        end
                        local Edamage = self:GetE2Dmg(target)
                        if(self.ESpell:IsReady() and self.Config.farm.lasthit.useE and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.EMana /100 )and  ValidTarget(target,self.QSpell.Range) and GetDistanceSqr(target) <= self.ESpell.Range * self.ESpell.Range and Edamage >= target.health) then
                          self:CastE(target)
                        end
                      end
                    elseif self.Config.farm.lasthit.lasthitlogic == 2 then
                      if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 )) then
                        self.QSpell:LastHit()
                      end
                      if(self.ESpell:IsReady() and self.Config.farm.lasthit.useE and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.EMana /100 )) then
                        self.ESpell:LastHit()
                      end
                    end
                  end
                  function Leblanc:JungleClear()
                    if(self.QSpell:IsReady() and self.Config.farm.jungleclear.useQ and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.QMana /100 ) then
                      self.QSpell:JungleClear()
                    end
                    if(self.WSpell:IsReady() and self.Config.farm.jungleclear.useW and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.WMana /100 ) then
                      self.WSpell:JungleClear()
                    end
                    if(self.ESpell:IsReady() and self.Config.farm.jungleclear.useE and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.EMana /100 ) then
                      self.ESpell:JungleClear()
                    end
                    if(self.RSpell:IsReady() and self.Config.farm.jungleclear.useR and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.RMana /100 ) then
                      self.RSpell:JungleClear()
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
                  function Leblanc:R2used()
                    local leblancQ = self.RSpell:IsReady()
                    if (leblancQ ) then
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
                  function Leblanc:WRused()
                    local leblancQ = self.WSpell:IsReady()
                    local leblancE = self.RSpell:IsReady()
                    if (leblancQ and leblancE) then
                      return false
                    else
                      return true
                    end
                  end
                  function Leblanc:WQused()
                    local leblancQ = self.WSpell:IsReady()
                    local leblancE = self.QSpell:IsReady()
                    if (leblancQ and leblancE) then
                      return false
                    else
                      return true
                    end
                  end
                  function Leblanc:Qused()
                    local leblancE = self.QSpell:IsReady()
                    if ( leblancE) then
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
                  function Leblanc:QWused()
                    local leblancW = self.QSpell:IsReady()
                    local leblancE = self.WSpell:IsReady()
                    if (leblancW and leblancE) then
                      return false
                    else
                      return true
                    end
                  end
                  local spellLevel = 0
                  function Leblanc:autolevel()
                    if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence1 =   { 1,2,3,1,1,4,1,2,1,2,4,2,2,3,3,4,3,3}
                      autoLevelSetSequence(levelSequence1)
                      Last_LevelSpell = os.clock()
                    end
                    if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence2 =   { 1,2,3,1,1,4,1,3,1,3,4,3,3,2,2,4,2,2}
                      autoLevelSetSequence(levelSequence2)
                      Last_LevelSpell = os.clock()
                    end
                    if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence3 =  { 2,3,1,2,2,4,2,1,2,1,4,1,1,3,3,4,3,3}
                      autoLevelSetSequence(levelSequence3)
                      Last_LevelSpell = os.clock()
                    end
                    if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence4 =  { 2,3,1,2,2,4,2,3,2,3,4,3,3,1,1,4,1,1}
                      autoLevelSetSequence(levelSequence4)
                      Last_LevelSpell = os.clock()
                    end
                    if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence5 =  { 3,1,2,3,3,4,3,2,3,2,4,2,2,1,1,4,1,1}
                      autoLevelSetSequence(levelSequence5)
                      Last_LevelSpell = os.clock()
                    end
                    if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence6 =  { 3,1,2,3,3,4,3,1,3,1,4,1,1,2,2,4,2,2}
                      autoLevelSetSequence(levelSequence6)
                      Last_LevelSpell = os.clock()
                    end
                    if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence6 =  { 2,1,3,2,1,4,2,2,1,3,4,2,1,1,3,4,3,3}
                      autoLevelSetSequence(levelSequence6)
                      Last_LevelSpell = os.clock()
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
                    pos=Vector(myHero)+(Vector(target)-Vector(myHero)):normalized()*self.WSpell.Range
                    CastSpell(_W,pos.x,pos.z)
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
                  if target and not target.dead and self.WSpell:IsReady() and self.QSpell:IsReady() and self.ESpell:IsReady() then
                    self:escapeforgap()
                  end
                end
                function Leblanc:items()
                  for i, enemy in ipairs(GetEnemyHeroes()) do
                    if self.Config.item.usebg and self.Config.Keys.combokey then
                      for _ = ITEM_1, ITEM_7 do
                        if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastSpell(_)
                      end
                    end
                  end
                  if self.Config.item.usehg and self.Config.Keys.combokey then
                    for _ = ITEM_1, ITEM_7 do
                      if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastSpell(_)
                    end
                  end
                end

              end
            end
            lastPotion = 0
            function Leblanc:autopot()
              if os.clock() - lastPotion < 15 then return end
              for SLOT = ITEM_1, ITEM_6 do
                if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp then
                  if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp /100 )  then
                    CastSpell(SLOT)
                    lastPotion = os.clock()
                  end
                end
              end
            end

            function Leblanc:TARGETCS()
              local Target = nil
              if self.selectedTar then Target = self.selectedTar
            else Target = self.tsw.target
            end
          end
          function Leblanc:WndMsg(Msg, Key)
            if self.Config.Keys.combomode then
              self.Config.combo.logic = self.Config.combo.logic +1
              self.Config.Keys.combomode = false
              if self.Config.combo.logic > 9 then self.Config.combo.logic = 1 end
            end
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
            if Msg == WM_LBUTTONDOWN then
              if PopUp1 then
                PopUp1 = false
              end
            end
          end
          function Leblanc:Unload()
            self:writecfg()
          end
          ---//==================================================\\---
          --|| > Akali Start                          ||--
          ---\\==================================================//---
          local Qbuff = false
          class "Akali"
          function Akali:__init()
            self.ts= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_PHYSICAL, false, true)
            self.tsq= TargetSelector(TARGET_LESS_CAST_PRIORITY, 600, DAMAGE_PHYSICAL, false, true)
            self.tsw= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_PHYSICAL, false, true)
            self.tse= TargetSelector(TARGET_LESS_CAST_PRIORITY, 315, DAMAGE_PHYSICAL, false, true)
            self.tsr= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_PHYSICAL, false, true)
            self.tsg= TargetSelector(TARGET_LESS_CAST_PRIORITY, 925, DAMAGE_MAGIC, false, true)
            self.QSpell = _Spell({Slot = _Q, DamageName = "Q", Range = 600, Collision = false, Aoe = false, Type = SPELL_TYPE.TARGETTED})
            self.WSpell = _Spell({Slot = _W, DamageName = "W", Range = 700, Collision = false, Aoe = true, Type = SPELL_TYPE.SELF})
            self.ESpell = _Spell({Slot = _E, DamageName = "E", Range = 325, Collision = false, Aoe = true, Type = SPELL_TYPE.SELF})
            self.RSpell = _Spell({Slot = _R, DamageName = "R", Range =700,  Collision = false, Aoe = false, Type = SPELL_TYPE.TARGETTED})
            self.RWSpell = _Spell({Slot = _W, DamageName = "W", Range = 700, Collision = false, Aoe = true, Type = SPELL_TYPE.LINEAR})
            self.Ignite = _Spell({Slot = FindSummonerSlot("summonerdot"), DamageName = "IGNITE", Range = 600, Type = SPELL_TYPE.TARGETTED})
            --|> Minion Managers
            self.enemyMinions   = minionManager(MINION_ENEMY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
            self.allyMinions    = minionManager(MINION_ALLY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
            self.jungleMinions  = minionManager(MINION_JUNGLE,  650, myHero, MINION_SORT_MAXHEALTH_DEC)
            self.otherMinions   = minionManager(MINION_OTHER,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
            self:LoadMenu()
            Last_LevelSpell = 0
            self:findorbwalker()

            AddTickCallback(function() self:Tick() end)
            AddUnloadCallback(function() self:Unload() end )
            AddDrawCallback(function() self:Draw() end)
            AddMsgCallback(function(msg,Key) self:WndMsg(msg,Key) end)
            --AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
            AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
            AddApplyBuffCallback(function(source, unit, buff) self:OnApplyBuff(source, unit, buff) end)
            AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
            AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end)
          end
          function Akali:Tick()
            self:autozhonya()
            self:Autostealth()
            self:autopot()
            self:autoq()
            -- if Qbuff then print "yes" else print "no" end
            if VIP_USER then   self:Antiafk()  end
            self:items()
            self:checkts()
            if VIP_USER then self:autolevel() end
            if VIP_USER then self:skinhack() end
            if(self.Config.Keys.combokey and self.Config.skilllogic.Rlogic.logic == 1 )then
              self:combo()
            end
            if(self.Config.Keys.combokey and self.Config.skilllogic.Rlogic.logic == 2 )then
              self:combo2()
            end
            if(self.Config.Keys.lasthitkey or self.Config.farm.lasthit.autolasthit )then
              self:LastHit()
            end
            if(self.Config.Keys.jungleclearkey )then
              self:JungleClear()
            end
            if(self.Config.Keys.laneclearkey )then
              self:LaneClear()
            end
            if self.Config.instruct then
              self.Config.instruct = false
              PopUp1 = true
            end
            if(self.Config.killsteal.ks ) then
              self:killsteal()
            end
            if(self.Config.Keys.harasskey  ) then
              self:harass()
            end
            if(self.Config.Keys.escapekey )then
              self:escape()
            end
          end
          function Akali:UpdateBuff(unit,buff,stacks)
            if unit and unit.team ~= myHero.team and unit.type == myHero.type then
              if buff.name == "AkaliMota" then
                Qbuff = true
              end
            end
          end
          function Akali:OnApplyBuff(source, unit, buff)
            if unit and unit.team ~= myHero.team and unit.type == myHero.type then
              if  buff.name == "AkaliMota" then
                Qbuff = true
              end
            end
          end

          function Akali:OnRemoveBuff(unit, buff)
            if unit and unit.team ~= myHero.team and unit.type == myHero.type then
              if buff.name == "AkaliMota" then
                Qbuff = false
              end
            end
          end
          function Akali:walk()
            myHero:MoveTo(mousePos.x,mousePos.z)
          end
          function Akali:escape()
            if self.Config.Keys.escapekey  and self.Config.escape.useW then
              CastSpell(_W,mousePos.x,mousePos.z)
            end
            if self.Config.Keys.escapekey  then
              self:walk()
            end
          end
          function Akali:Draw()
            if self.Config.other.draw.qdraw and self.QSpell:IsReady() then
              DrawCircle3D(myHero.x, myHero.y, myHero.z, 600,  self.Config.other.width.Qwidth,ARGB(table.unpack(self.Config.other.color.Qcolor)))
            end

            if self.Config.other.draw.wdraw and self.WSpell:IsReady() then
              DrawCircle3D(myHero.x, myHero.y, myHero.z, 700,  self.Config.other.width.Wwidth, ARGB(table.unpack(self.Config.other.color.Wcolor)))
            end

            if self.Config.other.draw.edraw and self.ESpell:IsReady() then
              DrawCircle3D(myHero.x, myHero.y, myHero.z, 325,  self.Config.other.width.Ewidth, ARGB(table.unpack(self.Config.other.color.Ecolor)))
            end

            if self.Config.other.draw.rdraw and self.RSpell:IsReady() then
              DrawCircle3D(myHero.x, myHero.y, myHero.z, 700, self.Config.other.width.Rwidth, ARGB(table.unpack(self.Config.other.color.Rcolor)))
            end
            if self.Config.other.draw.aadraw then
              DrawCircle3D(myHero.x, myHero.y, myHero.z, 125, self.Config.other.width.AAwidth, ARGB(table.unpack(self.Config.other.color.AAcolor)))
            end
            if self.Config.other.draw.rtdraw and self.RSpell:IsReady()  then
              if self.tsr.target~=nil then
                DrawLine3D(myHero.x, myHero.y, myHero.z,self.tsr.target.x, self.tsr.target.y, self.tsr.target.z,self.Config.other.width.E2width,ARGB(table.unpack(self.Config.other.color.E2color)))
              end
            end
            if PopUp1 then
              local w, h1, h2 = (WINDOW_W*0.50), (WINDOW_H*.15), (WINDOW_H*.9)
              DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
              DrawLine(w, h1, w, h2/2, w/1.8, ARGB(150, 235, 183, 63))
              DrawTextA(tostring("Welcome to KeyboardMaster Series 3.0"), WINDOW_H*.028, (WINDOW_W/2), (WINDOW_H*.18), ARGB(255, 96, 48, 0),"center","center")
              DrawTextA(tostring("Little informatation about KeyboardMaster Series"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.194), ARGB(255, 96, 48, 0))
              DrawTextA(tostring("Its a bundle that produced by ensuluyn"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.210), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("Currently it supported only mid champs "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.225), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("I focus Quality rather than Quantity"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.240), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("I need your feedbacks to improve it"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.255), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("I care every single feedback and try to add everything"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.270), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("Hope you are enjoy my script.."), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.285), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("You can change every settings to your like :)"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.300), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("Did you like my script > Upvote me on scriptstatus and on forum"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.315), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("Don't forget these are VIP;"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.330), ARGB(255, 96, 48, 0))
              DrawTextA(tostring("  Anti-Afk"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.345), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("  Auto Leveler "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.360), ARGB(255, 255, 255, 255))
              DrawTextA(tostring("  Skin Changer "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.375), ARGB(255, 255, 255, 255))
              local w, h1, h2 = (WINDOW_W*0.49), (WINDOW_H*.70), (WINDOW_H*.75)
              DrawLine(w, h1/1.775, w, h2/1.68, w*.11, ARGB(255, 0, 0, 0))
              DrawRectangleButton(WINDOW_W*0.467, WINDOW_H/2.375, WINDOW_W*.047, WINDOW_H*.041, ARGB(255, 255, 255, 255))
              DrawTextA(tostring("OK"), WINDOW_H*.02, (WINDOW_W/2)*.98, (WINDOW_H/2.375), ARGB(255, 0, 0, 0 ),"center","center")
              DrawTextA(tostring("                                                                                               Credits"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.395), ARGB(255, 96, 48, 0))
              DrawTextA(tostring("                                                                              Furry- For this awesome popup"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.410), ARGB(255, 255, 255, 255))
            end
            if self.Config.other.target and self.selectedTar ~= nil then
              DrawCircle3D(self.selectedTar.x, self.selectedTar.y, self.selectedTar.z, 80,6, ARGB(255, 255,0,0))
            end
            if self.Config.other.targetcal and not myHero.dead then
              if target and target ~= nil then
                local drawpos=WorldToScreen(D3DXVECTOR3(target.x, target.y, target.z))
                local comboText,color = self:GetDraws(target)
                if comboText then
                  DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
                end
              end
            end
            for _, target in pairs(GetEnemyHeroes()) do
              if ValidTarget(target, 15000) then
                if target.visible and not target.dead and self.Config.other.damage then
                  currLine = 1
                  DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
                  DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
                  currLine = currLine + 1
                end
              end
            end
          end
          function Akali:writecfg(param)
            local file = io.open(SCRIPT_PATH.."\\".."config.cfg", "w")
            if not file then
              -- print("Error in Write CFG")
            end
            if param ~= "ftc" then
              file:write(ava_languages[self.Config.lang])
              -- print("Written: "..ava_languages[self.Config.lang])
            else
              file:write("eng")
              -- print("W: English")
            end
            file:close()
          end
          function Akali:buff(unit)
            return TargetHaveBuff('AkaliMota', unit)
          end

          function Akali:skinhack()
            if not skinload then
              if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
                lastTimeTickCalled = CurrentTimeInMillis()
                if self.Config.vip.skin.key and self.Config.vip.packet  then
                  if self.Config.vip.skin['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
                    lastSkin = self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']
                    SendSkinPacket(myHero.charName, skinsPB[self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']], myHero.networkID);
                  end
                end
              end
            end
          end
          function Akali:ProcessSpell(unit, spell)
            if unit.type == myHero.type and unit.team ~= myHero.team and isAGapcloserUnit[unit.charName] and GetDistance(unit) < 1000 and spell ~= nil then
              if spell.name == (type(isAGapcloserUnit[unit.charName].spell) == 'number' and unit:GetSpellData(isAGapcloserUnit[unit.charName].spell).name or isAGapcloserUnit[unit.charName].spell) and self.Config.misc.gapClose[unit.charName] then
                if spell.target ~= nil and spell.target.name == myHero.name or isAGapcloserUnit[unit.charName].spell == 'blindmonkqtwo' then
                  CastSpell(_W, myHero.x, myHero.z)
                end
              end
            end
          end
          function Akali:autolevel()
            if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
              local levelSequence1 =   { 1,2,3,1,1,4,1,2,1,2,4,2,2,3,3,4,3,3}
              autoLevelSetSequence(levelSequence1)
              Last_LevelSpell = os.clock()
            end
            if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
              local levelSequence2 =   { 1,2,3,1,1,4,1,3,1,3,4,3,3,2,2,4,2,2}
              autoLevelSetSequence(levelSequence2)
              Last_LevelSpell = os.clock()
            end
            if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
              local levelSequence3 =  { 2,3,1,2,2,4,2,1,2,1,4,1,1,3,3,4,3,3}
              autoLevelSetSequence(levelSequence3)
              Last_LevelSpell = os.clock()
            end
            if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
              local levelSequence4 =  { 2,3,1,2,2,4,2,3,2,3,4,3,3,1,1,4,1,1}
              autoLevelSetSequence(levelSequence4)
              Last_LevelSpell = os.clock()
            end
            if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
              local levelSequence5 =  { 3,1,2,3,3,4,3,2,3,2,4,2,2,1,1,4,1,1}
              autoLevelSetSequence(levelSequence5)
              Last_LevelSpell = os.clock()
            end
            if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
              local levelSequence6 =  { 3,1,2,3,3,4,3,1,3,1,4,1,1,2,2,4,2,2}
              autoLevelSetSequence(levelSequence6)
              Last_LevelSpell = os.clock()
            end
            if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
              local levelSequence6 =  { 1,3,2,1,1,4,1,3,1,3,4,3,3,2,2,4,2,2}
              autoLevelSetSequence(levelSequence6)
              Last_LevelSpell = os.clock()
            end
          end
          function Akali:autozhonya()
            if self.Config.item.enableautozhonya then
              for _ = ITEM_1, ITEM_7 do
                if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
              end
            end
          end
        end
        function Akali:checkts()
          self.ts:update()
          self.tse:update()
          self.tsq:update()
          self.tsr:update()
          self.tsw:update()
          self.tsg:update()
          if not self.tsg.target~=nil or not self.Config.targetsel.ts then
            target = self.ts.target
          elseif self.tsg.target~=nil or self.selectedTar then
            target = self.selectedTar
          end
        end
        function Akali:combo()
          local abuff = self:buff(target)
          if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey  and self.QSpell:IsReady())then
            self:CastQ(target)
          end
          if(self.tsr.target~=nil and self.Config.combo.useR and Qbuff and  self.Config.Keys.combokey and not self.QSpell:IsReady() and self.RSpell:IsReady())then
            self:CastR(target)
          end
          if(self.tse.target~=nil and GetDistance(target)<315 and self.Config.combo.useE and  self.Config.Keys.combokey  and self.ESpell:IsReady())then
            self:CastE(target)
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
        function Akali:combo2()
          if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey  and self.QSpell:IsReady())then
            self:CastQ(target)
          end
          if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey  and not self.QSpell:IsReady() and self.RSpell:IsReady())then
            self:CastR(target)
          end
          if(self.tse.target~=nil  and self.Config.combo.useE and  self.Config.Keys.combokey  and self.ESpell:IsReady())then
            self:CastE(target)
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
        function Akali:harass()
          if(self.tsq.target~=nil and self.Config.harass.useQ and  self.Config.Keys.harasskey  and self.QSpell:IsReady())then
            self:CastQ(target)
          end
          if(self.tse.target~=nil  and self.Config.harass.useE and  self.Config.Keys.harasskey  and self.ESpell:IsReady())then
            self:CastE(target)
          end
        end
        function Akali:JungleClear()
          if(self.QSpell:IsReady() and self.Config.farm.jungleclear.useQ and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.QMana /100 ) then
            self.QSpell:JungleClear()
          end
          if(self.WSpell:IsReady() and self.Config.farm.jungleclear.useW and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.WMana /100 ) then
            self.WSpell:JungleClear()
          end
          if(self.ESpell:IsReady() and self.Config.farm.jungleclear.useE and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.EMana /100 ) then
            self.ESpell:JungleClear()
          end
          if(self.RSpell:IsReady() and self.Config.farm.jungleclear.useR and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.RMana /100 ) then
            self.RSpell:JungleClear()
          end
        end
        function Akali:LastHit()
          self.enemyMinions:update()
          if self.Config.farm.lasthit.lasthitlogic == 1 then
            for _, target in pairs(self.enemyMinions.objects) do
              local Qdamage = self:GetQDmg(target)
              if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 ) and ValidTarget(target,self.QSpell.Range)  and GetDistanceSqr(target) <= self.QSpell.Range * self.QSpell.Range and Qdamage >= target.health) then
                self:CastQ(target)
              end
              local Edamage = self:GetEDmg(target)
              if(self.ESpell:IsReady() and self.Config.farm.lasthit.useE and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.EMana /100 )and  ValidTarget(target,self.QSpell.Range) and GetDistanceSqr(target) <= self.ESpell.Range * self.ESpell.Range and Edamage >= target.health) then
                self:CastE(target)
              end
            end
          elseif self.Config.farm.lasthit.lasthitlogic == 2 then
            if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 )) then
              self.QSpell:LastHit()
            end
            if(self.ESpell:IsReady() and self.Config.farm.lasthit.useE and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.EMana /100 )) then
              self.ESpell:LastHit()
            end
          end
        end
        function Akali:LaneClear()
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
              if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.QMana /100 ) and GetDistance(minion) <= self.QSpell.Range then
                self:CastQ(cleartarget)
              end
              local NumberOfHits = self.Config.farm.laneclear.ecount
              if NumberOfHits >= 1 and #self.enemyMinions.objects >= NumberOfHits then
                if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useE and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.EMana /100 ) and GetDistance(minion) <= self.ESpell.Range then
                  self:CastE(cleartarget)
                end
              end
            end
          end
        end
        function Akali:CastQ(unit)
          self.QSpell:Cast(unit)
        end

        function Akali:CastW(unit)
          self.WSpell:Cast(unit)
        end

        function Akali:CastE(unit)
          self.ESpell:Cast(unit)
        end

        function Akali:CastR(unit)
          self.RSpell:Cast(unit)
        end
        function Akali:CastI(unit)
          self.Ignite:Cast(unit)
        end
        function Akali:autoq()
          if(self.tsq.target~=nil and self.Config.Keys.autoq and  self.QSpell:IsReady())then
            self:CastQ(target)
          end
        end
        function Akali:GetQDmg(target)
          if myHero:GetSpellData(_Q).level < 1 then
            return 0
          end
          if self.QSpell:IsReady() then
            local FinalDamage = (15 + (myHero:GetSpellData(_Q).level * 20) + (myHero.ap + (myHero.ap * myHero.apPercent) )*.4)
            return myHero:CalcMagicDamage(target, FinalDamage)
          else
            return 0
          end
        end
        function Akali:GetQ2Dmg(target)
          if myHero:GetSpellData(_Q).level < 1 then
            return 0
          end
          if self.QSpell:IsReady() then
            local FinalDamage = (20 + (myHero:GetSpellData(_Q).level * 25) + (myHero.ap + (myHero.ap * myHero.apPercent) )*.5)
            return myHero:CalcMagicDamage(target, FinalDamage)
          else
            return 0
          end
        end
        function Akali:GetEDmg(target)
          if myHero:GetSpellData(_E).level < 1 then
            return 0
          end
          if self.ESpell:IsReady() then
            local FinalDamage = (5 + (myHero:GetSpellData(_E).level * 25) + ((myHero.ap + (myHero.ap * myHero.apPercent) )* .4)+(myHero.addDamage *0.6))
            return myHero:CalcDamage(target, FinalDamage)
          else
            return 0
          end
        end
        function Akali:GetRDmg(target)
          if myHero:GetSpellData(_R).level < 1 then
            return 0
          end
          if self.RSpell:IsReady() then
            local FinalDamage = (25 + (myHero:GetSpellData(_R).level * 75) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .5)
            return myHero:CalcMagicDamage(target, FinalDamage)
          else
            return 0
          end
        end
        function Akali:GetMyDmg(target)
          if self.QSpell:IsReady() and self.RSpell:IsReady() and self.ESpell:IsReady() then
            return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target) +self:GetQ2Dmg(target)
          elseif self.QSpell:IsReady()  and self.RSpell:IsReady() then
            return self:GetQDmg(target) + self:GetRDmg(target) +self:GetQ2Dmg(target)
          elseif self.QSpell:IsReady()  and self.ESpell:IsReady() then
            return self:GetQDmg(target) + self:GetEDmg(target) +self:GetQ2Dmg(target)
          elseif self.RSpell:IsReady() and self.ESpell:IsReady() then
            return self:GetRDmg(target) +self:GetEDmg(target)
          elseif self.QSpell:IsReady() then
            return self:GetQDmg(target)
          elseif self.ESpell:IsReady() then
            return self:GetEDmg(target)
          elseif self.RSpell:IsReady() then
            return self:GetRDmg(target)
          elseif self.QSpell:IsReady() and self.RSpell:IsReady() then
            return self:GetQDmg(target) + self:GetRDmg(target)+self:GetQ2Dmg(target)
          else
            return 0
          end
        end
        function Akali:GetDraws(target)
          local Qdmg  = self:GetQDmg(target)
          local Qdmg2 =self:GetQ2Dmg(target)
          local Edmg = self:GetEDmg(target)
          local Rdmg = self:GetRDmg(target)
          local Idmg=(50+ ((myHero.level)*20))

          if Qdmg > target.health then
            return 'Q', RGBA(0, 255, 0, 255)
          elseif Qdmg+Idmg>target.health then
            return 'Q + Ignite', RGBA(0, 255, 0, 255)
          elseif Edmg>target.health then
            return 'E', RGBA(0, 255, 0, 255)
          elseif Edmg+Idmg>target.health then
            return 'E + Ignite', RGBA(0, 255, 0, 255)
          elseif Rdmg>target.health then
            return 'R', RGBA(0, 255, 0, 255)
          elseif Rdmg+Idmg>target.health then
            return 'R + Ignite', RGBA(0, 255, 0, 255)
          elseif Qdmg+Edmg>target.health then
            return 'Q + E',RGBA(0, 255, 0, 255)
          elseif Qdmg+Rdmg>target.health then
            return 'Q + R',RGBA(0, 255, 0, 255)
          elseif Qdmg+Edmg+Idmg>target.health then
            return 'Q + E + Ignite',RGBA(0, 255, 0, 255)
          elseif Qdmg+Rdmg+Idmg>target.health then
            return 'Q + R + Ignite',RGBA(0, 255, 0, 255)
          elseif Qdmg+Edmg+Rdmg+Idmg>target.health then
            return 'Q + R + E + Ignite',RGBA(0, 255, 0, 255)
          elseif Qdmg+Rdmg+Edmg >target.health then
            return 'Q + R + E',RGBA(0, 255, 0, 255)
          elseif Qdmg+Qdmg2 > target.health then
            return 'Q + Q2', RGBA(0, 255, 0, 255)
          elseif Qdmg+Idmg+Qdmg2>target.health then
            return 'Q + Q2 + Ignite', RGBA(0, 255, 0, 255)
          elseif Edmg>target.health then
            return 'E', RGBA(0, 255, 0, 255)
          elseif Edmg+Idmg>target.health then
            return 'E + Ignite', RGBA(0, 255, 0, 255)
          elseif Rdmg>target.health then
            return 'R', RGBA(0, 255, 0, 255)
          elseif Rdmg+Idmg>target.health then
            return 'R + Ignite', RGBA(0, 255, 0, 255)
          elseif Qdmg+Edmg+Qdmg2>target.health then
            return 'Q + Q2 + E',RGBA(0, 255, 0, 255)
          elseif Qdmg+Rdmg+Qdmg2>target.health then
            return 'Q + Q2 + R',RGBA(0, 255, 0, 255)
          elseif Qdmg+Edmg+Idmg+Qdmg2>target.health then
            return 'Q + Q2 + E + Ignite',RGBA(0, 255, 0, 255)
          elseif Qdmg+Rdmg+Idmg+Qdmg2>target.health then
            return 'Q + Q2 + R + Ignite',RGBA(0, 255, 0, 255)
          elseif Qdmg+Edmg+Rdmg+Idmg+Qdmg2>target.health then
            return 'Full Combo + Ignite',RGBA(0, 255, 0, 255)
          elseif Qdmg+Rdmg+Edmg+Qdmg2 >target.health then
            return 'Kill with full combo',RGBA(0, 255, 0, 255)
          else
            return "Cant Kill yet", RGBA(0, 255, 0, 255)
          end
        end
        function Akali:killsteal()
          for _, unit in pairs(GetEnemyHeroes()) do
            local health = unit.health
            local dmgE = self:GetEDmg(unit)
            if(self.tse.target ~= nil and  self.ESpell:IsReady() and health<dmgE and self.Config.killsteal.useE   and self.Config.killsteal.ks)then
              self:CastE(unit)
            end
            local dmgQ = self:GetQDmg(unit)
            if(self.tsq.target ~= nil and  self.QSpell:IsReady() and health<dmgQ and self.Config.killsteal.useQ and self.Config.killsteal.ks )then
              self:CastQ(unit)
            end
            local dmgI =(50+ ((myHero.level)*20))
            if(health<dmgI and self.Config.killsteal.useI and self.Config.killsteal.ks and GetDistance(unit)<600)then
              self:CastI(unit)
            end
            local dmgR =self:GetRDmg(unit)
            if(self.tsr.target ~= nil and  self.RSpell:IsReady() and health<dmgR and self.Config.killsteal.useR and self.Config.killsteal.ks and GetDistance(unit)<550)then
              self:CastR(unit)
            end
          end
        end
        function Akali:items()
          if self.Config.item.usebg and self.Config.Keys.combokey then
            for _ = ITEM_1, ITEM_7 do
              if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastSpell(_)
            end
          end
        end
        if self.Config.item.usehg and self.Config.Keys.combokey then
          for _ = ITEM_1, ITEM_7 do
            if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastSpell(_)
          end
        end
      end
    end
    function Akali:Autostealth()
      if self.Config.skilllogic.Wlogic.useW and self.Config.skilllogic.Wlogic.useWen then
        if self.Config.skilllogic.Wlogic.useWe == 1 then
          if CountEnemyHeroInRange(900) >= 2 then
            CastSpell(_W, myHero.x, myHero.z)
          end
        elseif self.Config.skilllogic.Wlogic.useWe == 2 then
          if CountEnemyHeroInRange(900) >= 3 then
            CastSpell(_W, myHero.x, myHero.z)
          end
        elseif self.Config.skilllogic.Wlogic.useWe == 3 then
          if CountEnemyHeroInRange(900) >= 4 then
            CastSpell(_W, myHero.x, myHero.z)
          end
        elseif self.Config.skilllogic.Wlogic.useWe == 4 then
          if CountEnemyHeroInRange(900) >= 5 then
            CastSpell(_W, myHero.x, myHero.z)
          end
        end
      end
      if self.Config.skilllogic.Wlogic.useWhp and self.Config.skilllogic.Wlogic.useW then
        if myHero.health <= (myHero.maxHealth * self.Config.skilllogic.Wlogic.hp / 100) then
          CastSpell(_W, myHero.x, myHero.z)
        end
      end
    end

    function Akali:LoadMenu()
      self.Config=scriptConfig(""..Scriptname.." [" .. myHero.charName.."]" ,"menu")

      self.Config:addSubMenu(loc_choosen[1], "combo")
      self.Config.combo:addParam("useQ", loc_choosen[2], SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useE", loc_choosen[4], SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useR", loc_choosen[5], SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useI", loc_choosen[6], SCRIPT_PARAM_ONOFF, true)
      -- self.Config.combo:addParam("userg", "Use R to Gap-Close", SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 10, 10, 100, 0)


      self.Config:addSubMenu(loc_choosen[9], "harass")
      self.Config.harass:addParam("useQ", loc_choosen[10], SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("useE", loc_choosen[11], SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 10, 10, 100, 0)

      self.Config:addSubMenu(loc_choosen[99], "skilllogic")
      self.Config.skilllogic:addSubMenu(loc_choosen[101], "Wlogic")
      self.Config.skilllogic.Wlogic:addParam("useW", loc_choosen[138], SCRIPT_PARAM_ONOFF, true)
      self.Config.skilllogic.Wlogic:addParam("useWhp", loc_choosen[137], SCRIPT_PARAM_ONOFF, false)
      self.Config.skilllogic.Wlogic:addParam("hp",loc_choosen[104],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.skilllogic.Wlogic:addParam("useWen", loc_choosen[136], SCRIPT_PARAM_ONOFF, false)
      self.Config.skilllogic.Wlogic:addParam("useWe", loc_choosen[136], SCRIPT_PARAM_LIST, 1, {loc_choosen[130], loc_choosen[131] , loc_choosen[132],loc_choosen[133] })
      self.Config.skilllogic:addSubMenu(loc_choosen[103], "Rlogic")
      self.Config.skilllogic.Rlogic:addParam("logic", loc_choosen[103], SCRIPT_PARAM_LIST, 1, {loc_choosen[134], loc_choosen[135]})

      self.Config:addSubMenu(loc_choosen[14], "farm")
      self.Config.farm:addSubMenu(loc_choosen[15],"laneclear")
      self.Config.farm.laneclear:addParam("useQ",loc_choosen[16],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.laneclear:addParam("useE",loc_choosen[18],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.laneclear:addParam("ecount",loc_choosen[182],SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
      self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.laneclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
      self.Config.farm.laneclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.farm.laneclear:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

      self.Config.farm:addSubMenu(loc_choosen[20],"jungleclear")
      self.Config.farm.jungleclear:addParam("useQ",loc_choosen[21],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.jungleclear:addParam("useW",loc_choosen[22],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.jungleclear:addParam("useE",loc_choosen[23],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.jungleclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
      self.Config.farm.jungleclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.farm.jungleclear:addParam("WMana",loc_choosen[186],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.farm.jungleclear:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

      self.Config.farm:addSubMenu(loc_choosen[25],"lasthit")
      self.Config.farm.lasthit:addParam("autolasthit",loc_choosen[189],SCRIPT_PARAM_ONOFF,false)
      self.Config.farm.lasthit:addParam("useQ",loc_choosen[26],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.lasthit:addParam("useE",loc_choosen[28],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.lasthit:addParam("lasthitlogic",loc_choosen[191], SCRIPT_PARAM_LIST, 1, {loc_choosen[172],loc_choosen[190],loc_choosen[174]})
      self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.lasthit:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
      self.Config.farm.lasthit:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.farm.lasthit:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)


      self.Config:addSubMenu(loc_choosen[35], "killsteal")
      self.Config.killsteal:addParam("ks",loc_choosen[36],SCRIPT_PARAM_ONOFF,true)
      self.Config.killsteal:addParam("useQ", loc_choosen[37], SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useE", loc_choosen[39], SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useR", loc_choosen[40], SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useI", loc_choosen[41], SCRIPT_PARAM_ONOFF, true)

      self.Config:addSubMenu(loc_choosen[30],"escape")
      self.Config.escape:addParam("useW",loc_choosen[32],SCRIPT_PARAM_ONOFF,true)

      self.Config:addSubMenu(loc_choosen[42], "item")
      self.Config.item:addSubMenu(loc_choosen[192], "autopot")
      self.Config.item.autopot:addParam("enableautopothp", loc_choosen[193], SCRIPT_PARAM_ONOFF, false)
      self.Config.item.autopot:addParam("autopothp", loc_choosen[194], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
      self.Config.item:addParam("enableautozhonya", loc_choosen[43], SCRIPT_PARAM_ONOFF, false)
      self.Config.item:addParam("autozhonya", loc_choosen[44], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
      self.Config.item:addParam("usehg", loc_choosen[45], SCRIPT_PARAM_ONOFF, false)
      self.Config.item:addParam("usebg", loc_choosen[46], SCRIPT_PARAM_ONOFF, false)

      self.Config:addSubMenu(loc_choosen[92], "misc")
      self.Config.misc:addSubMenu(loc_choosen[219], "gapClose")
      self.Config.misc.gapClose:addParam("w", loc_choosen[220], SCRIPT_PARAM_ONOFF, true)
      self.Config.misc.gapClose:addParam("info3", loc_choosen[98], SCRIPT_PARAM_INFO,"")
      for _, enemy in pairs(GetEnemyHeroes()) do
        if isAGapcloserUnit[enemy.charName] ~= nil then
          self.Config.misc.gapClose:addParam(enemy.charName, enemy.charName .. " - " .. enemy:GetSpellData(isAGapcloserUnit[enemy.charName].spell).name, SCRIPT_PARAM_ONOFF, true)
        end
      end
      Clock = os.clock()
      if VIP_USER then
        self.Config:addSubMenu(loc_choosen[47], "vip")
        self.Config.vip:addParam("packet",loc_choosen[48],SCRIPT_PARAM_ONOFF,false)
        self.Config.vip:addParam("info1", "", SCRIPT_PARAM_INFO,"")
        self.Config.vip:addParam("info2", loc_choosen[49], SCRIPT_PARAM_INFO,"")
        self.Config.vip:addSubMenu(loc_choosen[50], "level")
        self.Config.vip.level:addParam("key",loc_choosen[51],SCRIPT_PARAM_ONOFF,false)
        self.Config.vip.level:addParam("logic", loc_choosen[52], SCRIPT_PARAM_LIST, 7, {loc_choosen[58], loc_choosen[59],loc_choosen[60],loc_choosen[61],loc_choosen[62], loc_choosen[63], loc_choosen[64]  })
        self.Config.vip:addSubMenu(loc_choosen[53], "skin")
        self.Config.vip.skin:addParam("key",loc_choosen[54],SCRIPT_PARAM_ONOFF,false)
        self.Config.vip.skin:addParam('selected' .. myHero.charName .. 'Skin', loc_choosen[57], SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
        self.Config.vip.skin:addParam("info5", loc_choosen[55], SCRIPT_PARAM_INFO,"")
        --self.Config.vip:addParam("info5", "Skin Hack temporary disabled until next update. .", SCRIPT_PARAM_INFO,"")
        self.Config.vip:addSubMenu(loc_choosen[195], "antiafk")
        self.Config.vip.antiafk:addParam("antiafk",loc_choosen[196],SCRIPT_PARAM_ONOFF,false)
        self.Config.vip:addParam("info3", "", SCRIPT_PARAM_INFO,"")
        self.Config.vip:addParam("info4", loc_choosen[56], SCRIPT_PARAM_INFO,"")
      end
      self.Config:addSubMenu(loc_choosen[65],"other")
      --self.Config.other:addSubMenu("Show Damage On Hp Bar", "HPBAR")
      --self.Config.other.HPBAR:addParam("key","ON/OFF",SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addSubMenu(loc_choosen[66], "draw")
      self.Config.other.draw:addParam("qdraw",loc_choosen[67],SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("wdraw",loc_choosen[68],SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("edraw",loc_choosen[69],SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("rdraw",loc_choosen[70],SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("aadraw",loc_choosen[71],SCRIPT_PARAM_ONOFF,false)
      self.Config.other.draw:addParam("rtdraw",loc_choosen[225],SCRIPT_PARAM_ONOFF,false)
      self.Config.other:addSubMenu(loc_choosen[198], "color")
      self.Config.other.color:addParam("Qcolor", loc_choosen[199], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("Wcolor", loc_choosen[200], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("Ecolor", loc_choosen[201], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("Rcolor", loc_choosen[202], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("E2color", loc_choosen[226], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("AAcolor", loc_choosen[204], SCRIPT_PARAM_COLOR,{255, 255,0,0})
      self.Config.other.color:addParam("targetselect", loc_choosen[205], SCRIPT_PARAM_COLOR,{255, 255,0,0})
      self.Config.other:addSubMenu(loc_choosen[206], "width")
      self.Config.other.width:addParam("Qwidth", loc_choosen[210], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("Wwidth", loc_choosen[211], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("Ewidth", loc_choosen[212], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("Rwidth", loc_choosen[213], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("E2width", loc_choosen[227], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("AAwidth", loc_choosen[209], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("STwidth", loc_choosen[208], 4, 6, 1, 10, 0)
      self.Config.other:addSubMenu(loc_choosen[73], "perma")
      self.Config.other.perma:addParam("perma",loc_choosen[74],SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addParam("target",loc_choosen[75],SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addParam("damage",loc_choosen[214],SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addParam("targetcal",loc_choosen[76],SCRIPT_PARAM_ONOFF,true)

      self.Config:addSubMenu(loc_choosen[77],"targetsel")
      self.Config.targetsel:addParam("infoK2", "", SCRIPT_PARAM_INFO,"")
      self.Config.targetsel:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
      self.Config.targetsel:addParam("ts",loc_choosen[78],SCRIPT_PARAM_ONOFF,false)
      self.ts.name  = "Akali"
      self.Config.targetsel:addTS(self.ts)

      self.Config:addSubMenu(loc_choosen[79], "Keys")
      self.Config.Keys:addParam("infoK3",loc_choosen[80], SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("combokey",loc_choosen[81], SCRIPT_PARAM_ONKEYDOWN, false, 32)
      self.Config.Keys:addParam("infoK4", loc_choosen[82], SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("harasskey", loc_choosen[83], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
      self.Config.Keys:addParam("autoq", loc_choosen[91], SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
      self.Config.Keys:addParam("infoK5", loc_choosen[84], SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("laneclearkey", loc_choosen[85], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
      self.Config.Keys:addParam("jungleclearkey", loc_choosen[86], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
      self.Config.Keys:addParam("lasthitkey",loc_choosen[215], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
      self.Config.Keys:addParam("infoK6", loc_choosen[87], SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("escapekey", loc_choosen[88], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Y"))
      --self.Config.Keys:addParam("lasthitkey", "Lasthit Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
      self.Config.Keys:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("infoK2", loc_choosen[89], SCRIPT_PARAM_INFO,"")
      self.Config:addSubMenu(loc_choosen[110], "Keys2")

      OrbwalkManager:LoadCommonKeys(self.Config.Keys2)
      self.Config:addParam("lang", loc_choosen[165], SCRIPT_PARAM_LIST, 1, {loc_choosen[166], loc_choosen[167],loc_choosen[168]})
      self.Config:addParam("instruct", loc_choosen[216], SCRIPT_PARAM_ONOFF, false)

      if self.Config.other.perma.perma then
        DelayAction(function() self.Config:permaShow("infobox") end, 1)
        DelayAction(function() self.Config.Keys:permaShow("combokey") end, 1.2)
        DelayAction(function() self.Config.Keys:permaShow("harasskey") end, 1.2)
        DelayAction(function() self.Config.Keys:permaShow("autoq") end, 1.2)
      end
    end
    function Akali:autopot()
      if os.clock() - lastPotion < 15 then return end
      for SLOT = ITEM_1, ITEM_6 do
        if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp then
          if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp /100 )  then
            CastSpell(SLOT)
            lastPotion = os.clock()
          end
        end
      end
    end
    function Akali:rgap()
    end
    function Akali:Antiafk()
      if os.clock() < Clock or not self.Config.vip.antiafk.antiafk then return end
      Clock = os.clock() + math.random(60,120)
      myHero:MoveTo(myHero.x, myHero.z)
    end
    function Akali:WndMsg(Msg, Key)
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
      if Msg == WM_LBUTTONDOWN then
        if PopUp1 then
          PopUp1 = false
        end
      end
    end
    function Akali:Unload()
      self:writecfg()
    end
    ---//==================================================\\---
    --|| > Lissandra Starts                            ||--
    ---\\==================================================//---
    class "Lissandra"
    function Lissandra:__init()
      self.ts= TargetSelector(TARGET_LESS_CAST_PRIORITY, 1100, DAMAGE_PHYSICAL, false, true)
      self.tsq= TargetSelector(TARGET_LESS_CAST_PRIORITY, 725, DAMAGE_PHYSICAL, false, true)
      self.tsw= TargetSelector(TARGET_LESS_CAST_PRIORITY, 450, DAMAGE_MAGIC, false, true)
      self.tse= TargetSelector(TARGET_LESS_CAST_PRIORITY, 1050, DAMAGE_MAGIC, false, true)
      self.tsr= TargetSelector(TARGET_LESS_CAST_PRIORITY, 550, DAMAGE_MAGIC, false, true)
      self.tsg= TargetSelector(TARGET_LESS_CAST_PRIORITY, 1200, DAMAGE_MAGIC, false, true)
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
      pred = VPrediction()
      Last_LevelSpell = 0
      self:findorbwalker()
      spells = {}
      spells.q = { rangeMax = 925}
      AddTickCallback(function() self:Tick() end)
      AddUnloadCallback(function() self:Unload() end )
      AddDrawCallback(function() self:Draw() end)
      AddMsgCallback(function(msg,Key) self:WndMsg(msg,Key) end)
      --AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
      AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
      --AddApplyBuffCallback(function(source, unit, buff) self:OnApplyBuff(source, unit, buff) end)
      --AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
      --AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end)
    end
    function Lissandra:Tick()
      self:autozhonya()
      self:autopot()
      if VIP_USER then   self:Antiafk()  end
      self:items()
      if VIP_USER then self:autolevel() end
      if VIP_USER then self:skinhack() end
      self:autoR()
      self:autoq()
      self:checkts()
      if(self.Config.Keys.combokey )then
        self:combo()
      end
      if self.Config.instruct then
        self.Config.instruct = false
        PopUp1 = true
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
      if(self.Config.Keys.lasthitkey or self.Config.farm.lasthit.autolasthit )then
        self:LastHit()
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
    function Lissandra:checkts()
      self.ts:update()
      self.tse:update()
      self.tsq:update()
      self.tsr:update()
      self.tsw:update()
      self.tsg:update()
      if not self.tsg.target~=nil or not self.Config.targetsel.ts then
        target = self.ts.target
      elseif self.tsg.target~=nil or self.selectedTar then
        target = self.selectedTar
      end
    end
    function Lissandra:LoadMenu()
      self.Config=scriptConfig(""..Scriptname.." [" .. myHero.charName.."]" ,"menu")

      self.Config:addSubMenu(loc_choosen[1], "combo")
      self.Config.combo:addParam("useQ", loc_choosen[2], SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useW", loc_choosen[3], SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useE", loc_choosen[4], SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useR", loc_choosen[5], SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("useI", loc_choosen[6], SCRIPT_PARAM_ONOFF, true)
      self.Config.combo:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 10, 10, 100, 0)

      self.Config:addSubMenu(loc_choosen[9], "harass")
      self.Config.harass:addParam("useQ", loc_choosen[10], SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("useW", loc_choosen[11], SCRIPT_PARAM_ONOFF, true)
      self.Config.harass:addParam("useE", loc_choosen[12], SCRIPT_PARAM_ONOFF, false)
      self.Config.harass:addParam("autoq", loc_choosen[91], SCRIPT_PARAM_ONOFF, false)
      self.Config.harass:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

      self.Config:addSubMenu(loc_choosen[99], "skilllogic")
      self.Config.skilllogic:addSubMenu(loc_choosen[102], "Elogic")
      self.Config.skilllogic.Elogic:addParam("combo", loc_choosen[143], SCRIPT_PARAM_LIST, 2, {loc_choosen[145], loc_choosen[146] })
      self.Config.skilllogic.Elogic:addParam("harass", loc_choosen[144], SCRIPT_PARAM_LIST, 1, {loc_choosen[146], loc_choosen[145] })
      self.Config.skilllogic.Elogic:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.skilllogic.Elogic:addParam("infoE", loc_choosen[154], SCRIPT_PARAM_INFO,"")
      self.Config.skilllogic:addSubMenu(loc_choosen[103], "Rlogic")
      self.Config.skilllogic.Rlogic:addParam("Rlogic", loc_choosen[155], SCRIPT_PARAM_LIST, 1, {loc_choosen[149], loc_choosen[150], loc_choosen[151] })
      self.Config.skilllogic.Rlogic:addParam("enableautoR", loc_choosen[152], SCRIPT_PARAM_ONOFF, true)
      self.Config.skilllogic.Rlogic:addParam("autoR", loc_choosen[153], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
      self.Config.skilllogic.Rlogic:addParam("infoR2", "", SCRIPT_PARAM_INFO,"")
      self.Config.skilllogic.Rlogic:addParam("infoR", loc_choosen[156], SCRIPT_PARAM_INFO,"")

      self.Config:addSubMenu(loc_choosen[30],"escape")
      self.Config.escape:addParam("useW",loc_choosen[31],SCRIPT_PARAM_ONOFF,true)
      self.Config.escape:addParam("useE",loc_choosen[32],SCRIPT_PARAM_ONOFF,true)

      self.Config:addSubMenu(loc_choosen[14], "farm")

      self.Config.farm:addSubMenu(loc_choosen[15],"laneclear")
      self.Config.farm.laneclear:addParam("useQ",loc_choosen[16],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.laneclear:addParam("qcount",loc_choosen[180],SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
      self.Config.farm.laneclear:addParam("useW",loc_choosen[17],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.laneclear:addParam("wcount",loc_choosen[181],SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
      self.Config.farm.laneclear:addParam("useE",loc_choosen[18],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.laneclear:addParam("ecount",loc_choosen[182],SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
      self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.laneclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
      self.Config.farm.laneclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.farm.laneclear:addParam("WMana",loc_choosen[186],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.farm.laneclear:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

      self.Config.farm:addSubMenu(loc_choosen[20],"jungleclear")
      self.Config.farm.jungleclear:addParam("useQ",loc_choosen[21],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.jungleclear:addParam("useW",loc_choosen[22],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.jungleclear:addParam("useE",loc_choosen[23],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.jungleclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
      self.Config.farm.jungleclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.farm.jungleclear:addParam("WMana",loc_choosen[186],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.farm.jungleclear:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

      self.Config.farm:addSubMenu(loc_choosen[25],"lasthit")
      self.Config.farm.lasthit:addParam("autolasthit",loc_choosen[189],SCRIPT_PARAM_ONOFF,false)
      self.Config.farm.lasthit:addParam("useQ",loc_choosen[26],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.lasthit:addParam("useW",loc_choosen[27],SCRIPT_PARAM_ONOFF,true)
      self.Config.farm.lasthit:addParam("lasthitlogic",loc_choosen[191], SCRIPT_PARAM_LIST, 1, {loc_choosen[172],loc_choosen[190],loc_choosen[174]})
      self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
      self.Config.farm.lasthit:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
      self.Config.farm.lasthit:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
      self.Config.farm.lasthit:addParam("WMana",loc_choosen[186],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)


      self.Config:addSubMenu(loc_choosen[35], "killsteal")
      self.Config.killsteal:addParam("ks",loc_choosen[36],SCRIPT_PARAM_ONOFF,true)
      self.Config.killsteal:addParam("useQ", loc_choosen[37], SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useE", loc_choosen[39], SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useR", loc_choosen[40], SCRIPT_PARAM_ONOFF, true)
      self.Config.killsteal:addParam("useI", loc_choosen[41], SCRIPT_PARAM_ONOFF, true)

      self.Config:addSubMenu(loc_choosen[42], "item")
      self.Config.item:addSubMenu(loc_choosen[192], "autopot")
      self.Config.item.autopot:addParam("enableautopothp", loc_choosen[193], SCRIPT_PARAM_ONOFF, false)
      self.Config.item.autopot:addParam("autopothp", loc_choosen[194], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
      self.Config.item:addParam("enableautozhonya", loc_choosen[43], SCRIPT_PARAM_ONOFF, false)
      self.Config.item:addParam("autozhonya", loc_choosen[44], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
      self.Config.item:addParam("usehg", loc_choosen[45], SCRIPT_PARAM_ONOFF, false)
      self.Config.item:addParam("usebg", loc_choosen[46], SCRIPT_PARAM_ONOFF, false)

      self.Config:addSubMenu(loc_choosen[92], "misc")
      self.Config.misc:addSubMenu(loc_choosen[93], "interrupt")
      self.Config.misc.interrupt:addParam("r", loc_choosen[97], SCRIPT_PARAM_ONOFF, true)
      self.Config.misc.interrupt:addParam("info3", loc_choosen[98], SCRIPT_PARAM_INFO,"")
      for i, a in pairs(GetEnemyHeroes()) do
        if Interrupt[a.charName] ~= nil then
          for i, spell in pairs(Interrupt[a.charName].stop) do
            self.Config.misc.interrupt:addParam(spell.spellName, a.charName.." - "..spell.name, SCRIPT_PARAM_ONOFF, true)
          end
        end

      end
      self.Config.misc:addSubMenu(loc_choosen[219], "gapClose")
      self.Config.misc.gapClose:addParam("w", loc_choosen[220], SCRIPT_PARAM_ONOFF, true)
      self.Config.misc.gapClose:addParam("delay", loc_choosen[221], SCRIPT_PARAM_SLICE, 0, 0, 1000, 0)
      self.Config.misc.gapClose:addParam("info3", loc_choosen[98], SCRIPT_PARAM_INFO,"")
      for _, enemy in pairs(GetEnemyHeroes()) do
        if isAGapcloserUnit[enemy.charName] ~= nil then
          self.Config.misc.gapClose:addParam(enemy.charName, enemy.charName .. " - " .. enemy:GetSpellData(isAGapcloserUnit[enemy.charName].spell).name, SCRIPT_PARAM_ONOFF, true)
        end
      end
      self.Config.misc:addSubMenu(loc_choosen[222], "autow")
      self.Config.misc.autow:addParam("use", loc_choosen[223], SCRIPT_PARAM_ONOFF, true)
      self.Config.misc.autow:addParam("enemycount", loc_choosen[224], SCRIPT_PARAM_LIST, 1, {loc_choosen[130], loc_choosen[131] , loc_choosen[132],loc_choosen[133] })

      Clock = os.clock()
      if VIP_USER then
        self.Config:addSubMenu(loc_choosen[47], "vip")
        self.Config.vip:addParam("packet",loc_choosen[48],SCRIPT_PARAM_ONOFF,false)
        self.Config.vip:addParam("info1", "", SCRIPT_PARAM_INFO,"")
        self.Config.vip:addParam("info2", loc_choosen[49], SCRIPT_PARAM_INFO,"")
        self.Config.vip:addSubMenu(loc_choosen[50], "level")
        self.Config.vip.level:addParam("key",loc_choosen[51],SCRIPT_PARAM_ONOFF,false)
        self.Config.vip.level:addParam("logic", loc_choosen[52], SCRIPT_PARAM_LIST, 7, {loc_choosen[58], loc_choosen[59],loc_choosen[60],loc_choosen[61],loc_choosen[62], loc_choosen[63], loc_choosen[64]  })
        self.Config.vip:addSubMenu(loc_choosen[53], "skin")
        self.Config.vip.skin:addParam("key",loc_choosen[54],SCRIPT_PARAM_ONOFF,false)
        self.Config.vip.skin:addParam('selected' .. myHero.charName .. 'Skin', loc_choosen[57], SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
        self.Config.vip.skin:addParam("info5", loc_choosen[55], SCRIPT_PARAM_INFO,"")
        --self.Config.vip:addParam("info5", "Skin Hack temporary disabled until next update. .", SCRIPT_PARAM_INFO,"")
        self.Config.vip:addSubMenu(loc_choosen[195], "antiafk")
        self.Config.vip.antiafk:addParam("antiafk",loc_choosen[196],SCRIPT_PARAM_ONOFF,false)
        self.Config.vip:addParam("info3", "", SCRIPT_PARAM_INFO,"")
        self.Config.vip:addParam("info4", loc_choosen[56], SCRIPT_PARAM_INFO,"")
      end

      self.Config:addSubMenu(loc_choosen[65],"other")
      --self.Config.other:addSubMenu("Show Damage On Hp Bar", "HPBAR")
      --self.Config.other.HPBAR:addParam("key","ON/OFF",SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addSubMenu(loc_choosen[66], "draw")
      self.Config.other.draw:addParam("qdraw",loc_choosen[67],SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("wdraw",loc_choosen[68],SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("edraw",loc_choosen[69],SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("rdraw",loc_choosen[70],SCRIPT_PARAM_ONOFF,true)
      self.Config.other.draw:addParam("aadraw",loc_choosen[71],SCRIPT_PARAM_ONOFF,false)
      self.Config.other:addSubMenu(loc_choosen[198], "color")
      self.Config.other.color:addParam("Qcolor", loc_choosen[199], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("Wcolor", loc_choosen[200], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("Ecolor", loc_choosen[201], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("Rcolor", loc_choosen[202], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("E2color", loc_choosen[203], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
      self.Config.other.color:addParam("AAcolor", loc_choosen[204], SCRIPT_PARAM_COLOR,{255, 255,0,0})
      self.Config.other.color:addParam("targetselect", loc_choosen[205], SCRIPT_PARAM_COLOR,{255, 255,0,0})
      self.Config.other:addSubMenu(loc_choosen[206], "width")
      self.Config.other.width:addParam("Qwidth", loc_choosen[210], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("Wwidth", loc_choosen[211], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("Ewidth", loc_choosen[212], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("Rwidth", loc_choosen[213], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("AAwidth", loc_choosen[209], 4, 2, 1, 10, 0)
      self.Config.other.width:addParam("STwidth", loc_choosen[208], 4, 6, 1, 10, 0)
      self.Config.other:addSubMenu(loc_choosen[73], "perma")
      self.Config.other.perma:addParam("perma",loc_choosen[74],SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addParam("target",loc_choosen[75],SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addParam("damage",loc_choosen[214],SCRIPT_PARAM_ONOFF,true)
      self.Config.other:addParam("targetcal",loc_choosen[76],SCRIPT_PARAM_ONOFF,true)

      self.Config:addSubMenu(loc_choosen[77],"targetsel")
      self.ts.name  = "Lissandra "
      self.tsq.name = "Lissandra Q Skill"
      self.tsw.name = "Lissandra W Skill"
      self.tse.name = "Lissandra E Skill"
      self.tsr.name = "Lissandra R Skill"
      self.Config.targetsel:addTS(self.ts)
      self.Config.targetsel:addTS(self.tsq)
      self.Config.targetsel:addTS(self.tsw)
      self.Config.targetsel:addTS(self.tse)
      self.Config.targetsel:addTS(self.tsr)

      self.Config:addSubMenu(loc_choosen[79], "Keys")
      self.Config.Keys:addParam("infoK3", loc_choosen[80], SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("combokey", loc_choosen[81], SCRIPT_PARAM_ONKEYDOWN, false, 32)
      self.Config.Keys:addParam("combokeyr", loc_choosen[170], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("U"))
      self.Config.Keys:addParam("infoK4", loc_choosen[82], SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("harasskey", loc_choosen[83], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
      self.Config.Keys:addParam("harasstoglekey", loc_choosen[164], SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
      self.Config.Keys:addParam("infoK5", loc_choosen[84], SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("laneclearkey", loc_choosen[85], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
      self.Config.Keys:addParam("jungleclearkey", loc_choosen[86], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
      self.Config.Keys:addParam("lasthitkey",loc_choosen[215], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
      --self.Config.Keys:addParam("lasthitkey", "Lasthit Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
      self.Config.Keys:addParam("infoK6", loc_choosen[87], SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("escapekey", loc_choosen[88], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Y"))
      self.Config.Keys:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
      self.Config.Keys:addParam("infoK2", loc_choosen[89], SCRIPT_PARAM_INFO,"")

      self.Config:addSubMenu(loc_choosen[110], "Keys2")
      OrbwalkManager:LoadCommonKeys(self.Config.Keys2)
      self.Config:addParam("lang", loc_choosen[165], SCRIPT_PARAM_LIST, 1, {loc_choosen[166], loc_choosen[167],loc_choosen[168]})
      self.Config:addParam("instruct", loc_choosen[216], SCRIPT_PARAM_ONOFF, false)

      if self.Config.other.perma.perma then
        DelayAction(function() self.Config:permaShow("infobox") end, 1)
        DelayAction(function()  self.Config.Keys:permaShow("combokey") end, 1.2)
        DelayAction(function()  self.Config.Keys:permaShow("harasstoglekey") end, 1.2)
        DelayAction(function() self.Config.Keys:permaShow("harasskey") end, 1.2)

      end
    end

    function Lissandra:autopot()
      if os.clock() - lastPotion < 15 then return end
      for SLOT = ITEM_1, ITEM_6 do
        if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp then
          if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp /100 )  then
            CastSpell(SLOT)
            lastPotion = os.clock()
          end
        end
      end
    end
    function Lissandra:items()
      if self.Config.item.usebg and self.Config.combo.combokey then
        for _ = ITEM_1, ITEM_7 do
          if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastSpell(_)
        end
      end
    end
    if self.Config.item.usehg and self.Config.combo.combokey then
      for _ = ITEM_1, ITEM_7 do
        if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastSpell(_)
      end
    end
  end
end
function Lissandra:skinhack()
  if not skinload then
    if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
      lastTimeTickCalled = CurrentTimeInMillis()
      if self.Config.vip.skin.key and self.Config.vip.packet  then
        if self.Config.vip.skin['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
          lastSkin = self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']
          SendSkinPacket(myHero.charName, skinsPB[self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']], myHero.networkID);
        end
      end
    end
  end
end
function Lissandra:writecfg(param)
  local file = io.open(SCRIPT_PATH.."\\".."config.cfg", "w")
  if not file then
    -- print("Error in Write CFG")
  end
  if param ~= "ftc" then
    file:write(ava_languages[self.Config.lang])
    -- print("Written: "..ava_languages[self.Config.lang])
  else
    file:write("eng")
    -- print("W: English")
  end
  file:close()
end
function Lissandra:autolevel()
  if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence1 =   { 1,2,3,1,1,4,1,2,1,2,4,2,2,3,3,4,3,3}
    autoLevelSetSequence(levelSequence1)
    Last_LevelSpell = os.clock()
  end
  if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence2 =   { 1,2,3,1,1,4,1,3,1,3,4,3,3,2,2,4,2,2}
    autoLevelSetSequence(levelSequence2)
    Last_LevelSpell = os.clock()
  end
  if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence3 =  { 2,3,1,2,2,4,2,1,2,1,4,1,1,3,3,4,3,3}
    autoLevelSetSequence(levelSequence3)
    Last_LevelSpell = os.clock()
  end
  if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence4 =  { 2,3,1,2,2,4,2,3,2,3,4,3,3,1,1,4,1,1}
    autoLevelSetSequence(levelSequence4)
    Last_LevelSpell = os.clock()
  end
  if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence5 =  { 3,1,2,3,3,4,3,2,3,2,4,2,2,1,1,4,1,1}
    autoLevelSetSequence(levelSequence5)
    Last_LevelSpell = os.clock()
  end
  if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence6 =  { 3,1,2,3,3,4,3,1,3,1,4,1,1,2,2,4,2,2}
    autoLevelSetSequence(levelSequence6)
    Last_LevelSpell = os.clock()
  end
  if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence6 =  { 1,3,2,1,1,4,1,2,1,2,4,2,2,3,3,4,3,3}
    autoLevelSetSequence(levelSequence6)
    Last_LevelSpell = os.clock()
  end
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
self:CastQ(target)
end
self.tse:update()
if(self.ESpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tse.target~=nil and self.Config.combo.useE and self.Config.Keys.combokeyr )then
local Ticker = GetTickCount()
if (global_ticks + 2000) < Ticker then
  if (myHero:CanUseSpell(_E) == READY ) then
    CastSpell(_E, target.x, target.z)
    global_ticks = Ticker
    DelayAction(function() CastSpell(_E) end, 1.5)
  end
end
end
self.tsw:update()
if(self.WSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokeyr  )then
self:CastW(target)
end
self.tsr:update()
if(self.RSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokeyr )then
self:CastR(target)
end
end
function Lissandra:Antiafk()
if os.clock() < Clock or not self.Config.vip.antiafk.antiafk then return end
Clock = os.clock() + math.random(60,120)
myHero:MoveTo(myHero.x, myHero.z)
end
function Lissandra:Draw()
if self.Config.other.draw.qdraw and self.QSpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 725,  self.Config.other.width.Qwidth,ARGB(table.unpack(self.Config.other.color.Qcolor)))
end

if self.Config.other.draw.wdraw and self.WSpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 450,  self.Config.other.width.Wwidth, ARGB(table.unpack(self.Config.other.color.Wcolor)))
end

if self.Config.other.draw.edraw and self.ESpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 1050,  self.Config.other.width.Ewidth, ARGB(table.unpack(self.Config.other.color.Ecolor)))
end

if self.Config.other.draw.rdraw and self.RSpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 550, self.Config.other.width.Rwidth, ARGB(table.unpack(self.Config.other.color.Rcolor)))
end
if self.Config.other.draw.aadraw then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 550, self.Config.other.width.AAwidth, ARGB(table.unpack(self.Config.other.color.AAcolor)))
end
if self.Config.other.target and self.selectedTar ~= nil then
DrawCircle3D(self.selectedTar.x, self.selectedTar.y, self.selectedTar.z, 80, self.Config.other.width.STwidth, ARGB(table.unpack(self.Config.other.color.targetselect)))
end
for _, target in pairs(GetEnemyHeroes()) do
if ValidTarget(target, 15000) then
  if target.visible and not target.dead and self.Config.other.damage then
    currLine = 1
    DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
    DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
    currLine = currLine + 1
  end
end
end
if self.Config.other.targetcal and not myHero.dead then
if target and target ~= nil then
  local drawpos=WorldToScreen(D3DXVECTOR3(target.x, target.y, target.z))
  local comboText,color = self:GetDraws(target)
  if comboText then
    DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
  end
end
end
if PopUp1 then
local w, h1, h2 = (WINDOW_W*0.50), (WINDOW_H*.15), (WINDOW_H*.9)
DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
DrawLine(w, h1, w, h2/2, w/1.8, ARGB(150, 235, 183, 63))
DrawTextA(tostring("Welcome to KeyboardMaster Series 3.0"), WINDOW_H*.028, (WINDOW_W/2), (WINDOW_H*.18), ARGB(255, 96, 48, 0),"center","center")
DrawTextA(tostring("Little informatation about KeyboardMaster Series"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.194), ARGB(255, 96, 48, 0))
DrawTextA(tostring("Its a bundle that produced by ensuluyn"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.210), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Currently it supported only mid champs "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.225), ARGB(255, 255, 255, 255))
DrawTextA(tostring("I focus Quality rather than Quantity"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.240), ARGB(255, 255, 255, 255))
DrawTextA(tostring("I need your feedbacks to improve it"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.255), ARGB(255, 255, 255, 255))
DrawTextA(tostring("I care every single feedback and try to add everything"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.270), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Hope you are enjoy my script.."), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.285), ARGB(255, 255, 255, 255))
DrawTextA(tostring("You can change every settings to your like :)"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.300), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Did you like my script > Upvote me on scriptstatus and on forum"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.315), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Don't forget these are VIP;"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.330), ARGB(255, 96, 48, 0))
DrawTextA(tostring("  Anti-Afk"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.345), ARGB(255, 255, 255, 255))
DrawTextA(tostring("  Auto Leveler "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.360), ARGB(255, 255, 255, 255))
DrawTextA(tostring("  Skin Changer "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.375), ARGB(255, 255, 255, 255))
local w, h1, h2 = (WINDOW_W*0.49), (WINDOW_H*.70), (WINDOW_H*.75)
DrawLine(w, h1/1.775, w, h2/1.68, w*.11, ARGB(255, 0, 0, 0))
DrawRectangleButton(WINDOW_W*0.467, WINDOW_H/2.375, WINDOW_W*.047, WINDOW_H*.041, ARGB(255, 255, 255, 255))
DrawTextA(tostring("OK"), WINDOW_H*.02, (WINDOW_W/2)*.98, (WINDOW_H/2.375), ARGB(255, 0, 0, 0 ),"center","center")
DrawTextA(tostring("                                                                                               Credits"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.395), ARGB(255, 96, 48, 0))
DrawTextA(tostring("                                                                              Furry- For this awesome popup"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.410), ARGB(255, 255, 255, 255))
end
end
function Lissandra:combo()
self.tsq:update()
if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tsq.target~=nil  and self.Config.combo.useQ and self.Config.Keys.combokey  )then
self:CastQ(target)
end
self.tse:update()
if(self.Config.skilllogic.Elogic.combo == 1 and  (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.Config.combo.useE and self.Config.Keys.combokey  )then
local Ticker = GetTickCount()
if (global_ticks + 2000) < Ticker then
  if (myHero:CanUseSpell(_E) == READY and self.tse.target~=nil) then
    CastSpell(_E, target.x, target.z)
    global_ticks = Ticker
    DelayAction(function() CastSpell(_E) end, 1.5)
  end
end
end
if(self.Config.skilllogic.Elogic.combo == 2 and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.Config.combo.useE and self.Config.Keys.combokey  )then
local Ticker = GetTickCount()
if (global_ticks + 2000) < Ticker then
  if (myHero:CanUseSpell(_E) == READY and self.tse.target~=nil) then
    CastSpell(_E, target.x, target.z)
    global_ticks = Ticker
    DelayAction(function() CastSpell(_E) end, 2)
  end
end
end
self.tsw:update()
if(self.WSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.tsw.target~=nil and self.Config.combo.useW and  self.Config.Keys.combokey   )then
self:CastW(target)
end
if(self.Config.skilllogic.Rlogic.Rlogic == 3 or self.Config.skilllogic.Rlogic.Rlogic == 1 and self.RSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.Config.combo.useR and self.Config.Keys.combokey  )then
for _, unit in pairs(GetEnemyHeroes()) do
  local dmgR =getDmg("R",unit,myHero)+ ((myHero.ap)*0.70)
  local health=unit.health
  if(health<dmgR and self.Config.combo.useR and GetDistance(unit)<550)then
    self:CastR(target)
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
function Lissandra:autow()
if self.Config.misc.autow.use then
if self.Config.misc.autow.enemycount == 1 then
  if CountEnemyHeroInRange(435) >= 2 then
    CastSpell(_W, myHero.x, myHero.z)
  end
elseif self.Config.misc.autow.enemycount == 2 then
  if CountEnemyHeroInRange(435) >= 3 then
    CastSpell(_W, myHero.x, myHero.z)
  end
elseif self.Config.misc.autow.enemycount == 3 then
  if CountEnemyHeroInRange(435) >= 4 then
    CastSpell(_W, myHero.x, myHero.z)
  end
elseif self.Config.misc.autow.enemycount == 4 then
  if CountEnemyHeroInRange(435) >= 5 then
    CastSpell(_W, myHero.x, myHero.z)
  end
end
end
end

function Lissandra:ProcessSpell(unit, spell)
if Interrupt[unit.charName] ~= nil then
spell = Interrupt[unit.charName].stop[spell.name]
if spell ~= nil then
  if self.Config.misc.interrupt[spell.name] then
    if ValidTarget(unit) and GetDistance(unit) < self.RSpell.Range  and self.RSpell:IsReady()  and self.Config.misc.interrupt.r then
      self:CastR(unit)
    end
  end
end
end
if unit.type == myHero.type and unit.team ~= myHero.team and isAGapcloserUnit[unit.charName] and GetDistance(unit) < 1000 and spell ~= nil then
if spell.name == (type(isAGapcloserUnit[unit.charName].spell) == 'number' and unit:GetSpellData(isAGapcloserUnit[unit.charName].spell).name or isAGapcloserUnit[unit.charName].spell) and self.Config.misc.gapClose[unit.charName] then
  if spell.target ~= nil and spell.target.name == myHero.name or isAGapcloserUnit[unit.charName].spell == 'blindmonkqtwo' then
    DelayAction(function() CastSpell(_W, unit.x, unit.z)end ,self.Config.misc.gapClose.delay/1000)
  end
end
end
end
function Lissandra:GetQDmg(target)
if myHero:GetSpellData(_Q).level < 1 then
return 0
end
if self.QSpell:IsReady() then
local FinalDamage = (40 + (myHero:GetSpellData(_Q).level * 30) + (myHero.ap + (myHero.ap * myHero.apPercent) )*.65)
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Lissandra:GetWDmg(target)
if myHero:GetSpellData(_W).level < 1 then
return 0
end
if self.WSpell:IsReady() then
local FinalDamage = (30 + (myHero:GetSpellData(_W).level * 40) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .4)
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Lissandra:GetEDmg(target)
if myHero:GetSpellData(_E).level < 1 then
return 0
end
if self.ESpell:IsReady() then
local FinalDamage = (25 + (myHero:GetSpellData(_E).level * 45) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .6)
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Lissandra:GetRDmg(target)
if myHero:GetSpellData(_R).level < 1 then
return 0
end
if self.RSpell:IsReady() then
local FinalDamage = (50 + (myHero:GetSpellData(_R).level * 100) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .7)
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Lissandra:GetMyDmg(target)
if self.QSpell:IsReady() and self.WSpell:IsReady() and self.RSpell:IsReady() and self.ESpell:IsReady() then
return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
elseif self.QSpell:IsReady() and self.WSpell:IsReady() and self.RSpell:IsReady() then
return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target)
elseif self.QSpell:IsReady() and self.WSpell:IsReady() and self.ESpell:IsReady() then
return self:GetQDmg(target) + self:GetWDmg(target) + self:GetEDmg(target)
elseif self.QSpell:IsReady() and self.RSpell:IsReady() and self.ESpell:IsReady() then
return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
elseif self.RSpell:IsReady() and self.WSpell:IsReady() and self.ESpell:IsReady() then
return self:GetRDmg(target) + self:GetWDmg(target) + self:GetEDmg(target)
elseif self.QSpell:IsReady() and self.WSpell:IsReady() then
return self:GetQDmg(target) + self:GetWDmg(target)
elseif self.ESpell:IsReady() and self.WSpell:IsReady() then
return self:GetEDmg(target) + self:GetWDmg(target)
elseif self.RSpell:IsReady() and self.WSpell:IsReady() then
return self:GetRDmg(target) + self:GetWDmg(target)
elseif self.QSpell:IsReady() and self.RSpell:IsReady() then
return self:GetQDmg(target) + self:GetRDmg(target)
elseif self.ESpell:IsReady() and self.RSpell:IsReady() then
return self:GetEDmg(target) + self:GetRDmg(target)
elseif self.QSpell:IsReady() and self.ESpell:IsReady() then
return self:GetQDmg(target) + self:GetEDmg(target)
elseif self.RSpell:IsReady() then
return self:GetRDmg(target)
elseif self.ESpell:IsReady() then
return self:GetEDmg(target)
elseif self.QSpell:IsReady() then
return self:GetQDmg(target)
elseif self.WSpell:IsReady() then
return self:GetWDmg(target)
else
return 0
end
end
function Lissandra:GetDraws(target)
local qdamage = self:GetQDmg(target)
local wdamage = self:GetWDmg(target)
local edamage = self:GetEDmg(target)
local rdamage = self:GetRDmg(target)
local Idmg=(50+ ((myHero.level)*20))

if qdamage >target.health then
return 'Q', RGBA(0, 255, 0, 255)
elseif qdamage+ Idmg>target.health then
return 'Q + Ignite', RGBA(0, 255, 0, 255)
elseif wdamage >target.health then
return 'W', RGBA(0, 255, 0, 255)
elseif wdamage+ Idmg>target.health then
return 'W + Ignite', RGBA(0, 255, 0, 255)
elseif edamage >target.health then
return 'E', RGBA(0, 255, 0, 255)
elseif edamage + Idmg>target.health then
return 'E + Ignite', RGBA(0, 255, 0, 255)
elseif rdamage  >target.health then
return 'R', RGBA(0, 255, 0, 255)
elseif rdamage + Idmg>target.health then
return 'R + Ignite', RGBA(0, 255, 0, 255)
elseif rdamage +edamage  >target.health then
return 'R + E',RGBA(0, 255, 0, 255)
elseif rdamage +edamage+ Idmg>target.health then
return 'R + E + Ignite',RGBA(0, 255, 0, 255)
elseif edamage+wdamage >target.health then
return 'E + W',RGBA(0, 255, 0, 255)
elseif edamage+wdamage+ Idmg>target.health then
return 'E + W + Ignite',RGBA(0, 255, 0, 255)
elseif rdamage+wdamage >target.health then
return 'R + W',RGBA(0, 255, 0, 255)
elseif rdamage+wdamage+ Idmg>target.health then
return 'R + W + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+wdamage >target.health then
return 'Q + W',RGBA(0, 255, 0, 255)
elseif qdamage+edamage>target.health then
return 'Q + E',RGBA(0, 255, 0, 255)
elseif qdamage+rdamage >target.health then
return 'Q + R',RGBA(0, 255, 0, 255)
elseif qdamage+wdamage+ Idmg>target.health then
return 'Q + W + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+edamage+ Idmg>target.health then
return 'Q + E + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+rdamage+ Idmg>target.health then
return 'Q + R + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+edamage+wdamage >target.health then
return 'Q + W + E',RGBA(0, 255, 0, 255)
elseif qdamage+rdamage+wdamage >target.health then
return 'Q + W + R',RGBA(0, 255, 0, 255)
elseif qdamage+edamage+rdamage >target.health then
return 'Q + R + E',RGBA(0, 255, 0, 255)
elseif qdamage+edamage+wdamage+ Idmg>target.health then
return 'Q + W + E + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+wdamage+edamage+rdamage >target.health then
return 'Kill with full combo',RGBA(0, 255, 0, 255)
elseif qdamage+wdamage+edamage+rdamage+Idmg>target.health then
return 'Full Combo + Ignite',RGBA(0, 255, 0, 255)
else
return "Cant Kill yet", RGBA(0, 255, 0, 255)
end
end
function Lissandra:CastQ(unit)
self.QSpell:Cast(unit)
end
pred = nil
function Lissandra:CastQ2(unit)
if ValidTarget(unit) and self.QSpell:IsReady() then
if GetDistance(unit) < self.QSpell.Range then
  self:CastQ(unit)
elseif GetDistance(unit) < spells.q.rangeMax then
  local collision = false
  local x, z = 0, 0

  self.enemyMinions:update()
  for i, minion in pairs(self.enemyMinions.objects) do
    if minion ~= nil and not minion.dead and GetDistance(minion) <= self.QSpell.Range then
      x, z = pointOnLine(myHero, unit, minion, 0)

      if math.sqrt((minion.x - x) ^ 2 + (minion.z - z) ^ 2) < self.QSpell.Width / 2 then
        collision = true
      end
    end
  end

  if collision == true and GetDistance(unit) < spells.q.rangeMax then
    Position = pred:GetPredictedPos(unit, self.QSpell.Delay + (GetDistance(unit) / self.QSpell.Speed))

    local castX = myHero.x + self.QSpell.Range * ((Position.x - myHero.x) / GetDistance(Position))
    local castZ = myHero.z + self.QSpell.Range* ((Position.z - myHero.z) / GetDistance(Position))
    CastSpell(_Q, castX, castZ)
  end
end
end
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
local dmgE = self:GetEDmg(unit)
if(self.tse.target ~= nil and  self.ESpell:IsReady() and health<dmgE and self.Config.killsteal.useE   and self.Config.killsteal.ks)then
  self:CastE(unit)
end
local dmgQ = self:GetQDmg(unit)
if(self.tsq.target ~= nil and  self.QSpell:IsReady() and health<dmgQ and self.Config.killsteal.useQ and self.Config.killsteal.ks )then
  self:CastQ(unit)
end
local dmgW = self:GetWDmg(unit)
if(self.tsw.target ~= nil and  self.WSpell:IsReady() and health<dmgQ and self.Config.killsteal.useW and self.Config.killsteal.ks )then
  self:CastW(unit)
end
local dmgI =(50+ ((myHero.level)*20))
if(health<dmgI and self.Config.killsteal.useI and self.Config.killsteal.ks and GetDistance(unit)<600)then
  self:CastI(unit)
end
local dmgR =self:GetRDmg(unit)
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
  self:CastQ(target)
end
end
if self.Config.Keys.harasskey or self.Config.Keys.harasstoglekey then
if(self.WSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 ) and self.tsw.target~=nil and self.Config.harass.useW ) then
  self:CastW(target)
end
end
if self.Config.Keys.harasskey or self.Config.Keys.harasstoglekey  then
if(self.Config.skilllogic.Elogic.harass == 1  and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 )  and self.Config.harass.useE ) then
  local Ticker = GetTickCount()
  if (global_ticks + 2000) < Ticker then
    if (myHero:CanUseSpell(_E) == READY and self.tse.target~=nil) then
      CastSpell(_E, target.x, target.z)
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
      CastSpell(_E, target.x, target.z)
      global_ticks = Ticker
      DelayAction(function() CastSpell(_E) end, 1.5)
    end
  end
end
end
end
function Lissandra:LastHit()
self.enemyMinions:update()
if self.Config.farm.lasthit.lasthitlogic == 1 then
for _, target in pairs(self.enemyMinions.objects) do
  local Qdamage = self:GetQDmg(target)
  if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 ) and ValidTarget(target,self.QSpell.Range)  and GetDistanceSqr(target) <= self.QSpell.Range * self.QSpell.Range and Qdamage >= target.health) then
    self:CastQ(target)
  end
  local Wdamage = self:GetWDmg(target)
  if(self.WSpell:IsReady() and self.Config.farm.lasthit.useW and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.WMana /100 )and  ValidTarget(target,self.QSpell.Range) and GetDistanceSqr(target) <= self.WSpell.Range * self.WSpell.Range and Wdamage >= target.health) then
    self:CastW(target)
  end
end
elseif self.Config.farm.lasthit.lasthitlogic == 2 then
if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 )) then
  self.QSpell:LastHit()
end
if(self.WSpell:IsReady() and self.Config.farm.lasthit.useW and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.WMana /100 )) then
  self.WSpell:LastHit()
end
end
end
function Lissandra:LaneClear()
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
  local NumberOfHits = self.Config.farm.laneclear.qcount
  if NumberOfHits >= 1 and #self.enemyMinions.objects >= NumberOfHits then

    if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.QMana /100 ) and GetDistance(minion) <= self.QSpell.Range then
      local BestPos, BestHit =  GetBestLineFarmPosition(self.QSpell.Range, self.QSpell.Width, self.enemyMinions.objects )
      if BestPos ~= nil and  BestHit >= NumberOfHits then
        CastSpell(_Q, BestPos.x, BestPos.z)
      end
    end
  end
  local NumberOfHits = self.Config.farm.laneclear.wcount
  if NumberOfHits >= 1 and #self.enemyMinions.objects >= NumberOfHits then
    if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useW and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.WMana /100 ) and GetDistance(minion) <= self.WSpell.Range then
      self:CastW(cleartarget)
    end
  end
  local NumberOfHits = self.Config.farm.laneclear.ecount
  if NumberOfHits >= 1 and #self.enemyMinions.objects >= NumberOfHits then

    if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useE and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.EMana /100 ) and GetDistance(minion) <= self.ESpell.Range then
      local BestPos, BestHit = GetBestLineFarmPosition(self.ESpell.Range, self.ESpell.Width, self.enemyMinions.objects )
      if BestPos ~= nil and  BestHit >= NumberOfHits then
        local Ticker = GetTickCount()
        if (global_ticks + 2000) < Ticker then
          if (myHero:CanUseSpell(_E) == READY ) then
            CastSpell(_E, BestPos.x, BestPos.z)
            global_ticks = Ticker
            DelayAction(function() CastSpell(_E) end, 2)
          end
        end
      end
    end
  end
end
end
end
function Lissandra:autoq()

if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 )  and self.Config.harass.autoq ) then
self:CastQ2(target)
end
end
function Lissandra:JungleClear()
if(self.QSpell:IsReady() and self.Config.farm.jungleclear.useQ and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.QMana /100 ) then
self.QSpell:JungleClear()
end
if(self.WSpell:IsReady() and self.Config.farm.jungleclear.useW and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.WMana /100 ) then
self.WSpell:JungleClear()
end
if(self.ESpell:IsReady() and self.Config.farm.jungleclear.useE and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.EMana /100 ) then
self.ESpell:JungleClear()
end
end
function Lissandra:WndMsg(Msg, Key)
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
if Msg == WM_LBUTTONDOWN then
if PopUp1 then
  PopUp1 = false
end
end
end
function Lissandra:Unload()
self:writecfg()
end
---//==================================================\\---
--|| > Viktor Starts                         ||--
---\\==================================================//---
class "Viktor"
local ebuff = false
require 'HPrediction'
function Viktor:__init()
self.ts= TargetSelector(TARGET_LESS_CAST_PRIORITY, 525, DAMAGE_PHYSICAL, false, true)
self.tsq= TargetSelector(TARGET_LESS_CAST_PRIORITY, 600, DAMAGE_PHYSICAL, false, true)
self.tsw= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_MAGIC, false, true)
self.tse= TargetSelector(TARGET_LESS_CAST_PRIORITY, 1200, DAMAGE_MAGIC, false, true)
self.tsr= TargetSelector(TARGET_LESS_CAST_PRIORITY, 700, DAMAGE_MAGIC, false, true)
self.tsg= TargetSelector(TARGET_LESS_CAST_PRIORITY, 1300, DAMAGE_MAGIC, false, true)
self.QSpell = _Spell({Slot = _Q, DamageName = "Q", Range = math.huge, Width = 1, Delay = 0, Speed = math.huge, Collision = false, Aoe = false, Type = SPELL_TYPE.TARGETTED})
self.WSpell = _Spell({Slot = _W, DamageName = "W", Range = 700, Width = 125, Delay = 0.5, Speed = 750, Collision = false, Aoe = true, Type = SPELL_TYPE.CIRCULAR})
self.ESpell = _Spell({Slot = _E, DamageName = "E", Range = 1200, Width = 180, Delay = 0, Speed = math.huge, Collision = false, Aoe = false, Type = SPELL_TYPE.LINEAR})
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
Last_LevelSpell = 0

AddTickCallback(function() self:Tick() end)
AddUnloadCallback(function() self:Unload() end )
AddDrawCallback(function() self:Draw() end)
AddMsgCallback(function(msg,Key) self:WndMsg(msg,Key) end)
--AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
AddApplyBuffCallback(function(source, unit, buff) self:ApplyBuff(source, unit, buff) end)
--AddUpdateBuffCallback(function(source, unit, buff) self:UpdateBuff(source, unit, buff) end)
--AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end)
end
-- handles script logic, a pure high speed loop
function Viktor:Tick()
self:autozhonya()
self:Hasebuff()
if VIP_USER then   self:Antiafk()  end
self:autopot()
self:items()
self:checkts()
if VIP_USER then self:autolevel() end
if VIP_USER then self:skinhack() end
if(self.Config.combo.combokey )then
self:combo()
end
if(self.Config.farm.clearkey.lasthitkey or self.Config.farm.lasthit.autolasthit )then
self:LastHit()
end
if(self.Config.farm.clearkey.laneclearkey)then
self:LaneClear()
end
if(self.Config.farm.clearkey.jungleclearkey)then
self:JungleClear()
end
if(self.Config.killsteal.ks ) then
self:killsteal()
end
if(self.Config.harass.harasskey or self.Config.harass.harasstogle ) then
self:harass()
end
if self.Config.instruct then
self.Config.instruct = false
PopUp1 = true
end
end
function Viktor:writecfg(param)
local file = io.open(SCRIPT_PATH.."\\".."config.cfg", "w")
if not file then
-- print("Error in Write CFG")
end
if param ~= "ftc" then
file:write(ava_languages[self.Config.lang])
-- print("Written: "..ava_languages[self.Config.lang])
else
file:write("eng")
-- print("W: English")
end
file:close()
end
function Viktor:checkts()
self.ts:update()
self.tse:update()
self.tsq:update()
self.tsr:update()
self.tsw:update()
self.tsg:update()
if not self.tsg.target~=nil or not self.Config.targetsel.ts then
target = self.tse.target
elseif self.tsg.target~=nil or self.selectedTar then
target = self.selectedTar
end
end
function Viktor:LoadMenu()
self.Config=scriptConfig(""..Scriptname.." [" .. myHero.charName.."]" ,"menu")
self.Config:addSubMenu(loc_choosen[105], "hit")
self.Config.hit:addParam("E", loc_choosen[162], SCRIPT_PARAM_SLICE, 1.6, 1, 3, 2)

self.Config:addSubMenu(loc_choosen[1], "combo")
self.Config.combo:addParam("combokey", loc_choosen[81], SCRIPT_PARAM_ONKEYDOWN, false, 32)
self.Config.combo:addParam("useQ", loc_choosen[2], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("useW", loc_choosen[3], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("useE", loc_choosen[4], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("useR", loc_choosen[5], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("useI", loc_choosen[6], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("logic", loc_choosen[159], SCRIPT_PARAM_LIST, 1, {loc_choosen[160],loc_choosen[217],loc_choosen[172] })
self.Config.combo:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 10, 10, 100, 0)

self.Config:addSubMenu(loc_choosen[9], "harass")
self.Config.harass:addParam("harasskey", loc_choosen[83], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
self.Config.harass:addParam("harasstogle", loc_choosen[164],   SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
self.Config.harass:addParam("useQ", loc_choosen[10], SCRIPT_PARAM_ONOFF, true)
self.Config.harass:addParam("useE", loc_choosen[12], SCRIPT_PARAM_ONOFF, true)
self.Config.harass:addParam("E", loc_choosen[163], SCRIPT_PARAM_SLICE, 2, 1, 3, 2)
self.Config.harass:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

self.Config:addSubMenu(loc_choosen[14], "farm")

self.Config.farm:addSubMenu(loc_choosen[15],"laneclear")
self.Config.farm.laneclear:addParam("useQ",loc_choosen[16],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.laneclear:addParam("useE",loc_choosen[18],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.laneclear:addParam("ecount",loc_choosen[182],SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.laneclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
self.Config.farm.laneclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
self.Config.farm.laneclear:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

self.Config.farm:addSubMenu(loc_choosen[20],"jungleclear")
self.Config.farm.jungleclear:addParam("useQ",loc_choosen[21],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.jungleclear:addParam("useW",loc_choosen[22],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.jungleclear:addParam("useE",loc_choosen[23],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.jungleclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
self.Config.farm.jungleclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
self.Config.farm.jungleclear:addParam("WMana",loc_choosen[186],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
self.Config.farm.jungleclear:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

self.Config.farm:addSubMenu(loc_choosen[25],"lasthit")
self.Config.farm.lasthit:addParam("autolasthit",loc_choosen[189],SCRIPT_PARAM_ONOFF,false)
self.Config.farm.lasthit:addParam("useQ",loc_choosen[26],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.lasthit:addParam("useE",loc_choosen[28],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.lasthit:addParam("lasthitlogic",loc_choosen[191], SCRIPT_PARAM_LIST, 1, {loc_choosen[172],loc_choosen[190],loc_choosen[174]})
self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.lasthit:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
self.Config.farm.lasthit:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
self.Config.farm.lasthit:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

self.Config.farm:addSubMenu(loc_choosen[218],"clearkey")
self.Config.farm.clearkey:addParam("lasthitkey",loc_choosen[215], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
self.Config.farm.clearkey:addParam("laneclearkey", loc_choosen[85], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
self.Config.farm.clearkey:addParam("jungleclearkey", loc_choosen[86], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))

self.Config:addSubMenu(loc_choosen[35], "killsteal")
self.Config.killsteal:addParam("ks",loc_choosen[36],SCRIPT_PARAM_ONOFF,true)
self.Config.killsteal:addParam("useQ", loc_choosen[37], SCRIPT_PARAM_ONOFF, true)
self.Config.killsteal:addParam("useE", loc_choosen[39], SCRIPT_PARAM_ONOFF, true)
self.Config.killsteal:addParam("useR", loc_choosen[40], SCRIPT_PARAM_ONOFF, true)
self.Config.killsteal:addParam("useI", loc_choosen[41], SCRIPT_PARAM_ONOFF, true)

self.Config:addSubMenu(loc_choosen[42], "item")
self.Config.item:addSubMenu(loc_choosen[192], "autopot")
self.Config.item.autopot:addParam("enableautopothp", loc_choosen[193], SCRIPT_PARAM_ONOFF, false)
self.Config.item.autopot:addParam("autopothp", loc_choosen[194], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
self.Config.item:addParam("enableautozhonya", loc_choosen[43], SCRIPT_PARAM_ONOFF, false)
self.Config.item:addParam("autozhonya", loc_choosen[44], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
self.Config.item:addParam("usehg", loc_choosen[45], SCRIPT_PARAM_ONOFF, false)
self.Config.item:addParam("usebg", loc_choosen[46], SCRIPT_PARAM_ONOFF, false)

self.Config:addSubMenu(loc_choosen[92], "misc")
self.Config.misc:addSubMenu(loc_choosen[93], "interrupt")
self.Config.misc.interrupt:addParam("r", loc_choosen[97], SCRIPT_PARAM_ONOFF, true)
self.Config.misc.interrupt:addParam("w", loc_choosen[95], SCRIPT_PARAM_ONOFF, true)
self.Config.misc.interrupt:addParam("info3", loc_choosen[98], SCRIPT_PARAM_INFO,"")
for i, a in pairs(GetEnemyHeroes()) do
if Interrupt[a.charName] ~= nil then
  for i, spell in pairs(Interrupt[a.charName].stop) do
    self.Config.misc.interrupt:addParam(spell.spellName, a.charName.." - "..spell.name, SCRIPT_PARAM_ONOFF, true)
  end
end

end
self.Config.misc:addSubMenu(loc_choosen[219], "gapClose")
self.Config.misc.gapClose:addParam("w", loc_choosen[220], SCRIPT_PARAM_ONOFF, true)
self.Config.misc.gapClose:addParam("info3", loc_choosen[98], SCRIPT_PARAM_INFO,"")
for _, enemy in pairs(GetEnemyHeroes()) do
if isAGapcloserUnit[enemy.charName] ~= nil then
  self.Config.misc.gapClose:addParam(enemy.charName, enemy.charName .. " - " .. enemy:GetSpellData(isAGapcloserUnit[enemy.charName].spell).name, SCRIPT_PARAM_ONOFF, true)
end
end
Clock = os.clock()
if VIP_USER then
self.Config:addSubMenu(loc_choosen[47], "vip")
self.Config.vip:addParam("packet",loc_choosen[48],SCRIPT_PARAM_ONOFF,false)
self.Config.vip:addParam("info1", "", SCRIPT_PARAM_INFO,"")
self.Config.vip:addParam("info2", loc_choosen[49], SCRIPT_PARAM_INFO,"")
self.Config.vip:addSubMenu(loc_choosen[50], "level")
self.Config.vip.level:addParam("key",loc_choosen[51],SCRIPT_PARAM_ONOFF,false)
self.Config.vip.level:addParam("logic", loc_choosen[52], SCRIPT_PARAM_LIST, 7, {loc_choosen[58], loc_choosen[59],loc_choosen[60],loc_choosen[61],loc_choosen[62], loc_choosen[63], loc_choosen[64]  })
self.Config.vip:addSubMenu(loc_choosen[53], "skin")
self.Config.vip.skin:addParam("key",loc_choosen[54],SCRIPT_PARAM_ONOFF,false)
self.Config.vip.skin:addParam('selected' .. myHero.charName .. 'Skin', loc_choosen[57], SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
self.Config.vip.skin:addParam("info5", loc_choosen[55], SCRIPT_PARAM_INFO,"")
--self.Config.vip:addParam("info5", "Skin Hack temporary disabled until next update. .", SCRIPT_PARAM_INFO,"")
self.Config.vip:addSubMenu(loc_choosen[195], "antiafk")
self.Config.vip.antiafk:addParam("antiafk",loc_choosen[196],SCRIPT_PARAM_ONOFF,false)
self.Config.vip:addParam("info3", "", SCRIPT_PARAM_INFO,"")
self.Config.vip:addParam("info4", loc_choosen[56], SCRIPT_PARAM_INFO,"")
end
self.Config:addSubMenu(loc_choosen[65],"other")
--self.Config.other:addSubMenu("Show Damage On Hp Bar", "HPBAR")
--self.Config.other.HPBAR:addParam("key","ON/OFF",SCRIPT_PARAM_ONOFF,true)
self.Config.other:addSubMenu(loc_choosen[66], "draw")
self.Config.other.draw:addParam("qdraw",loc_choosen[67],SCRIPT_PARAM_ONOFF,true)
self.Config.other.draw:addParam("wdraw",loc_choosen[68],SCRIPT_PARAM_ONOFF,true)
self.Config.other.draw:addParam("edraw",loc_choosen[69],SCRIPT_PARAM_ONOFF,true)
self.Config.other.draw:addParam("rdraw",loc_choosen[70],SCRIPT_PARAM_ONOFF,true)
self.Config.other.draw:addParam("aadraw",loc_choosen[71],SCRIPT_PARAM_ONOFF,false)
self.Config.other.draw:addParam("rtdraw",loc_choosen[197],SCRIPT_PARAM_ONOFF,false)
self.Config.other:addSubMenu(loc_choosen[198], "color")
self.Config.other.color:addParam("Qcolor", loc_choosen[199], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
self.Config.other.color:addParam("Wcolor", loc_choosen[200], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
self.Config.other.color:addParam("Ecolor", loc_choosen[201], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
self.Config.other.color:addParam("Rcolor", loc_choosen[202], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
self.Config.other.color:addParam("E2color", loc_choosen[203], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
self.Config.other.color:addParam("AAcolor", loc_choosen[204], SCRIPT_PARAM_COLOR,{255, 255,0,0})
self.Config.other.color:addParam("targetselect", loc_choosen[205], SCRIPT_PARAM_COLOR,{255, 255,0,0})
self.Config.other:addSubMenu(loc_choosen[206], "width")
self.Config.other.width:addParam("Qwidth", loc_choosen[210], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("Wwidth", loc_choosen[211], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("Ewidth", loc_choosen[212], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("Rwidth", loc_choosen[213], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("E2width", loc_choosen[207], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("AAwidth", loc_choosen[209], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("STwidth", loc_choosen[208], 4, 6, 1, 10, 0)
self.Config.other:addParam("target",loc_choosen[75],SCRIPT_PARAM_ONOFF,true)
self.Config.other:addParam("damage",loc_choosen[214],SCRIPT_PARAM_ONOFF,true)
self.Config.other:addParam("targetcal",loc_choosen[76],SCRIPT_PARAM_ONOFF,true)
self.Config.other:addSubMenu(loc_choosen[73], "perma")
self.Config.other.perma:addParam("perma",loc_choosen[74],SCRIPT_PARAM_ONOFF,true)
self.Config:addSubMenu(loc_choosen[77],"targetsel")
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
self.Config:addSubMenu(loc_choosen[79], "Keys")
OrbwalkManager:LoadCommonKeys(self.Config.Keys)
self.Config:addParam("lang", loc_choosen[165], SCRIPT_PARAM_LIST, 1, {loc_choosen[166], loc_choosen[167],loc_choosen[168]})
self.Config:addParam("instruct", loc_choosen[216], SCRIPT_PARAM_ONOFF, false)
if self.Config.other.perma.perma then
DelayAction(function() self.Config:permaShow("infobox") end, 1)
DelayAction(function() self.Config.combo:permaShow("combokey") end, 1.2)
DelayAction(function() self.Config.harass:permaShow("harasstogle") end, 1.2)
DelayAction(function() self.Config.harass:permaShow("harasskey") end, 1.2)
end
end
function Viktor:Draw()
if self.Config.other.draw.qdraw and self.QSpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 600,  self.Config.other.width.Qwidth,ARGB(table.unpack(self.Config.other.color.Qcolor)))
end

if self.Config.other.draw.wdraw and self.WSpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 700,  self.Config.other.width.Wwidth, ARGB(table.unpack(self.Config.other.color.Wcolor)))
end

if self.Config.other.draw.edraw and self.ESpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 1200,  self.Config.other.width.Ewidth, ARGB(table.unpack(self.Config.other.color.Ecolor)))
end

if self.Config.other.draw.rdraw and self.RSpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 700, self.Config.other.width.Rwidth, ARGB(table.unpack(self.Config.other.color.Rcolor)))
end
if self.Config.other.draw.aadraw then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 525, self.Config.other.width.AAwidth, ARGB(table.unpack(self.Config.other.color.AAcolor)))
end
if self.Config.other.draw.rtdraw and self.ESpell:IsReady()  then
if self.tse.target~=nil then
  DrawLine3D(myHero.x, myHero.y, myHero.z,self.tse.target.x, self.tse.target.y, self.tse.target.z,self.Config.other.width.E2width,ARGB(table.unpack(self.Config.other.color.E2color)))
end
end
if self.Config.other.target and self.selectedTar ~= nil then
DrawCircle3D(self.selectedTar.x, self.selectedTar.y, self.selectedTar.z, 80, self.Config.other.width.STwidth, ARGB(table.unpack(self.Config.other.color.targetselect)))
end
if PopUp1 then
local w, h1, h2 = (WINDOW_W*0.50), (WINDOW_H*.15), (WINDOW_H*.9)
DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
DrawLine(w, h1, w, h2/2, w/1.8, ARGB(150, 235, 183, 63))
DrawTextA(tostring("Welcome to KeyboardMaster Series 3.0"), WINDOW_H*.028, (WINDOW_W/2), (WINDOW_H*.18), ARGB(255, 96, 48, 0),"center","center")
DrawTextA(tostring("Little informatation about KeyboardMaster Series"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.194), ARGB(255, 96, 48, 0))
DrawTextA(tostring("Its a bundle that produced by ensuluyn"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.210), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Currently it supported only mid champs "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.225), ARGB(255, 255, 255, 255))
DrawTextA(tostring("I focus Quality rather than Quantity"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.240), ARGB(255, 255, 255, 255))
DrawTextA(tostring("I need your feedbacks to improve it"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.255), ARGB(255, 255, 255, 255))
DrawTextA(tostring("I care every single feedback and try to add everything"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.270), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Hope you are enjoy my script.."), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.285), ARGB(255, 255, 255, 255))
DrawTextA(tostring("You can change every settings to your like :)"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.300), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Did you like my script > Upvote me on scriptstatus and on forum"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.315), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Don't forget these are VIP;"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.330), ARGB(255, 96, 48, 0))
DrawTextA(tostring("  Anti-Afk"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.345), ARGB(255, 255, 255, 255))
DrawTextA(tostring("  Auto Leveler "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.360), ARGB(255, 255, 255, 255))
DrawTextA(tostring("  Skin Changer "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.375), ARGB(255, 255, 255, 255))
local w, h1, h2 = (WINDOW_W*0.49), (WINDOW_H*.70), (WINDOW_H*.75)
DrawLine(w, h1/1.775, w, h2/1.68, w*.11, ARGB(255, 0, 0, 0))
DrawRectangleButton(WINDOW_W*0.467, WINDOW_H/2.375, WINDOW_W*.047, WINDOW_H*.041, ARGB(255, 255, 255, 255))
DrawTextA(tostring("OK"), WINDOW_H*.02, (WINDOW_W/2)*.98, (WINDOW_H/2.375), ARGB(255, 0, 0, 0 ),"center","center")
DrawTextA(tostring("                                                                                               Credits"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.395), ARGB(255, 96, 48, 0))
DrawTextA(tostring("                                                                              Furry- For this awesome popup"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.410), ARGB(255, 255, 255, 255))
end
for _, target in pairs(GetEnemyHeroes()) do
if ValidTarget(target, 15000) then
  if self.Config.other.targetcal and not myHero.dead then
    local drawpos=WorldToScreen(D3DXVECTOR3(target.x, target.y, target.z))
    local comboText,color = self:GetDraws(target)
    if comboText then
      DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
    end
  end
end
end
for _, target in pairs(GetEnemyHeroes()) do
if ValidTarget(target, 15000) then
  if target.visible and not target.dead and self.Config.other.damage then
    currLine = 1
    DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
    DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
    currLine = currLine + 1
  end
end
end
end

function Viktor:autopot()
if os.clock() - lastPotion < 15 then return end
for SLOT = ITEM_1, ITEM_6 do
if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp then
  if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp /100 )  then
    CastSpell(SLOT)
    lastPotion = os.clock()
  end
end
end
end
function Viktor:items()
if self.Config.item.usebg and self.Config.combo.combokey then
for _ = ITEM_1, ITEM_7 do
  if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastSpell(_)
end
end
end
if self.Config.item.usehg and self.Config.combo.combokey then
for _ = ITEM_1, ITEM_7 do
if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastSpell(_)
end
end
end
end
function Viktor:skinhack()
if not skinload then
if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
lastTimeTickCalled = CurrentTimeInMillis()
if self.Config.vip.skin.key and self.Config.vip.packet  then
if self.Config.vip.skin['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
  lastSkin = self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']
  SendSkinPacket(myHero.charName, skinsPB[self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']], myHero.networkID);
end
end
end
end
end
function Viktor:Hasebuff()
for i = 1, myHero.buffCount do
local buff = myHero:getBuff(i)
if BuffIsValid(buff) then
if buff.name:lower() == "viktoreaug" then
ebuff = true
end
end
end
end
function Viktor:ApplyBuff(source, unit, buff)
if unit == nil or buff == nil then return end
if unit and unit.isMe and buff.name == "viktoreaug" then
ebuff = true
end
end
function Viktor:autolevel()
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence1 =   { 1,2,3,1,1,4,1,2,1,2,4,2,2,3,3,4,3,3}
autoLevelSetSequence(levelSequence1)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence2 =   { 1,2,3,1,1,4,1,3,1,3,4,3,3,2,2,4,2,2}
autoLevelSetSequence(levelSequence2)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence3 =  { 2,3,1,2,2,4,2,1,2,1,4,1,1,3,3,4,3,3}
autoLevelSetSequence(levelSequence3)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence4 =  { 2,3,1,2,2,4,2,3,2,3,4,3,3,1,1,4,1,1}
autoLevelSetSequence(levelSequence4)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence5 =  { 3,1,2,3,3,4,3,2,3,2,4,2,2,1,1,4,1,1}
autoLevelSetSequence(levelSequence5)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence6 =  { 3,1,2,3,3,4,3,1,3,1,4,1,1,2,2,4,2,2}
autoLevelSetSequence(levelSequence6)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence6 =  { 1,3,3,2,3,4,3,1,3,1,4,1,2,1,2,4,2,2}
autoLevelSetSequence(levelSequence6)
Last_LevelSpell = os.clock()
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
function Viktor:saver()
end
function Viktor:alwaysr()
if (self.RSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.Config.combo.useR and self.Config.combo.combokey and GetDistance(self.tsr.target)<700 )then
self:CastR(target)
end
end
function Viktor:needr()
for _, unit in pairs(GetEnemyHeroes()) do
if( self.RSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.Config.combo.useR and self.Config.combo.combokey and GetDistance(unit)<700 )then
local damagewithr =self:GetRDmg(unit)+self:GetQDmg(unit) +self:GetEDmg(unit)
local damagewithnor = self:GetQDmg(unit) +self:GetEDmg(unit)
local health=unit.health
if(health<damagewithnor )then
self:saver()
elseif(health<damagewithr )then
self:CastR(target)
end
end
end
end
function Viktor:killr()
for _, unit in pairs(GetEnemyHeroes()) do
if( self.RSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.Config.combo.useR and self.Config.combo.combokey and GetDistance(unit)<700 )then
local dmgR =self:GetRDmg(unit)
local health=unit.health
if(health<dmgR )then
self:CastR(target)
end
end
end
end
function Viktor:ProcessSpell(unit, spell)
if myHero:GetSpellData(_R).level > 1 then
if Interrupt[unit.charName] ~= nil then
spell = Interrupt[unit.charName].stop[spell.name]
if spell ~= nil then
if self.Config.misc.interrupt[spell.name] then
if ValidTarget(unit) and GetDistance(unit) < self.RSpell.Range  and self.RSpell:IsReady()  and self.Config.misc.interrupt.r then
  self:CastR(unit)
end
end
end
end
end
if myHero:GetSpellData(_W).level > 1 then
if Interrupt[unit.charName] ~= nil then
spell = Interrupt[unit.charName].stop[spell.name]
if spell ~= nil then
if self.Config.misc.interrupt[spell.name] then
if ValidTarget(unit) and GetDistance(unit) < self.WSpell.Range  and self.WSpell:IsReady()  and self.Config.misc.interrupt.w then
  self:CastW(unit)
end
end
end
end
end
if unit.type == myHero.type and unit.team ~= myHero.team and isAGapcloserUnit[unit.charName] and GetDistance(unit) < 1000 and spell ~= nil then
if spell.name == (type(isAGapcloserUnit[unit.charName].spell) == 'number' and unit:GetSpellData(isAGapcloserUnit[unit.charName].spell).name or isAGapcloserUnit[unit.charName].spell) and self.Config.misc.gapClose[unit.charName] then
if spell.target ~= nil and spell.target.name == myHero.name or isAGapcloserUnit[unit.charName].spell == 'blindmonkqtwo' then
CastSpell(_W, myHero.x, myHero.z)
end
end
end
end
function Viktor:combo()
self.tsq:update()
self.tse:update()
self.tsw:update()
self.tsr:update()
if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tsq.target~=nil  and self.Config.combo.useQ and self.Config.combo.combokey  )then
self:CastQ(target)
end
if(self.ESpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 )and self.tse.target~=nil and self.Config.combo.useE and self.Config.combo.combokey  )then
self:CastE(target)
end
if(self.WSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.combo.Mana /100 ) and self.tsw.target~=nil and self.Config.combo.useW and  self.Config.combo.combokey  )then
self:CastW(target)
end
if self.Config.combo.logic == 1 then
self:killr()
elseif self.Config.combo.logic == 2 then
self:needr()
elseif self.Config.combo.logic == 3 then
self:alwaysr()
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
local dmgE = self:GetEDmg(unit)
if(self.tse.target ~= nil and  self.ESpell:IsReady() and health<dmgE and self.Config.killsteal.useE and GetDistance(unit)<700   and self.Config.killsteal.ks)then
self:CastE(unit)
end
local dmgQ = self:GetQDmg(unit)
if(self.tsq.target ~= nil and  self.QSpell:IsReady() and health<dmgQ and self.Config.killsteal.useQ and self.Config.killsteal.ks )then
self:CastQ(unit)
end
local dmgI =(50+ ((myHero.level)*20))
if(health<dmgI and self.Config.killsteal.useI and self.Config.killsteal.ks and GetDistance(unit)<600)then
self:CastI(unit)
end
local dmgR =self:GetRDmg(unit)
if(self.tsr.target ~= nil and  self.RSpell:IsReady() and health<dmgR and self.Config.killsteal.useR and self.Config.killsteal.ks and GetDistance(unit)<700)then
self:CastR(unit)
end
end
end
function Viktor:GetQDmg(target)
if myHero:GetSpellData(_Q).level < 1 then
return 0
end
if self.QSpell:IsReady() then
local FinalDamage = (20 + (myHero:GetSpellData(_Q).level * 20) + (myHero.ap + (myHero.ap * myHero.apPercent) )*.2 + ((myHero.ap + (myHero.ap * myHero.apPercent) )*.5))
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Viktor:GetQ2Dmg(target)
if myHero:GetSpellData(_Q).level < 1 then
return 0
end
if self.QSpell:IsReady() then
local FinalDamage = (20 + (myHero:GetSpellData(_Q).level * 20) + (myHero.ap + (myHero.ap * myHero.apPercent) )*.2 )
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Viktor:GetEDmg(target)
if myHero:GetSpellData(_E).level < 1 then
return 0
end
if not ebuff and self.ESpell:IsReady() then
local FinalDamage = (25 + (myHero:GetSpellData(_E).level * 45) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .7)
return myHero:CalcMagicDamage(target, FinalDamage)
elseif ebuff and self.ESpell:IsReady() then
local FinalDamage =.4*((25 + (myHero:GetSpellData(_E).level * 45) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .7))
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Viktor:GetRDmg(target)
if myHero:GetSpellData(_R).level < 1 then
return 0
end
if self.RSpell:IsReady() then
local Rdamage = (50 + (myHero:GetSpellData(_R).level * 100) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .55)
local persecond = ( 14*(myHero:GetSpellData(_R).level * 15) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .1)
local FinalDamage = Rdamage + persecond
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Viktor:GetMyDmg(target)
if self.QSpell:IsReady() and self.RSpell:IsReady() and self.ESpell:IsReady() then
return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
elseif self.QSpell:IsReady()  and self.RSpell:IsReady() then
return self:GetQDmg(target) + self:GetRDmg(target)
elseif self.QSpell:IsReady()  and self.ESpell:IsReady() then
return self:GetQDmg(target) + self:GetEDmg(target)
elseif self.RSpell:IsReady() and self.ESpell:IsReady() then
return self:GetRDmg(target) +self:GetEDmg(target)
elseif self.QSpell:IsReady() then
return self:GetQDmg(target)
elseif self.ESpell:IsReady() then
return self:GetEDmg(target)
elseif self.RSpell:IsReady() then
return self:GetRDmg(target)
elseif self.QSpell:IsReady() and self.RSpell:IsReady() then
return self:GetQDmg(target) + self:GetRDmg(target)
else
return 0
end
end
function Viktor:GetDraws(target)
local qdamage = self:GetQDmg(target)
local edamage = self:GetEDmg(target)
local rdamage = self:GetRDmg(target)
local Idmg=(50+ ((myHero.level)*20))

if qdamage >target.health then
return 'Q', RGBA(0, 255, 0, 255)
elseif qdamage+ Idmg>target.health then
return 'Q + Ignite', RGBA(0, 255, 0, 255)
elseif edamage >target.health then
return 'E', RGBA(0, 255, 0, 255)
elseif edamage + Idmg>target.health then
return 'E + Ignite', RGBA(0, 255, 0, 255)
elseif rdamage  >target.health then
return 'R', RGBA(0, 255, 0, 255)
elseif rdamage + Idmg>target.health then
return 'R + Ignite', RGBA(0, 255, 0, 255)
elseif rdamage +edamage  >target.health then
return 'R + E',RGBA(0, 255, 0, 255)
elseif rdamage +edamage+ Idmg>target.health then
return 'R + E + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+edamage>target.health then
return 'Q + E',RGBA(0, 255, 0, 255)
elseif qdamage+rdamage >target.health then
return 'Q + R',RGBA(0, 255, 0, 255)
elseif qdamage+edamage+ Idmg>target.health then
return 'Q + E + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+rdamage+ Idmg>target.health then
return 'Q + R + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+edamage+rdamage >target.health then
return 'Kill with full combo',RGBA(0, 255, 0, 255)
elseif qdamage+edamage+rdamage+ Idmg>target.health then
return 'Full Combo + Ignite',RGBA(0, 255, 0, 255)
else
return "Cant Kill yet", RGBA(0, 255, 0, 255)
end
end
function Viktor:harass()
self.ts:update()
self.tsq:update()
if self.Config.harass.harasskey or self.Config.harass.harasstogle  then
if(self.QSpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 ) and self.tsq.target~=nil and self.Config.harass.useQ ) then
self:CastQ(target)
end
self.tse:update()
if(self.ESpell:IsReady() and (myHero.mana / myHero.maxMana > self.Config.harass.Mana /100 ) and self.tse.target ~= nil and self.Config.harass.useE  and ValidTarget(self.tse.target, self.ERange)) then
self:CastE(target)
end

end
end
function Viktor:Antiafk()
if os.clock() < Clock or not self.Config.vip.antiafk.antiafk then return end
Clock = os.clock() + math.random(60,120)
myHero:MoveTo(myHero.x, myHero.z)
end
function Viktor:LastHit()
self.enemyMinions:update()
if self.Config.farm.lasthit.lasthitlogic == 1 then
for _, target in pairs(self.enemyMinions.objects) do
local Qdamage = self:GetQDmg(target)
if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 ) and ValidTarget(target,self.QSpell.Range)  and GetDistanceSqr(target) <= self.QSpell.Range * self.QSpell.Range and Qdamage >= target.health) then
self:CastQ(target)
end
local Edamage = self:GetEDmg(target)
if(self.ESpell:IsReady() and self.Config.farm.lasthit.useE and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.EMana /100 )and  ValidTarget(target,self.QSpell.Range) and GetDistanceSqr(target) <= self.ESpell.Range * self.ESpell.Range and Edamage >= target.health) then
self:CastE(target)
end
end
elseif self.Config.farm.lasthit.lasthitlogic == 2 then
if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 )) then
self.QSpell:LastHit()
end
if(self.ESpell:IsReady() and self.Config.farm.lasthit.useE and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.EMana /100 )) then
self.ESpell:LastHit()
end
end
end
function Viktor:LaneClear()
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
if self.Config.farm.clearkey.laneclearkey  and self.Config.farm.laneclear.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.QMana /100 ) and GetDistance(minion) <= self.QSpell.Range then
self:CastQ(cleartarget)
end
local NumberOfHits = self.Config.farm.laneclear.ecount
if NumberOfHits >= 1 and #self.enemyMinions.objects >= NumberOfHits then
if self.Config.farm.clearkey.laneclearkey  and self.Config.farm.laneclear.useE and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.EMana /100 ) and GetDistance(minion) <= self.ESpell.Range then
local BestPos, BestHit = GetBestLineFarmPosition(self.ESpell.Range, self.ESpell.Width, self.enemyMinions.objects)
if BestPos ~= nil and  BestHit >= NumberOfHits then
  CastSpell(_E, BestPos.x, BestPos.z)
end
end
end
end
end
end
function Viktor:JungleClear()
if(self.QSpell:IsReady() and self.Config.farm.jungleclear.useQ and self.Config.farm.clearkey.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.QMana /100 ) then
self.QSpell:JungleClear()
end
if(self.WSpell:IsReady() and self.Config.farm.jungleclear.useW and self.Config.farm.clearkey.jungleclearkey  ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.WMana /100 ) then
self.WSpell:JungleClear()
end
if(self.ESpell:IsReady() and self.Config.farm.jungleclear.useE and self.Config.farm.clearkey.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.EMana /100 ) then
self.ESpell:JungleClear()
end
end
function Viktor:WndMsg(Msg, Key)
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
if Msg == WM_LBUTTONDOWN then
if PopUp1 then
PopUp1 = false
end
end
end
function Viktor:Unload()
self:writecfg()
end
class "Diana"
---//==================================================\\---
--|| > Diana Starts                         ||--
---\\==================================================//---
function Diana:__init()
self.ts= TargetSelector(TARGET_LESS_CAST_PRIORITY, 830, DAMAGE_PHYSICAL, false, true)
self.tsq= TargetSelector(TARGET_LESS_CAST_PRIORITY, 830, DAMAGE_PHYSICAL, false, true)
self.tsw= TargetSelector(TARGET_LESS_CAST_PRIORITY, 200, DAMAGE_PHYSICAL, false, true)
self.tse= TargetSelector(TARGET_LESS_CAST_PRIORITY, 350, DAMAGE_PHYSICAL, false, true)
self.tsr= TargetSelector(TARGET_LESS_CAST_PRIORITY, 825, DAMAGE_PHYSICAL, false, true)
self.tsg= TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_MAGIC, false, true)
self.QSpell = _Spell({Slot = _Q, DamageName = "Q", Range = 830, Width = 75, Delay = 0.25, Speed = 2000, Collision = false, Aoe = false, Type = SPELL_TYPE.LINEAR})
self.WSpell = _Spell({Slot = _W, DamageName = "W", Range = 200, Collision = false, Aoe = true, Type = SPELL_TYPE.SELF})
self.ESpell = _Spell({Slot = _E, DamageName = "E", Range = 350, Collision = true, Aoe = false, Type = SPELL_TYPE.SELF})
self.RSpell = _Spell({Slot = _R, DamageName = "R", Range = 825,  Collision = false, Aoe = true, Type = SPELL_TYPE.TARGETTED})
self.Ignite = _Spell({Slot = FindSummonerSlot("summonerdot"), DamageName = "IGNITE", Range = 600, Type = SPELL_TYPE.TARGETTED})
--|> Minion Managers
self.enemyMinions   = minionManager(MINION_ENEMY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
self.allyMinions    = minionManager(MINION_ALLY,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
self.jungleMinions  = minionManager(MINION_JUNGLE,  650, myHero, MINION_SORT_MAXHEALTH_DEC)
self.otherMinions   = minionManager(MINION_OTHER,   650, myHero, MINION_SORT_MAXHEALTH_DEC)
self:LoadMenu()
self:findorbwalker()
Last_LevelSpell = 0
Clock = os.clock()
AddTickCallback(function() self:Tick() end)
AddUnloadCallback(function() self:Unload() end )
AddDrawCallback(function() self:Draw() end)
AddMsgCallback(function(msg,Key) self:WndMsg(msg,Key) end)
--AddAnimationCallback(function(unit, animation) self:Animation(unit, animation) end)
AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
--AddApplyBuffCallback(function(source, unit, buff) self:OnApplyBuff(source, unit, buff) end)
--AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
--AddRemoveBuffCallback(function(unit, buff) self:OnRemoveBuff(unit, buff) end)
end
function Diana:Tick()
self:autozhonya()
self:autoq()
if VIP_USER then   self:Antiafk()  end
self:autopot()
--self:gapclose()
self:items()
self:checkts()
if VIP_USER then self:autolevel() end
if VIP_USER then self:skinhack() end
if(self.Config.Keys.jungleclearkey )then
self:JungleClear()
end
if(self.Config.Keys.combokey and self.Config.combo.logic == 1 )then
self:combo1()
end
if(self.Config.Keys.lasthitkey or self.Config.farm.lasthit.autolasthit )then
self:LastHit()
end
if self.Config.instruct then
self.Config.instruct = false
PopUp1 = true
end
if(self.Config.Keys.combokey and self.Config.combo.logic == 2 )then
self:combo2()
end
if(self.Config.Keys.combokey and self.Config.combo.logic == 3 )then
self:combo3()
end
if(self.Config.Keys.laneclearkey )then
self:LaneClear()
end
if(self.Config.killsteal.ks ) then
self:killsteal()
end
if(self.Config.Keys.harasskey  ) then
self:harass()
end
if(self.Config.Keys.escapekey )then
self:escape()
end
end
function Diana:Draw()
if self.Config.other.draw.qdraw and self.QSpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 600,  self.Config.other.width.Qwidth,ARGB(table.unpack(self.Config.other.color.Qcolor)))
end

if self.Config.other.draw.wdraw and self.WSpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 700,  self.Config.other.width.Wwidth, ARGB(table.unpack(self.Config.other.color.Wcolor)))
end

if self.Config.other.draw.edraw and self.ESpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 1200,  self.Config.other.width.Ewidth, ARGB(table.unpack(self.Config.other.color.Ecolor)))
end

if self.Config.other.draw.rdraw and self.RSpell:IsReady() then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 700, self.Config.other.width.Rwidth, ARGB(table.unpack(self.Config.other.color.Rcolor)))
end
if self.Config.other.draw.aadraw then
DrawCircle3D(myHero.x, myHero.y, myHero.z, 525, self.Config.other.width.AAwidth, ARGB(table.unpack(self.Config.other.color.AAcolor)))
end
if self.Config.other.target and self.selectedTar ~= nil then
DrawCircle3D(self.selectedTar.x, self.selectedTar.y, self.selectedTar.z, 80, self.Config.other.width.STwidth, ARGB(table.unpack(self.Config.other.color.targetselect)))
end
if PopUp1 then
local w, h1, h2 = (WINDOW_W*0.50), (WINDOW_H*.15), (WINDOW_H*.9)
DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
DrawLine(w, h1, w, h2/2, w/1.8, ARGB(150, 235, 183, 63))
DrawTextA(tostring("Welcome to KeyboardMaster Series 3.0"), WINDOW_H*.028, (WINDOW_W/2), (WINDOW_H*.18), ARGB(255, 96, 48, 0),"center","center")
DrawTextA(tostring("Little informatation about KeyboardMaster Series"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.194), ARGB(255, 96, 48, 0))
DrawTextA(tostring("Its a bundle that produced by ensuluyn"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.210), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Currently it supported only mid champs "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.225), ARGB(255, 255, 255, 255))
DrawTextA(tostring("I focus Quality rather than Quantity"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.240), ARGB(255, 255, 255, 255))
DrawTextA(tostring("I need your feedbacks to improve it"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.255), ARGB(255, 255, 255, 255))
DrawTextA(tostring("I care every single feedback and try to add everything"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.270), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Hope you are enjoy my script.."), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.285), ARGB(255, 255, 255, 255))
DrawTextA(tostring("You can change every settings to your like :)"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.300), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Did you like my script > Upvote me on scriptstatus and on forum"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.315), ARGB(255, 255, 255, 255))
DrawTextA(tostring("Don't forget these are VIP;"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.330), ARGB(255, 96, 48, 0))
DrawTextA(tostring("  Anti-Afk"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.345), ARGB(255, 255, 255, 255))
DrawTextA(tostring("  Auto Leveler "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.360), ARGB(255, 255, 255, 255))
DrawTextA(tostring("  Skin Changer "), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.375), ARGB(255, 255, 255, 255))
local w, h1, h2 = (WINDOW_W*0.49), (WINDOW_H*.70), (WINDOW_H*.75)
DrawLine(w, h1/1.775, w, h2/1.68, w*.11, ARGB(255, 0, 0, 0))
DrawRectangleButton(WINDOW_W*0.467, WINDOW_H/2.375, WINDOW_W*.047, WINDOW_H*.041, ARGB(255, 255, 255, 255))
DrawTextA(tostring("OK"), WINDOW_H*.02, (WINDOW_W/2)*.98, (WINDOW_H/2.375), ARGB(255, 0, 0, 0 ),"center","center")
DrawTextA(tostring("                                                                                               Credits"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.395), ARGB(255, 96, 48, 0))
DrawTextA(tostring("                                                                              Furry- For this awesome popup"), WINDOW_H*.015, (WINDOW_W/2.65), (WINDOW_H*.410), ARGB(255, 255, 255, 255))
end
for _, target in pairs(GetEnemyHeroes()) do
if ValidTarget(target, 15000) then
if self.Config.other.targetcal and not myHero.dead then
local drawpos=WorldToScreen(D3DXVECTOR3(target.x, target.y, target.z))
local comboText,color = self:GetDraws(target)
if comboText then
DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
end
end
end
end
for _, target in pairs(GetEnemyHeroes()) do
if ValidTarget(target, 15000) then
if target.visible and not target.dead and self.Config.other.damage then
currLine = 1
DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
currLine = currLine + 1
end
end
end
end
function Diana:killsteal()
for _, unit in pairs(GetEnemyHeroes()) do
local health = unit.health
local dmgQ = self:GetQDmg(unit)
if(self.tsq.target ~= nil and  self.QSpell:IsReady() and health<dmgQ and self.Config.killsteal.useQ and self.Config.killsteal.ks )then
self:CastQ(unit)
end
local dmgW = self:GetWDmg(unit)
if(self.tsw.target ~= nil and  self.WSpell:IsReady() and health<dmgW and self.Config.killsteal.useW   and self.Config.killsteal.ks)then
self:CastW(unit)
end
local dmgI =(50+ ((myHero.level)*20))
if(health<dmgI and self.Config.killsteal.useI and self.Config.killsteal.ks and GetDistance(unit)<600)then
self:CastI(unit)
end
local dmgR =self:GetRDmg(unit)
if(self.tsr.target ~= nil and  self.RSpell:IsReady() and health<dmgR and self.Config.killsteal.useR and self.Config.killsteal.ks and GetDistance(unit)<550)then
self:CastR(unit)
end
end
end
function Diana:writecfg(param)
local file = io.open(SCRIPT_PATH.."\\".."config.cfg", "w")
if not file then
-- print("Error in Write CFG")
end
if param ~= "ftc" then
file:write(ava_languages[self.Config.lang])
-- print("Written: "..ava_languages[self.Config.lang])
else
file:write("eng")
--  print("W: English")
end
file:close()
end
function Diana:ProcessSpell(unit, spell)
--[[ if spell.name == "attack"  then
if unit and unit.type == myHero.type and unit.team ~= myHero.team and spell and spell.target and spell.target ~= nil and spell.target.isMe then
if (self.Config.skilllogic.Wlogic.useW and self.WSpell:IsReady() and self.tsw.target~=nil) then
self:CastW(unit)
end
end
end]]
if Interrupt[unit.charName] ~= nil then
spell = Interrupt[unit.charName].stop[spell.name]
if spell ~= nil then
if self.Config.misc.interrupt[spell.name] then
if ValidTarget(unit) and GetDistance(unit) < self.ESpell.Range  and self.ESpell:IsReady()  and self.Config.misc.interrupt.r then
  self:CastE(unit)
end
end
end
end
end

function Diana:checkts()
self.ts:update()
self.tse:update()
self.tsq:update()
self.tsr:update()
self.tsw:update()
self.tsg:update()
if not self.tsg.target~=nil or not self.Config.targetsel.ts then
target = self.ts.target
elseif self.tsg.target~=nil or self.selectedTar then
target = self.selectedTar
end
end
function Diana:walk()
myHero:MoveTo(mousePos.x,mousePos.z)
end
function Diana:escape()
if self.Config.Keys.escapekey  then
self:walk()
end
end
function Diana:harass()
if(self.tsq.target~=nil and self.Config.harass.useQ and  self.Config.Keys.harasskey  and self.QSpell:IsReady())then
self:CastQ(target)
end
if(self.tsw.target~=nil  and self.Config.harass.useW and  self.Config.Keys.harasskey  and self.WSpell:IsReady())then
self:CastW(target)
end
if(self.tse.target~=nil  and self.Config.harass.useE and  self.Config.Keys.harasskey  and self.ESpell:IsReady())then
self:CastE(target)
end
end
function Diana:autoq()
if(self.tsq.target~=nil and self.Config.Keys.autoq and  self.QSpell:IsReady())then
self:CastQ(target)
end
end
function Diana:CastQ(unit)
self.QSpell:Cast(unit)
end

function Diana:CastW(unit)
self.WSpell:Cast(unit)
end

function Diana:CastE(unit)
self.ESpell:Cast(unit)
end

function Diana:CastR(unit)
self.RSpell:Cast(unit)
end
function Diana:CastI(unit)
self.Ignite:Cast(unit)
end
function Diana:GetQDmg(target)
if myHero:GetSpellData(_Q).level < 1 then
return 0
end
if self.QSpell:IsReady() then
local FinalDamage = (25 + (myHero:GetSpellData(_Q).level * 35) + (myHero.ap + (myHero.ap * myHero.apPercent) )*.7)
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Diana:GetWDmg(target)
if myHero:GetSpellData(_W).level < 1 then
return 0
end
if self.WSpell:IsReady() then
local FinalDamage = 3*(10 + (myHero:GetSpellData(_W).level * 12) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .2)
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Diana:GetRDmg(target)
if myHero:GetSpellData(_R).level < 1 then
return 0
end
if self.RSpell:IsReady() then
local FinalDamage = (40 + (myHero:GetSpellData(_R).level * 60) + (myHero.ap + (myHero.ap * myHero.apPercent) )* .6)
return myHero:CalcMagicDamage(target, FinalDamage)
else
return 0
end
end
function Diana:autozhonya()
if self.Config.item.enableautozhonya then
for _ = ITEM_1, ITEM_7 do
if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
end
end
end
end
function Diana:items()
if self.Config.item.usebg and self.Config.Keys.combokey then
for _ = ITEM_1, ITEM_7 do
if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastSpell(_)
end
end
end
if self.Config.item.usehg and self.Config.Keys.combokey then
for _ = ITEM_1, ITEM_7 do
if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastSpell(_)
end
end
end
end
function Diana:Antiafk()
if os.clock() < Clock or not self.Config.vip.antiafk.antiafk then return end
Clock = os.clock() + math.random(60,120)
myHero:MoveTo(myHero.x, myHero.z)
end
function Diana:autopot()
if os.clock() - lastPotion < 15 then return end
for SLOT = ITEM_1, ITEM_6 do
if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp then
if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp /100 )  then
CastSpell(SLOT)
lastPotion = os.clock()
end
end
end
end
function Diana:LoadMenu()
self.Config=scriptConfig(""..Scriptname.." [" .. myHero.charName.."]" ,"menu")

self.Config:addSubMenu(loc_choosen[1], "combo")
self.Config.combo:addParam("useQ", loc_choosen[2], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("useW", loc_choosen[3], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("useE", loc_choosen[4], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("useR", loc_choosen[5], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("useI", loc_choosen[6], SCRIPT_PARAM_ONOFF, true)
self.Config.combo:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 10, 10, 100, 0)
--self.Config.combo:addParam("logicgap", "Use QR to gapclose", SCRIPT_PARAM_LIST, 1, {"Only if target Killable", "Always" , "Never" })
self.Config.combo:addParam("logic", loc_choosen[7], SCRIPT_PARAM_LIST, 1, {loc_choosen[139], loc_choosen[140] , loc_choosen[141] })


self.Config:addSubMenu(loc_choosen[9], "harass")
self.Config.harass:addParam("useQ", loc_choosen[10], SCRIPT_PARAM_ONOFF, true)
self.Config.harass:addParam("useW", loc_choosen[11], SCRIPT_PARAM_ONOFF, true)
self.Config.harass:addParam("useE", loc_choosen[12], SCRIPT_PARAM_ONOFF, true)
self.Config.harass:addParam("Mana",loc_choosen[8],SCRIPT_PARAM_SLICE, 10, 10, 100, 0)


self.Config:addSubMenu(loc_choosen[14], "farm")

self.Config.farm:addSubMenu(loc_choosen[15],"laneclear")
self.Config.farm.laneclear:addParam("useQ",loc_choosen[16],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.laneclear:addParam("qcount",loc_choosen[180],SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
self.Config.farm.laneclear:addParam("useW",loc_choosen[17],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.laneclear:addParam("wcount",loc_choosen[181],SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.laneclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.laneclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
self.Config.farm.laneclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
self.Config.farm.laneclear:addParam("WMana",loc_choosen[186],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

self.Config.farm:addSubMenu(loc_choosen[20],"jungleclear")
self.Config.farm.jungleclear:addParam("useQ",loc_choosen[21],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.jungleclear:addParam("useW",loc_choosen[22],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.jungleclear:addParam("useE",loc_choosen[23],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.jungleclear:addParam("useR",loc_choosen[24],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.jungleclear:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.jungleclear:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
self.Config.farm.jungleclear:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
self.Config.farm.jungleclear:addParam("WMana",loc_choosen[186],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
self.Config.farm.jungleclear:addParam("EMana",loc_choosen[187],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)
self.Config.farm.jungleclear:addParam("RMana",loc_choosen[188],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

self.Config.farm:addSubMenu(loc_choosen[25],"lasthit")
self.Config.farm.lasthit:addParam("autolasthit",loc_choosen[189],SCRIPT_PARAM_ONOFF,false)
self.Config.farm.lasthit:addParam("useQ",loc_choosen[26],SCRIPT_PARAM_ONOFF,true)
self.Config.farm.lasthit:addParam("lasthitlogic",loc_choosen[191], SCRIPT_PARAM_LIST, 1, {loc_choosen[172],loc_choosen[190],loc_choosen[174]})
self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.lasthit:addParam("blank", "", SCRIPT_PARAM_INFO,"")
self.Config.farm.lasthit:addParam("info2", loc_choosen[184], SCRIPT_PARAM_INFO,"")
self.Config.farm.lasthit:addParam("QMana",loc_choosen[185],SCRIPT_PARAM_SLICE, 30, 10, 100, 0)

self.Config:addSubMenu(loc_choosen[35], "killsteal")
self.Config.killsteal:addParam("ks",loc_choosen[36],SCRIPT_PARAM_ONOFF,true)
self.Config.killsteal:addParam("useQ", loc_choosen[37], SCRIPT_PARAM_ONOFF, true)
self.Config.killsteal:addParam("useR", loc_choosen[40], SCRIPT_PARAM_ONOFF, true)
self.Config.killsteal:addParam("useI", loc_choosen[41], SCRIPT_PARAM_ONOFF, true)

--[[  self.Config:addSubMenu("Escape Settings","escape")
self.Config.escape:addParam("useR","Use R Minion To Escape",SCRIPT_PARAM_ONOFF,true)
self.Config.escape:addParam("useQR","Use QR Minion To Escape",SCRIPT_PARAM_ONOFF,true)]]
self.Config:addSubMenu(loc_choosen[42], "item")
self.Config.item:addSubMenu(loc_choosen[192], "autopot")
self.Config.item.autopot:addParam("enableautopothp", loc_choosen[193], SCRIPT_PARAM_ONOFF, false)
self.Config.item.autopot:addParam("autopothp", loc_choosen[194], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
self.Config.item:addParam("enableautozhonya", loc_choosen[43], SCRIPT_PARAM_ONOFF, false)
self.Config.item:addParam("autozhonya", loc_choosen[44], SCRIPT_PARAM_SLICE, 10, 0, 100, 0)
self.Config.item:addParam("usehg", loc_choosen[45], SCRIPT_PARAM_ONOFF, false)
self.Config.item:addParam("usebg", loc_choosen[46], SCRIPT_PARAM_ONOFF, false)

self.Config:addSubMenu(loc_choosen[92], "misc")
self.Config.misc:addSubMenu(loc_choosen[93], "interrupt")
self.Config.misc.interrupt:addParam("r", loc_choosen[96], SCRIPT_PARAM_ONOFF, true)
self.Config.misc.interrupt:addParam("info3", loc_choosen[98], SCRIPT_PARAM_INFO,"")
for i, a in pairs(GetEnemyHeroes()) do
if Interrupt[a.charName] ~= nil then
for i, spell in pairs(Interrupt[a.charName].stop) do
self.Config.misc.interrupt:addParam(spell.spellName, a.charName.." - "..spell.name, SCRIPT_PARAM_ONOFF, true)
end
end

end

self.Config.misc:addParam("emax", loc_choosen[142], SCRIPT_PARAM_ONOFF, true)
--self.Config.misc:addParam("useW", "Auto W skill if enemy attacks.", SCRIPT_PARAM_ONOFF, true)
Clock = os.clock()
if VIP_USER then
self.Config:addSubMenu(loc_choosen[47], "vip")
self.Config.vip:addParam("packet",loc_choosen[48],SCRIPT_PARAM_ONOFF,false)
self.Config.vip:addParam("info1", "", SCRIPT_PARAM_INFO,"")
self.Config.vip:addParam("info2", loc_choosen[49], SCRIPT_PARAM_INFO,"")
self.Config.vip:addSubMenu(loc_choosen[50], "level")
self.Config.vip.level:addParam("key",loc_choosen[51],SCRIPT_PARAM_ONOFF,false)
self.Config.vip.level:addParam("logic", loc_choosen[52], SCRIPT_PARAM_LIST, 7, {loc_choosen[58], loc_choosen[59],loc_choosen[60],loc_choosen[61],loc_choosen[62], loc_choosen[63], loc_choosen[64]  })
self.Config.vip:addSubMenu(loc_choosen[53], "skin")
self.Config.vip.skin:addParam("key",loc_choosen[54],SCRIPT_PARAM_ONOFF,false)
self.Config.vip.skin:addParam('selected' .. myHero.charName .. 'Skin', loc_choosen[57], SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
self.Config.vip.skin:addParam("info5", loc_choosen[55], SCRIPT_PARAM_INFO,"")
--self.Config.vip:addParam("info5", "Skin Hack temporary disabled until next update. .", SCRIPT_PARAM_INFO,"")
self.Config.vip:addSubMenu(loc_choosen[195], "antiafk")
self.Config.vip.antiafk:addParam("antiafk",loc_choosen[196],SCRIPT_PARAM_ONOFF,false)
self.Config.vip:addParam("info3", "", SCRIPT_PARAM_INFO,"")
self.Config.vip:addParam("info4", loc_choosen[56], SCRIPT_PARAM_INFO,"")
end
self.Config:addSubMenu(loc_choosen[65],"other")
--self.Config.other:addSubMenu("Show Damage On Hp Bar", "HPBAR")
--self.Config.other.HPBAR:addParam("key","ON/OFF",SCRIPT_PARAM_ONOFF,true)
self.Config.other:addSubMenu(loc_choosen[66], "draw")
self.Config.other.draw:addParam("qdraw",loc_choosen[67],SCRIPT_PARAM_ONOFF,true)
self.Config.other.draw:addParam("wdraw",loc_choosen[68],SCRIPT_PARAM_ONOFF,true)
self.Config.other.draw:addParam("edraw",loc_choosen[69],SCRIPT_PARAM_ONOFF,true)
self.Config.other.draw:addParam("rdraw",loc_choosen[70],SCRIPT_PARAM_ONOFF,true)
self.Config.other.draw:addParam("aadraw",loc_choosen[71],SCRIPT_PARAM_ONOFF,false)
self.Config.other:addSubMenu(loc_choosen[198], "color")
self.Config.other.color:addParam("Qcolor", loc_choosen[199], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
self.Config.other.color:addParam("Wcolor", loc_choosen[200], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
self.Config.other.color:addParam("Ecolor", loc_choosen[201], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
self.Config.other.color:addParam("Rcolor", loc_choosen[202], SCRIPT_PARAM_COLOR,{255, 255, 255, 255})
self.Config.other.color:addParam("AAcolor", loc_choosen[204], SCRIPT_PARAM_COLOR,{255, 255,0,0})
self.Config.other.color:addParam("targetselect", loc_choosen[205], SCRIPT_PARAM_COLOR,{255, 255,0,0})
self.Config.other:addSubMenu(loc_choosen[206], "width")
self.Config.other.width:addParam("Qwidth", loc_choosen[210], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("Wwidth", loc_choosen[211], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("Ewidth", loc_choosen[212], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("Rwidth", loc_choosen[213], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("AAwidth", loc_choosen[209], 4, 2, 1, 10, 0)
self.Config.other.width:addParam("STwidth", loc_choosen[208], 4, 6, 1, 10, 0)
self.Config.other:addParam("target",loc_choosen[75],SCRIPT_PARAM_ONOFF,true)
self.Config.other:addParam("damage",loc_choosen[214],SCRIPT_PARAM_ONOFF,true)
self.Config.other:addParam("targetcal",loc_choosen[76],SCRIPT_PARAM_ONOFF,true)
self.Config.other:addSubMenu(loc_choosen[73], "perma")
self.Config.other.perma:addParam("perma",loc_choosen[74],SCRIPT_PARAM_ONOFF,true)

self.Config:addSubMenu(loc_choosen[77],"targetsel")
self.Config.targetsel:addParam("infoK2", "", SCRIPT_PARAM_INFO,"")
self.Config.targetsel:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
self.Config.targetsel:addParam("ts",loc_choosen[78],SCRIPT_PARAM_ONOFF,false)
self.ts.name  = "Diana"
self.Config.targetsel:addTS(self.ts)

self.Config:addSubMenu(loc_choosen[79], "Keys")
self.Config.Keys:addParam("infoK3", loc_choosen[80], SCRIPT_PARAM_INFO,"")
self.Config.Keys:addParam("combokey", loc_choosen[81], SCRIPT_PARAM_ONKEYDOWN, false, 32)
self.Config.Keys:addParam("infoK4", loc_choosen[82], SCRIPT_PARAM_INFO,"")
self.Config.Keys:addParam("harasskey", loc_choosen[83], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
self.Config.Keys:addParam("autoq", loc_choosen[91], SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
self.Config.Keys:addParam("infoK5", loc_choosen[84], SCRIPT_PARAM_INFO,"")
self.Config.Keys:addParam("laneclearkey", loc_choosen[85], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
self.Config.Keys:addParam("jungleclearkey", loc_choosen[86], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
self.Config.Keys:addParam("lasthitkey",loc_choosen[215], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
self.Config.Keys:addParam("infoK6", loc_choosen[87], SCRIPT_PARAM_INFO,"")
self.Config.Keys:addParam("escapekey", loc_choosen[88], SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Y"))
--self.Config.Keys:addParam("lasthitkey", "Lasthit Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
self.Config.Keys:addParam("infoK", "", SCRIPT_PARAM_INFO,"")
self.Config.Keys:addParam("infoK2", loc_choosen[89], SCRIPT_PARAM_INFO,"")
self.Config:addSubMenu(loc_choosen[110], "Keys2")

OrbwalkManager:LoadCommonKeys(self.Config.Keys2)
self.Config:addParam("lang", loc_choosen[165], SCRIPT_PARAM_LIST, 1, {loc_choosen[166], loc_choosen[167],loc_choosen[168]})
self.Config:addParam("instruct", loc_choosen[216], SCRIPT_PARAM_ONOFF, false)

if self.Config.other.perma.perma then
DelayAction(function() self.Config:permaShow("infobox") end, 1)
DelayAction(function()self.Config.Keys:permaShow("combokey") end, 1.2)
DelayAction(function()self.Config.Keys:permaShow("harasskey") end, 1.2)
DelayAction(function() self.Config.Keys:permaShow("autoq") end, 1.2)
end
end
--[[function Diana:gapclose()
local Qdmg=getDmg("Q",target,myHero)
local Wdmg=getDmg("W",target,myHero)
local Edmg=getDmg("E",target,myHero)
local Rdmg=getDmg("R",target,myHero)
local Idmg=(50+ ((myHero.level)*20))
local fulcombo= Qdmg + Wdmg + Edmg + Rdmg
if (target.health < fulcombo and self.Config.combo.logicgap == 1 and GetDistance(unit)>830 and self.tsg.target~=nil) then
self:CastQR(minion)
elseif  (self.Config.combo.logicgap == 2 and GetDistance(unit)>830 and self.tsg.target~=nil) then
self:CastQR(minion)
end
end]]
function Diana:CastRQ(unit)
if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey   and self.QSpell:IsReady())then
self:CastQ(target)
end
if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey   and self.RSpell:IsReady()) then
DelayAction(function()self:CastR(target) end, 0.5)
end
end
function Diana:CastQR(unit)
local abuff = self:buff(minion)
if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey    and self.QSpell:IsReady())then
self:CastQ(minion)
end
if(self.tsr.target~=nil and self.Config.combo.useR and abuff and  self.Config.Keys.combokey   and self.RSpell:IsReady()) then
self:CastR(minion)
end
end
function Diana:combo1()
self:CastRQ(target)
if(self.tsw.target~=nil  and self.Config.combo.useW and  self.Config.Keys.combokey  and self.WSpell:IsReady() and not self.QSpell:IsReady())then
self:CastW(target)
end
if self.Config.misc.emax then
if(self.tse.target~=nil  and self.Config.combo.useE and GetDistance(target)>280 and self.Config.Keys.combokey  and self.ESpell:IsReady())then
self:CastE(target)
end
elseif not self.Config.misc.emax then
if(self.tse.target~=nil  and self.Config.combo.useE and  self.Config.Keys.combokey  and self.ESpell:IsReady())then
self:CastE(target)
end
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
function Diana:combo2()
local abuff = self:buff(target)
if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey  and self.QSpell:IsReady())then
self:CastQ(target)
end
if(self.tsr.target~=nil and self.Config.combo.useR and abuff and  self.Config.Keys.combokey  and not self.QSpell:IsReady() and self.RSpell:IsReady())then
self:CastR(target)
end
if(self.tsw.target~=nil  and self.Config.combo.useW and  self.Config.Keys.combokey  and self.WSpell:IsReady())then
self:CastW(target)
end
if self.Config.misc.emax then
if(self.tse.target~=nil  and self.Config.combo.useE and GetDistance(target)>280 and self.Config.Keys.combokey  and self.ESpell:IsReady()  )then
self:CastE(target)
end
elseif not self.Config.misc.emax then
if(self.tse.target~=nil  and self.Config.combo.useE and  self.Config.Keys.combokey  and self.ESpell:IsReady())then
self:CastE(target)
end
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
function Diana:combo3()
if(self.tsq.target~=nil and self.Config.combo.useQ and  self.Config.Keys.combokey  and self.QSpell:IsReady())then
self:CastQ(target)
end
if(self.tsw.target~=nil  and self.Config.combo.useW and  self.Config.Keys.combokey  and self.WSpell:IsReady())then
self:CastW(target)
end
if(self.tsr.target~=nil and self.Config.combo.useR and  self.Config.Keys.combokey  and not self.QSpell:IsReady() and self.RSpell:IsReady())then
self:CastR(target)
end
if self.Config.misc.emax then
if(self.tse.target~=nil  and self.Config.combo.useE and GetDistance(target)>280 and self.Config.Keys.combokey  and self.ESpell:IsReady() )then
self:CastE(target)
end
elseif not self.Config.misc.emax then
if(self.tse.target~=nil  and self.Config.combo.useE and  self.Config.Keys.combokey  and self.ESpell:IsReady())then
self:CastE(target)
end
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
function Diana:buff(unit)
return TargetHaveBuff('dianamoonlight', unit)
end
function Diana:WndMsg(Msg, Key)
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
if Msg == WM_LBUTTONDOWN then
if PopUp1 then
PopUp1 = false
end
end
end
function Diana:GetMyDmg(target)
if self.QSpell:IsReady() and self.RSpell:IsReady() and self.WSpell:IsReady() then
return self:GetQDmg(target) + self:GetRDmg(target) + self:GetWDmg(target)
elseif self.QSpell:IsReady()  and self.RSpell:IsReady() then
return self:GetQDmg(target) + self:GetRDmg(target)
elseif self.QSpell:IsReady()  and self.WSpell:IsReady() then
return self:GetQDmg(target) + self:GetWDmg(target)
elseif self.RSpell:IsReady() and self.WSpell:IsReady() then
return self:GetRDmg(target) +self:GetWDmg(target)
elseif self.QSpell:IsReady() then
return self:GetQDmg(target)
elseif self.WSpell:IsReady() then
return self:GetWDmg(target)
elseif self.RSpell:IsReady() then
return self:GetRDmg(target)
elseif self.QSpell:IsReady() and self.RSpell:IsReady() then
return self:GetQDmg(target) + self:GetRDmg(target)
else
return 0
end
end
function Diana:GetDraws(target)
local qdamage = self:GetQDmg(target)
local wdamage = self:GetWDmg(target)
local rdamage = self:GetRDmg(target)
local Idmg=(50+ ((myHero.level)*20))

if qdamage >target.health then
return 'Q', RGBA(0, 255, 0, 255)
elseif qdamage+ Idmg>target.health then
return 'Q + Ignite', RGBA(0, 255, 0, 255)
elseif wdamage >target.health then
return 'W', RGBA(0, 255, 0, 255)
elseif wdamage + Idmg>target.health then
return 'W + Ignite', RGBA(0, 255, 0, 255)
elseif rdamage  >target.health then
return 'R', RGBA(0, 255, 0, 255)
elseif rdamage + Idmg>target.health then
return 'R + Ignite', RGBA(0, 255, 0, 255)
elseif rdamage +wdamage  >target.health then
return 'R + W',RGBA(0, 255, 0, 255)
elseif rdamage +wdamage+ Idmg>target.health then
return 'R + W + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+wdamage>target.health then
return 'Q + W',RGBA(0, 255, 0, 255)
elseif qdamage+rdamage >target.health then
return 'Q + R',RGBA(0, 255, 0, 255)
elseif qdamage+wdamage+ Idmg>target.health then
return 'Q + W + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+rdamage+ Idmg>target.health then
return 'Q + R + Ignite',RGBA(0, 255, 0, 255)
elseif qdamage+wdamage+rdamage >target.health then
return 'Kill with full combo',RGBA(0, 255, 0, 255)
elseif qdamage+wdamage+rdamage+ Idmg>target.health then
return 'Full Combo + Ignite',RGBA(0, 255, 0, 255)
else
return "Cant Kill yet", RGBA(0, 255, 0, 255)
end
end
function Diana:skinhack()
if not skinload then
if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
lastTimeTickCalled = CurrentTimeInMillis()
if self.Config.vip.skin.key and self.Config.vip.packet  then
if self.Config.vip.skin['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
lastSkin = self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']
SendSkinPacket(myHero.charName, skinsPB[self.Config.vip.skin['selected' .. myHero.charName .. 'Skin']], myHero.networkID);
end
end
end
end
end
function Diana:autolevel()
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence1 =   { 1,2,3,1,1,4,1,2,1,2,4,2,2,3,3,4,3,3}
autoLevelSetSequence(levelSequence1)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence2 =   { 1,2,3,1,1,4,1,3,1,3,4,3,3,2,2,4,2,2}
autoLevelSetSequence(levelSequence2)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence3 =  { 2,3,1,2,2,4,2,1,2,1,4,1,1,3,3,4,3,3}
autoLevelSetSequence(levelSequence3)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence4 =  { 2,3,1,2,2,4,2,3,2,3,4,3,3,1,1,4,1,1}
autoLevelSetSequence(levelSequence4)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence5 =  { 3,1,2,3,3,4,3,2,3,2,4,2,2,1,1,4,1,1}
autoLevelSetSequence(levelSequence5)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence6 =  { 3,1,2,3,3,4,3,1,3,1,4,1,1,2,2,4,2,2}
autoLevelSetSequence(levelSequence6)
Last_LevelSpell = os.clock()
end
if( self.Config.vip.packet and self.Config.vip.level.key and self.Config.vip.level.logic == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
local levelSequence6 =  { 1,2,3,1,1,4,1,2,1,2,4,2,2,3,3,4,3,3}
autoLevelSetSequence(levelSequence6)
Last_LevelSpell = os.clock()
end
end
function Diana:JungleClear()
if(self.QSpell:IsReady() and self.Config.farm.jungleclear.useQ and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.QMana /100 ) then
self.QSpell:JungleClear()
end
if(self.WSpell:IsReady() and self.Config.farm.jungleclear.useW and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.WMana /100 ) then
self.WSpell:JungleClear()
end
if(self.ESpell:IsReady() and self.Config.farm.jungleclear.useE and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.EMana /100 ) then
self.ESpell:JungleClear()
end
if(self.RSpell:IsReady() and self.Config.farm.jungleclear.useR and self.Config.Keys.jungleclearkey ) and (myHero.mana / myHero.maxMana > self.Config.farm.jungleclear.RMana /100 ) then
self.RSpell:JungleClear()
end
end
function Diana:LastHit()
self.enemyMinions:update()
if self.Config.farm.lasthit.lasthitlogic == 1 then
for _, target in pairs(self.enemyMinions.objects) do
local Qdamage = self:GetQDmg(target)
if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 ) and ValidTarget(target,self.QSpell.Range)  and GetDistanceSqr(target) <= self.QSpell.Range * self.QSpell.Range and Qdamage >= target.health) then
self:CastQ(target)
end
end
elseif self.Config.farm.lasthit.lasthitlogic == 2 then
if(self.QSpell:IsReady() and self.Config.farm.lasthit.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.lasthit.QMana /100 )) then
self.QSpell:LastHit()
end
end
end
function Diana:LaneClear()
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
local NumberOfHits = self.Config.farm.laneclear.wcount
if NumberOfHits >= 1 and #self.enemyMinions.objects >= NumberOfHits then
if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useW and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.WMana /100 ) and GetDistance(minion) <= self.WSpell.Range then
self:CastW(cleartarget)
end
end
local NumberOfHits = self.Config.farm.laneclear.qcount
if NumberOfHits >= 1 and #self.enemyMinions.objects >= NumberOfHits then
if self.Config.Keys.laneclearkey  and self.Config.farm.laneclear.useQ and (myHero.mana / myHero.maxMana > self.Config.farm.laneclear.QMana /100 ) and GetDistance(minion) <= self.QSpell.Range then
local BestPos, BestHit = GetBestLineFarmPosition(self.QSpell.Range, self.QSpell.Width, self.enemyMinions.objects )
if BestPos ~= nil and  BestHit >= NumberOfHits then
CastSpell(_Q, BestPos.x, BestPos.z)
end
end
end
end
end
end
function Diana:Unload()
self:writecfg()
end
function pointOnLine(myHero, unit, minion, extra)
local tominion = {x = minion.x - unit.x, z = minion.z - unit.z}
local tomyHero = {x = myHero.x - unit.x, z = myHero.z - unit.z}

local magitudeTomyHero = tomyHero.x ^ 2 + tomyHero.z ^ 2
local dotP = tominion.x * tomyHero.x + tominion.z * tomyHero.z

local distance = dotP / magitudeTomyHero

return unit.x + tomyHero.x * (distance + extra), unit.z + tomyHero.z * (distance + extra)
end
function DrawLineHPBar(damage, text, unit, enemyteam)
if unit.dead or not unit.visible then return end
local p = WorldToScreen(D3DXVECTOR3(unit.x, unit.y, unit.z))
if not OnScreen(p.x, p.y) then return end
local thedmg = 0
local line = 2
local linePosA  = {x = 0, y = 0 }
local linePosB  = {x = 0, y = 0 }
local TextPos   = {x = 0, y = 0 }


if damage >= unit.maxHealth then
thedmg = unit.maxHealth - 1
else
thedmg = damage
end

thedmg = math.round(thedmg)

local StartPos, EndPos = GetHPBarPos(unit)
local Real_X = StartPos.x + 24
local Offs_X = (Real_X + ((unit.health - thedmg) / unit.maxHealth) * (EndPos.x - StartPos.x - 2))
if Offs_X < Real_X then Offs_X = Real_X end
local mytrans = 350 - math.round(255*((unit.health-thedmg)/unit.maxHealth))
if mytrans >= 255 then mytrans=254 end
local my_bluepart = math.round(400*((unit.health-thedmg)/unit.maxHealth))
if my_bluepart >= 255 then my_bluepart=254 end


if enemyteam then
linePosA.x = Offs_X-150
linePosA.y = (StartPos.y-(30+(line*15)))
linePosB.x = Offs_X-150
linePosB.y = (StartPos.y-10)
TextPos.x = Offs_X-148
TextPos.y = (StartPos.y-(30+(line*15)))
else
linePosA.x = Offs_X-125
linePosA.y = (StartPos.y-(30+(line*15)))
linePosB.x = Offs_X-125
linePosB.y = (StartPos.y-15)

TextPos.x = Offs_X-122
TextPos.y = (StartPos.y-(30+(line*15)))
end

DrawLine(linePosA.x, linePosA.y, linePosB.x, linePosB.y , 2, ARGB(mytrans, 255, my_bluepart, 0))
DrawText(tostring(thedmg).." "..tostring(text), 15, TextPos.x, TextPos.y , ARGB(mytrans, 255, my_bluepart, 0))
end


function DrawLineHPBar2(damage, text, unit, line)
local thedmg = 0
if damage >= unit.maxHealth then
thedmg = unit.maxHealth-1
else
thedmg=damage
end
local StartPos, EndPos = GetHPBarPos(unit)
local Real_X = StartPos.x+24
local Offs_X = (Real_X + ((unit.health-thedmg)/unit.maxHealth) * (EndPos.x - StartPos.x - 2))
if Offs_X < Real_X then
Offs_X = Real_X
end
DrawLine(Offs_X-150, StartPos.y-(line*15), StartPos.x-20, StartPos.y-(line*15), 10, ARGB(140, 0, 0, 0))
end
local floor = math.floor
function DrawRectangleButton(x, y, w, h, color)
local points = {}
points[1] = D3DXVECTOR2(floor(x), floor(y))
points[2] = D3DXVECTOR2(floor(x + w), floor(y))
local points2 = {}
points2[1] = D3DXVECTOR2(floor(x), floor(y - h/2))
points2[2] = D3DXVECTOR2(floor(x + w), floor(y - h/2))
points2[3] = D3DXVECTOR2(floor(x + w), floor(y + h/2))
points2[4] = D3DXVECTOR2(floor(x), floor(y + h/2))
local t = GetCursorPos()
polygon = Polygon(Point(points2[1].x, points2[1].y), Point(points2[2].x, points2[2].y), Point(points2[3].x, points2[3].y), Point(points2[4].x, points2[4].y))
if polygon:contains(Point(t.x, t.y)) then
DrawLines2(points, floor(h), color)
else
DrawLines2(points, floor(h), ARGB(150, 235, 183, 63 ))
end
end

---//==================================================\\---
--|| > SimpleLib                          ||--
---\\==================================================//---
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




---//==================================================\\---
--|| > OrbWalks                            ||--
---\\==================================================//---

function Viktor:findorbwalker()
if _G.Reborn_Loaded then
SAC=true and
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry has been found") end, 2)
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry integration has been finished succesfully") end, 8)
self.Config:addParam("infobox22", loc_choosen[114], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
elseif not _G.Reborn_Loaded and FileExist(LIB_PATH .. "SxOrbWalk.lua") then
SxOrb=true and
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk has been found") end, 2)
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk integration has been finished succesfully") end, 4)
require("SxOrbWalk")
self.Config:addParam("infobox22", loc_choosen[115], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
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
function Akali:findorbwalker()
if _G.Reborn_Loaded then
SAC=true and
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry has been found") end, 2)
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry integration has been finished succesfully") end, 8)
self.Config:addParam("infobox22", loc_choosen[114], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
elseif not _G.Reborn_Loaded and FileExist(LIB_PATH .. "SxOrbWalk.lua") then
SxOrb=true and
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk has been found") end, 2)
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk integration has been finished succesfully") end, 4)
require("SxOrbWalk")
self.Config:addParam("infobox22", loc_choosen[115], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
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
function Diana:findorbwalker()
if _G.Reborn_Loaded then
SAC=true and
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry has been found") end, 2)
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Sidas Auto Carry integration has been finished succesfully") end, 8)
self.Config:addParam("infobox22", loc_choosen[114], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
elseif not _G.Reborn_Loaded and FileExist(LIB_PATH .. "SxOrbWalk.lua") then
SxOrb=true and
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk has been found") end, 2)
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk integration has been finished succesfully") end, 4)
require("SxOrbWalk")
self.Config:addParam("infobox22", loc_choosen[115], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
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
self.Config:addParam("infobox22", loc_choosen[114], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
elseif not _G.Reborn_Loaded and FileExist(LIB_PATH .. "SxOrbWalk.lua") then
SxOrb=true and
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk has been found") end, 2)
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk integration has been finished succesfully") end, 4)
require("SxOrbWalk")
self.Config:addParam("infobox22", loc_choosen[115], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
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
self.Config:addParam("infobox22", loc_choosen[114], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
elseif not _G.Reborn_Loaded and FileExist(LIB_PATH .. "SxOrbWalk.lua") then
SxOrb=true and
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk has been found") end, 2)
DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> SxOrbWalk integration has been finished succesfully") end, 4)
require("SxOrbWalk")
self.Config:addParam("infobox22", loc_choosen[115], SCRIPT_PARAM_INFO,"")
self.Config:addParam("info3", "___________________________________________", SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox", "               "..Scriptname.."", SCRIPT_PARAM_INFO, "")
self.Config:addParam("infobox2",loc_choosen[111], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox6", loc_choosen[112], SCRIPT_PARAM_INFO,"")
self.Config:addParam("infobox5", loc_choosen[113], SCRIPT_PARAM_INFO,"")
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

function OnUnload()
if VIP_USER and not skinload  then
SendSkinPacket(myHero.charName, nil, myHero.networkID)
end
end
