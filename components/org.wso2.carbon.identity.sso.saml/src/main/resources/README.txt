Patch ID         : WSO2-CARBON-PATCH-4.4.0-9999
Applies To       : is-5.3.0
Associated JIRA  : https://support.wso2.com/jira/browse/CIRBSUB-41


DESCRIPTION
-----------
This patch carries CIRB/CIBG fix for saml async SLO functionalities , see http://confluence.cirb.lan/pages/viewpage.action?pageId=24776146


INSTALLATION INSTRUCTIONS
-------------------------

(i)  Shutdown the server, if you have already started.

(ii) Copy the WSO2-CARBON-UPDATE-4.4.0-9999.zip to  <CARBON_SERVER>/repository/components/patches/

(iii) Copy the oauth2.war file inside resources folder to <CARBON_SERVER>/repository/deployment/server/webapps/. 
(Make sure to replace the existing files with these resources coming with the patch and delete the relevant extracted folders of the old .war files.)

(iii) Restart the server with :
       Linux/Unix :  sh wso2server.sh
       Windows    :  wso2server.bat