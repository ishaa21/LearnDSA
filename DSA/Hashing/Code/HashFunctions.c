#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define TABLE_SIZE 100

// Hash Functions in C
// Division Method
int divisionHash(int key) {
    return key % TABLE_SIZE;
}

// Multiplication Method
int multiplicationHash(int key) {
    float A = 0.618033988; // Golden ratio - 1
    return (int)(TABLE_SIZE * (key * A - (int)(key * A)));
}

// Sum of digits
int sumOfDigitsHash(int key) {
    int sum = 0;
    while (key > 0) {
        sum += key % 10;
        key /= 10;
    }
    return sum % TABLE_SIZE;
}

// String hash function (Djb2)
int stringHash(char* str) {
    unsigned long hash = 5381;
    int c;
    while ((c = *str++)) {
        hash = ((hash << 5) + hash) + c;
    }
    return hash % TABLE_SIZE;
}

// Polynomial rolling hash
int polynomialHash(char* str) {
    int hash = 0;
    int p = 31;
    int p_pow = 1;
    
    for (int i = 0; str[i]; i++) {
        hash = (hash + (str[i] - 'a' + 1) * p_pow) % TABLE_SIZE;
        p_pow = (p_pow * p) % TABLE_SIZE;
    }
    return hash;
}

int main() {
    printf("=== Hash Functions ===\n\n");
    
    printf("Division Method (key %% TABLE_SIZE):\n");
    printf("Hash(45) = %d\n", divisionHash(45));
    printf("Hash(78) = %d\n", divisionHash(78));
    printf("Hash(150) = %d\n\n", divisionHash(150));
    
    printf("Multiplication Method (A * 0.618...):\n");
    printf("Hash(45) = %d\n", multiplicationHash(45));
    printf("Hash(78) = %d\n", multiplicationHash(78));
    printf("Hash(150) = %d\n\n", multiplicationHash(150));
    
    printf("Sum of Digits Method:\n");
    printf("Hash(45) = %d\n", sumOfDigitsHash(45));
    printf("Hash(78) = %d\n", sumOfDigitsHash(78));
    printf("Hash(150) = %d\n\n", sumOfDigitsHash(150));
    
    printf("String Hash (Djb2):\n");
    printf("Hash('apple') = %d\n", stringHash("apple"));
    printf("Hash('banana') = %d\n", stringHash("banana"));
    printf("Hash('orange') = %d\n\n", stringHash("orange"));
    
    printf("Polynomial Rolling Hash:\n");
    printf("Hash('abc') = %d\n", polynomialHash("abc"));
    printf("Hash('bcd') = %d\n", polynomialHash("bcd"));
    printf("Hash('hello') = %d\n\n", polynomialHash("hello"));
    
    printf("Properties of Good Hash Function:\n");
    printf("1. Deterministic: Same input always produces same output\n");
    printf("2. Efficient: O(1) time complexity\n");
    printf("3. Uniform Distribution: Minimizes collisions\n");
    printf("4. Minimal Clustering: Avoids patterns\n");
    
    return 0;
}
