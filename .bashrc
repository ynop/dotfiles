# Do nothing when not interactive
case $- in
	*i*) ;;
	*) return;;
esac

