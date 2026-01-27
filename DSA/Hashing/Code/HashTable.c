#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TABLE_SIZE 100

// Hash Table in C (Linear Probing for collision handling)
typedef struct {
    char key[50];
    int value;
    int used;
} Entry;

typedef struct {
    Entry entries[TABLE_SIZE];
} HashTable;

HashTable* createHashTable() {
    HashTable* ht = (HashTable*)malloc(sizeof(HashTable));
    for (int i = 0; i < TABLE_SIZE; i++) {
        ht->entries[i].used = 0;
    }
    return ht;
}

int hashFunction(char* key) {
    int hash = 0;
    for (int i = 0; key[i]; i++) {
        hash += key[i];
    }
    return hash % TABLE_SIZE;
}

void insert(HashTable* ht, char* key, int value) {
    int index = hashFunction(key);
    int originalIndex = index;
    
    while (ht->entries[index].used) {
        if (strcmp(ht->entries[index].key, key) == 0) {
            ht->entries[index].value = value;
            printf("Updated: %s -> %d (index %d)\n", key, value, index);
            return;
        }
        index = (index + 1) % TABLE_SIZE;
        if (index == originalIndex) {
            printf("Hash Table is full\n");
            return;
        }
    }
    
    strcpy(ht->entries[index].key, key);
    ht->entries[index].value = value;
    ht->entries[index].used = 1;
    printf("Inserted: %s -> %d (index %d)\n", key, value, index);
}

int search(HashTable* ht, char* key) {
    int index = hashFunction(key);
    int originalIndex = index;
    
    while (ht->entries[index].used) {
        if (strcmp(ht->entries[index].key, key) == 0) {
            printf("Found: %s -> %d (index %d)\n", key, ht->entries[index].value, index);
            return ht->entries[index].value;
        }
        index = (index + 1) % TABLE_SIZE;
        if (index == originalIndex) break;
    }
    
    printf("Not found: %s\n", key);
    return -1;
}

void delete(HashTable* ht, char* key) {
    int index = hashFunction(key);
    int originalIndex = index;
    
    while (ht->entries[index].used) {
        if (strcmp(ht->entries[index].key, key) == 0) {
            ht->entries[index].used = 0;
            printf("Deleted: %s (was at index %d)\n", key, index);
            return;
        }
        index = (index + 1) % TABLE_SIZE;
        if (index == originalIndex) break;
    }
    
    printf("Key not found: %s\n", key);
}

void display(HashTable* ht) {
    printf("\nHash Table Contents:\n");
    for (int i = 0; i < TABLE_SIZE; i++) {
        if (ht->entries[i].used) {
            printf("Index %d: %s -> %d\n", i, ht->entries[i].key, ht->entries[i].value);
        }
    }
}

int main() {
    HashTable* ht = createHashTable();
    
    printf("=== Hash Table ===\n\n");
    
    printf("Inserting elements:\n");
    insert(ht, "apple", 5);
    insert(ht, "banana", 3);
    insert(ht, "orange", 7);
    insert(ht, "grape", 4);
    
    display(ht);
    
    printf("\nSearching elements:\n");
    search(ht, "banana");
    search(ht, "mango");
    
    printf("\nDeleting elements:\n");
    delete(ht, "banana");
    
    display(ht);
    
    printf("\nComplexity Analysis:\n");
    printf("Insert: O(1) average, O(n) worst case\n");
    printf("Search: O(1) average, O(n) worst case\n");
    printf("Delete: O(1) average, O(n) worst case\n");
    printf("Collision Handling: Linear Probing\n");
    
    free(ht);
    return 0;
}
