int main(){
   float m0[4][4] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
   float m1[4][4] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17};
   float o[4][4];
   float q = 0;
   asm volatile ( "addi x0, x0, 552\n");  
   for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
         int s = 0;
         for (int k = 0; k < 4; k++) {
            s += m0[i][k] * m1[k][j];
         }
         o[i][j] = s;
         q += s;
      }
   }
   asm volatile ( "addi x0, x0, 752\n");  

   return (int) q;
}
