#include <stdio.h>
#include <string.h>

// Concatenating Two Strings in C
// Join two strings together

int main() {
    char str1[50] = "Hello";
    char str2[50] = "World";
    char result[100] = "";
    
    // Method 1: Using strcat()
    printf("Method 1: Using strcat()\n");
    strcpy(result, str1);
    strcat(result, " ");
    strcat(result, str2);
    printf("Result: %s\n", result);
    
    // Method 2: Using strncat() - safe version
    printf("\nMethod 2: Using strncat()\n");
    result[0] = '\0';
    strncat(result, str1, 49);
    strncat(result, " ", 1);
    strncat(result, str2, 49);
    printf("Result: %s\n", result);
    
    // Method 3: Manual concatenation with loop
    printf("\nMethod 3: Manual loop\n");
    int i = 0, j = 0;
    result[0] = '\0';
    
    // Copy str1
    while (str1[i] != '\0') {
        result[j++] = str1[i++];
    }
    
    // Add space
    result[j++] = ' ';
    
    // Copy str2
    i = 0;
    while (str2[i] != '\0') {
        result[j++] = str2[i++];
    }
    result[j] = '\0';
    
    printf("Result: %s\n", result);
    
    // Method 4: Concatenating multiple strings
    printf("\nMethod 4: Multiple strings\n");
    char str3[50] = "from";
    char str4[50] = "C";
    result[0] = '\0';
    
    strcat(result, str1);
    strcat(result, " ");
    strcat(result, str2);
    strcat(result, " ");
    strcat(result, str3);
    strcat(result, " ");
    strcat(result, str4);
    printf("Result: %s\n", result);
    
    return 0;
}
