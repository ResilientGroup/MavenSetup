# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help \
	update-dependencies update-snapshot-dependencies bump-version

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

MAVEN_COMMAND ?= ./mvnw

# Updates of third-party dependencies
update-dependencies: ## Update Maven dependencies and plugins which have versions defined in properties
	$(MAVEN_COMMAND) --projects :parent,:versions clean -DgenerateBackupPoms=false versions:update-properties

update-snapshot-dependencies: ## Update locked snapshot versions with the latest available one in the POM
	$(MAVEN_COMMAND) --projects :parent,:versions -DgenerateBackupPoms=false versions:unlock-snapshots versions:lock-snapshots

bump-version: $(eval SHELL := /bin/bash) ## Bump the version of the project
	@if [ -z "$(NEW_VERSION)" ]; then read -e -i "$$($(MAVEN_COMMAND) help:evaluate -Dexpression=revision --quiet -DforceStdout)" -p 'new version: ' -r NEW_VERSION; fi; \
		if [ -z "$$NEW_VERSION" ]; then echo 'ERROR: NEW_VERSION is not set.'; exit 2; fi; \
		$(MAVEN_COMMAND) versions:set-property -DgenerateBackupPoms=false -Dproperty=revision -DnewVersion=$$NEW_VERSION
