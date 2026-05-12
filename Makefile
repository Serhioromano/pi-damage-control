.PHONY: publish

# Publish a new version to npm.
#   1. Checks if logged in to npm (npm whoami), runs npm login if not.
#   2. Bumps version in package.json and creates a git commit + tag (npm version).
#   3. Pushes the commit and tag to GitHub.
#   4. Publishes the package to npm registry (npm publish).
#
# Usage: make publish v=<version>
#   make publish v=patch   — 1.0.1 → 1.0.2
#   make publish v=minor   — 1.0.1 → 1.1.0
#   make publish v=major   — 1.0.1 → 2.0.0
#   make publish v=1.5.0   — explicit version
publish:
	@test -n "$(v)" || { \
		echo "Usage: make publish v=<version>"; echo "Example: make publish v=patch"; 
		exit 1; \
	}
	@npm whoami >/dev/null 2>&1 || { \
		echo "Not logged in to npm. Running npm login..."; \
		npm login; \
	}
	npm version $(v)
	git push origin master --follow-tags
	npm publish
