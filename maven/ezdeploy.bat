@echo off
Rem  Licensed to the Apache Software Foundation (ASF) under one or more
Rem  contributor license agreements.  See the NOTICE file distributed with
Rem  this work for additional information regarding copyright ownership.
Rem  The ASF licenses this file to You under the Apache License, Version 2.0
Rem  (the "License") you may not use this file except in compliance with
Rem  the License.  You may obtain a copy of the License at
Rem  
Rem       http://www.apache.org/licenses/LICENSE-2.0
Rem  
Rem  Unless required by applicable law or agreed to in writing, software
Rem  distributed under the License is distributed on an "AS IS" BASIS,
Rem  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
Rem  See the License for the specific language governing permissions and
Rem  limitations under the License.
Rem  Contributors:      Xu Lijia

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