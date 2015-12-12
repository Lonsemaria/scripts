--[[ Since I don't know your language, it should be the exactly same order and same organization.
I also copy my turkish translations to be an example]]





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
--General Menu(Ýtem Settings) // 5 // 42
"Item Settings","Auto Zhonya", "Zhonya if Health under -> %", "Use Hextech Gunblade", "Use Bilgewater Cutlass",
--General Menu(Výp Settings) // 19 // 47
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
"Language","English", "Turkish","German","Korean",
-- Extrass// 
"Start Engage With Your Ulti "
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
--General Menu(Ýtem Settings) // 5
"Item Ayarlari","Otomatik Zhonya", "Zhonya Eger can -> %", "Hextech Gunblade kullan", "Bilgewater Cutlass kullan",
--General Menu(Výp Settings) // 19
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
"R Yetenegi Ýle durdur","                  [Desteklenen Yetenekler]",
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
"2 düsman", "3 düsman" , "4 düsman","5 düsman","Q Hedefteyse R Kullan", "Yetenekleri Direk Kullan","Görünmezlik(W) kullan hedef >","Görünmezlik(W) kullan Can %",
"Görünmezlik(W) kullan",
-- Diana Menu // 4
"Akilli Kombo", "Hedef isaretli ise R kullan" , "Bütün yetenekleri hizlica kullan","E yetenegini mesafe > 280 kullan",
-- Lissandraa Menu // 17
"Kombo modu icin E ayarlari","Durtme modu icin E ayarlari","2. E ile basla", "2. E'yi kullanma ( önerilen)" ,
"2. E'yi kullanma (onerilen)", "2. E ile basla" ,"Akilli", "Kendini koru", "Dusman icin kullan" ,"Kendine otomatik R",
"Otomatik R can altindaysa -> %", "2. E ile basla ayari test asamasindadir..", "Kombo modu icin R ayarlari", "Akilli R ayarlari için kendine otomatik R acik olmalidir.",
"W kullanarak dusmani uzak tut","Bu ozellik hala test asamasindadir..",
-- Viktor Menu // 5
"Ulti Ayarlari","Hedef olucek ise Ulti Kullan","Ultiyi Direk Kullan" ,"E Tutturma Orani (Normali = 1.6)","E Tutturma Orani (Normali = 2)","Otomatik durtme",
-- language menu// 5
"Dil Secimi","Ingilizce", "Turkce","Almanca","Korece",
-- Extrass// 
"Komboyu ulti ile baslat "
}