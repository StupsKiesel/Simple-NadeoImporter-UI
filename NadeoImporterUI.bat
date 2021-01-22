::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBpQQQ2MAE+/Fb4I5/jHweuDp0I0WfIwapveyIGnHNQ+1WzpZZk/wn9IreJCBRhXHg==
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
::cxY6rQJ7JhzQF1fEqQJhZkkaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlbMbCXqZg==
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
::Zh4grVQjdCyDJGyX8VAjFBpQQQ2MAE+/Fb4I5/jHweuDp0I0WfIwapveyIGnHM4S7kDrXJs92WhOndk5JVVdZhfL
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
:START
title NadeoImporter
color 0a
SET NadeoImporterPath=%~dp0
set NadeoImporterexe="NadeoImporter.exe"
mode con: cols=80 lines=11

if exist %NadeoImporterexe% (
    rem file exists
	GOTO NI_exist
) else (
	SET "myvar=99999999999999999999999999999999999999999999999999999999999999999999999999999999999999"
	mode con: cols=80 lines=9
	GOTO UPDATER
    rem file doesn't exist
)

:NI_exist
cls
rem run NI without arguments to find version.
NadeoImporter.exe > tmpFile
set /p myvar= < tmpFile

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
del tmpFile 
pause

:importagain
:again
:again44
mode con: cols=80 lines=9
title Select a Mode
echo ###############################################################################
echo # Possible modes:                                                             #
echo #                                                                             #
echo # [1] Item   - Creating a *.Item.Gbx file                                     #
echo # [2] Mesh   - Improting a Shape / Mesh                                       #
echo # [3] WWW    - Open NadeoImporter Documentation                               #
echo # [4] Update - Try to update the NadeoImporter                                #
echo ###############################################################################
set /P mode=

IF "%mode%"=="3" (
 	start "" https://doc.trackmania.com/nadeo-importer/
 	)

IF "%mode%"=="4" (
 	GOTO UPDATER
 	)

rem Mode must be 1 or 2 
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
	echo ###############################################################################
	echo #                                                                             #
	echo #                              ! ! ! ERROR ! ! !                              #
	echo #                                                                             #
	echo #                        Your path must end with .fbx                         #
	echo #                                                                             #
	echo #                                                                             #
	echo ###############################################################################
	pause
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
echo ###############################################################################
echo ###############################################################################
echo ###############################################################################
echo ###############################################################################
echo ###############################################################################
CALL %NadeoImporterexe% %convmode% Items\%path%
echo .
echo ###############################################################################
title Importing process finished ...
pause

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
START /WAIT /MIN bitsadmin.exe /transfer "Searching for Download URL" https://doc.trackmania.com/nadeo-importer/01-download-and-install/index.html %NadeoImporterPath%themp.html
timeout /T 2 /nobreak>nul

rem reading html file
set "xprvar="
for /F "skip=501 delims=" %%i in (themp.html) do if not defined xprvar set "xprvar=%%i"
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
echo Version NEW: %version_new%

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
	pause
	GOTO START

	)
IF %version_old% neq %version_new% (
	title Update avaliable
	echo ###############################################################################
	echo # Searching for Download URL  - Done                                          #
	echo # Update available                                                            #
	echo #                                                                             #
	echo #                                                                             #
	echo #                                                                             #
	echo #                                                                             #
	echo ###############################################################################
	timeout /T 1 /nobreak>nul
	)

rem downloading Latest NadeoImporter.zip
title Downloading %xprvar3% ...
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # Update available                                                            #
echo # Downloading %xprvar3% ...                                #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################
START /WAIT /MIN bitsadmin.exe /transfer "Downloading %xprvar3%" %xprvar2% %NadeoImporterPath%%xprvar3%
timeout /T 2 /nobreak>nul
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # Update available                                                            #
echo # Downloading %xprvar3% - Done                             #
echo #                                                                             #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################

rem unzip
title Expanding %xprvar3% ...
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # Update available                                                            #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% ...                                  #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################
powershell -command "Expand-Archive -Force '%~dp0%xprvar3%' '%~dp0'"
timeout /T 1 /nobreak>nul
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # Update available                                                            #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% - Done                               #
echo #                                                                             #
echo #                                                                             #
echo ###############################################################################
rem Deleting leftover themp files
title Deleting Old Files ...
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # Update available                                                            #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% - Done                               #
echo # Deleting Old Files ...                                                      #
echo #                                                                             #
echo ###############################################################################
del %xprvar3%
del themp.html
timeout /T 1 /nobreak>nul
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # Update available                                                            #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% - Done                               #
echo # Deleting Old Files - Done                                                   #
echo #                                                                             #
echo ###############################################################################
timeout /T 1 /nobreak>nul
title Update Finished
echo ###############################################################################
echo # Searching for Download URL  - Done                                          #
echo # Update available                                                            #
echo # Downloading %xprvar3% - Done                             #
echo # Expanding %xprvar3% - Done                               #
echo # Deleting Old Files - Done                                                   #
echo # Update Finished                                                             #
echo ###############################################################################
pause
GOTO START

:exit
exit

