#include <stdio.h>
#include <string.h>

// Generate All Substrings in C
// Print all possible substrings of a given string

void generateSubstrings(char str[]) {
    int len = strlen(str);
    int count = 0;
    
    printf("All substrings:\n");
    
    // Outer loop for starting position
    for (int i = 0; i < len; i++) {
        // Inner loop for ending position
        for (int j = i; j < len; j++) {
            // Print substring from position i to j
            for (int k = i; k <= j; k++) {
                printf("%c", str[k]);
            }
            printf("\n");
            count++;
        }
    }
    printf("Total substrings: %d\n", count);
}

int main() {
    char str[50] = "ABC";
    
    printf("String: %s\n", str);
    printf("Length: %d\n", strlen(str));
    printf("\n");
    
    generateSubstrings(str);
    
    // Another example
    printf("\n\nString: HELLO\n");
    char str2[50] = "HELLO";
    
    int len = strlen(str2);
    int count = 0;
    printf("All substrings:\n");
    
    for (int i = 0; i < len; i++) {
        for (int j = i; j < len; j++) {
            for (int k = i; k <= j; k++) {
                printf("%c", str2[k]);
            }
            printf("\n");
            count++;
        }
    }
    printf("Total substrings: %d\n", count);
    
    return 0;
}
