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

---//==================================================\\---
--|| > Korean Translation details               ||--
---\\==================================================//---
local loc_kr = {
--General Menu(Combo) // 8 // 1
"콤보 설정", "콤보에 Q 사용", “콤보에 W 사용", "콤보에 E 사용", "콤보에 R 사용" ,
"타겟을 죽일 수 있을때 점화 사용","콤보 로직","마나 관리 %",
--General Menu(Harass) // 5 // 9
"딜교 설정","딜교에 Q 사용","딜교에 W 사용","딜교에 E 사용","딜교에 R 사용",
--General Menu(Clear) // 16 // 14
"파밍 설정","라인클리어 설정","라인클리어에 Q 사용","라인클리어에 W 사용",”라인클리어에 E 사용","라인클리어에 R 사용",
"정글클리어 설정","정클클리어에 Q 사용”,”정글클리어에 W 사용","정글클리어에 E 사용","정글클리어에 R 사용",
"막타 설정","막타에 Q 사용","막타에 W 사용","막타에 E 사용","막타에 R 사용",
--General Menu(Escape) // 5 // 30
"도주 설정","도주시 Q 사용","도주시 W 사용","도주시 E 사용","도주시 R 사용",
--General Menu(Killsteal) // 7 // 35
"킬스틸 설정","킬스틸 사용","스틸에 Q 사용","스틸에 W 사용","스틸에 E 사용","스틸에 R 사용","스틸에 점화 사용",
--General Menu(Item Settings) // 5 // 42
"아이템 설정","자동 존야", "체력이 몇℅ 이하일 경우 존야 사용", "마법공학 총검 사용", "빌지워터 사용",
--General Menu(Vip Settings) // 19 // 47
"VIP 설정”,"패킷 캐스팅 사용","VIP 설정을 사용하면, 패킷 캐스팅이 활성화될 것입니다.", "자동 레벨업 세팅","자동 레벨업 사용",
"스킬 순서 선택","스킨핵 설정","스킨핵 사용","패킷 캐스팅을 활성화했는지 확인하세요.",
"VIP설정을 사용하려면, BOL 포럼에서 VIP여야만 합니다.","스킨 선택",
"Q>W>E 고정", "Q>E>W 고정","W>Q>E 고정","W>E>Q 고정","E>W>Q 고정", "E>Q>W 고정", "스마트" ,
--General Menu(Draw Settings) // 12 // 65
"그리기 설정","스킬 그리기 설정","Q 스킬 출력","W 스킬 출력","E 스킬 출력","R 스킬 출력","자동 공격 사거리",
"콤보 모드 출력","Permabox 출력","Permabox 출력 ( 재로딩 필요 )","선택된 타겟 표시","타겟 계산",
--General Menu(Target Selectors) // 2 // 77
"타겟셀렉터","좌클릭으로 타겟을 선택",
--General Menu(Key Settings) // 13 // 79
"키 설정", "<------------------콤보 키 설정------------------>","콤보 키","<------------------딜교 키 설정------------------>", 
"스마트 딜교 키","<------------------클리어 키 설정-------------------->","라인클리어 키","정글클리어 키", 
"<------------------기타 키 설정-------------------->","도주 키", "Orbwalk와 같은 키로 설정하세요.","Orbwalk 키 설정",
"자동 딜교 Q",
--General Menu(Misc Settings) // 7 // 92
"기타 설정", "[" .. myHero.charName.. "] - 자동 스킬 차단","Q 스킬로 스킬 차단","W 스킬로 스킬 차단","E 스킬로 스킬 차단",
"R 스킬로 스킬 차단","                  [지원되는 스킬]",
-- General Menu(Skill Logic) // 6 // 99
"스킬 로직","Q 스킬 로직","W 스킬 로직","E 스킬 로직","R 스킬 로직","체력 관리 %",
-- General Menu(Hitchance Settings) // 5 // 105
"히트찬스","Q 히트찬스","W 히트찬스","E 히트찬스","R 히트찬스",
-- General Menu(Orbwalk Settings) // 5  // 110
"OrbWalker키 설정",
"                 스크립트 버전:  "..Version.. "         ","            스크립트 제작: "..Author.. "         ",
"       리그 오브 레전드 버전:  "..LVersion.. "         ","현재 Orbwalker:                      Sidas Auto Carry",
"현재 Orbwalker:                             SxOrbWalk", 
-- Leblanc Menu // 13 // 116
"Q>E>W>R", "Q>R>E>W", "E>Q>W>R", "E>W>Q>R" ,"랜덤 스킬 순서","W 스킬 재사용 설정","Q>E>W>R 모드에서 W로 돌아가기 ",
"Q>R>E>W 모드에서 W로 돌아가기","E>Q>W>R 모드에서 W로 돌아가기","E>W>Q>R 모드에서 W로 돌아가기",
"랜덤 스킬 순서 모드에서 W로 돌아가기 ","스틸에 QW 사용","E 스킬만 사용 (스턴)","콤보모드 키 선택",
-- Akali Menu // 9
"2명", "3명" , "4명","5명","Q가 타겟에 있을때만 R 사용", "돌진 스킬","적이 몇명 이상이면 은신 사용","체력이 몇% 이하일경우 은신 사용","은신 사용 (W)",
-- Diana Menu // 4
"스마트 콤보", "타겟에 표식이 있으면 R 사용" , "모든것을 빠르게 사용","적이 280보다 가까이 있을때만 E 사용",
-- Lissandraa Menu // 17
"콤보 모드시 E 로직","딜교 모드시 E 로직","E2로 접근", "E2 사용 안함 ( 추천)" ,
"E2 사용 안함 (추천)", "E2로 접근" ,"스마트", "도주용으로 사용", "적에게 사용" ,"본인에게 자동R",
"체력이 몇% 이하일 경우 자동R", "E2로 접근하는건 아직 베타입니다.", "콤보 모드시 R 로직", “스마트 R 로직을 사용하면, 자동R이 생깁니다.",
"W로 접근 차단","이 기능은 아직 베타입니다.",
-- Viktor Menu // 5
"궁극기 로직","타겟을 잡을 수 있을때 궁 사용","대상에게 직접 궁 사용" ,"E 히트찬스 (기본값 = 1.6)","E 히트찬스 (기본값 = 2)",”스마트 자동 딜교",
-- language menu// 5
"Language","English", "Turkish","German","Korean",
-- Extrass// 
"궁으로 접근 시작"
}
