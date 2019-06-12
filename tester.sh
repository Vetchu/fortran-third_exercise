IBEGIN=0
IEND=10
INTEGRALS=(0 1)
FUNCTIONS=(0 1 2)

echo -e "0 - rectangular\n1 - trapezoidal\n"

echo -e "FIRST - POLYNOMIAL"
echo -e "SECOND - E^X"
echo -e "THIRD - SIN(X)\n"
for I in ${!INTEGRALS[*]}; do
    echo "TESTING $I"
    for F in ${!FUNCTIONS[*]}; do
        ./main $I $IBEGIN $IEND 100 $F
    done
done
