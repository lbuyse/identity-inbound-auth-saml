# BrIAM WSO2 SAML 2.0 Single Logout Patch

This project contains all the sources to build the BrIAM patch for the WSO2 saml SLO problem.
Explanation of the problem and solution here : http://confluence.cirb.lan/pages/viewpage.action?pageId=24776146

## General prerequisites

*   Git (for windows)
*   Maven 2
*   make (for windows please install make for windows : http://gnuwin32.sourceforge.net/packages/make.htm)
* 	Github account to checkout wso2 sources.

### Exclude Eclipse configuration files from Git index

After cloning this Git project, execute the following commands to avoid considering changes in Eclipse configuration files :

```
git update-index --assume-unchanged **/**/.project
git update-index --assume-unchanged **/**/.settings/*
git update-index --assume-unchanged **/**/.classpath
```

## Project structure

          
## Usage
http://confluence.cirb.lan/pages/viewpage.action?pageId=24776146

It assumes that [JDK8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) (Not OpenJDK8!!!) and [Apache Maven](http://maven.apache.org/download.cgi) are already installed to build the project.

Build the patch (`make`) and deploy it (with `make deploy`) to your local WSO2 IS create a .env file with your 
carbon home path see [Execution section](#execution)

### Prerequisites
WSO2 Identity Server 5.3.0 with latest updates downloaded from cirb repo : http://repo.irisnet.be/apps/org.wso2/wso2is-5.3.0.zip and unzipped to your local dir 
Here you can see the latest updates report http://repo.irisnet.be/apps/org.wso2/latest-wso2is530-update-18-12-2017-report.pdf

### Development Usage

http://confluence.cirb.lan/pages/viewpage.action?pageId=24776146

#### Web

### Build

#### <a id="default_build"></a>Default build

From `identity-inbound-auth-saml` parent project folder, execute either `make`, `make build` or `mvn clean package` command. The latter command will be used in all cases to run the build.

This build results in a `org.wso2.carbon.identity.sso.saml-5.3.0.jar` file located in submodule `components/org.wso2.carbon.identity.sso.saml/target/` folder.

It also results in a zip file called WSO2-CARBON-UPDATE-4.4.0-9999.zip located in submodule `components/org.wso2.carbon.identity.sso.saml/target/` folder.
This zip file can be used to be uploaded to the BRIC repository and be used by puppet to install as a patch on WSO2 IS.

#### <a id="deploy_build"></a>build and deploy patch

From `identity-inbound-auth-saml` parent project folder, execute either `make deploy` or `mvn clean package -PdeployLocalIdp -Dlocal.idp.carbon.home.path=$(LOCAL_IDP_CARBON_HOME_PATH)` command. The latter command will be used in all cases to run the build. The default profile will skip the bundles deployment.

This build execution uses the [Maven Dependency Plugin](https://maven.apache.org/plugins/maven-dependency-plugin/) to 
deploy/copy the patch bundle jar artifact to your local wso2 IS patch9999 directory.
 Execution of plugins can be found in every submodule `../pom.xml` file.
The carbon home path where patch should be deployed (Your local WSO2 IS 5.3.0 folders) should be configured in your .env file so this execution requires the environment to be configured and initialized first. See [Execution section](#execution) for more information about environment configuration and initialization.

### <a id="execution">Execution</a>

#### Environment Configuration

The project contains a `Makefile` to execute different targets for build and execution. Execution targets enable configuring local environment. Create a `.env` file in the project root folder, then complete the file with the following and adapt :

```
LOCAL_IDP_CARBON_HOME_PATH=C:\Development\Servers\wso2is-5.3.0
```

### <a id="execution">Execution</a>

After your patch is deployed [Deploy build section](#deploy_build) ,  
Run WSO2 IS by running `$CARBON_HOME/bin/wso2server.sh` for linux and `$CARBON_HOME/bin/wso2server.bat` for windows. 

#### Environment initialization and execution

#### Environment stop / destroy
