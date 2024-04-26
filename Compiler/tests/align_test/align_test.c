#include <stdint.h>
int main()
{

char y = 'B';

char z = 'C';
static int p = 12;
static int q = 12;
static int r = 12;
static char x = 'A';
static char s = 'A';

typedef struct{
 char x;
 char y;
 char z ;
 int p ;
} structure;

static structure w = {'A', 'B', 'C', 12}; 

char* t = &(w.z);
char a = *t;

}

