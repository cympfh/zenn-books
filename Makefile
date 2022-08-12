PREVIEW_PORT := 8080

preview:
	npx zenn preview --port $(PREVIEW_PORT)

new-article:
	npx zenn new:article --slug $(SLUG)
