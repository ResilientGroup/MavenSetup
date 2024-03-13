# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help \
	update-dependencies update-snapshot-dependencies

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# Updates of third-party dependencies
update-dependencies: ## Update Maven dependencies and plugins which have versions defined in properties
	cd Base && ../mvnw --projects :base,:versions clean versions:update-properties

update-snapshot-dependencies: ## Update locked snapshot versions with the latest available one in the POM
	cd Base && ../mvnw --projects :base,:versions versions:unlock-snapshots versions:lock-snapshots
