//KJ Sweet
//modified from K&R pg 17
//It prints out any instances of the characters in the word 'yes'.
#include <stdio.h>
main() {
    int c, count = 0;
    while ((c=getchar()) != EOF) {
        if (c == '\n') {
            putchar(c); /* Don't count the newline! */
        }
        else if (c == 'y' || c == 'e' || c == 's') { /* Print and count */
            putchar(c);
            count++;
        }
        else { /* Don't print, but count */
            count++;
        }
    }
}
