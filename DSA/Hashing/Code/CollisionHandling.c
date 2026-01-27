#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define TABLE_SIZE 7
#define MAX_CHAIN_SIZE 10

// ========== Linear Probing ==========
typedef struct {
    char key[50];
    int value;
    int used;
} Entry;

typedef struct {
    Entry entries[TABLE_SIZE];
} LinearProbingTable;

int hashFunction(char* str) {
    int hash = 0;
    for (int i = 0; str[i]; i++) {
        hash += str[i];
    }
    return hash % TABLE_SIZE;
}

void linearProbingInsert(LinearProbingTable* table, char* key, int value) {
    int index = hashFunction(key);
    
    while (table->entries[index].used) {
        if (strcmp(table->entries[index].key, key) == 0) {
            table->entries[index].value = value;
            return;
        }
        index = (index + 1) % TABLE_SIZE;
    }
    
    strcpy(table->entries[index].key, key);
    table->entries[index].value = value;
    table->entries[index].used = 1;
}

int linearProbingSearch(LinearProbingTable* table, char* key) {
    int index = hashFunction(key);
    
    while (table->entries[index].used) {
        if (strcmp(table->entries[index].key, key) == 0) {
            return table->entries[index].value;
        }
        index = (index + 1) % TABLE_SIZE;
    }
    return -1;
}

// ========== Quadratic Probing ==========
void quadraticProbingInsert(LinearProbingTable* table, char* key, int value) {
    int index = hashFunction(key);
    int i = 0;
    
    while (table->entries[index].used) {
        if (strcmp(table->entries[index].key, key) == 0) {
            table->entries[index].value = value;
            return;
        }
        i++;
        index = (hashFunction(key) + i*i) % TABLE_SIZE;
    }
    
    strcpy(table->entries[index].key, key);
    table->entries[index].value = value;
    table->entries[index].used = 1;
}

// ========== Double Hashing ==========
int hash2(char* str) {
    int hash = 0;
    for (int i = 0; str[i]; i++) {
        hash += str[i] * (i + 1);
    }
    return (hash % (TABLE_SIZE - 1)) + 1;
}

void doubleHashingInsert(LinearProbingTable* table, char* key, int value) {
    int h1 = hashFunction(key);
    int h2 = hash2(key);
    int index = h1;
    
    while (table->entries[index].used) {
        if (strcmp(table->entries[index].key, key) == 0) {
            table->entries[index].value = value;
            return;
        }
        index = (index + h2) % TABLE_SIZE;
    }
    
    strcpy(table->entries[index].key, key);
    table->entries[index].value = value;
    table->entries[index].used = 1;
}

int main() {
    printf("=== Collision Handling Strategies ===\n\n");
    
    // Initialize table
    LinearProbingTable table;
    for (int i = 0; i < TABLE_SIZE; i++) {
        table.entries[i].used = 0;
    }
    
    printf("TABLE_SIZE: %d\n\n", TABLE_SIZE);
    
    // Linear Probing
    printf("1. LINEAR PROBING (index = (h(key) + i) %% TABLE_SIZE)\n");
    linearProbingInsert(&table, "john", 25);
    linearProbingInsert(&table, "jane", 30);
    linearProbingInsert(&table, "jack", 28);
    printf("   Inserted: john(25), jane(30), jack(28)\n");
    printf("   Search john: %d\n", linearProbingSearch(&table, "john"));
    printf("   Complexity: O(1) avg, O(n) worst\n\n");
    
    // Reset table
    for (int i = 0; i < TABLE_SIZE; i++) {
        table.entries[i].used = 0;
    }
    
    // Quadratic Probing
    printf("2. QUADRATIC PROBING (index = (h(key) + i²) %% TABLE_SIZE)\n");
    quadraticProbingInsert(&table, "john", 25);
    quadraticProbingInsert(&table, "jane", 30);
    quadraticProbingInsert(&table, "jack", 28);
    printf("   Inserted: john(25), jane(30), jack(28)\n");
    printf("   Probing sequence: h(key), h(key)+1, h(key)+4, h(key)+9...\n");
    printf("   Reduces primary clustering compared to linear probing\n");
    printf("   Complexity: O(1) avg, O(n) worst\n\n");
    
    // Reset table
    for (int i = 0; i < TABLE_SIZE; i++) {
        table.entries[i].used = 0;
    }
    
    // Double Hashing
    printf("3. DOUBLE HASHING (index = (h₁(key) + i*h₂(key)) %% TABLE_SIZE)\n");
    doubleHashingInsert(&table, "john", 25);
    doubleHashingInsert(&table, "jane", 30);
    doubleHashingInsert(&table, "jack", 28);
    printf("   Inserted: john(25), jane(30), jack(28)\n");
    printf("   Uses two hash functions\n");
    printf("   Eliminates both primary and secondary clustering\n");
    printf("   Complexity: O(1) avg, O(n) worst\n\n");
    
    printf("COMPARISON:\n");
    printf("Linear Probing:     Simple, cache-friendly, but clustering issues\n");
    printf("Quadratic Probing:  Reduces primary clustering\n");
    printf("Double Hashing:     Best distribution, no clustering, higher computation\n");
    
    return 0;
}
