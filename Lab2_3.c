//KJ Sweet
//Lab 2 Problem 5
//Sep 14, 2015
//This work is mine unless otherwise cited
//This program takes the average of two numbers

#include <stdio.h>

double mean(int i, int j);

main() {
  int num1, num2;
  //double mean();

  printf("Enter two integers:");
  scanf("%d%d", &num1, &num2);;
  printf("The average of %d and %d is: %lf\n", num1, num2, mean(num1, num2));

  return 0;
} //main

double mean(int i, int j) {
  double avg;

  avg = (i+j)/2.;

  return avg;
} //mean
