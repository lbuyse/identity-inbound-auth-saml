LOCAL_IDP_CARBON_HOME_PATH=C:\Development\Servers\wso2is-5.3.0

-include .env

build: ## Build the application
	mvn clean package

no-test: ## Build the application skipping tests
	mvn clean package -Dskip.unit.tests=true -Dmaven.test.skip=true 

deploy: ## Build the bundles & config and copy/deploy them in local idp folders
	mvn clean package -PdeployLocalIdp -Dlocal.idp.carbon.home.path=$(LOCAL_IDP_CARBON_HOME_PATH)

deploynotest: ## Build the bundles & config without tests and copy/deploy them in local idp folders
	mvn clean package -PdeployLocalIdp -Dlocal.idp.carbon.home.path=$(LOCAL_IDP_CARBON_HOME_PATH) -Dmaven.test.skip=true

#TODO
test: ## Run acceptance testing with mvn verify
	mvn verify
	
help: ## This help dialog.
	@echo "Usage: make [target]. Find the available targets below:"
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed 's/:.*##\s*/:/' | column -c2 -t -s :)"