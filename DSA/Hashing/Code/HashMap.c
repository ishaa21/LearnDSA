#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define TABLE_SIZE 100

// HashMap: Key-Value pair storage with hash-based retrieval
typedef struct {
    char key[50];
    int value;
    int used;
} MapEntry;

typedef struct {
    MapEntry entries[TABLE_SIZE];
} HashMap;

int hashFunction(char* str) {
    int hash = 0;
    for (int i = 0; str[i]; i++) {
        hash += str[i];
    }
    return hash % TABLE_SIZE;
}

void put(HashMap* map, char* key, int value) {
    int index = hashFunction(key);
    
    while (map->entries[index].used) {
        if (strcmp(map->entries[index].key, key) == 0) {
            map->entries[index].value = value;
            return;
        }
        index = (index + 1) % TABLE_SIZE;
    }
    
    strcpy(map->entries[index].key, key);
    map->entries[index].value = value;
    map->entries[index].used = 1;
}

int get(HashMap* map, char* key) {
    int index = hashFunction(key);
    
    while (map->entries[index].used) {
        if (strcmp(map->entries[index].key, key) == 0) {
            return map->entries[index].value;
        }
        index = (index + 1) % TABLE_SIZE;
    }
    return -1;
}

int containsKey(HashMap* map, char* key) {
    int index = hashFunction(key);
    
    while (map->entries[index].used) {
        if (strcmp(map->entries[index].key, key) == 0) {
            return 1;
        }
        index = (index + 1) % TABLE_SIZE;
    }
    return 0;
}

void remove(HashMap* map, char* key) {
    int index = hashFunction(key);
    
    while (map->entries[index].used) {
        if (strcmp(map->entries[index].key, key) == 0) {
            map->entries[index].used = 0;
            // Rehash remaining elements
            char tempKey[50];
            int tempValue;
            strcpy(tempKey, map->entries[index].key);
            tempValue = map->entries[index].value;
            
            return;
        }
        index = (index + 1) % TABLE_SIZE;
    }
}

int main() {
    HashMap map;
    
    // Initialize
    for (int i = 0; i < TABLE_SIZE; i++) {
        map.entries[i].used = 0;
    }
    
    printf("=== HashMap (C) ===\n\n");
    
    // Put operations
    printf("Inserting key-value pairs...\n");
    put(&map, "apple", 5);
    put(&map, "banana", 3);
    put(&map, "orange", 7);
    put(&map, "grape", 4);
    printf("Inserted: apple->5, banana->3, orange->7, grape->4\n\n");
    
    // Get operations
    printf("Retrieving values...\n");
    printf("get('apple') = %d\n", get(&map, "apple"));
    printf("get('banana') = %d\n", get(&map, "banana"));
    printf("get('grape') = %d\n", get(&map, "grape"));
    printf("get('mango') = %d (not found)\n\n", get(&map, "mango"));
    
    // Contains key
    printf("Checking keys...\n");
    printf("containsKey('apple') = %d\n", containsKey(&map, "apple"));
    printf("containsKey('mango') = %d\n\n", containsKey(&map, "mango"));
    
    // Update value
    printf("Updating value...\n");
    put(&map, "apple", 10);
    printf("Updated apple->10\n");
    printf("get('apple') = %d\n\n", get(&map, "apple"));
    
    // Remove operation
    printf("Removing 'banana'...\n");
    remove(&map, "banana");
    printf("get('banana') = %d (removed)\n\n", get(&map, "banana"));
    
    printf("=== HashMap Operations Complexity ===\n");
    printf("put(key, value):    O(1) average, O(n) worst\n");
    printf("get(key):           O(1) average, O(n) worst\n");
    printf("containsKey(key):   O(1) average, O(n) worst\n");
    printf("remove(key):        O(1) average, O(n) worst\n");
    printf("Space Complexity:   O(n) where n = number of entries\n");
    
    return 0;
}
