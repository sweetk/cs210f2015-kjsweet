//KJ Sweet
//This program gives line numbers for an imputted file.

#include <stdio.h>

main() {
  int count = 1;
  char c;

  printf("%3d ", count);

  while ((c=getchar()) != EOF) {
    printf("%c", c);
    if (c == '\n') {
      count++;
      printf("%3d ", count);
    }//if
  } //while

  printf("\n");
} //main
