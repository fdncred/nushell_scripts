def show_index_colors [] {
    set prefix = "48;5;"
    set reset_color = "0m"
    echo 1..256 | each {
        set cr = $(echo $(build-string $it % 16) | math eval)
        set color = $(echo [$(ansi -e $prefix) $(build-string $it) 'm'] | str collect)
        set padded_number = $(echo $(build-string $it | str lpad -l 3 -c '0'))
        if $cr == 0 {
            echo [$color $padded_number ' ' $(ansi -e $reset_color) $(char newline)]
        } {
            echo [$color $padded_number ' ' $(ansi -e $reset_color)]
        }
    } | str collect
}

show_index_colors

#one-liner
#echo 0..255 | each {echo [$(ansi -e '38;5;') $(build-string $it) 'm' $(build-string $it) ' ']} | str collect