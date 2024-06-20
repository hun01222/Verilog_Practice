#include<stdio.h>

int main(){
  int i=0, j=1, n=15;
  int temp, arr[1000];

  while(i!=n){ // outer_loop
    j=i+1;
    while(j!=n){ // inner_loop
      if(arr[i]<arr[j]){ // no_swap
        j++;
        continue;
      }
      temp=arr[i];
      arr[i]=arr[j];
      arr[j]=temp;

      printf("%d %d %d %d", i, j, arr[i], arr[j]);
    }
    i++; // end_inner
  } // end_outer
}