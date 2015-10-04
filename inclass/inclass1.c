#include <stdio.h>

main() {
  int lcount[26];
  int i;
  char c, use;

  for(i = 0; i < 26; i++) {
    lcount[i] = 0;
  } //for

  while((c = getchar()) != EOF) {
    if(c >= 'a' && c <= 'z') {
      lcount[c-'a']++;
    }//if
  }//while

  for(i = 0; i < 26; i++) {
    printf("'%c':%d\n", use, lcount[i]);
    use++;
  } //for

  for(i = 0; i < 26; i++) {
    printf("'%c':%d\n", 'a' + i, lcount[i]);
  } //for
} //main
