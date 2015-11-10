/* KJ Sweet
   Lab 9 Problem 2 part c
   Nov 11 2015
   This program changes each element of an array to be the sum of the numbers
   next to it in the original array.
   All work is mine unless otherwise cited
   Modified from lab9.c by Bob Roos
 */

/**********  DON'T CHANGE ANY C CODE EXCEPT THE arrayCalc FUNCTION! *********/
#include <stdio.h>

/* Function prototype: */
void arrayCalc(int a[], int len);

int main() {
    int a1[] = {4,2,9,-1,6,3};
    int a2[] = {10,9,11,12,15,28,19};
    int a3[] = {2,3,5,8,0,10,1};//changed from the other examples for clarity
    int l1 = 6, l2 = 7, l3 = 7, i;
    arrayCalc(a1,l1);
    for (i = 0; i < l1; i++) { printf("%d ",a1[i]); }
    printf("\n");
    arrayCalc(a2,l2);
    for (i = 0; i < l2; i++) { printf("%d ",a2[i]); }
    printf("\n");
    arrayCalc(a3,l3);
    for (i = 0; i < l3; i++) { printf("%d ",a3[i]); }
    printf("\n");
}

/***********  CHANGE THE FOLLOWING FUNCTION ACCORDING TO THE PROBLEM ******/
void arrayCalc(int a[], int len) {
    int i, a0, temp1, temp2;
    a0 = a[0];
    temp1 = a[0];

    //The first element is different
    a[0] += a[1];

    for (i = 1; i < len-1; i++) {
        temp2 = a[i];
        a[i] = temp1 + a[i + 1];
        temp1 = temp2;
    }//for

    //The last element is different
    a[len-1] += temp2;
}
