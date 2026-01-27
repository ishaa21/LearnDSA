#include <stdio.h>
#include <string.h>

// Insert a Character in a String in C
// Insert character at specific position

void insertChar(char str[], int position, char ch) {
    int len = strlen(str);
    
    // Shift characters to the right
    for (int i = len; i >= position; i--) {
        str[i + 1] = str[i];
    }
    
    // Insert character
    str[position] = ch;
}

void displayString(char str[]) {
    printf("%s\n", str);
}

int main() {
    char str[50] = "Hello World";
    
    printf("Original string: ");
    displayString(str);
    
    // Insert at beginning
    insertChar(str, 0, 'H');
    printf("After inserting 'H' at position 0: ");
    displayString(str);
    
    // Reset string
    strcpy(str, "Hello World");
    
    // Insert in middle
    insertChar(str, 5, '!');
    printf("After inserting '!' at position 5: ");
    displayString(str);
    
    // Reset string
    strcpy(str, "Hello World");
    
    // Insert at end
    int len = strlen(str);
    insertChar(str, len, '!');
    printf("After inserting '!' at end: ");
    displayString(str);
    
    // Manual method - building new string
    char original[50] = "Hi";
    char result[50] = "";
    int pos = 1;
    char newChar = '*';
    
    printf("\nManual method:\n");
    printf("Original: Hi\n");
    
    // Copy up to position
    for (int i = 0; i < pos; i++) {
        result[i] = original[i];
    }
    
    // Insert character
    result[pos] = newChar;
    
    // Copy rest
    for (int i = pos; original[i] != '\0'; i++) {
        result[i + 1] = original[i];
    }
    result[pos + 1 + strlen(original) - pos] = '\0';
    
    printf("After inserting '*' at position 1: %s\n", result);
    
    return 0;
}
