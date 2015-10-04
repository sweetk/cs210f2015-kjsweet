//KJ Sweet
//Lab 2 Problem 5
//Sep 14, 2015
//This work is mine unless otherwise cited
//This program manipulates character strings and
//munges the strings together for shipping purposes

#include <stdio.h>

main() {
  char first[] = "Dorian";
  char next[] = "Bull";
  char last[] = "Kaidan James";
  char munged[12] = "";
  int i;

  printf("%s, %s, %s\n", first, next, last);

  for (i = 0; i < 4; i++) {
    munged[i] = last[i];
  }//forKaidan

  for (i = 0; i < 4; i++) {
    munged[i+4] = first[i];
  }//forDorian

  for (i = 0; i < 4; i++) {
    munged[i+8] = next[i];
  }//forBull

  printf("Ship name: %s\n", munged);
}//main
