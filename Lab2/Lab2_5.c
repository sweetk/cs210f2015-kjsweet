//KJ Sweet
//Lab 2 Problem 5
//Sep 14, 2015
//This work is mine unless otherwise cited
//This code takes the arethmetic or gemetric mean
//depending on whether the sum is odd or even

#include <stdio.h>
#include <math.h>

int even(unsigned int isit);
double agmean(unsigned int i, unsigned int j);

main() {
  unsigned int num1, num2;

  printf("Enter two numbers:");
  scanf("%u%u", &num1, &num2);;
  printf("agmean(%u,%u) is: %lf\n", num1, num2, agmean(num1, num2));

  return 0;
} //main

int even(unsigned int isit) {
  int even;

  if(isit%2 == 0) {
    even = 1;
  }//if
  else {
    even = 0;
  }//else

  return even;
}//even

double agmean(unsigned int i, unsigned int j) {
  double it;
  unsigned int sum;

  sum = i + j;

    if(even(sum) == 0) {
      it = sqrt(1.0*i*j);
    }//if
    else {
      it = sum/2.;
    } //else

  return it;
}//agmean
