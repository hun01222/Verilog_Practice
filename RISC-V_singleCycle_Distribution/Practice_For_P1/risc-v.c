void matmul (int result[3], int mat[3][3], int vec[3]){
  int i, j, k;

  for(i=0; i<3; i++){
    k=0;
    
    for(j=0; j<3; j++)
      k+=mat[i][j]*vec[j];
    result[i]=k;
  }
}