# Do nothing when not interactive
case $- in
	*i*) ;;
	*) return;;
esac

[ -r "~/.bash_profile" ] && [ -f "~/.bash_profile" ] && source "~/.bash_profile";

