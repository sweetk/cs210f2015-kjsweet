/**
 * KJ Sweet
 * Lab 7, part 1b
 * due October 26
 *
 * This program shows use of pointer variables to access
 * elements of an array. Now with long longs!
 *
 * All work is mine unless otherwise cited
 * This program is altered from pointer.c by Bob Roos
 */

#include <stdio.h>
#define SIZE 12
int main() {
   long long a[SIZE] = {5,3,6,7,2,1,9,8,10,4,11,0};
   long long *b, *c;
   int i,temp;

   /* Ordinary array indexing: this you should already know how to do! */
   for (i = 0; i < SIZE; i++) {
     printf("%lld ",a[i]);
   }
   printf("\n");

   /* Using a pointer to advance through the array. We start with
      b pointing to a, then we add 4 to b each time through the loop:
   */
   b = a;
   for (i = 0; i < SIZE; i++) {
     printf("%lld ",*(b++)); /* "b++" will add 4 since b points to int */
   }
   printf("\n");

   /* Changing the base of the array. Here, we set the pointer to
      the END of array a, but we offset all of our indices by -11 to
      compensate. Note that "c[1]", "c[2]", etc. are all illegal
      locations under this scheme.
   */
   c = a+SIZE-1; /* c now points to the LAST element in a */
   for (i = -(SIZE-1); i <= 0;  i++) { /* Indices are c[-11], c[-10], ..., c[0] */
     printf("%lld ",c[i]);
   }
   printf("\n");

   /* Reverse elements in an array: */
   b = a;
   c = a+SIZE-1;
   for (i = 0; i < SIZE/2; i++) {
     temp = *b;
     *(b++) = *c;
     *(c--) = temp;
   }

   for (i = 0; i < SIZE; i++) {
     printf("%lld ",a[i]);
   }
   printf("\n");
}
