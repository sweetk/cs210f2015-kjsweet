/*************************************
 * KJ Sweet
 * Lab 7 Part 1c
 * Due October 26
 *
 * This program prints the sizes of various data types
 * All work is mine unless otherwise cited
 *************************************/

#include <stdio.h>

int main() {
  int tint;
  float tfloat;
  double tdouble;
  char tchar;
  short tshort;
  long long tlonglong;

  printf("Data Type:    Size:\n");
  printf("===================\n");
  printf("int            %lu\n", sizeof(tint));
  printf("float          %lu\n", sizeof(tfloat));
  printf("double         %lu\n", sizeof(tdouble));
  printf("char           %lu\n", sizeof(tchar));
  printf("short          %lu\n", sizeof(tshort));
  printf("long long      %lu\n", sizeof(tlonglong));

}//main
