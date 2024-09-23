all:
	stow --verbose --target=$$HOME --restow home
#	stow --verbose --target=/etc --restow etc
uninstall:
	stow --verbose --target=$$HOME --delete home
#	stow --verbose --target=/etc --delete etc