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
echo �÷�:
echo deploy.bat groupId artifactId version packaging file
echo.
echo ע�������������������Ϊ�ա�
goto end


:deploy
echo �ϴ�����ǰ���ٴ�ȷ��������Ϣ�Ƿ���ȷ:
echo groupId: %1
echo artifactId: %2
echo version: %3
echo packaging: %4
echo file: %5
choice /m "ȷ���ϴ�������"
if not "%errorlevel%"=="1" goto end
echo Deploying %5 ...
mvn deploy:deploy-file -DgroupId=%1 -DartifactId=%2 -Dversion=%3 -Dpackaging=%4 -Dfile=%5 -Durl=http://122.16.61.59:9000/nexus/content/repositories/my-repo/ -DrepositoryId=xulj-maven-private-server >deploy.log
echo Deployment completed.


:end