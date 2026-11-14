#!/bin/bash
# Educational sample adapted from Upkar Lidder (IBM).
read -r -p 'Enter the principal: ' principal
read -r -p 'Enter time period in years: ' years
read -r -p 'Enter annual rate of interest (%): ' rate
for value in "$principal" "$years" "$rate"; do
    if [[ ! $value =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        printf 'Enter nonnegative numbers, such as 1000 or 5.25.
' >&2
        exit 1
    fi
done
interest=$(printf 'scale=2; %s * %s * %s / 100
' "$principal" "$years" "$rate" | bc) || exit 1
printf 'The simple interest is: %s
' "$interest"
