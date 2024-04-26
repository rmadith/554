int multiplyNumbers(int n) {
    if (n>=1)
        return n*multiplyNumbers(n-1);
    else
        return 1;
}
int main() {
    int n = 7;
    asm volatile ( "addi x0, x0, 552\n");  
    int x = multiplyNumbers(n);
    asm volatile ( "addi x0, x0, 752\n");  
    return x;
}

