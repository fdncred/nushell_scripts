set nl = $(char newline)
set plus = $(echo [$nl '   + '] | str collect)
set cols = $(seq 0 35 | each { echo $(build-string $it) | str lpad -c ' ' -l 3 } | str collect)
echo [$plus $cols] | str collect

set ansi_bg = $(ansi -e '48;5;')
set ansi_reset = $(ansi reset)
echo $nl $nl | str collect

set row_header = '   0  '
set row_data = $(seq 0 15 | each { 
    echo [$ansi_bg $it 'm' '  ' $ansi_reset ' '] 
} | str collect)
echo [$row_header $row_data $nl $nl] | str collect

seq 0 6 | each {
    set math_str = $(build-string $it ' * 36 + 16')
    set i = $(echo $math_str | math eval)
    set row_header = $(echo $i | str from -d 0 | str lpad -c ' ' -l 4)
    set row_data = $(seq 0 35 | each {
        set math_str2 = $(build-string $i + $it)
        set val = $(echo $math_str2 | math eval | str from -d 0)
        echo [$ansi_bg $val 'm' '  ' $(ansi -e 'm') ' ']
    } | str collect)
    echo [$row_header '  ' $row_data $nl $nl] | str collect
} | str collect