def make_header [hi] {
    if $hi == $true {
        set ansi100m = $(echo '100m' | str lpad -l 11 -c ' ')
        set ansi101m = $(echo '101m' | str lpad -l 9 -c ' ')
        set ansi102m = $(echo '102m' | str lpad -l 9 -c ' ')
        set ansi103m = $(echo '103m' | str lpad -l 9 -c ' ')
        set ansi104m = $(echo '104m' | str lpad -l 9 -c ' ')
        set ansi105m = $(echo '105m' | str lpad -l 9 -c ' ')
        set ansi106m = $(echo '106m' | str lpad -l 9 -c ' ')
        set ansi107m = $(echo '107m' | str lpad -l 9 -c ' ')
        echo [$(char newline) $ansi100m $ansi101m $ansi102m $ansi103m $ansi104m $ansi105m $ansi106m $ansi107m $(char newline)] | str collect
    } {
        set ansi40m = $(echo '40m' | str lpad -l 10 -c ' ')
        set ansi41m = $(echo '41m' | str lpad -l 8 -c ' ')
        set ansi42m = $(echo '42m' | str lpad -l 8 -c ' ')
        set ansi43m = $(echo '43m' | str lpad -l 8 -c ' ')
        set ansi44m = $(echo '44m' | str lpad -l 8 -c ' ')
        set ansi45m = $(echo '45m' | str lpad -l 8 -c ' ')
        set ansi46m = $(echo '46m' | str lpad -l 8 -c ' ')
        set ansi47m = $(echo '47m' | str lpad -l 8 -c ' ')
        echo [$(char newline) $ansi40m $ansi41m $ansi42m $ansi43m $ansi44m $ansi45m $ansi46m $ansi47m $(char newline)] | str collect
    }
}

def mk_header [color_range:range] {
    set min_rng = $(echo $color_range | math min)
    set hi_start_pad = 11
    set hi_regular_pad = 9
    set lo_start_pad = 10
    set lo_regular_pad = 8
    echo $color_range | each {
        #set cur = $(echo $it | str to-int)
        #set cur = $(echo $it)
        set ansi_color = $(echo [$(build-string $it 'm')])
        if $it == $min_rng {
            if $min_rng == 100 {
                set header = $(echo $ansi_color | str lpad -l $hi_start_pad -c ' ')
                echo $header
            } {
                set header = $(echo $ansi_color | str lpad -l $lo_start_pad -c ' ')
                echo $header
            }
        } {
            if $min_rng > 100 {
                set header = $(echo $ansi_color | str lpad -l $hi_regular_pad -c ' ')
                echo $header
            } {
                set header = $(echo $ansi_color | str lpad -l $lo_regular_pad -c ' ')
                echo $header
            }
        }
    } | str collect
}

def color_row_range [num:int bg_rg:range] {
    set reset = $(ansi reset)
    set row_header = $(build-string $num "m " $(ansi reset))
    set row_data = $(echo $bg_rg | each {
        set row_name = $(echo [$(build-string $num ';' $it) "m"] | str collect)
        set ansi_color = $(ansi -e $row_name)
        echo [$ansi_color ' ' $row_name ' ' $reset] | str collect
    } | append $(char newline) | str collect)
    echo [$row_header $row_data] | str collect
}

def create_color_tables [fg_range:range bg_range:range] {
    echo $fg_range | each {
        color_row_range $it $bg_range
    } | str collect
}

def color_table [] {    
    make_header $false
    create_color_tables 30..37 40..47

    make_header $true
    create_color_tables 90..97 100..107

    mk_header 40..47
    mk_header 100..107
}

color_table