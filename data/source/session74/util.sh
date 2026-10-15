#! /bin/bash
x=888
y=999
add() {
    echo "$1 + $2 = $[$1 + $2]"
}
multiply() {
    echo "$1 * $2 = $[$1 * $2]"
}
subtract() {
    echo "$1 - $2 = $[$1 - $2]"
}
divide() {
    echo "$1 / $2 = $[$1 / $2]"
}
