# Calculator. Stolen from somewhere in StackOverflow. Use as follows:
# c 1+1
# c '2^(1/2)'
c () {
    local in="$(echo " $*" | sed -e 's/\[/(/g' -e 's/\]/)/g')";
    gawk -M -v PREC=201 -M 'BEGIN {printf("%.60g\n",'"${in-0}"')}' < /dev/null
}
