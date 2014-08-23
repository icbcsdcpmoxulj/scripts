@echo off
echo Maven artifacts easy-deployer of 22nd August 2014, by Xu Lijia.
echo.

if "%1"=="" goto displayusage
if "%2"=="" goto displayusage
if "%3"=="" goto displayusage
if "%4"=="" goto displayusage
if "%5"=="" goto displayusage
if "%6"=="" goto displayusage
if "%7"=="" goto displayusage

goto deploy


:displayusage
echo Usage:
echo deploy.bat groupId artifactId version packaging file repoId repoUrl
echo.
echo Note: All the 7 parameters above should not be null. 
goto end


:deploy
echo Please check before deploying
echo groupId: %1
echo artifactId: %2
echo version: %3
echo packaging: %4
echo file: %5
choice /m "Are you sure to deploy?"
if not "%errorlevel%"=="1" goto end
echo Deploying %5 ...
mvn deploy:deploy-file -DgroupId=%1 -DartifactId=%2 -Dversion=%3 -Dpackaging=%4 -Dfile=%5 -DrepositoryId=%6 -Durl=%7 >deploy.log
echo Deployment completed.


:end