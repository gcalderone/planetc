; Stellarium installer
; Run "make install" first to generate the executable and translation files.
; @ISS_AUTOGENERATED_WARNING@

[Setup]
@ISS_ARCHITECTURE_SPECIFIC@
DisableStartupPrompt=yes
WizardSmallImageFile=@CMAKE_SOURCE_DIR@\data\icon.bmp
WizardImageFile=@CMAKE_SOURCE_DIR@\data\splash.bmp
WizardImageStretch=no
WizardImageBackColor=clBlack

AppName=Stellarium-PlanetC
AppVersion=@PLANETC_PLUGIN_VERSION@
AppVerName=Stellarium-PlanetC @PLANETC_PLUGIN_VERSION@
AppCopyright=Copyright (C) 2016-2018 Giorgio Calderone
AppPublisher=Giorgio Calderone
AppPublisherURL=https://github.com/gcalderone/PlanetC
AppSupportURL=https://github.com/gcalderone/PlanetC
AppUpdatesURL=https://github.com/gcalderone/PlanetC
VersionInfoVersion=@PLANETC_PLUGIN_VERSION@

MinVersion=0,@MIN_VERSION@
SetupIconFile=@CMAKE_SOURCE_DIR@\data\@PACKAGE_ICON@.ico
OutputBaseFilename=PlanetC-v@PLANETC_PLUGIN_VERSION@-@PACKAGE_VERSION@-@ISS_PACKAGE_PLATFORM@
OutputDir=@CMAKE_SOURCE_DIR@\installers
; In 64-bit mode, {pf} is equivalent to {pf64},
; see http://www.jrsoftware.org/ishelp/index.php?topic=32vs64bitinstalls
DefaultDirName={pf}\PlanetC
DefaultGroupName=PlanetC
UninstallDisplayIcon={app}\data\stellarium.ico
LicenseFile=@CMAKE_SOURCE_DIR@\COPYING
ChangesAssociations=yes
; LZMA2/max required 95 MB RAM for compression and 8 MB RAM for decompression
; Using LZMA2/max algorithm reduces size of package on ~10%
Compression=lzma2/max

[Files]
Source: "@CMAKE_INSTALL_PREFIX@\bin\stellarium.exe"; Flags: ignoreversion; DestDir: "{app}"
@STELMAINLIB@
@MESALIB@
@REDIST_FILES@
Source: "@CMAKE_SOURCE_DIR@\data\stellarium.url"; Flags: ignoreversion; DestDir: "{app}"
Source: "@CMAKE_SOURCE_DIR@\data\stellarium-devdocs.url"; Flags: ignoreversion; DestDir: "{app}"
Source: "README-PLANETC"; DestDir: "{app}"; Flags: isreadme; DestName: "README-PLANETC.txt"
; Source: "@CMAKE_SOURCE_DIR@\README.md"; DestDir: "{app}"; Flags: isreadme ignoreversion; DestName: "README.txt"
; Source: "@CMAKE_SOURCE_DIR@\INSTALL"; DestDir: "{app}"; Flags: ignoreversion; DestName: "INSTALL.txt"
Source: "@CMAKE_SOURCE_DIR@\COPYING"; DestDir: "{app}"; Flags: ignoreversion; DestName: "GPL.txt"
; Source: "@CMAKE_SOURCE_DIR@\AUTHORS"; DestDir: "{app}"; Flags: ignoreversion; DestName: "AUTHORS.txt"
Source: "@CMAKE_SOURCE_DIR@\ChangeLog"; DestDir: "{app}"; Flags: ignoreversion; DestName: "ChangeLog.txt"
Source: "@QtCore_location@"; DestDir: "{app}";
Source: "@QtGui_location@"; DestDir: "{app}";
@ISS_QT_OPENGL@
Source: "@QtNetwork_location@"; DestDir: "{app}";
Source: "@QtWidgets_location@"; DestDir: "{app}";
Source: "@QtSql_location@"; DestDir: "{app}";
Source: "@QtXmlPatterns_location@"; DestDir: "{app}";
Source: "@QtConcurrent_location@"; DestDir: "{app}";
@ISS_QT_PRINTSUPPORT@
@ISS_QT_SCRIPT@
@ISS_QT_MULTIMEDIA@
@ISS_QT_SERIALPORT@
@ISS_QT_POSITIONING@
@ISS_ANGLE_LIBS@
@ISS_ICU_LIBS@
@ISS_QT_PLUGINS@
@ISS_OPENSSL_LIBS@
; Stellarium's stuff
Source: "@CMAKE_INSTALL_PREFIX@\share\stellarium\*"; DestDir: "{app}\"; Flags: recursesubdirs ignoreversion

[Tasks]
Name: desktopicon; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: desktopicon\common; Description: "{cm:ForAllUsers}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: exclusive
Name: desktopicon\user; Description: "{cm:ForCurrentUserOnly}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: exclusive unchecked
Name: removecache; Description: "{cm:RemoveCache}"; GroupDescription: "{cm:RemoveFromPreviousInstallation}"
Name: removeconfig; Description: "{cm:RemoveMainConfig}"; GroupDescription: "{cm:RemoveFromPreviousInstallation}"
Name: removeplugins; Description: "{cm:RemovePluginsConfig}"; GroupDescription: "{cm:RemoveFromPreviousInstallation}"; Flags: unchecked
Name: removesolar; Description: "{cm:RemoveSolarConfig}"; GroupDescription: "{cm:RemoveFromPreviousInstallation}"
Name: removelandscapes; Description: "{cm:RemoveUILandscapes}"; GroupDescription: "{cm:RemoveFromPreviousInstallation}"; Flags: unchecked
;Name: removeshortcuts; Description: "{cm:RemoveShortcutsConfig}"; GroupDescription: "{cm:RemoveFromPreviousInstallation}"; Flags: unchecked

[Run]
;An option to start Stellarium after setup has finished
@REDIST_RUN@
Filename: "{app}\stellarium.exe"; Description: "{cm:LaunchProgram,Stellarium}"; Flags: postinstall nowait skipifsilent unchecked

[InstallDelete]
;The old log file in all cases
Type: files; Name: "{userappdata}\Stellarium\log.txt"
Type: files; Name: "{userappdata}\Stellarium\config.ini"; Tasks: removeconfig
Type: files; Name: "{userappdata}\Stellarium\data\ssystem_minor.ini"; Tasks: removesolar
Type: filesandordirs; Name: "{userappdata}\Stellarium\modules"; Tasks: removeplugins
Type: filesandordirs; Name: "{userappdata}\Stellarium\landscapes"; Tasks: removelandscapes
Type: filesandordirs; Name: "{localappdata}\stellarium\stellarium"; Tasks: removecache
;Type: files; Name: "{userappdata}\Stellarium\data\shortcuts.json"; Tasks: removeshortcuts

[UninstallDelete]

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,Stellarium}"; Filename: "{app}\stellarium.url"; IconFilename: "{app}\data\stellarium.ico"
Name: "{group}\{cm:DevelopersDocsOnTheWeb}"; Filename: "{app}\stellarium-devdocs.url"; IconFilename: "{app}\data\stellarium.ico"
Name: "{group}\PlanetC"; Filename: "{app}\stellarium.exe"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"
; Name: "{group}\PlanetC {cm:FallbackMode}"; Filename: "{app}\stellarium.exe"; Parameters: "--safe-mode"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"
Name: "{group}\PlanetC {cm:DebugMode}"; Filename: "{app}\stellarium.exe"; Parameters: "--dump-opengl-details"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"
; Name: "{group}\PlanetC {cm:AngleMode}"; Filename: "{app}\stellarium.exe"; Parameters: "--angle-mode"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"
; Name: "{group}\PlanetC {cm:AngleD3D9Mode}"; Filename: "{app}\stellarium.exe"; Parameters: "--angle-d3d9"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"
; Name: "{group}\PlanetC {cm:AngleD3D11Mode}"; Filename: "{app}\stellarium.exe"; Parameters: "--angle-d3d11"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"
; Name: "{group}\PlanetC {cm:AngleWarpMode}"; Filename: "{app}\stellarium.exe"; Parameters: "--angle-warp"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"
Name: "{group}\PlanetC {cm:AngleMode}"; Filename: "{app}\stellarium.exe"; Parameters: "--angle-d3d9"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"
Name: "{group}\PlanetC {cm:MesaMode}"; Filename: "{app}\stellarium.exe"; Parameters: "--mesa-mode"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"
@ISS_SPOUT@
Name: "{group}\{cm:UninstallProgram,Stellarium-PlanetC}"; Filename: "{uninstallexe}"
Name: "{group}\config.ini"; Filename: "{userappdata}\Stellarium\planetc\config.ini"
Name: "{group}\{cm:LastRunLog}"; Filename: "{userappdata}\Stellarium\log.txt"
Name: "{group}\{cm:OutputDataFile}"; Filename: "{userappdata}\Stellarium\output.txt"
Name: "{group}\{cm:ChangeLog}"; Filename: "{app}\ChangeLog.txt"
@ISS_GUIDE@
Name: "{commondesktop}\PlanetC"; Filename: "{app}\stellarium.exe"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"; Tasks: desktopicon\common
Name: "{userdesktop}\PlanetC"; Filename: "{app}\stellarium.exe"; WorkingDir: "{app}"; IconFilename: "{app}\data\stellarium.ico"; Tasks: desktopicon\user

[Registry]
; Set file associations for Stellarium scripts
Root: HKCR; Subkey: ".ssc"; ValueType: string; ValueName: ""; ValueData: "Stellarium.Script"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Stellarium.Script"; ValueType: string; ValueName: ""; ValueData: "Stellarium Script"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Stellarium.Script\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\stellarium.exe,0"
Root: HKCR; Subkey: "Stellarium.Script\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\stellarium.exe"" --startup-script ""%1"""

; Recommended use Inno Setup 5.5.3+
[Languages]
; Official translations of GUI of Inno Setup + translation Stellarium specific lines
Name: "en"; MessagesFile: "compiler:Default.isl,@CMAKE_SOURCE_DIR@\util\ISL\EnglishCM.isl"

[Code]
#IFDEF UNICODE
  #DEFINE AW "W"
#ELSE
  #DEFINE AW "A"
#ENDIF
type
  INSTALLSTATE = Longint;
const
  INSTALLSTATE_INVALIDARG = -2;  // An invalid parameter was passed to the function.
  INSTALLSTATE_UNKNOWN = -1;     // The product is neither advertised or installed.
  INSTALLSTATE_ADVERTISED = 1;   // The product is advertised but not installed.
  INSTALLSTATE_ABSENT = 2;       // The product is installed for a different user.
  INSTALLSTATE_DEFAULT = 5;      // The product is installed for the current user.

  // Visual C++ 2013 Redistributable 12.0.21005
  // VC_REDIST_X86 = '{13A4EE12-23EA-3371-91EE-EFB36DDFFF3E}';
  // VC_REDIST_X64 = '{A749D8E6-B613-3BE3-8F5F-045C84EBA29B}';
  
  // Visual C++ 2015 Redistributable 14.0.24215
  VC_REDIST_X86 = '{e2803110-78b3-4664-a479-3611a381656a}';
  VC_REDIST_X64 = '{d992c12e-cab2-426f-bde3-fb8c53950b0d}';

function MsiQueryProductState(szProduct: string): INSTALLSTATE; 
  external 'MsiQueryProductState{#AW}@msi.dll stdcall';

function VCVersionInstalled(const ProductID: string): Boolean;
begin
  Result := MsiQueryProductState(ProductID) = INSTALLSTATE_DEFAULT;
end;

function VCRedistNeedsInstall: Boolean;
begin
  // here the Result must be True when you need to install your VCRedist
  // or False when you don't need to, so now it's upon you how you build
  // this statement, the following won't install your VC redist only when
  // the Visual C++ 2015 Redist are installed for the current user
  Result := not (VCVersionInstalled(@REDIST_VERSION@));
end;

procedure CurUninstallStepChanged (CurUninstallStep: TUninstallStep);
var
  mres : integer;
begin
  case CurUninstallStep of
    usPostUninstall:
      begin
        mres := SuppressibleMsgBox(ExpandConstant('{cm:DeleteUserData}'), mbConfirmation, MB_YESNO or MB_DEFBUTTON2, IDYES)
        if mres = IDYES then
          DelTree(ExpandConstant('{userappdata}\Stellarium'), True, True, True);
          DelTree(ExpandConstant('{userdocs}\Stellarium'), True, True, True);
      end;  
  end;
end;
