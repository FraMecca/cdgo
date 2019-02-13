function cdgo
	set DB ~/.local/share/cdgo/db
	mkdir -p  ~/.local/share/cdgo/
	touch $DB
	set argc (count $argv)
	set helpflag 0
	if test $argc -lt 1
		echo "cdgo: incorrect usage"
	else
    	switch $argv[1]
    		case set
    			if test $argc -eq 2
    				kv -k $argv[2] -v (pwd) $DB
    			else if test $argc -eq 3
    				kv -k $argv[2] -v $argv[3] $DB
    			else
    				echo "cdgo: incorrect usage"
    			end
    		case list
    			if test $argc -eq 1
    				kv -l $DB
    			else
    				echo "cdgo: incorrect usage"
    			end
    		case purge
    			if test $argc -eq 1
    				rm $DB
    			else
    				echo "cdgo: incorrect usage"
    			end
    		case delete
    			if test $argc -eq 2
    				kv -d -k $argv[2] $DB
    			else
    				echo "cdgo: incorrect usage"
    			end
    		case --help
    			set helpflag 1
    		case -h
    			set helpflag 1
    		case help
    			set helpflag 1
    		case '*'
    			set flag 0
    			for p in (kv -l "$DB")
    				set key (echo $p | cut -d':' -f1)
    				if test $key = $argv[1]
    					set dst (echo $p | sed "s/$key: //g")
                        cd $dst
    					set flag 1
    					break
    				end
    			end
    			if test $flag -eq 0
    				echo "cdgo: checkpoint \"$argv[1]\" not set."
    			end
    		end
    	end
    	if test $helpflag -eq 1
			echo "cdgo -- advanced folder navigation"
			echo "Usage:"
			echo "    help                   show this help message"
			echo "    set [tag] [directory]  setup a checkpoint, if directory is not specified, the current folder is assumed"
			echo "    delete [directory]     remove a previously registered checkpoint"
			echo "    purge                  remove all the checkpoints"
			echo "    [tag]                  go to the folder associated with the specified tag"
    	end
    end
