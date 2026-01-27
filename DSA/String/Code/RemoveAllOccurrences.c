#include <stdio.h>
#include <string.h>

// Remove All Occurrences of a Character in C
// Remove all instances of a specific character

void removeAllOccurrences(char str[], char target) {
    int i = 0, j = 0;
    
    while (str[i] != '\0') {
        if (str[i] != target) {
            str[j++] = str[i];
        }
        i++;
    }
    str[j] = '\0';
}

void displayString(char str[]) {
    printf("%s\n", str);
}

int main() {
    char str[50] = "Hello World";
    
    printf("Original string: ");
    displayString(str);
    
    // Remove all 'l'
    char str1[50] = "Hello World";
    removeAllOccurrences(str1, 'l');
    printf("After removing all 'l': ");
    displayString(str1);
    
    // Remove all 'o'
    char str2[50] = "Hello World";
    removeAllOccurrences(str2, 'o');
    printf("After removing all 'o': ");
    displayString(str2);
    
    // Remove all spaces
    char str3[50] = "Hello World";
    removeAllOccurrences(str3, ' ');
    printf("After removing all spaces: ");
    displayString(str3);
    
    // Manual approach using new string
    printf("\nManual approach:\n");
    char original[50] = "Programming Language";
    char result[50] = "";
    char target = 'a';
    int j = 0;
    
    printf("Original: Programming Language\n");
    
    for (int i = 0; original[i] != '\0'; i++) {
        if (original[i] != target) {
            result[j++] = original[i];
        }
    }
    result[j] = '\0';
    printf("After removing all '%c': %s\n", target, result);
    
    return 0;
}
