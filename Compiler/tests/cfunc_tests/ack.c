int ack(int m, int n)
{
    if (m == 0){
        return n + 1;
    }
    else if((m > 0) && (n == 0)){
        return ack(m - 1, 1);
    }
    else if((m > 0) && (n > 0)){
        return ack(m - 1, ack(m, n - 1));
    }
}
 
// Driver code
int main()
{
    int A;
    asm volatile ( "addi x0, x0, 552\n");  
    A = ack(2, 3);
    asm volatile ( "addi x0, x0, 752\n");
    return A;
}