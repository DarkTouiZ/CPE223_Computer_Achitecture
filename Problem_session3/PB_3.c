#include <stdio.h>

//find the 44th number in the fibonacci sequence function
int fibonacci(int n)
{
    if (n == 0)
    {
        return 0;
    }
    else if (n == 1)
    {
        return 1;
    }
    else
    {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}

int main()
{
    int n = 44;
    printf("The 44th number in the fibonacci sequence is: %d\n", fibonacci(n));
    return 0;
}