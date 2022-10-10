compdef _adbunch adbunch

_adbunch () {
	_arguments \
		"1: :($ALLS)" \
		"*: :_files"
}
