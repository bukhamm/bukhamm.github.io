;InnoSetupVersion=5.5.7

[Setup]
AppName=UltraISO
AppVerName=UltraISO Premium V9.76
AppId=UltraISO
AppVersion=9.76
AppPublisher=EZB Systems, Inc.
DefaultDirName={pf32}\UltraISO
DefaultGroupName=UltraISO
UninstallDisplayIcon={app}\UltraISO.exe
OutputBaseFilename=uiso97pes
Compression=lzma2
DisableDirPage=auto
DisableProgramGroupPage=auto
LicenseFile=embedded\License.txt
WizardImageFile=embedded\WizardImage0.bmp
WizardSmallImageFile=embedded\WizardSmallImage0.bmp

[Files]
Source: "{app}\UltraISO.exe"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: overwritereadonly ignoreversion 
Source: "{app}\isoshell,1.dll"; DestDir: "{app}"; DestName: "isoshell.dll"; Check: "NotX64"; MinVersion: 0.0,5.0; Flags: regserver noregerror onlyifdoesntexist 32bit 
Source: "{app}\isoshell,2.dll"; DestDir: "{app}"; DestName: "isoshell.dll"; Check: "IsX64"; MinVersion: 0.0,5.0; Flags: onlyifdoesntexist 
Source: "{app}\isoshl64,1.dll"; DestDir: "{app}"; DestName: "isoshl64.dll"; Check: "IsX64"; MinVersion: 0.0,5.0; Flags: regserver noregerror onlyifdoesntexist 64bit 
Source: "{app}\isoshl64,2.dll"; DestDir: "{app}"; DestName: "isoshl64.dll"; Check: "NotX64"; MinVersion: 0.0,5.0; Flags: onlyifdoesntexist 
Source: "{app}\drivers\ISODrive,1.sys"; DestDir: "{app}\drivers"; DestName: "ISODrive.sys"; Tasks: isodrive; Check: "IsWin2kToWin7"; MinVersion: 0.0,5.0; Flags: onlyifdoesntexist ignoreversion 
Source: "{app}\drivers\ISODrv64,1.sys"; DestDir: "{app}\drivers"; DestName: "ISODrv64.sys"; Tasks: isodrive; Check: "IsWin2kToWin7"; MinVersion: 0.0,5.0; Flags: onlyifdoesntexist ignoreversion 
Source: "{app}\drivers\ISODrive,2.sys"; DestDir: "{app}\drivers"; DestName: "ISODrive.sys"; Tasks: isodrive; Check: "IsWin8OrNewer"; MinVersion: 0.0,5.0; Flags: onlyifdoesntexist ignoreversion 
Source: "{app}\drivers\ISODrv64,2.sys"; DestDir: "{app}\drivers"; DestName: "ISODrv64.sys"; Tasks: isodrive; Check: "IsWin8OrNewer"; MinVersion: 0.0,5.0; Flags: onlyifdoesntexist ignoreversion 
Source: "{app}\drivers\IsoCmd.exe"; DestDir: "{app}\drivers"; Tasks: isodrive; Check: "IsWin2k"; MinVersion: 0.0,5.0; Flags: overwritereadonly ignoreversion 
Source: "{app}\drivers\FileDlg.exe"; DestDir: "{app}\drivers"; MinVersion: 0.0,5.0; Flags: overwritereadonly ignoreversion 
Source: "{app}\drivers\bootpart,1.sys"; DestDir: "{app}\drivers"; DestName: "bootpart.sys"; Check: "IsWin2kToWin7"; MinVersion: 0.0,5.0; Flags: overwritereadonly ignoreversion 
Source: "{app}\drivers\bootpt64,1.sys"; DestDir: "{app}\drivers"; DestName: "bootpt64.sys"; Check: "IsWin2kToWin7"; MinVersion: 0.0,5.0; Flags: overwritereadonly ignoreversion 
Source: "{app}\drivers\bootpart,2.sys"; DestDir: "{app}\drivers"; DestName: "bootpart.sys"; Check: "IsWin8OrNewer"; MinVersion: 0.0,5.0; Flags: overwritereadonly ignoreversion 
Source: "{app}\drivers\bootpt64,2.sys"; DestDir: "{app}\drivers"; DestName: "bootpt64.sys"; Check: "IsWin8OrNewer"; MinVersion: 0.0,5.0; Flags: overwritereadonly ignoreversion 
Source: "{app}\drivers\bootpart.exe"; DestDir: "{app}\drivers"; Check: "IsWin2k"; MinVersion: 0.0,5.0; Flags: overwritereadonly ignoreversion 
Source: "{cf32}\EZB Systems\lame_enc.dll"; DestDir: "{cf32}\EZB Systems"; MinVersion: 0.0,5.0; Flags: overwritereadonly ignoreversion 
Source: "{app}\ultraiso.chm"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\License.txt"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\Readme.txt"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\History.txt"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_de.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_fr.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_it.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_es.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_pt.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_nl.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_se.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_pl.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_cz.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_hu.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_ru.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_ua.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_bg.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_tr.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_kr.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_gr.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_yu.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_by.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_he.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_br.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_dk.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_no.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_lv.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_ar.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_si.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_cn.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_tw.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_et.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_sk.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_ct.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_fi.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_mk.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_hr.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_ro.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_lt.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_sr.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_ir.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_jp.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_vn.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_my.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 
Source: "{app}\lang\lang_id.dll"; DestDir: "{app}\lang"; MinVersion: 0.0,5.0; 

[Dirs]
Name: "{userdocs}\My ISO Files"; 
Name: "{app}\backup"; 

[Registry]
Root: HKLM; Subkey: "Software\EasyBoot Systems"; MinVersion: 0.0,5.0; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\EasyBoot Systems\UltraISO"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems"; MinVersion: 0.0,5.0; Flags: uninsdeletekeyifempty 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueType: String; ValueData: "{app}"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueType: String; ValueData: "{app}"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Shared"; ValueType: String; ValueData: "{cf32}\EZB Systems"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Shared"; ValueType: String; ValueData: "{cf32}\EZB Systems"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "XPBurn"; ValueType: String; ValueData: "0"; MinVersion: 0.0,5.0; Flags: createvalueifdoesntexist uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "ISOFolder"; ValueType: String; ValueData: "{userdocs}\My ISO Files"; Check: "DirExists(ExpandConstant('{userdocs}'))"; MinVersion: 0.0,5.0; Flags: createvalueifdoesntexist uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "UseSkins"; ValueType: String; ValueData: "1"; MinVersion: 0.0,5.0; Flags: createvalueifdoesntexist uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "SoundEffect"; ValueType: String; ValueData: "1"; MinVersion: 0.0,5.0; Flags: createvalueifdoesntexist uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1033"; Languages: "en"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1031"; Languages: "de"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1036"; Languages: "fr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1040"; Languages: "it"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1034"; Languages: "es"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "2070"; Languages: "pt"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1043"; Languages: "nl"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1053"; Languages: "se"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1045"; Languages: "pl"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1029"; Languages: "cz"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1038"; Languages: "hu"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1049"; Languages: "ru"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1058"; Languages: "ua"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1026"; Languages: "bg"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1055"; Languages: "tr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1042"; Languages: "kr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1032"; Languages: "gr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "2074"; Languages: "yu"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1059"; Languages: "by"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1037"; Languages: "he"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1046"; Languages: "br"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1030"; Languages: "dk"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1044"; Languages: "no"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1062"; Languages: "lv"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "10241"; Languages: "ar"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1060"; Languages: "si"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "2052"; Languages: "cn"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1028"; Languages: "tw"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1061"; Languages: "et"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1051"; Languages: "sk"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1027"; Languages: "ct"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1035"; Languages: "fi"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1071"; Languages: "mk"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1050"; Languages: "hr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1048"; Languages: "ro"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1257"; Languages: "lt"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1065"; Languages: "ir"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1041"; Languages: "jp"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1066"; Languages: "vn"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1086"; Languages: "my"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCU; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Language"; ValueType: String; ValueData: "1057"; Languages: "id"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\EasyBoot Systems\UltraISO\5.0"; ValueName: "Install"; ValueType: String; ValueData: "1"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: ".iso"; ValueType: String; ValueData: "UltraISO"; Tasks: associate; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: ".isz"; ValueType: String; ValueData: "UltraISO"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: ".ui"; ValueType: String; ValueData: "UltraISO"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO File"; Tasks: associate; Languages: "en"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO Datei"; Tasks: associate; Languages: "de"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Fichier UltraISO"; Tasks: associate; Languages: "fr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "File di UltraISO"; Tasks: associate; Languages: "it"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Archivo UltraISO"; Tasks: associate; Languages: "es"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Ficheiro UltraISO"; Tasks: associate; Languages: "pt"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO Bestand"; Tasks: associate; Languages: "nl"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO Fil"; Tasks: associate; Languages: "se"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO plik"; Tasks: associate; Languages: "pl"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO soubor"; Tasks: associate; Languages: "cz"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO fájl"; Tasks: associate; Languages: "hu"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Ôàéë UltraISO"; Tasks: associate; Languages: "ru"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO ôàéë"; Tasks: associate; Languages: "ua"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO Ôàéë"; Tasks: associate; Languages: "bg"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO Dosyası"; Tasks: associate; Languages: "tr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO ÆÄÀÏ"; Tasks: associate; Languages: "kr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Áñ÷åßï UltraISO"; Tasks: associate; Languages: "gr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO Fajl"; Tasks: associate; Languages: "yu"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO ôàéë"; Tasks: associate; Languages: "by"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO ÷åáõ"; Tasks: associate; Languages: "he"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Arquivo UltraISO"; Tasks: associate; Languages: "br"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO Fil"; Tasks: associate; Languages: "dk"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO Fil"; Tasks: associate; Languages: "no"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO fails"; Tasks: associate; Languages: "lv"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO ãáİ"; Tasks: associate; Languages: "ar"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Datoteka UltraISO"; Tasks: associate; Languages: "si"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO ÎÄ¼ş"; Tasks: associate; Languages: "cn"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO ¤å¥ó"; Tasks: associate; Languages: "tw"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO fail"; Tasks: associate; Languages: "et"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Súbor programu UltraISO"; Tasks: associate; Languages: "sk"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Fitxer UltraISO"; Tasks: associate; Languages: "ct"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO-tiedosto"; Tasks: associate; Languages: "fi"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO Äàòîòåêà"; Tasks: associate; Languages: "mk"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO datoteka"; Tasks: associate; Languages: "hr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Fisier UltraISO"; Tasks: associate; Languages: "ro"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO failas"; Tasks: associate; Languages: "lt"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO İÇíá"; Tasks: associate; Languages: "ir"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "UltraISO ƒtƒ@ƒCƒ‹"; Tasks: associate; Languages: "jp"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Tâòp tin UltraISO"; Tasks: associate; Languages: "vn"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Fail UltraISO"; Tasks: associate; Languages: "my"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO"; ValueType: String; ValueData: "Berkas UltraISO"; Tasks: associate; Languages: "id"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\DefaultIcon"; ValueType: String; ValueData: """{app}\UltraISO.exe"",0"; Tasks: associate; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Open with &UltraISO"; Tasks: associate; Languages: "en"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Öffnen mit &UltraISO"; Tasks: associate; Languages: "de"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Ouvrir avec &UltraISO"; Tasks: associate; Languages: "fr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Apri con &UltraISO"; Tasks: associate; Languages: "it"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Abrir con &UltraISO"; Tasks: associate; Languages: "es"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Abre com o &UltraISO"; Tasks: associate; Languages: "pt"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Open met &UltraISO"; Tasks: associate; Languages: "nl"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Öppna med &UltraISO"; Tasks: associate; Languages: "se"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Otwórz u¿ywaj¹c &UltraISO"; Tasks: associate; Languages: "pl"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Otevøít programem &UltraISO"; Tasks: associate; Languages: "cz"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Megnyitás &UltraISO -val"; Tasks: associate; Languages: "hu"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Îòêğûòü èñïîëüçóÿ &UltraISO"; Tasks: associate; Languages: "ru"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Â³äêğèòè ç &UltraISO"; Tasks: associate; Languages: "ua"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Îòâàğÿíå ñ &UltraISO"; Tasks: associate; Languages: "bg"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "&UltraISO ile aç"; Tasks: associate; Languages: "tr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "UltraISO·Î ¿­±â(&U)"; Tasks: associate; Languages: "kr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "¢íïéãìá ìå ôï &UltraISO"; Tasks: associate; Languages: "gr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Otvori sa &UltraISO"; Tasks: associate; Languages: "yu"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Àä÷ûí³öü ó &UltraISO"; Tasks: associate; Languages: "by"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "&UltraISO ôúç òì-éãé"; Tasks: associate; Languages: "he"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Aberto por &UltraISO"; Tasks: associate; Languages: "br"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Åben med &UltraISO"; Tasks: associate; Languages: "dk"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Åpne med &UltraISO"; Tasks: associate; Languages: "no"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Atvçrt ar &UltraISO"; Tasks: associate; Languages: "lv"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "&UltraISO İÊÍ ÈæÇÓØÉ"; Tasks: associate; Languages: "ar"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Odprto pri &UltraISO"; Tasks: associate; Languages: "si"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "ÓÃ &UltraISO ´ò¿ª"; Tasks: associate; Languages: "cn"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "¥Î &UltraISO ¥´¶}"; Tasks: associate; Languages: "tw"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Ava &UltraISO-ga"; Tasks: associate; Languages: "et"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Otvori?v programe &UltraISO"; Tasks: associate; Languages: "sk"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Obre amb l’&UltraISO"; Tasks: associate; Languages: "ct"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Avaa &UltraISOlla"; Tasks: associate; Languages: "fi"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "&Îòâîğè ñî UltraISO"; Tasks: associate; Languages: "mk"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Otvori sa &UltraISO"; Tasks: associate; Languages: "hr"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Deschide cu &UltraISO"; Tasks: associate; Languages: "ro"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Atidaryti su &UltraISO"; Tasks: associate; Languages: "lt"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "&UltraISO ÔæÏä ÈÇ"; Tasks: associate; Languages: "ir"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "UltraISO ‚©‚çŠJ‚­(&U)"; Tasks: associate; Languages: "jp"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "MõÒ bãÌng &UltraISO"; Tasks: associate; Languages: "vn"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Buka dengan &UltraISO"; Tasks: associate; Languages: "my"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open"; ValueType: String; ValueData: "Buka dengan &UltraISO"; Tasks: associate; Languages: "id"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "UltraISO\shell\open\command"; ValueType: String; ValueData: """{app}\UltraISO.exe"" ""%1"""; Tasks: associate; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: ".bin"; ValueType: String; ValueData: "binimage"; Tasks: associate; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "binimage"; ValueType: String; ValueData: "BIN File"; Tasks: associate; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "binimage\DefaultIcon"; ValueType: String; ValueData: """{app}\UltraISO.exe"",0"; Tasks: associate; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "binimage\shell\Convert to ISO\command"; ValueType: String; ValueData: """{app}\UltraISO.exe"" -bin2iso ""%1"""; Tasks: associate; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKCR; Subkey: "binimage\shell\open\command"; ValueType: String; ValueData: """{app}\UltraISO.exe"" ""%1"""; Tasks: associate; MinVersion: 0.0,5.0; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Services\ISODrive\Parameters"; ValueName: "AutoMount"; ValueType: Dword; ValueData: "$1"; Tasks: isodrive; Check: "IsWin2k"; MinVersion: 0.0,5.0; Flags: uninsdeletekey 

[Run]
Filename: "{app}\Readme.txt"; Description: "View the README file"; Languages: "en"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Launch UltraISO"; Languages: "en"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "README-Datei lesen"; Languages: "de"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "UltraISO starten"; Languages: "de"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Afficher Lisez-Moi"; Languages: "fr"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Lancer UltraISO"; Languages: "fr"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Visualizza il file README"; Languages: "it"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Esegui UltraISO"; Languages: "it"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Ver el archivo README"; Languages: "es"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Abrir UltraISO"; Languages: "es"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Visualizar o ficheiro Readme"; Languages: "pt"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Executar o UltraISO"; Languages: "pt"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Bekijk het README-bestand"; Languages: "nl"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Start UltraISO op"; Languages: "nl"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Granska README-filen"; Languages: "se"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Starta UltraISO"; Languages: "se"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "czytaj plik README"; Languages: "pl"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Uruchom UltraISO"; Languages: "pl"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Zobrazit README soubor"; Languages: "cz"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Spustit UltraISO"; Languages: "cz"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Olvass el! megtekintése"; Languages: "hu"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "UltraISO futtatása"; Languages: "hu"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Ïğîñìîòğåòü README"; Languages: "ru"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Çàïóñòèòü UltraISO"; Languages: "ru"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "×èòàòè README ôàéë"; Languages: "ua"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Çàâàíòàæèòè UltraISO"; Languages: "ua"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Ïğåãëåä íà README ôàéëà"; Languages: "bg"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Ñòàğòèğàíå íà UltraISO"; Languages: "bg"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "BeniOku dosyasını görüntüle"; Languages: "tr"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "UltraISO'yu çalıştır"; Languages: "tr"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "README ÆÄÀÏ º¸±â"; Languages: "kr"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "UltraISO ½ÇÇà"; Languages: "kr"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "ĞñïâïëŞ áñ÷åßïõ README"; Languages: "gr"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Åêêßíçóç UltraISO"; Languages: "gr"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Pokazi README fajl"; Languages: "yu"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Pokreni UltraISO"; Languages: "yu"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Ïğàãëÿä ôàéëà README"; Languages: "by"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Çàïóñö³öü UltraISO"; Languages: "by"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "README äöâ àú ÷åáõ"; Languages: "he"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "UltraISO äôòì"; Languages: "he"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Visualizar arquivo README"; Languages: "br"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Iniciar UltraISO"; Languages: "br"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Læs README filen (Engelsk)"; Languages: "dk"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Start UltraISO"; Languages: "dk"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Les README filen"; Languages: "no"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Start UltraISO"; Languages: "no"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Apskatît README failu"; Languages: "lv"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Palaist UltraISO"; Languages: "lv"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "README ÚÑÖ ãáİ"; Languages: "ar"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "UltraISO ÊÔÛíá"; Languages: "ar"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Poglej datoteko README"; Languages: "si"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Zaeni UltraISO"; Languages: "si"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "²é¿´ README ÎÄ¼ş"; Languages: "cn"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "ÔËĞĞ UltraISO"; Languages: "cn"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "¬d¬İ README ¤å¥ó"; Languages: "tw"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "¹B¦æ UltraISO"; Languages: "tw"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Vaata seletusfaili (LoeMind)"; Languages: "et"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Käivita UltraISO"; Languages: "et"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Zobrazi?súbor README"; Languages: "sk"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Spusti?program UltraISO"; Languages: "sk"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Veure el fitxer LLEGEIX-ME"; Languages: "ct"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Executa l’UltraISO"; Languages: "ct"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Katso README tiedosto"; Languages: "fi"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Käynnistä UltraISO"; Languages: "fi"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Âèäè ¼à README äàòîòåêàòà"; Languages: "mk"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Ñòàğòóâà¼ ãî UltraISO"; Languages: "mk"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Pogledaj README datoteku"; Languages: "hr"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Pokreni UltraISO"; Languages: "hr"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Deschide fisierul README"; Languages: "ro"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Lanseaza UltraISO"; Languages: "ro"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Skaityti README failà"; Languages: "lt"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Paleisti UltraISO"; Languages: "lt"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "äãÇíÔ İÇíá ãÊäí ÑÇåäãÇ"; Languages: "ir"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "UltraISO ÇÌÑÇí"; Languages: "ir"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "»•iî•ñ‚ğ“Ç‚Ş"; Languages: "jp"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "UltraISO‚ğÀs‚·‚é"; Languages: "jp"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Xem tâòp tin README"; Languages: "vn"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Chaòy UltraISO"; Languages: "vn"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Papar fail README"; Languages: "my"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Mulakan UltraISO"; Languages: "my"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\Readme.txt"; Description: "Tampilkan berkas README"; Languages: "id"; MinVersion: 0.0,5.0; Flags: shellexec postinstall unchecked skipifsilent nowait
Filename: "{app}\UltraISO.exe"; Description: "Jalankan UltraISO"; Languages: "id"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait
Filename: "{app}\drivers\isocmd.exe"; Parameters: "-i"; Tasks: isodrive; Check: "IsWin2k"; MinVersion: 0.0,5.0; 

[UninstallRun]
Filename: "{app}\drivers\isocmd.exe"; Parameters: "-r"; Tasks: isodrive; Check: "IsWin2k"; MinVersion: 0.0,5.0; 

[Icons]
Name: "{group}\UltraISO"; Filename: "{app}\UltraISO.exe"; WorkingDir: "{app}"; MinVersion: 0.0,5.0; 
Name: "{group}\UltraISO Help"; Filename: "{app}\ultraiso.chm"; MinVersion: 0.0,5.0; 
Name: "{group}\UltraISO Online Order"; Filename: "http://www.ezbsystems.com/ultraiso/order.htm"; MinVersion: 0.0,5.0; 
Name: "{group}\UltraISO Web Site"; Filename: "http://www.ezbsystems.com/index.php"; MinVersion: 0.0,5.0; 
Name: "{group}\UltraISO Readme"; Filename: "{app}\Readme.txt"; MinVersion: 0.0,5.0; 
Name: "{group}\UltraISO Revision History"; Filename: "{app}\History.txt"; MinVersion: 0.0,5.0; 
Name: "{group}\Uninstall UltraISO"; Filename: "{uninstallexe}"; MinVersion: 0.0,5.0; 
Name: "{commondesktop}\UltraISO"; Filename: "{app}\UltraISO.exe"; WorkingDir: "{app}"; Tasks: desktopicon; MinVersion: 0.0,5.0; 

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; Languages: "en"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Associate UltraISO with the .iso file extension"; Languages: "en"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "en"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Desktop-Symbol erstellen"; Languages: "de"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: ".ISO Dateien mit UltraISO verknüpfen"; Languages: "de"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "de"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Créer une icône &bureau"; Languages: "fr"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Associer UltraISO avec les extentions .iso"; Languages: "fr"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "Installer émulateur ISO CD/DVD (lecteur ISO)"; Languages: "fr"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Crea l'icona sul &desktop"; Languages: "it"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Associa a UltraISO i file con estensione .iso"; Languages: "it"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Configura emulatore CD/DVD ISO (ISODrive)"; Languages: "it"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Crear un acceso directo en el escritorio"; Languages: "es"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Asociar UltraISO con la extensión .iso"; Languages: "es"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Instalar unidad virtual de CD/DVD (ISODrive)"; Languages: "es"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Crie um icon no &desktop"; Languages: "pt"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Associe UltraISO com as extensões .iso"; Languages: "pt"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "pt"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Maak een bureaublad-icoon"; Languages: "nl"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "Verbind UltraISO met de .iso-bestandsextensie"; Languages: "nl"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "nl"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Skapa en &ikon på Skrivbordet"; Languages: "se"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Associera UltraISO med .iso filer"; Languages: "se"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "se"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Utwórz ikonê na &pulpicie"; Languages: "pl"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Powi¹¿ UltraISO z plikami o rozszerzeniu .iso"; Languages: "pl"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "U&staw emulator CD/DVD ISO (ISODrive)"; Languages: "pl"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "&Vytvoøit ikonu na ploše"; Languages: "cz"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Asociovat UltraISO se soubory typu .iso"; Languages: "cz"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Nastavit emulátor ISO CD/DVD(disk ISO)"; Languages: "cz"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Készítsen az &asztalon ikont"; Languages: "hu"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&UltraISO társítása az .iso fájl kiterjesztéssel"; Languages: "hu"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "ISO CD/DVD emulátor (ISODrive) telepítése"; Languages: "hu"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Äîáàâèòü èêîíêó íà &Ğàáî÷èé ñòîë"; Languages: "ru"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Àññîöèèğîâàòü .iso ôàéë ñ UltraISO"; Languages: "ru"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "Óñòàíîâèòü ISO CD/DVD ıìóëÿòîğ (ISODrive)"; Languages: "ru"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Ñòâîğèòè íà &ğîáî÷îìó ñòîë³ ³êîíêó"; Languages: "ua"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Àñîö³şâàòè UltraISO ç .iso ôàéëàìè"; Languages: "ua"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "Âñòàíîâèòè ISO CD/DVD åìóëÿòî?(ISODrive)"; Languages: "ua"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Ñúçäàâàíå íà èêîíà íà &äåñêòîïà"; Languages: "bg"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Ñâúğçâàíå íà UltraISO ñ .iso ôàéëîâè ğàçøèğåíèÿ"; Languages: "bg"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Íàñòğîéê?íà ISO CD/DVD åìóëàòîğ (ISODrive)"; Languages: "bg"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "&Masaüstünde UltraISO için ikon oluştur"; Languages: "tr"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: ".iso &uzantılı dosyalarla UltraISO'yu ilişkilendir"; Languages: "tr"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&ISO CD/DVD Sanal Sürücüsünü Kur (ISODrive)"; Languages: "tr"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "¹ÙÅÁÈ­¸é ¾ÆÀÌÄÜ »ı¼º(&D)"; Languages: "kr"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "UltraISO¿¡ .iso ÆÄÀÏ È®ÀåÀÚ ¿¬°á(&A)"; Languages: "kr"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "ISO CD/DVD °¡»ó µå¶óÀÌºê ¼³Ä¡(&S) (ISOµå¶óÀÌºê)"; Languages: "kr"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "&Äçìéïõñãßá åéêïíéäßïõ óôç åğéöÜíåéá åñãáóßáò"; Languages: "gr"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Äéáóıíäåóç ôïõ UltraISO ìå ôá áñ÷åßá .iso"; Languages: "gr"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Åãêáôáóôáó?ISO CD / DVD emulator (ISODrive)"; Languages: "gr"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Kreiraj ikonu na &biro"; Languages: "yu"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Asociraj UltraISO sa .iso fajl ekstenzije"; Languages: "yu"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "Podešavanje ISO CD/DVD oponašanja (ISO ureğaj)"; Languages: "yu"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Ñòâàğûöü &çíà÷îê íà ïğàöî¢íûì ñòàëå"; Languages: "by"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Àñàöûÿâàöü UltraISO ç ïàøûğıííåì ôàéëà¢ .iso"; Languages: "by"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "by"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "öåø ñîì ùåìçï òáåãä"; Languages: "he"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&.iso òí ÷åáõ ñéåîú UltraISO ùééê"; Languages: "he"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&äâãø ëåğï ú÷ìéèåøé?åéøèåàìé"; Languages: "he"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Criar Icone na Area de Trabalho"; Languages: "br"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Associar UltraISO com arquivos extenção .iso"; Languages: "br"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Instalar unidade virtual de CD/DVD ISO (ISODrive)"; Languages: "br"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Lav et ikon på skrivebordet"; Languages: "dk"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Forbind UltraISO med .iso filtype"; Languages: "dk"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "dk"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Lag et &ikon på skrivebordet"; Languages: "no"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Assosier UltraISO med .iso filtypen"; Languages: "no"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Innstaller ISO CD/DVD emulator (ISODrive)"; Languages: "no"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Izveidot &darbgalda ikonu"; Languages: "lv"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Saistît UltraISO ar .iso failu paplağinâjumu"; Languages: "lv"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "lv"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "ÅäÔÇÁ ÃíŞæäÉ Úáì ÓØÍ ÇáãßÊÈ"; Languages: "ar"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: ".iso ãÚ ãáİÇÊ UltraISO ÅÔÑÇß"; Languages: "ar"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "(ISODrive) ISO CD/DVD ÅÚÏÇÏ ãÍÇßí"; Languages: "ar"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Naredi &ikono na namizju"; Languages: "si"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Zdrui UltraISO z .iso datotekami"; Languages: "si"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Namesti ISO CD/DVD emulator (ISODrive)"; Languages: "si"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "ÔÚ×ÀÃæ´´½¨Í¼±ê"; Languages: "cn"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "½¨Á¢ UltraISO Óë .iso ÎÄ¼ş¹ØÁª"; Languages: "cn"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "°²×°ĞéÄâ ISO Çı¶¯Æ÷ (ISODrive)"; Languages: "cn"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "¦b®à­±³Ğ«Ø¹Ï¥Ü"; Languages: "tw"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "«Ø¥ß UltraISO »P .iso ¤å¥óÃöÁp"; Languages: "tw"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "¦w¸ËµêÀÀ ISO ÅX°Ê¾¹ (ISODrive)"; Languages: "tw"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "&Loo ikoon töölauale"; Languages: "et"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Sidesta UltraISO faililaiendiga .iso"; Languages: "et"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Paigaldatakse CD/DVD-emulaator (ISO-draiv)"; Languages: "et"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Vytvori?ikonu na ploche"; Languages: "sk"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Asociova?UltraISO so súbormi s príponou .iso"; Languages: "sk"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "sk"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "&Crea una icona a l’escriptori"; Languages: "ct"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Associa amb l’UltraISO els fitxers amb extensió .iso"; Languages: "ct"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Configuraci?de l’emulador ISO CD/DVD (ISODrive)"; Languages: "ct"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Luo &pikakuvake työpöydälle"; Languages: "fi"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Kytke .iso tiedostopääte ohjelmaan"; Languages: "fi"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&ISO CD/DVD-emulaattorin asetukset (ISO-asema)"; Languages: "fi"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Êğåèğà¼ èêîíà íà &Äåñêòîï-îò"; Languages: "mk"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Ïğèäğóæè ãî UltraISO ñî .iso åêñòåíçèè"; Languages: "mk"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Èíñòàëèğà¼ ISO CD/DVD åìóëàòîğ (ISODrive)"; Languages: "mk"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Stvori ikonu na ra&dnoj površini"; Languages: "hr"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Pridrui UltraISO .iso proširenju"; Languages: "hr"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Namjesti ISO CD/DVD emulator (ISODrive)"; Languages: "hr"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Creaza icon pe &desktop"; Languages: "ro"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Asociaza UltraISO cu fisierele cu extensia .iso"; Languages: "ro"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "ro"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Sukurti piktogramà ant &darbastalio"; Languages: "lt"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Susieti UltraISO su .iso failais"; Languages: "lt"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Setup ISO CD/DVD emulator (ISODrive)"; Languages: "lt"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "ÓÇÎÊ ÔãÇíá ãíÒßÇÑ"; Languages: "ir"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "ãæÌæÏí .iso åãÈÓÊí äÑã ÇİÒÇÑ ÈÇ İÇíá åÇí"; Languages: "ir"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "& CD/DVD äÕ?ÏÑÇí?ãÌÇÒ?"; Languages: "ir"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "ƒfƒXƒNƒgƒbƒv‚ÉƒVƒ‡[ƒgƒJƒbƒg‚ğì¬‚·‚é(&D)"; Languages: "jp"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: ".isoŠg’£q‚ªUltraISO‚ÉŠÖ˜A•t‚¯‚é(&A)"; Languages: "jp"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "ISO CD‚Ü‚½‚ÍDVDƒhƒ‰ƒCƒu‚ğƒCƒ“ƒXƒg[ƒ‹‚·‚é(ISOƒhƒ‰ƒCƒu)(&S)"; Languages: "jp"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Taòo môòt icon õÒ &desktop"; Languages: "vn"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Liên kêìt UltraISO võìi ğuôi mõÒ rôòng .iso"; Languages: "vn"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&CaÌi ğãòt mô phoÒng ISO CD/DVD (ÔÒ ğiŞa ISO)"; Languages: "vn"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Bina ikon di &desktop"; Languages: "my"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Kaitkan UltraISO dengan fail bersambungan .iso"; Languages: "my"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Bina pemacu maya CD/DVD ISO (ISODrive)"; Languages: "my"; MinVersion: 0.0,5.0; 
Name: "desktopicon"; Description: "Buat ikon pada &desktop"; Languages: "id"; MinVersion: 0.0,5.0; 
Name: "associate"; Description: "&Asosasi UltraISO dengan ekstensi berkas .iso"; Languages: "id"; MinVersion: 0.0,5.0; 
Name: "isodrive"; Description: "&Pengaturan CD/DVD emulator ISO (ISODrive)"; Languages: "id"; MinVersion: 0.0,5.0; 

[UninstallDelete]
Type: files; Name: "{sys}\drivers\isodrive.sys"; 
Type: files; Name: "{sys}\drivers\ISODrv64.sys"; 

[CustomMessages]
en.NameAndVersion=%1 version %2
en.AdditionalIcons=Additional shortcuts:
en.CreateDesktopIcon=Create a &desktop shortcut
en.CreateQuickLaunchIcon=Create a &Quick Launch shortcut
en.ProgramOnTheWeb=%1 on the Web
en.UninstallProgram=Uninstall %1
en.LaunchProgram=Launch %1
en.AssocFileExtension=&Associate %1 with the %2 file extension
en.AssocingFileExtension=Associating %1 with the %2 file extension...
AutoStartProgramGroupDescription=Startup:
AutoStartProgram=Automatically start %1
AddonHostProgramNotFound=%1 could not be located in the folder you selected.%n%nDo you want to continue anyway?
de.NameAndVersion=%1 Version %2
de.AdditionalIcons=Zusätzliche Symbole:
de.CreateDesktopIcon=&Desktop-Symbol erstellen
de.CreateQuickLaunchIcon=Symbol in der Schnellstartleiste erstellen
de.ProgramOnTheWeb=%1 im Internet
de.UninstallProgram=%1 entfernen
de.LaunchProgram=%1 starten
de.AssocFileExtension=&Registriere %1 mit der %2-Dateierweiterung
de.AssocingFileExtension=%1 wird mit der %2-Dateierweiterung registriert...
de.AutoStartProgramGroupDescription=Beginn des Setups:
de.AutoStartProgram=Starte automatisch%1
de.AddonHostProgramNotFound=%1 konnte im ausgewählten Ordner nicht gefunden werden.%n%nMöchten Sie dennoch fortfahren?
fr.NameAndVersion=%1 version %2
fr.AdditionalIcons=Icônes supplémentaires :
fr.CreateDesktopIcon=Créer une icône sur le &Bureau
fr.CreateQuickLaunchIcon=Créer une icône dans la barre de &Lancement rapide
fr.ProgramOnTheWeb=Page d'accueil de %1
fr.UninstallProgram=Désinstaller %1
fr.LaunchProgram=Exécuter %1
fr.AssocFileExtension=&Associer %1 avec l'extension de fichier %2
fr.AssocingFileExtension=Associe %1 avec l'extension de fichier %2...
fr.AutoStartProgramGroupDescription=Démarrage :
fr.AutoStartProgram=Démarrer automatiquement %1
fr.AddonHostProgramNotFound=%1 n'a pas été trouvé dans le dossier que vous avez choisi.%n%nVoulez-vous continuer malgré tout ?
it.NameAndVersion=%1 versione %2
it.AdditionalIcons=Icone aggiuntive:
it.CreateDesktopIcon=Crea un'icona sul &desktop
it.CreateQuickLaunchIcon=Crea un'icona nella &barra 'Avvio veloce'
it.ProgramOnTheWeb=Sito web di %1
it.UninstallProgram=Disinstalla %1
it.LaunchProgram=Avvia %1
it.AssocFileExtension=&Associa i file con estensione %2 a %1
it.AssocingFileExtension=Associazione dei file con estensione %2 a %1...
it.AutoStartProgramGroupDescription=Esecuzione automatica:
it.AutoStartProgram=Esegui automaticamente %1
it.AddonHostProgramNotFound=Impossibile individuare %1 nella cartella selezionata.%n%nVuoi continuare ugualmente?
es.NameAndVersion=%1 versión %2
es.AdditionalIcons=Iconos adicionales:
es.CreateDesktopIcon=Crear un icono en el &escritorio
es.CreateQuickLaunchIcon=Crear un icono de &Inicio Rápido
es.ProgramOnTheWeb=%1 en la Web
es.UninstallProgram=Desinstalar %1
es.LaunchProgram=Ejecutar %1
es.AssocFileExtension=&Asociar %1 con la extensión de archivo %2
es.AssocingFileExtension=Asociando %1 con la extensión de archivo %2...
es.AutoStartProgramGroupDescription=Inicio:
es.AutoStartProgram=Iniciar automáticamente %1
es.AddonHostProgramNotFound=%1 no pudo ser localizado en la carpeta seleccionada.%n%n¿Desea continuar de todas formas?
pt.NameAndVersion=%1 versão %2
pt.AdditionalIcons=Ícones adicionais:
pt.CreateDesktopIcon=Criar ícone no Ambiente de &Trabalho
pt.CreateQuickLaunchIcon=&Criar ícone na barra de Iniciação Rápida
pt.ProgramOnTheWeb=%1 na Web
pt.UninstallProgram=Desinstalar o %1
pt.LaunchProgram=Executar o %1
pt.AssocFileExtension=Associa&r o %1 aos ficheiros com a extensão %2
pt.AssocingFileExtension=A associar o %1 aos ficheiros com a extensão %2...
pt.AutoStartProgramGroupDescription=Inicialização Automática:
pt.AutoStartProgram=Iniciar %1 automaticamente
pt.AddonHostProgramNotFound=Não foi possível localizar %1 na pasta seleccionada.%n%nDeseja continuar de qualquer forma?
nl.NameAndVersion=%1 versie %2
nl.AdditionalIcons=Extra snelkoppelingen:
nl.CreateDesktopIcon=Maak een snelkoppeling op het &bureaublad
nl.CreateQuickLaunchIcon=Maak een snelkoppeling op de &Snel starten werkbalk
nl.ProgramOnTheWeb=%1 op het Web
nl.UninstallProgram=Verwijder %1
nl.LaunchProgram=&Start %1
nl.AssocFileExtension=&Koppel %1 aan de %2 bestandsextensie
nl.AssocingFileExtension=Bezig met koppelen van %1 aan de %2 bestandsextensie...
nl.AutoStartProgramGroupDescription=Opstarten:
nl.AutoStartProgram=%1 automatisch starten
nl.AddonHostProgramNotFound=%1 kon niet worden gevonden in de geselecteerde map.%n%nWilt u toch doorgaan?
se.NameAndVersion=%1 version %2
se.AdditionalIcons=Återstående ikoner:
se.CreateDesktopIcon=Skapa en ikon på skrivbordet
se.CreateQuickLaunchIcon=Skapa en ikon i Snabbstartfältet
se.ProgramOnTheWeb=%1 på Webben
se.UninstallProgram=Avinstallera %1
se.LaunchProgram=Starta %1
se.AssocFileExtension=Associera %1 med %2 filnamnstillägg
se.AssocingFileExtension=Associerar %1 med %2 filnamnstillägg...
se.AutoStartProgramGroupDescription=Autostart:
se.AutoStartProgram=Starta automatiskt %1
se.AddonHostProgramNotFound=%1 kunde inte hittas i katalogen du valde.%n%nVill du fortsätta ändå?
pl.NameAndVersion=%1 (wersja %2)
pl.AdditionalIcons=Dodatkowe skróty:
pl.CreateDesktopIcon=Utwórz skrót na &pulpicie
pl.CreateQuickLaunchIcon=Utwórz skrót na pasku &szybkiego uruchamiania
pl.ProgramOnTheWeb=Strona internetowa aplikacji %1
pl.UninstallProgram=Dezinstalacja aplikacji %1
pl.LaunchProgram=Uruchom aplikacjê %1
pl.AssocFileExtension=&Przypisz aplikacjê %1 do rozszerzenia pliku %2
pl.AssocingFileExtension=Przypisywanie aplikacji %1 do rozszerzenia pliku %2...
pl.AutoStartProgramGroupDescription=Autostart:
pl.AutoStartProgram=Automatycznie uruchamiaj aplikacjê %1
pl.AddonHostProgramNotFound=Aplikacja %1 nie zosta³a znaleziona we wskazanym przez Ciebie folderze.%n%nCzy pomimo tego chcesz kontynuowaæ?
cz.NameAndVersion=%1 verze %2
cz.AdditionalIcons=Další zástupci:
cz.CreateDesktopIcon=Vytvoøit zástupce na &ploše
cz.CreateQuickLaunchIcon=Vytvoøit zástupce na panelu &Snadné spuštìní
cz.ProgramOnTheWeb=Aplikace %1 na internetu
cz.UninstallProgram=Odinstalovat aplikaci %1
cz.LaunchProgram=Spustit aplikaci %1
cz.AssocFileExtension=Vytvoøit &asociaci mezi soubory typu %2 a aplikací %1
cz.AssocingFileExtension=Vytváøí se asociace mezi soubory typu %2 a aplikací %1...
cz.AutoStartProgramGroupDescription=Po spuštìní:
cz.AutoStartProgram=Spouštìt aplikaci %1 automaticky
cz.AddonHostProgramNotFound=Aplikace %1 nebyla ve Vámi zvolené sloce nalezena.%n%nChcete pøesto pokraèovat?
hu.NameAndVersion=%1 %2 verzió
hu.AdditionalIcons=További ikonok:
hu.CreateDesktopIcon=Ikon létrehozása az &Asztalon
hu.CreateQuickLaunchIcon=Ikon létrehozása a &Gyorsindítás eszköztáron
hu.ProgramOnTheWeb=%1 a weben
hu.UninstallProgram=%1 eltávolítása
hu.LaunchProgram=%1 elindítása
hu.AssocFileExtension=A(z) %1 &társítása a(z) %2 fájlkiterjesztéssel
hu.AssocingFileExtension=A(z) %1 társítása a(z) %2 fájlkiterjesztéssel...
hu.AutoStartProgramGroupDescription=Indítópult:
hu.AutoStartProgram=%1 automatikus indítása
hu.AddonHostProgramNotFound=A(z) %1 nem található a kiválasztott mappában.%n%nMindenképpen folytatni kívánja?
ru.NameAndVersion=%1, âåğñèÿ %2
ru.AdditionalIcons=Äîïîëíèòåëüíûå çíà÷êè:
ru.CreateDesktopIcon=Ñîçäàòü çíà÷îê íà &Ğàáî÷åì ñòîëå
ru.CreateQuickLaunchIcon=Ñîçäàòü çíà÷îê â &Ïàíåëè áûñòğîãî çàïóñêà
ru.ProgramOnTheWeb=Ñàéò %1 â Èíòåğíåòå
ru.UninstallProgram=Äåèíñòàëëèğîâàòü %1
ru.LaunchProgram=Çàïóñòèòü %1
ru.AssocFileExtension=Ñâ&ÿçàòü %1 ñ ôàéëàìè, èìåşùèìè ğàñøèğåíèå %2
ru.AssocingFileExtension=Ñâÿçûâàíèå %1 ñ ôàéëàìè %2...
ru.AutoStartProgramGroupDescription=Àâòîçàïóñê:
ru.AutoStartProgram=Àâòîìàòè÷åñêè çàïóñêàòü %1
ru.AddonHostProgramNotFound=%1 íå íàéäåí â óêàçàííîé âàìè ïàïêå.%n%nÂû âñ¸ ğàâíî õîòèòå ïğîäîëæèòü?
ua.NameAndVersion=%1, âåğñ³ÿ %2
ua.AdditionalIcons=Äîäàòêîâ³ ÿğëèêè:
ua.CreateDesktopIcon=Ñòâîğèòè ÿğëèêè íà &Ğîáî÷îìó ñòîë³
ua.CreateQuickLaunchIcon=Ñòâîğèòè ÿğëèêè íà &Ïàíåë³ øâèäêîãî çàïóñêó
ua.ProgramOnTheWeb=Ñàéò %1 â ²íòåğíåò³
ua.UninstallProgram=Âèäàëèòè %1
ua.LaunchProgram=Â³äêğèòè %1
ua.AssocFileExtension=&Àñîö³şâàòè %1 ç ğîçøèğåííÿì ôàéëó %2
ua.AssocingFileExtension=Àñîö³şâàííÿ %1 ç ğîçøèğåííÿì ôàéëó %2...
ua.AutoStartProgramGroupDescription=Àâòîçàâàíòàæåííÿ:
ua.AutoStartProgram=Àâòîìàòè÷íî çàâàíòóæóâàòè %1
ua.AddonHostProgramNotFound=%1 íå çíàéäåíèé ó âêàçàí³é âàìè ïàïö³%n%nÂè âñå îäíî áàæàºòå ïğîäîâæèòè?
bg.NameAndVersion=%1, âåğñèÿ %2
bg.AdditionalIcons=Äîïúëíèòåëíè èêîíè:
bg.CreateDesktopIcon=Èêîíà íà &ğàáîòíèÿ ïëîò
bg.CreateQuickLaunchIcon=Èêîíà â ëåíòàòà "&Áúğçî ñòàğòèğàíå"
bg.ProgramOnTheWeb=%1 â Èíòåğíåò
bg.UninstallProgram=Äåèíñòàëèğàíå íà %1
bg.LaunchProgram=Ñòàğòèğàíå íà %1
bg.AssocFileExtension=&Ñâúğçâàíå íà %1 ñ ôàéëîâîòî ğàçøèğåíèå %2
bg.AssocingFileExtension=%1 ñå ñâúğçâà ñ ôàéëîâîòî ğàçøèğåíèå %2...
bg.AutoStartProgramGroupDescription=Ñòàğòèğàíå:
bg.AutoStartProgram=Àâòîìàòè÷íî ñòàğòèğàíå íà %1
bg.AddonHostProgramNotFound=%1 íå áå íàìåğåíà â èçáğàíàòà îò âàñ ïàïêà.%n%nÆåëàåòå ëè âñå ïàê äà ïğîäúëæèòå?
tr.NameAndVersion=%1 %2 sürümü
tr.AdditionalIcons=Ek simgeler:
tr.CreateDesktopIcon=Masaüstü simg&esi oluşturulsun
tr.CreateQuickLaunchIcon=Hızlı Başlat simgesi &oluşturulsun
tr.ProgramOnTheWeb=%1 Web Sitesi
tr.UninstallProgram=%1 Yazılımını Kaldırın
tr.LaunchProgram=%1 Yazılımı Çalıştırılsın
tr.AssocFileExtension=%1 y&azılımı ile %2 dosya uzantısı ilişkilendirilsin
tr.AssocingFileExtension=%1 y&azılımı ile %2 dosya uzantısı ilişkilendiriliyor...
tr.AutoStartProgramGroupDescription=Başlangıç:
tr.AutoStartProgram=%1 kendiliğinden başlatılsın
tr.AddonHostProgramNotFound=%1 seçtiğiniz klasörde bulunamadı.%n%nYine de devam etmek istiyor musunuz?
kr.NameAndVersion=%1 ¹öÀü %2
kr.AdditionalIcons=¾ÆÀÌÄÜ »ı¼º:
kr.CreateDesktopIcon=¹ÙÅÁ È­¸é¿¡ ¾ÆÀÌÄÜ »ı¼º(&D)
kr.CreateQuickLaunchIcon=ºü¸¥ ½ÇÇà¿¡ ¾ÆÀÌÄÜ »ı¼º(&Q)
kr.ProgramOnTheWeb=À¥ »óÀÇ %1
kr.UninstallProgram=%1 Á¦°Å
kr.LaunchProgram=%1 ½ÇÇà
kr.AssocFileExtension=%2 È®ÀåÀÚ¸¦ %1 ¿¡ ¿¬°á(&A)
kr.AssocingFileExtension=%2 È®ÀåÀÚ¸¦ %1 ¿¡ ¿¬°á Áß...
kr.AutoStartProgramGroupDescription=½ÃÀÛ:
kr.AutoStartProgram=ÀÚµ¿ ½ÃÀÛ ÇÁ·Î±×·¥ %1
kr.AddonHostProgramNotFound=%1 ¼±ÅÃÇÑ Æú´õ¿¡ À§Ä¡ÇÒ¼ö ¾ø½À´Ï´Ù. %n%n°è¼Ó ÇÏ½Ã°Ú½À´Ï±î?
gr.NameAndVersion=%1 İêäïóç %2
gr.AdditionalIcons=Åğéğëİïí åéêïíßäéá:
gr.CreateDesktopIcon=Äçìéïõñãßá &åéêïíéäßïõ óôçí åğéöÜíåéá åñãáóßáò
gr.CreateQuickLaunchIcon=Äçìéïõñãßá åéêïíéäßïõ óôç &ÃñŞãïñç Åêêßíçóç
gr.ProgramOnTheWeb=Ôï %1 óôï Internet
gr.UninstallProgram=ÁğåãêáôÜóôáóç ôïõ %1
gr.LaunchProgram=Åêêßíçóç ôïõ %1
gr.AssocFileExtension=&Áíôéóôïß÷éóç ôïõ %1 ìå ôçí %2 åğİêôáóç áñ÷åßïõ
gr.AssocingFileExtension=Ãßíåôáé áíôéóôïß÷çóç ôïõ %1 ìå ôçí %2 åğİêôáóç áñ÷åßïõ...
gr.AutoStartProgramGroupDescription=Åêêßíçóç:
gr.AutoStartProgram=Áõôüìáôç åêêßíçóç ôïõ %1
gr.AddonHostProgramNotFound=Ôï %1 äå âñİèçêå óôï öÜêåëï ğïõ åğéëİîáôå.%n%nÈİëåôå íá óõíå÷ßóåôå ğáñüëá áõôÜ;
yu.NameAndVersion=%1 âåğçè¼à %2
yu.AdditionalIcons=Äîäàòíå èêîíå:
yu.CreateDesktopIcon=&Ïîñòàâè èêîíó íà ğàäíó ïîâğøèíó
yu.CreateQuickLaunchIcon=Ï&îñòàâè èêîíó íà òğàêó çà áğçî ïîêğåòàœå
yu.ProgramOnTheWeb=%1 íà èíòåğíåòó
yu.UninstallProgram=Äåèíñòàëèğà¼ %1
yu.LaunchProgram=Ïîêğåíè %1
yu.AssocFileExtension=&Ïîâåæè %1 ñà ôîğìàòîì %2
yu.AssocingFileExtension=Ïîâåçó¼åì %1 ñà ôîğìàòîì %2…
yu.AutoStartProgramGroupDescription=Ïîêğåòàœå:
yu.AutoStartProgram=Àóòîìàòñêè ïîêğåíè %1
yu.AddonHostProgramNotFound=%1 ñå íå íàëàçè ó íàâåäåíî¼ ôàñöèêëè.%n%nÆåëèòå ëè èïàê äà íàñòàâèòå?
by.NameAndVersion=«%1» âığñ³³ %2
by.AdditionalIcons=Äàäàòêîâûÿ çíà÷ê³:
by.CreateDesktopIcon=Ñòâàğûöü çíà÷àê íà &ñòàëüí³öû
by.CreateQuickLaunchIcon=Ñòâàğûöü çíà÷àê íà ïàë³öû &õóòêàãà çàïóñêó
by.ProgramOnTheWeb=«%1» ó ñåö³âå
by.UninstallProgram=Âûñòàëÿâàöü «%1»
by.LaunchProgram=Çàïóñüö³öü «%1»
by.AssocFileExtension=&Çüâÿçàöü «%1» ç ôàéëàì³ ïàøûğıíüíÿ «%2»
by.AssocingFileExtension=«%1» çüâÿçâàåööà ç ôàéëàì³ ïàøûğıíüíÿ «%2»…
by.AutoStartProgramGroupDescription=Çàïóñêàöü:
by.AutoStartProgram=Çàïóñêàöü «%1» ñàìàğóøíà
by.AddonHostProgramNotFound=Ó àáğàíûì êàòàë¸´ó íå çíàéøë³ ôàéë «%1».%n%nÖ³ ïğàöÿãâàöü óñ¸ ğî¢íà?
he.NameAndVersion=%1 âéøñä %2
he.AdditionalIcons=ñéîìåğéí ğåñôéí:
he.CreateDesktopIcon=öåø ÷éöåø ãøê òì &ùåìçï äòáåãä
he.CreateQuickLaunchIcon=öåø ñéîìåï áùåøú ääøöä äîäéøä
he.ProgramOnTheWeb=%1 áøùú
he.UninstallProgram=äñø àú %1
he.LaunchProgram=äôòì %1
he.AssocFileExtension=&÷ùø àú %1 òí ñéåîú ä÷åáõ %2
he.AssocingFileExtension=î÷ùø àú %1 òí ñéåîú ä÷åáõ %2
he.AutoStartProgramGroupDescription=äôòìä àåèåîèéú:
he.AutoStartProgram=äôòì àåèåîèéú %1
he.AddonHostProgramNotFound=%1 ìà ğîöà áúé÷éä ùáçøú.%n%nàúä øåöä ìäîùéê áëì æàú?
br.NameAndVersion=%1 versão %2
br.AdditionalIcons=Ícones adicionais:
br.CreateDesktopIcon=Criar um ícone &na área de trabalho
br.CreateQuickLaunchIcon=Criar um ícone na &barra de inicialização rápida
br.ProgramOnTheWeb=%1 na Web
br.UninstallProgram=Desinstalar o %1
br.LaunchProgram=Iniciar o %1
br.AssocFileExtension=&Associar o %1 com a extensão do arquivo %2
br.AssocingFileExtension=Associando o %1 com a extensão do arquivo %2...
br.AutoStartProgramGroupDescription=Inicialização:
br.AutoStartProgram=Automaticamente iniciar o %1
br.AddonHostProgramNotFound=%1 não pôde ser localizado na pasta que você selecionou.%n%nVocê quer continuar de qualquer maneira?
jp.NameAndVersion=%1 ƒo[ƒWƒ‡ƒ“ %2
jp.AdditionalIcons=ƒAƒCƒRƒ“‚ğ’Ç‰Á‚·‚é:
jp.CreateDesktopIcon=ƒfƒXƒNƒgƒbƒvã‚ÉƒAƒCƒRƒ“‚ğì¬‚·‚é(&D)
jp.CreateQuickLaunchIcon=ƒNƒCƒbƒN‹N“®ƒAƒCƒRƒ“‚ğì¬‚·‚é(&Q)
jp.ProgramOnTheWeb=%1 on the Web
jp.UninstallProgram=%1 ‚ğƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚·‚é
jp.LaunchProgram=%1 ‚ğÀs‚·‚é
jp.AssocFileExtension=ƒtƒ@ƒCƒ‹Šg’£q %2 ‚É %1 ‚ğŠÖ˜A•t‚¯‚Ü‚·B
jp.AssocingFileExtension=ƒtƒ@ƒCƒ‹Šg’£q %2 ‚É %1 ‚ğŠÖ˜A•t‚¯‚Ä‚¢‚Ü‚·...
jp.AutoStartProgramGroupDescription=ƒXƒ^[ƒgƒAƒbƒv:
jp.AutoStartProgram=%1 ‚ğ©“®“I‚ÉŠJn‚·‚é
jp.AddonHostProgramNotFound=‘I‘ğ‚³‚ê‚½ƒtƒHƒ‹ƒ_[‚É %1 ‚ªŒ©‚Â‚©‚è‚Ü‚¹‚ñ‚Å‚µ‚½B%n%n‚±‚Ì‚Ü‚Ü‘±s‚µ‚Ü‚·‚©H
dk.NameAndVersion=%1 version %2
dk.AdditionalIcons=Supplerende ikoner:
dk.CreateDesktopIcon=Opret ikon på skrive&bordet
dk.CreateQuickLaunchIcon=Opret &hurtigstart-ikon
dk.ProgramOnTheWeb=%1 på internettet
dk.UninstallProgram=Afinstaller (fjern) %1
dk.LaunchProgram=&Start %1
dk.AssocFileExtension=Sammen&kæd %1 med filtypen %2
dk.AssocingFileExtension=Sammenkæder %1 med filtypen %2...
dk.AutoStartProgramGroupDescription=Start:
dk.AutoStartProgram=Start automatisk %1
dk.AddonHostProgramNotFound=%1 blev ikke fundet i den valgte mappe.%n%nVil du alligevel fortsætte?
fi.NameAndVersion=%1 versio %2
fi.AdditionalIcons=Lisäkuvakkeet:
fi.CreateDesktopIcon=Lu&o kuvake työpöydälle
fi.CreateQuickLaunchIcon=Luo kuvake &pikakäynnistyspalkkiin
fi.ProgramOnTheWeb=%1 Internetissä
fi.UninstallProgram=Poista %1
fi.LaunchProgram=&Käynnistä %1
fi.AssocFileExtension=&Yhdistä %1 tiedostopäätteeseen %2
fi.AssocingFileExtension=Yhdistetään %1 tiedostopäätteeseen %2 ...
fi.AutoStartProgramGroupDescription=Käynnistys:
fi.AutoStartProgram=Käynnistä %1 automaattisesti
fi.AddonHostProgramNotFound=%1 ei ole valitsemassasi kansiossa.%n%nHaluatko jatkaa tästä huolimatta?
no.NameAndVersion=%1 versjon %2
no.AdditionalIcons=Ekstra-ikoner:
no.CreateDesktopIcon=Lag ikon på &skrivebordet
no.CreateQuickLaunchIcon=Lag et &Hurtigstarts-ikon
no.ProgramOnTheWeb=%1 på nettet
no.UninstallProgram=Avinstaller %1
no.LaunchProgram=Kjør %1
no.AssocFileExtension=&Koble %1 med filetternavnet %2
no.AssocingFileExtension=Kobler %1 med filetternavnet %2...
no.AutoStartProgramGroupDescription=Oppstart:
no.AutoStartProgram=Start %1 automatisk
no.AddonHostProgramNotFound=%1 ble ikke funnet i katalogen du valgte.%n%nVil du fortsette likevel?
lv.NameAndVersion=%1 versija %2
lv.AdditionalIcons=Papildu ikonas:
lv.CreateDesktopIcon=Izveidot &darbvisrmas ikonu
lv.CreateQuickLaunchIcon=Izveidot &Quick Launch ikonu
lv.ProgramOnTheWeb=%1 Internçtâ
lv.UninstallProgram=Atinstalçt %1
lv.LaunchProgram=Palaist %1
lv.AssocFileExtension=&Apvienot %1 ar %2 faila paplağinâjumu
lv.AssocingFileExtension=Apvienoğana %1 ar %2 faila paplağinâjumu...
lv.AutoStartProgramGroupDescription=starta:
lv.AutoStartProgram=Automâtiski sâkt %1
lv.AddonHostProgramNotFound=%1 nevar atrasties mapç jûs izvçlçjâties.%n%nVai vçlaties turpinât?
ar.NameAndVersion=%1 ÇáäÓÎÉ %2
ar.AdditionalIcons=ÑãæÒ ÅÖÇİíÉ :
ar.CreateDesktopIcon=ÅäÔÇÁ ÃíŞæäÉ Úáì ÓØÍ ÇáãßÊÈ :
ar.CreateQuickLaunchIcon=ÅäÔÇÁ ÃíŞæäÉ ÅØáÇŞ ÓÑíÚ ÈÌæÇÑ ÇÈÏÃ
ar.ProgramOnTheWeb=%1 Úáì ÇáÅäÊÑäÊ
ar.UninstallProgram=%1 ÅáÛÇÁ ÊËÈíÊ
ar.LaunchProgram=%1 ÊÔÛíá
ar.AssocFileExtension=ÅÔÑÇß %1 ãÚ ÅãÊÏÇÏ ãáİ %2
ar.AssocingFileExtension=íÊã ÅÔÑÇß %1 ãÚ ÅãÊÏÇÏ ãáİ %2 ...
ar.AutoStartProgramGroupDescription=ÈÏÁ ÇáÊÔÛíá:
ar.AutoStartProgram=ÊÔÛíá %1 ÊáŞÇÆíÇ
ar.AddonHostProgramNotFound=ÊÚĞÑ ÇáÚËæÑ Úáì %1 İí ÇáãÌáÏ ÇáĞí ŞãÊ ÈÊÍÏíÏå%n%nåá ÊÑíÏ ÇáãÊÇÈÚÉ Úáì Ãí ÍÇá ¿
si.NameAndVersion=%1 razlièica %2
si.AdditionalIcons=Dodatne ikone:
si.CreateDesktopIcon=Ustvari ikono na &namizju
si.CreateQuickLaunchIcon=Ustvari ikono za &hitri zagon
si.ProgramOnTheWeb=%1 na spletu
si.UninstallProgram=Odstrani %1
si.LaunchProgram=Odpri %1
si.AssocFileExtension=&Povei %1 s pripono %2
si.AssocingFileExtension=Povezujem %1 s pripono %2...
si.AutoStartProgramGroupDescription=Zagon:
si.AutoStartProgram=Samodejno zaeni %1
si.AddonHostProgramNotFound=Programa %1 ni bilo mogoèe najti v izbrani mapi.%n%nAli elite vseeno nadaljevati?
cn.NameAndVersion=%1°æ±¾%2
cn.AdditionalIcons=¸½¼Ó¿ì½İ·½Ê½£º
cn.CreateDesktopIcon=´´½¨×ÀÃæ¿ì½İ·½Ê½(&D)
cn.CreateQuickLaunchIcon=´´½¨¿ìËÙÆô¶¯À¸¿ì½İ·½Ê½(&Q)
cn.ProgramOnTheWeb=%1ÍøÕ¾
cn.UninstallProgram=Ğ¶ÔØ%1
cn.LaunchProgram=ÔËĞĞ%1
cn.AssocFileExtension=½«%1Óë%2ÎÄ¼şÀ©Õ¹Ãû¹ØÁª(&A)
cn.AssocingFileExtension=ÕıÔÚ½«%1Óë%2ÎÄ¼şÀ©Õ¹Ãû¹ØÁª¡­
cn.AutoStartProgramGroupDescription=Æô¶¯£º
cn.AutoStartProgram=×Ô¶¯Æô¶¯%1
cn.AddonHostProgramNotFound=ÔÚÄúËùÑ¡ÎÄ¼ş¼ĞÖĞÕÒ²»µ½%1¡£%n%nÊÇ·ñÈÔÈ»¼ÌĞø£¿
tw.NameAndVersion=%1 ª©¥» %2
tw.AdditionalIcons=ªş¥[¹Ï¥Ü:
tw.CreateDesktopIcon=«Ø¥ß®à­±¹Ï¥Ü(&D)
tw.CreateQuickLaunchIcon=«Ø¥ß§Ö³t±Ò°Ê¹Ï¥Ü(&Q)
tw.ProgramOnTheWeb=%1 ªººô¯¸
tw.UninstallProgram=¸Ñ°£¦w¸Ë %1
tw.LaunchProgram=±Ò°Ê %1
tw.AssocFileExtension=±N %1 »PÀÉ®×°ÆÀÉ¦W %2 ²£¥ÍÃöÁp(&A)
tw.AssocingFileExtension=¥¿¦b±N %1 »PÀÉ®×°ÆÀÉ¦W %2 ²£¥ÍÃöÁp...
tw.AutoStartProgramGroupDescription=¶}±Ò:
tw.AutoStartProgram=¦Û°Ê¶}±Ò %1
tw.AddonHostProgramNotFound=%1 µLªk¦b±z©Ò¿ïªº¸ê®Æ§¨¤¤§ä¨ì¡C%n%n±z¬O§_ÁÙ­nÄ~Äò¡H
et.NameAndVersion=%1 versiooniga %2
et.AdditionalIcons=Täiendavad ikoonid:
et.CreateDesktopIcon=Loo &töölaua ikoon
et.CreateQuickLaunchIcon=Loo &kiirkäivituse ikoon
et.ProgramOnTheWeb=%1 veebis
et.UninstallProgram=%1 - eemalda
et.LaunchProgram=Käivita %1
et.AssocFileExtension=&Seosta %1 %2 faililaiendiga
et.AssocingFileExtension=Seostan %1 %2 faililaiendiga...
et.AutoStartProgramGroupDescription=Käivitus:
et.AutoStartProgram=Käivita %1 automaatselt
et.AddonHostProgramNotFound=%1 ei asu sinu valitud kaustas.%n%nKas soovid sellegipoolest jätkata?
sk.NameAndVersion=%1 verzia %2
sk.AdditionalIcons=Ïalší zástupcovia:
sk.CreateDesktopIcon=Vytvori zástupcu na &ploche
sk.CreateQuickLaunchIcon=Vytvori zástupcu na paneli &Rıchle spustenie
sk.ProgramOnTheWeb=Aplikácia %1 na internete
sk.UninstallProgram=Odinštalova aplikáciu %1 
sk.LaunchProgram=Spusti aplikáciu %1
sk.AssocFileExtension=Vytvori &asociáciu medzi súbormi typu %2 a aplikáciou %1
sk.AssocingFileExtension=Vytvára sa asociácia medzi súbormi typu %2 a aplikáciou %1...
sk.AutoStartProgramGroupDescription=Po spustení:
sk.AutoStartProgram=Automaticky spusti %1
sk.AddonHostProgramNotFound=Nepodarilo sa nájs %1 v prieèinku, ktorı ste zvolili.%n%nChcete napriek tomu pokraèova?
ct.NameAndVersion=%1 versió %2
ct.AdditionalIcons=Icones addicionals:
ct.CreateDesktopIcon=Crea una icona a l'&Escriptori
ct.CreateQuickLaunchIcon=Crea una icona a la &Barra de tasques
ct.ProgramOnTheWeb=%1 a Internet
ct.UninstallProgram=Desinstal·la %1
ct.LaunchProgram=Obre %1
ct.AssocFileExtension=&Associa %1 amb l'extensió de fitxer %2
ct.AssocingFileExtension=Associant %1 amb l'extensió de fitxer %2...
ct.AutoStartProgramGroupDescription=Inici:
ct.AutoStartProgram=Inicia automàticament %1
ct.AddonHostProgramNotFound=%1 no ha pogut ser trobat a la carpeta seleccionada.%n%nVoleu continuar igualment?
mk.NameAndVersion=%1 âåğçè¼à %2
mk.AdditionalIcons=Äîäàòíè èêîíè:
mk.CreateDesktopIcon=Êğåèğà¼ &äåñêòîï èêîíà
mk.CreateQuickLaunchIcon=Êğåèğà¼ &áğç ñòàğò èêîíà
mk.ProgramOnTheWeb=%1 íà èíòåğíåò
mk.UninstallProgram=Äåèíñòàëèğà¼ ãî %1
mk.LaunchProgram=Ñòàğòóâà¼ %1
mk.AssocFileExtension=&Àñîöèğà¼ ãî %1 ñî %2 ñî åêñòåíçèèòå
mk.AssocingFileExtension=Àñîöèğà¼ ãè %1 ñî %2 åêñòåíçèèòå...
hr.NameAndVersion=%1 verzija %2
hr.AdditionalIcons=Dodatne ikone:
hr.CreateDesktopIcon=Kreiraj ikonu na &Desktopu
hr.CreateQuickLaunchIcon=Kreiraj ikonu u traci za brzo pokretanje
hr.ProgramOnTheWeb=%1 na internetu
hr.UninstallProgram=Deinstaliraj %1
hr.LaunchProgram=Pokreni %1
hr.AssocFileExtension=Pridru&i %1 sa %2 ekstenzijom datoteke
hr.AssocingFileExtension=Pridruujem %1 sa %2 ekstenzijom datoteke
hr.AutoStartProgramGroupDescription=Pokretanje:
hr.AutoStartProgram=Automatski pokreni %1
hr.AddonHostProgramNotFound=%1 se ne nalazi u navedenoj mapi.%n%nelite li svejedno nastaviti?
ro.NameAndVersion=%1 versiunea %2
ro.AdditionalIcons=Icoane suplimentare:
ro.CreateDesktopIcon=Creeazã o icoanã pe &Birou ("Desktop")
ro.CreateQuickLaunchIcon=Creeazã o icoanã în Bara de &Lansare Rapidã ("Quick Launch")
ro.ProgramOnTheWeb=%1 pe internet
ro.UninstallProgram=Dezinstaleazã %1
ro.LaunchProgram=Lanseazã %1
ro.AssocFileExtension=&Asociazã %1 cu extensia de file %2
ro.AssocingFileExtension=Asociez %1 cu extensia de file %2...
ro.AutoStartProgramGroupDescription=Pornire:
ro.AutoStartProgram=Porneºte automat %1
ro.AddonHostProgramNotFound=%1 nu poate fi gãsit în dosarul selectat.%n%nVrei sã continui oricum?
lt.NameAndVersion=%1 versija %2
lt.AdditionalIcons=Papildomos piktogramos:
lt.CreateDesktopIcon=Rodyti piktogramà &Darbalaukyje
lt.CreateQuickLaunchIcon=Rodyti Sparèiosios &Paleisties piktogramà
lt.ProgramOnTheWeb=„%1“ şiniatinklyje
lt.UninstallProgram=Pağalinti „%1“
lt.LaunchProgram=Paleisti „%1“
lt.AssocFileExtension=&Susieti „%1“ programà su bylos plëtiniu %2
lt.AssocingFileExtension=„%1“ programa susiejama su bylos plëtiniu %2...
lt.AutoStartProgramGroupDescription=Atomatinë paleistis:
lt.AutoStartProgram=Atomatiğkai paleisti „%1“
lt.AddonHostProgramNotFound=„%1“ nerasta Jûsø nurodytame kataloge.%n%nAr Jûs vis tiek norite tæsti?
ir.NameAndVersion=%1 æíÑÇíÔ %2
ir.AdditionalIcons=ÔãÇíá åÇí ÇÖÇİí:
ir.CreateDesktopIcon=İÑÇåã ˜ÑÏä í˜ ÔãÇíá ãíÒ˜ÇÑ
ir.CreateQuickLaunchIcon=İÑÇåã ˜ÑÏä ÔãÇíá Quick Launch
ir.ProgramOnTheWeb=%1 ÏÑ æÈ
ir.UninstallProgram=ÍĞİ %1
ir.LaunchProgram=ÈÇÒ ˜ÑÏä %1
ir.AssocFileExtension=æÇÈÓÊå ˜ÑÏä %1 ÈÇ ŞÇáÈ İÇíá %2
ir.AssocingFileExtension=ÏÑ ÍÇá æÇÈÓÊå ˜ÑÏä %1 ÈÇ ŞÇáÈ İÇíá %2...
vn.NameAndVersion=%1 versio %2
vn.AdditionalIcons=Icons adicionals:
vn.CreateDesktopIcon=Crear un icon en l'&Escritori
vn.CreateQuickLaunchIcon=Crear un icon en la &Barra de tarees
vn.ProgramOnTheWeb=%1 a Internet
vn.UninstallProgram=Desinstalar %1
vn.LaunchProgram=Obrir %1
vn.AssocFileExtension=&Associar %1 en l'extensio d'archiu %2
vn.AssocingFileExtension=Associant %1 en l'extensio d'archiu %2...
my.NameAndVersion=%1 versi %2
my.AdditionalIcons=Ikon tambahan:
my.CreateDesktopIcon=Hasilkan ikon &desktop
my.CreateQuickLaunchIcon=Hasilkan ikon &Lancar Pantas
my.ProgramOnTheWeb=%1 di Internet
my.UninstallProgram=Uninstall %1
my.LaunchProgram=Jalankan perisian %1
my.AssocFileExtension=&Kaitkan %1 dengan akhiran fail %2
my.AssocingFileExtension=Mengaitkan %1 dengan akhiran fail %2 ...
id.NameAndVersion=%1 versi %2
id.AdditionalIcons=Ikon tambahan:
id.CreateDesktopIcon=Buat sebuah ikon di &Desktop
id.CreateQuickLaunchIcon=Buat sebuah ikon di &Quick Launch
id.ProgramOnTheWeb=%1 di Web
id.UninstallProgram=Lepas %1
id.LaunchProgram=&Jalankan %1
id.AssocFileExtension=%1 &asosiasikan dengan berkas berekstensi %2
id.AssocingFileExtension=%1 asosiasikan dengan berkas berekstensi %2
id.AutoStartProgramGroupDescription=Startup:
id.AutoStartProgram=Otomatis menjalankan %1
id.AddonHostProgramNotFound=%1 tidak ada di lokasi yang anda pilih.%n%nApakah anda ingin melanjutkan?

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "en"; MessagesFile: "embedded\en.isl"; 
Name: "de"; MessagesFile: "embedded\de.isl"; 
Name: "fr"; MessagesFile: "embedded\fr.isl"; 
Name: "it"; MessagesFile: "embedded\it.isl"; LicenseFile: "embedded\itLicense.txt"; 
Name: "es"; MessagesFile: "embedded\es.isl"; 
Name: "pt"; MessagesFile: "embedded\pt.isl"; 
Name: "nl"; MessagesFile: "embedded\nl.isl"; 
Name: "se"; MessagesFile: "embedded\se.isl"; 
Name: "pl"; MessagesFile: "embedded\pl.isl"; 
Name: "cz"; MessagesFile: "embedded\cz.isl"; 
Name: "hu"; MessagesFile: "embedded\hu.isl"; 
Name: "ru"; MessagesFile: "embedded\ru.isl"; 
Name: "ua"; MessagesFile: "embedded\ua.isl"; 
Name: "bg"; MessagesFile: "embedded\bg.isl"; 
Name: "tr"; MessagesFile: "embedded\tr.isl"; 
Name: "kr"; MessagesFile: "embedded\kr.isl"; 
Name: "gr"; MessagesFile: "embedded\gr.isl"; 
Name: "yu"; MessagesFile: "embedded\yu.isl"; 
Name: "by"; MessagesFile: "embedded\by.isl"; 
Name: "he"; MessagesFile: "embedded\he.isl"; 
Name: "br"; MessagesFile: "embedded\br.isl"; 
Name: "jp"; MessagesFile: "embedded\jp.isl"; 
Name: "dk"; MessagesFile: "embedded\dk.isl"; 
Name: "fi"; MessagesFile: "embedded\fi.isl"; 
Name: "no"; MessagesFile: "embedded\no.isl"; 
Name: "lv"; MessagesFile: "embedded\lv.isl"; 
Name: "ar"; MessagesFile: "embedded\ar.isl"; 
Name: "si"; MessagesFile: "embedded\si.isl"; 
Name: "cn"; MessagesFile: "embedded\cn.isl"; 
Name: "tw"; MessagesFile: "embedded\tw.isl"; 
Name: "et"; MessagesFile: "embedded\et.isl"; 
Name: "sk"; MessagesFile: "embedded\sk.isl"; 
Name: "ct"; MessagesFile: "embedded\ct.isl"; 
Name: "mk"; MessagesFile: "embedded\mk.isl"; 
Name: "hr"; MessagesFile: "embedded\hr.isl"; 
Name: "ro"; MessagesFile: "embedded\ro.isl"; 
Name: "lt"; MessagesFile: "embedded\lt.isl"; 
Name: "ir"; MessagesFile: "embedded\ir.isl"; 
Name: "vn"; MessagesFile: "embedded\vn.isl"; 
Name: "my"; MessagesFile: "embedded\my.isl"; 
Name: "id"; MessagesFile: "embedded\id.isl"; 
