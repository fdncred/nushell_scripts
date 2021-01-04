seq 30 39 | each {
    set row = $(echo [$it ' '] | str collect)
    set data = $(seq 40 49 | each {
        echo [$it ' '] | str collect
    } | str collect)
    echo [$row $data $(char newline)] | str collect
} | str collect