docs/README.md: docs/reference.md docs/header.md docs/commit_history.md
	cat \
		docs/header.md \
		<(printf "\n\n") \
		docs/reference.md \
		<(printf "\n\n") \
		docs/commit_history.md \
	> docs/README.md

docs/reference.md: square.py circle.py rectangle.py triangle.py
	pydoc-markdown -m square -m circle -m rectangle -m triangle -I . > docs/reference.md


.PHONY: docs/commit_history.md
docs/commit_history.md:
	cat \
		<(printf "# Commit history\n") \
		<(git log --pretty=format:"## %s%n- **Author:** %an %n- **Date:** %ad %n- **Hash:** %H%n" --date=short) \
	> docs/commit_history.md
