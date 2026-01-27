#include <stdio.h>
#include <string.h>

// Search a Character in a String in C
// Find position and count of a character

int main() {
    char str[] = "Hello World";
    char target = 'l';
    
    // Method 1: Using strchr() - finds first occurrence
    printf("Using strchr():\n");
    char *pos = strchr(str, target);
    if (pos != NULL) {
        int index = pos - str;
        printf("Character '%c' found at index: %d\n", target, index);
    } else {
        printf("Character '%c' not found\n", target);
    }
    
    // Method 2: Using strrchr() - finds last occurrence
    printf("\nUsing strrchr():\n");
    char *lastPos = strrchr(str, target);
    if (lastPos != NULL) {
        int index = lastPos - str;
        printf("Last occurrence of '%c' at index: %d\n", target, index);
    }
    
    // Method 3: Manual search with loop
    printf("\nManual search:\n");
    int found = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] == target) {
            printf("Found at index: %d\n", i);
            found++;
        }
    }
    printf("Total occurrences: %d\n", found);
    
    // Method 4: Finding from specific position
    printf("\nSearching from position 5:\n");
    for (int i = 5; str[i] != '\0'; i++) {
        if (str[i] == target) {
            printf("Found at index: %d\n", i);
        }
    }
    
    // Method 5: Case-insensitive search
    printf("\nCase-insensitive search for 'W':\n");
    char target2 = 'W';
    int count = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        char c = str[i];
        if (c == target2 || c == target2 + 32 || c == target2 - 32) {
            printf("Found at index: %d\n", i);
            count++;
        }
    }
    
    return 0;
}
