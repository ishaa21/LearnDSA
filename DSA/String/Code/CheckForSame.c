#include <stdio.h>
#include <string.h>

// Check for Same (String Comparison) in C
// Different methods to compare two strings

int main() {
    char str1[] = "Hello";
    char str2[] = "Hello";
    char str3[] = "hello";
    char str4[] = "World";
    
    // Method 1: Using strcmp() - case sensitive
    printf("strcmp() function:\n");
    printf("strcmp(str1, str2): %d\n", strcmp(str1, str2));  // 0 = equal
    printf("strcmp(str1, str3): %d\n", strcmp(str1, str3));  // > 0
    printf("strcmp(str1, str4): %d\n", strcmp(str1, str4));  // < 0
    
    // Method 2: Using strcasecmp() - case insensitive (non-standard)
    printf("\nManual case-insensitive comparison:\n");
    int result = 0;
    int i = 0;
    while (str1[i] != '\0' && str3[i] != '\0') {
        char c1 = (str1[i] >= 'A' && str1[i] <= 'Z') ? str1[i] + 32 : str1[i];
        char c2 = (str3[i] >= 'A' && str3[i] <= 'Z') ? str3[i] + 32 : str3[i];
        if (c1 != c2) {
            result = c1 - c2;
            break;
        }
        i++;
    }
    if (result == 0 && str1[i] == str3[i])
        printf("Strings are equal (case-insensitive)\n");
    else
        printf("Strings are different\n");
    
    // Method 3: Comparing first n characters
    printf("\nComparing first 3 characters:\n");
    char str5[] = "Helloworld";
    char str6[] = "Hellouni";
    printf("strncmp(str5, str6, 3): %d\n", strncmp(str5, str6, 3));
    
    // Method 4: Manual character-by-character comparison
    printf("\nManual character comparison:\n");
    if (strcmp(str1, str2) == 0) {
        printf("str1 and str2 are the same\n");
    } else {
        printf("str1 and str2 are different\n");
    }
    
    return 0;
}
