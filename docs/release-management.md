
# Release Mamagement

This project uses [changie](https://changie.dev/) for release management. New issues are created using this command:

```bash
changie new
```

Releases are created as follows.

```bash
changie batch auto
changie merge

git add .
git commit -m "Release: $(changie latest)"
git push

gh release create $(changie latest) --notes-file .changes/$(changie latest).md
```

