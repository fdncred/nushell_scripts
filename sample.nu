echo 40..47 100..107 49 | each {
    let clbg = $it
    echo 30..37 90..97 39 | each {
        let clfg = $it
        let row = $(echo 0 1 2 4 5 6 | each {
            let attr = $it
            let ansi_str = $(echo [$(make-str $attr) ';' $(make-str $clbg) ';' $(make-str $clfg) 'm'] | str collect)
            echo [$(ansi -e $ansi_str) ' ' $ansi_str ' ' $(ansi reset)] | str collect
            } | str collect)
        echo [$row $(char newline)] | str collect
    } | str collect
} | str collect

def make-str [item] {
    echo $item | str from
}

# Bash Script
# for clbg in {40..47} {100..107} 49 ; do
# 	#Foreground
# 	for clfg in {30..37} {90..97} 39 ; do
# 		#Formatting
# 		for attr in 0 1 2 4 5 7 ; do
# 			#Print the result
# 			echo -en "\033[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \033[0m"
# 		done
# 		echo #Newline
# 	done
# done

# exit 0