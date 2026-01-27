#include <stdio.h>
#include <string.h>

// Length of a String in C
// Different methods to find the length of a string

int main() {
    char str[] = "Hello World";
    
    // Method 1: Using strlen() function
    int len1 = strlen(str);
    printf("Using strlen(): %d\n", len1);
    
    // Method 2: Manual counting
    int len2 = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        len2++;
    }
    printf("Using manual loop: %d\n", len2);
    
    // Method 3: Using pointer
    int len3 = 0;
    char *ptr = str;
    while (*ptr != '\0') {
        len3++;
        ptr++;
    }
    printf("Using pointer: %d\n", len3);
    
    // Method 4: Finding length without null terminator check
    char str2[50];
    printf("Enter a string: ");
    fgets(str2, sizeof(str2), stdin);
    
    int len4 = 0;
    while (str2[len4] != '\n' && str2[len4] != '\0') {
        len4++;
    }
    printf("Length of input string: %d\n", len4);
    
    return 0;
}
