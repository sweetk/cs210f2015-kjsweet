//KJ Sweet
//CS210 Final Project
//February 12, 2016
//All work is mine unless otherwise cited
//
//This program takes in input to create a rectangle

#include <stdio.h>

main() {
  int x, y, i, j;

  printf("Please enter a width for your triangle, from 0 to 32:\n");
  scanf("%d", &x);
  printf("Please enter a height for your triangle, from 0 to 16:\n");
  scanf("%d", &y);

  printf("You entered: %d, %d\n", x, y);

  if(x>=0 && x<=32 && y>=0 && y<=16) {
    //printf("OK GOOD\n");//test

    for(j = 0; j<y; j++) {
      for(i = 0; i<x; i++) {
        if(j == 0 || j == (y-1)){
          printf("* ");
        }//top and bottem
        else if(i == 0 || i == (x-1)) {
          printf("/ ");
        }//sides
        else {
          printf("  ");
        }//middle
      }//over
      printf("\n");
    }//down
  }//good
  else {
    printf("Width or height out of bounds. Please try again.\n");
  }//bad
}//end
