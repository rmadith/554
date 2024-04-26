#include <stdarg.h>

// C program for the above approach

#include <stdarg.h>
#include <stdio.h>

// Variadic function to add numbers
int AddNumbers(int n, ...)
{
	int Sum = 0;

	// Declaring pointer to the
	// argument list
	va_list ptr;

	// Initializing argument to the
	// list pointer
	va_start(ptr, n);

	for (int i = 0; i < n; i++)

		// Accessing current variable
		// and pointing to next one
		Sum += va_arg(ptr, int);

	// Ending argument list traversal
	va_end(ptr);

	return Sum;
}

// Driver Code
int main()
{

	// Variable number of arguments
		AddNumbers(2, 1, 2);
		AddNumbers(3, 3, 4, 5);
                char* str;

	//	sprintf(str, "sum = %d", AddNumbers(4, 6, 7, 8, 9));

	return 0;
}
