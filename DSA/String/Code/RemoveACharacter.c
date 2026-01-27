#include <stdio.h>
#include <string.h>

// Remove a Character from a String in C
// Remove character at specific position

void removeChar(char str[], int position) {
    int len = strlen(str);
    
    // Shift characters to the left
    for (int i = position; i < len; i++) {
        str[i] = str[i + 1];
    }
}

void displayString(char str[]) {
    printf("%s\n", str);
}

int main() {
    char str[50] = "Hello World";
    
    printf("Original string: ");
    displayString(str);
    
    // Remove from beginning
    char str1[50] = "Hello World";
    removeChar(str1, 0);
    printf("After removing character at position 0: ");
    displayString(str1);
    
    // Remove from middle
    char str2[50] = "Hello World";
    removeChar(str2, 5);
    printf("After removing character at position 5: ");
    displayString(str2);
    
    // Remove from end
    char str3[50] = "Hello World";
    str3[strlen(str3) - 1] = '\0';
    printf("After removing last character: ");
    displayString(str3);
    
    // Remove specific character (all occurrences)
    printf("\nRemoving all occurrences of 'l':\n");
    char str4[50] = "Hello World";
    char result[50] = "";
    int j = 0;
    
    for (int i = 0; str4[i] != '\0'; i++) {
        if (str4[i] != 'l') {
            result[j++] = str4[i];
        }
    }
    result[j] = '\0';
    printf("Result: %s\n", result);
    
    return 0;
}
