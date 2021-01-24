::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcAWGMWK0OpEZ++Pv4Pq7jEwZUe0WdZ/UyKCLMtU61mjlYbok1DRfgM5s
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBpQQQ2MAE+/Fb4I5/jHweuDp0I0WfIwapveyIGnHM0W7kzlSaIA6VNXiMQeGB5KSzvlZww7yQ==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZk8aHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlDMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIeKR9RQy2PLGSoErAO3cGb
::eg0/rx1wNQPfEVWB+kM9LVsJDCqDOG61L7gM5/rv6viyiy0=
::fBEirQZwNQPfEVWB+kM9LVsJDCqDOG61L7gM5/rv6viyiy0=
::cRolqwZ3JBvQF1fEqQIeKR9RQy2PLGSoErAOqN3o6vjHi0MJUfA5eYzeug==
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBpQQQ2MAE+/Fb4I5/jHweuDp0I0WfIwapveyIGnHM4S7kDrXJs92WhOndk5JSROLVyudgpU
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO off
:START
title NadeoImporter
color 0a
SET NadeoImporterPath=%~dp0
set NadeoImporterexe="NadeoImporter.exe"

rem check if installed corectly "next to Trackmania.exe"
if exist Trackmania.exe (
    rem file exists
	GOTO Trackmania_exe_found
) else (
	if exist MatLib.exe (
		del MatLib.exe
		)
	mode con: cols=80 lines=9
	color 0c
	echo ###############################################################################
	echo #                                                                             #
	echo #                 NadeoImporterUI is not installed correctly !                #
	echo #                                                                             #
	echo #               Pls copy it in the same folder as Trackmania.exe              #
	echo #                                                                             #
	echo #                                                                             #
	echo ###############################################################################
	pause
	exit
    rem file doesn't exist
)
:Trackmania_exe_found

rem check if NadeoImporter is installed, if not download it
if exist %NadeoImporterexe% (
    rem file exists
	GOTO NI_exist
) else (
	SET "myvar=99999999999999999999999999999999999999999999999999999999999999999999999999999999999999"
	SET "v=Not yet installed"
	mode con: cols=80 lines=9
	GOTO new_install_NI
    rem file doesn't exist
)

:NI_exist
mode con: cols=80 lines=11
cls
rem run NI without arguments to find version.
NadeoImporter.exe > %TEMP%\tmpFile
set /p myvar= < %TEMP%\tmpFile

rem INTRO
echo      ////////////////  ////////////////  ////////////////  ////////////////
echo     ////////////////  ////////////////  ////////////////  //////////////// 
echo    ////////////////  ////////////////  ////////////////  ////////////////
echo            ###################################################### //////
echo            #                  NadeoImporter UI                  #//////
echo           /#      NadeoImporter %myvar:NadeoImporter=Version:%       #/////
echo          //######################################################////
echo         //////  //////            //////                      //////
echo        //////  //////            //////                      //////
echo       //////  //////            //////                      //////
del %TEMP%\tmpFile 
pause

:importagain
:again
:again44
mode con: cols=80 lines=9
title Select a Mode
echo ###############################################################################
echo # Possible modes:                                                             #
echo # [1] Item   - Creating a *.Item.Gbx file                                     #
echo # [2] Mesh   - Improting a Shape / Mesh                                       #
echo # [3] WWW    - Open NadeoImporter Documentation                               #
echo # [4] Update - Try to update the NadeoImporter                                #
echo # [5] MatLib - Open MaterialLib.txt                                           #
echo ###############################################################################
set /P mode=

IF "%mode%"=="5" (
	rem Open NadeoImporterMaterialLib.txt in New CMD Window
 	if exist MatLib.exe (
		START MatLib.exe
		) else (
			START MatLib.bat
			)
	)
IF "%mode%"=="3" (
	rem open NadeoImporter DOC in Webbrowser
 	start "" https://doc.trackmania.com/nadeo-importer/
 	)

IF "%mode%"=="4" (
	rem go to updating section
 	GOTO UPDATER
 	)

rem Mode must be 1 or 2 to start importing process
IF NOT "%mode%"=="1" IF NOT "%mode%"=="2" (
 	GOTO again
 	)

:again2
title Enter path to FBX
echo ###############################################################################
echo # Input options:                                                              #
echo #                                                                             #
echo # Items\*.fbx                                                                 #
echo # Items\filename.fbx                                                          #
echo # Items\subfolder\*.fbx                                                       #
echo # Items\subfolder\filename.fbx                                                #
echo ###############################################################################
set "path="
set /P path=Items\

rem check for blank input
if "%path%" equ "" (
	GOTO again2
	)
if "%path:~-4%" neq ".fbx" (
	title ERROR
	color 0c
	echo ###############################################################################
	echo #                                                                             #
	echo #                              ! ! ! ERROR ! ! !                              #
	echo #                                                                             #
	echo #                        Your path must end with .fbx                         #
	echo #                                                                             #
	echo #                                                                             #
	echo ###############################################################################
	pause
	color 0a
	goto again2
)
rem convert mode 1,2 to MESH / ITEM
IF "%mode%"=="1" (
	SET convmode=Item
	)	
IF "%mode%"=="2" (
	SET convmode=Mesh
	)

rem display your inputs
:check_again
title Start the Import? 
echo ###############################################################################
echo #                                                                             #
echo # Mode: %convmode%                                                                  #
echo #                                                                             #
echo #                                                                             #
echo # Path: Items\%path%
echo #                                                                             #
echo ###############################################################################
set /P start=[Y/N]

rem if Y run NadeoImporter - if N Go to beginning
IF "%start%"=="Y" (
	 GOTO run
	)	
IF "%start%"=="y" (
	 GOTO run
	)	
IF "%start%"=="N" (
	GOTO again44
	)
IF "%start%"=="n" (
	GOTO again44
	)
IF NOT "%start%"=="Y" IF NOT "%start%"=="y" IF NOT "%start%"=="N" IF NOT "%start%"=="n" (
	GOTO check_again)

:run

title Importing process started ...
CALL %NadeoImporterexe% %convmode% Items\%path% > %TEMP%\NadeoImporter_log.txt
echo ###############################################################################
IF %errorlevel%==0 (
	title Importing process finished ...
	echo [92m#                        Importing process finished ...                       #
	echo ###############################################################################[97m
	type %TEMP%\NadeoImporter_log.txt
	echo [30m.
	echo [92m###############################################################################
	)
	
IF %errorlevel%==1 (
	title Importing process failed ...
	echo [92m#                        [91mImporting process failed ... [0m                        [92m#
	echo ###############################################################################
	echo [30m.[97m
	type %TEMP%\NadeoImporter_log.txt
	echo [30m.
	echo [92m###############################################################################
	)
	
	
	
del %TEMP%\NadeoImporter_log.txt
pause

rem RESET [0m
rem GREEN [92m
rem RED [91m
rem WHITE [97m
rem UNDERLINE [4m
rem BOLD [1m
rem MAGENTA [95m
rem CYAN [96m
rem BLACK [30m


:again34
rem Import Again?  
title Do you want to Import again ?
echo ###############################################################################
echo #                                                                             #
echo #                                                                             #
echo #                          NadeoImporter UI made by                           #
echo #                                 StupsKiesel                                 #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################
set /P again=[Y/N]
IF "%again%"=="Y" (
	 GOTO importagain
	)
IF "%again%"=="y" (
	 GOTO importagain
	)
IF "%again%"=="N" (
	GOTO exit
	)
IF "%again%"=="n" (
	GOTO exit
	)
IF NOT "%again%"=="Y" IF NOT "%again%"=="y" IF NOT "%again%"=="N" IF NOT "%again%"=="n" (
	GOTO again34)



:UPDATER
rem ########################
rem #   Updating Section   #
rem ########################
SET "v=Update available "
:new_install_NI
rem downloading html page of nadeoimporter DOC
title Searching for Download URL ...
echo ###############################################################################
echo # Searching for Download URL ...                                              #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################
START /WAIT /MIN bitsadmin.exe /transfer "Searching for Download URL" https://doc.trackmania.com/nadeo-importer/01-download-and-install/index.html %TEMP%\themp.html
timeout /T 2 /nobreak>nul

rem reading html file
set "xprvar="
for /F "skip=501 delims=" %%i in (%TEMP%\themp.html) do if not defined xprvar set "xprvar=%%i"
SET xprvar2=%xprvar:~43,-84%
SET xprvar3=%xprvar2:~46,-4%.zip
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################

rem compare old vs new version
SET version_old=%myvar:~14,-6%

rem reading download url to find new version
SET versionnew=%xprvar2:~60,-4%
rem replacing _ with - to match the formation of version_old
SET version_new=%versionnew:_=-%  

IF %version_old% equ %version_new% (
	title Already Up To Date
	echo ###############################################################################
	echo # Searching for Download URL  - Done                                          #
	echo # Already Up To Date                                                          #
	echo #                                                                             #
	echo #                                                                             #
	echo #                                                                             #
	echo #                                                                             #
	echo ###############################################################################
	del %TEMP%\themp.html
	pause
	GOTO START

	)
IF %version_old% neq %version_new% (
	title %v%
	echo ###############################################################################
	echo # Searching for Download URL  - Done                                          #
	echo # %v%                                                           #
	echo #                                                                             #
	echo #                                                                             #
	echo #                                                                             #
	echo #                                                                             #
	echo ###############################################################################
	)

timeout /T 1 /nobreak>nul
	
rem downloading Latest NadeoImporter.zip
title Downloading %xprvar3% ...
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # %v%                                                           #
echo # Downloading %xprvar3% ...                                #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################
START /WAIT /MIN bitsadmin.exe /transfer "Downloading %xprvar3%" %xprvar2% %TEMP%\%xprvar3%
timeout /T 2 /nobreak>nul
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # %v%                                                           #
echo # Downloading %xprvar3% - Done                             #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################

rem unzip
title Expanding %xprvar3% ...
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # %v%                                                           #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% ...                                  #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################
powershell -command "Expand-Archive -Force '%TEMP%\%xprvar3%' '%~dp0'"
timeout /T 1 /nobreak>nul
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # %v%                                                           #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% - Done                               #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################
rem Deleting leftover themp files
title Deleting Old Files ...
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # %v%                                                           #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% - Done                               #
echo # Deleting Old Files ...                                                      #
echo #                                                                             #
echo ###############################################################################
del %TEMP%\%xprvar3%
del %TEMP%\themp.html

timeout /T 1 /nobreak>nul
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # %v%                                                           #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% - Done                               #
echo # Deleting Old Files - Done                                                   #
echo #                                                                             #
echo ###############################################################################
timeout /T 1 /nobreak>nul
title Update Finished
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # %v%                                                           #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% - Done                               #
echo # Deleting Old Files - Done                                                   #
echo # Update Finished                                                             #
echo ###############################################################################
pause
GOTO START

:exit
exit

