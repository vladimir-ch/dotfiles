function ff --wraps find
	find . -type f -iname '*'$argv[1]'*' -ls ;
end
