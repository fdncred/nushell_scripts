def loading [] {
    echo Loading $(char newline) | str collect | autoview
    echo 0..100 | each {
        sleep 50ms
        # I believe '1000D' means move the cursor to the left 1000 columns
        echo $(ansi -e '1000D') | autoview
        echo $(build-string $it '%') | autoview
    }
}

loading