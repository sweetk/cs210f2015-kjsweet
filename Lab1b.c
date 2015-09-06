//KJ Sweet
//This program counts and prints the number of vowels
//and consonants in a file.

#include <stdio.h>

main() {
  char c;
  int vow, con;
  //int test = 0;

  vow = con = 0;

  while ((c=getchar()) != EOF) {
    if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') {
      vow++;
    } //if
    else if(c > 'a' && c <= 'z' || c > 'A' && c <= 'Z') {
      con++;
    } //else if

    /*if(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z') {
      test++;
    }//test*/

  }//while

  //printf("Test: %d\n", test);
  printf("Vowels: %d, Consonants: %d\n", vow, con);
}//main
