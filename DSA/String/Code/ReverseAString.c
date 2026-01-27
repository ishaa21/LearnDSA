#include <stdio.h>
#include <string.h>

// Reverse a String in C
// Different methods to reverse a string

void reverseString(char str[]) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        // Swap characters
        char temp = str[i];
        str[i] = str[len - 1 - i];
        str[len - 1 - i] = temp;
    }
}

void displayString(char str[]) {
    printf("%s\n", str);
}

int main() {
    // Method 1: Using function with swap
    printf("Method 1: Using swap function\n");
    char str1[50] = "Hello World";
    printf("Original: ");
    displayString(str1);
    reverseString(str1);
    printf("Reversed: ");
    displayString(str1);
    
    // Method 2: Using pointer and iteration
    printf("\nMethod 2: Using pointers\n");
    char str2[50] = "Hello World";
    printf("Original: %s\n", str2);
    
    char *start = str2;
    char *end = str2 + strlen(str2) - 1;
    
    while (start < end) {
        char temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
    printf("Reversed: %s\n", str2);
    
    // Method 3: Building new string in reverse
    printf("\nMethod 3: Building new string\n");
    char str3[50] = "Programming";
    char reversed[50] = "";
    int len = strlen(str3);
    
    printf("Original: %s\n", str3);
    for (int i = len - 1; i >= 0; i--) {
        reversed[len - 1 - i] = str3[i];
    }
    reversed[len] = '\0';
    printf("Reversed: %s\n", reversed);
    
    // Method 4: Using recursion
    printf("\nMethod 4: Using recursion\n");
    void reverseRecursive(const char *str, int n);
    char str4[50] = "Recursion";
    printf("Original: %s\n", str4);
    printf("Reversed: ");
    reverseRecursive(str4, strlen(str4) - 1);
    printf("\n");
    
    return 0;
}

void reverseRecursive(const char *str, int n) {
    if (n >= 0) {
        printf("%c", str[n]);
        reverseRecursive(str, n - 1);
    }
}
