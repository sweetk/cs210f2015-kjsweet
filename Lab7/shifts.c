/****************************
 * KJ Sweet
 * Lab 7 part 2
 * Due October 26
 *
 * All work is mine unless otherwise cited
 *
 * This program takes in a number, and two endcap bits.
 * It then only returns the integer between the endcaps.
****************************/

#include <stdio.h>

int main() {
    int begin, end;
    unsigned int a;
    unsigned int mask = 0xFFFFFFFF;

    printf("Give me a number between 0 and 4,294,967,295:\n");
    scanf("%u", &a);

    printf("Enter two bit positions 0 to 31:\n");
    scanf("%d %d", &begin, &end);

    //Shift the mask
    mask = mask << begin;
    mask = mask >> begin;

    mask = mask >> (31-end);
    mask = mask << (31-end);

    //Apply mask
    a = (a & mask);
    a = a >> (31-end);
    printf("New a: %u\n", a);
}//main
