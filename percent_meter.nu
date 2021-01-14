# this script doesn't work. the intent of it is to
# print a progress %, overwriting the same line
# with each update.

# it seems to be difficult to get nushell
# to output iteratively through each loop
def loading [] {
    echo Loading $(char newline) | str collect | autoview
    echo 0..100 | each {
        sleep 50ms
        echo $(ansi -e '1000D') | autoview
        echo $(build-string $it '%') | autoview
        # I believe '1000D' means move the cursor to the left 1000 columns
        # let value = $(echo [$(ansi -e '1000D') $(build-string $it) '%'] | str collect)
        # echo $value | autoview
    }
}

loading