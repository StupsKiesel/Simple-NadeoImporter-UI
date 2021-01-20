::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBpQQQ2MAE+1BaAR7ebv/NaztUQJV+oDUYLa3bGdHNM4uQvtdplN
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
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
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
::Zh4grVQjdCyDJGyX8VAjFBpQQQ2MAE+/Fb4I5/jHweuDp0I0WfIwapveyIGnHM4S7kDrXJs92WhOndk5JSRvdxz8IAosrA4=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
title Simple NadeoImporter UI
color 0a
SET NadeoImporterPath=%~dp0
set NadeoImporterexe="NadeoImporter.exe"
mode con: cols=80 lines=9


rem skiping intro
rem GOTO INTROEND

rem INTRO_1
echo      ////////////////  ////////////////  ////////////////  ////////////////
echo     ////////////////  ////////////////  ////////////////  //////////////// 
echo    ////////////////  ////////////////  ////////////////  ////////////////
echo             //////  //////            //////                      //////
echo            //////  //////            //////                      //////
echo           //////  //////            //////                      //////
echo          //////  //////            //////                      //////
echo         //////  //////            //////                      //////
timeout /T 1 /nobreak>nul

rem INTRO_2
echo      ////////////////  ////////////////  ////////////////  ////////////////
echo     ////////////////  ////////////////  ////////////////  //////////////// 
echo    ////////////////  ////////////////  ////////////////  ////////////////
echo             //////  //////            //////                      //////
echo            //////  //////            //////                      //////
echo           //////  //////            //////                      //////
echo          //////  //////            //////                      //////
echo         ######################################################//////
timeout /T 1 /nobreak>nul

rem INTRO_3
echo      ////////////////  ////////////////  ////////////////  ////////////////
echo     ////////////////  ////////////////  ////////////////  //////////////// 
echo    ////////////////  ////////////////  ////////////////  ////////////////
echo             //////  //////            //////                      //////
echo            //////  //////            //////                      //////
echo           //////  //////            //////                      //////
echo         ###################################################### //////
echo         #              Simple NadeoImporter UI               #//////
timeout /T 1 /nobreak>nul

rem INTRO_4
echo      ////////////////  ////////////////  ////////////////  ////////////////
echo     ////////////////  ////////////////  ////////////////  //////////////// 
echo    ////////////////  ////////////////  ////////////////  ////////////////
echo             //////  //////            //////                      //////
echo            //////  //////            //////                      //////
echo         ######################################################  //////
echo         #              Simple NadeoImporter UI               # //////
echo         ######################################################//////
timeout /T 1 /nobreak>nul

rem INTRO_5
echo      ////////////////  ////////////////  ////////////////  ////////////////
echo     ////////////////  ////////////////  ////////////////  //////////////// 
echo    ////////////////  ////////////////  ////////////////  ////////////////
echo             //////  //////            //////                      //////
echo         ######################################################   //////
echo         #              Simple NadeoImporter UI               #  //////
echo         ###################################################### //////
echo         //////  //////            //////                      //////
timeout /T 1 /nobreak>nul

rem INTRO_6
echo      ////////////////  ////////////////  ////////////////  ////////////////
echo     ////////////////  ////////////////  ////////////////  //////////////// 
echo    ////////////////  ////////////////  ////////////////  ////////////////
echo         ######################################################    //////
echo         #              Simple NadeoImporter UI               #   //////
echo         ######################################################  //////
echo          //////  //////            //////                      //////
echo         //////  //////            //////                      //////
timeout /T 1 /nobreak>nul

rem INTRO_7
echo      ////////////////  ////////////////  ////////////////  ////////////////
echo     ////////////////  ////////////////  ////////////////  //////////////// 
echo    /////######################################################///////////
echo         #              Simple NadeoImporter UI               #    //////
echo         ######################################################   //////
echo           //////  //////            //////                      //////
echo          //////  //////            //////                      //////
echo         //////  //////            //////                      //////
timeout /T 1 /nobreak>nul
:INTROEND
cls
mode con: cols=80 lines=8
rem check if NadeoImporter is instaled corectly
echo ###############################################################################
echo #                                                                             #
echo #                                                                             #
echo #  check for NadeoImporter.exe                                                #
if exist %NadeoImporterexe% (
    rem file exists
	echo #  OKAY                                                                       #
) else (
    rem file doesn't exist
	echo #  NadeoImporter.exe was not found                                            #
	echo #                                                                             #
	echo ###############################################################################
	pause
	exit
	
)
echo #                                                                             #
echo ###############################################################################
timeout /T 1 /nobreak>nul

:importagain
:again
:again44
mode con: cols=80 lines=8
echo ###############################################################################
echo # possible modes:                                                             #
echo #                                                                             #
echo # [1] Item - Creates a singel *.Item.Gbx file                                 #
echo # [2] Mesh - Creates a file combination Item / Shape / Mesh                   #
echo # [3] Open NandoImporter Documentation (www)                                  #
echo ###############################################################################
set /P mode=Select Mode:

IF "%mode%"=="3" (
 	start "" https://doc.trackmania.com/nadeo-importer/
 	)

rem Mode must be 1 or 2
IF NOT "%mode%"=="1" IF NOT "%mode%"=="2" (
 	GOTO again
 	)

:again2
echo ###############################################################################
echo # input options:                                                              #
echo #                                                                             #
echo # Items\*.fbx                                                                 #
echo # Items\filename.fbx                                                          #
echo # Items\subfolder\*.fbx                                                       #
echo ###############################################################################
set "path="
set /P path=Enter path to FBX - Items\

rem check for blank input
if "%path%" equ "" (
	GOTO again2
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
echo ###############################################################################
echo # validate your input:                                                        #
echo #                                                                             #
echo # Mode: %convmode%                                                                  #
echo # Path: Items\%path%
echo #                                                                             #
echo ###############################################################################
set /P start=Start the Import? [Y/N]

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
echo Executing NadeoImporter.exe
echo ###############################################################################
CALL %NadeoImporterexe% %convmode% Items\%path%
echo .
echo ###############################################################################
pause

:again34
rem Import Again?  
echo ###############################################################################
echo #                                                                             #
echo #                        Do you want to import again ?                        #
echo #                                                                             #
echo #                    Simple Importer UI made by StupsKiesel                   #
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

:exit
exit

