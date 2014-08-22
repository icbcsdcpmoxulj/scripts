@echo off
echo Maven artifacts easy-deployer of 22nd August 2014, by Xu Lijia.
echo.

if "%1"=="" goto displayusage
if "%2"=="" goto displayusage
if "%3"=="" goto displayusage
if "%4"=="" goto displayusage
if "%5"=="" goto displayusage

goto deploy


:displayusage
echo 用法:
echo deploy.bat groupId artifactId version packaging file
echo.
echo 注：以上五个参数都不得为空。
goto end


:deploy
echo 上传构件前请再次确认所输信息是否正确:
echo groupId: %1
echo artifactId: %2
echo version: %3
echo packaging: %4
echo file: %5
choice /m "确认上传构件？"
if not "%errorlevel%"=="1" goto end
echo Deploying %5 ...
mvn deploy:deploy-file -DgroupId=%1 -DartifactId=%2 -Dversion=%3 -Dpackaging=%4 -Dfile=%5 -Durl=http://122.16.61.59:9000/nexus/content/repositories/my-repo/ -DrepositoryId=xulj-maven-private-server >deploy.log
echo Deployment completed.


:end