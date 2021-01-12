# this script will print a blue gradient on the screen

let height = 40 # really need to get the terminal height here
let width = 160  # really need to get the terminal width here

seq 0 $height | each {
    let row_data = $(seq 0 $width | each {
        let fgcolor = $(iter_inc 2 2 $it)
        if $fgcolor > 200 && $fgcolor < 210 {
            echo [$(ansi -e '48;2;0;0;') $(build-string $fgcolor m) 'Nu' $(ansi -e '0m')] | str collect
        } {
            echo [$(ansi -e '48;2;0;0;') $(build-string $fgcolor m) ' ' $(ansi -e '0m')] | str collect
        }
    } | str collect)
    echo [$row_data $(char newline)] | str collect | autoview
} | str collect

def iter_inc [incr mult iter] {
    echo $(build-string $incr + $mult * $iter) | math eval | math round
}