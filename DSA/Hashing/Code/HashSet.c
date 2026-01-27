#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define TABLE_SIZE 100

// HashSet: Set implementation using hash table for O(1) lookups
typedef struct {
    char element[50];
    int used;
} SetEntry;

typedef struct {
    SetEntry entries[TABLE_SIZE];
    int size;
} HashSet;

int hashFunction(char* str) {
    int hash = 0;
    for (int i = 0; str[i]; i++) {
        hash += str[i];
    }
    return hash % TABLE_SIZE;
}

void add(HashSet* set, char* element) {
    int index = hashFunction(element);
    
    while (set->entries[index].used) {
        if (strcmp(set->entries[index].element, element) == 0) {
            return; // Element already exists
        }
        index = (index + 1) % TABLE_SIZE;
    }
    
    strcpy(set->entries[index].element, element);
    set->entries[index].used = 1;
    set->size++;
}

int contains(HashSet* set, char* element) {
    int index = hashFunction(element);
    
    while (set->entries[index].used) {
        if (strcmp(set->entries[index].element, element) == 0) {
            return 1;
        }
        index = (index + 1) % TABLE_SIZE;
    }
    return 0;
}

void remove(HashSet* set, char* element) {
    int index = hashFunction(element);
    
    while (set->entries[index].used) {
        if (strcmp(set->entries[index].element, element) == 0) {
            set->entries[index].used = 0;
            set->size--;
            return;
        }
        index = (index + 1) % TABLE_SIZE;
    }
}

int getSize(HashSet* set) {
    return set->size;
}

void print(HashSet* set) {
    printf("Set contents: { ");
    for (int i = 0; i < TABLE_SIZE; i++) {
        if (set->entries[i].used) {
            printf("%s ", set->entries[i].element);
        }
    }
    printf("}\n");
}

void intersection(HashSet* set1, HashSet* set2, HashSet* result) {
    for (int i = 0; i < TABLE_SIZE; i++) {
        if (set1->entries[i].used) {
            if (contains(set2, set1->entries[i].element)) {
                add(result, set1->entries[i].element);
            }
        }
    }
}

void union_set(HashSet* set1, HashSet* set2, HashSet* result) {
    for (int i = 0; i < TABLE_SIZE; i++) {
        if (set1->entries[i].used) {
            add(result, set1->entries[i].element);
        }
    }
    for (int i = 0; i < TABLE_SIZE; i++) {
        if (set2->entries[i].used) {
            add(result, set2->entries[i].element);
        }
    }
}

int main() {
    HashSet set1, set2, resultSet;
    
    // Initialize sets
    set1.size = 0;
    set2.size = 0;
    resultSet.size = 0;
    for (int i = 0; i < TABLE_SIZE; i++) {
        set1.entries[i].used = 0;
        set2.entries[i].used = 0;
        resultSet.entries[i].used = 0;
    }
    
    printf("=== HashSet (C) ===\n\n");
    
    // Add elements to set1
    printf("Adding elements to Set1...\n");
    add(&set1, "apple");
    add(&set1, "banana");
    add(&set1, "orange");
    add(&set1, "grape");
    printf("Set1 size: %d\n", getSize(&set1));
    print(&set1);
    printf("\n");
    
    // Add elements to set2
    printf("Adding elements to Set2...\n");
    add(&set2, "banana");
    add(&set2, "grape");
    add(&set2, "mango");
    add(&set2, "pear");
    printf("Set2 size: %d\n", getSize(&set2));
    print(&set2);
    printf("\n");
    
    // Contains operation
    printf("Checking elements...\n");
    printf("Set1 contains 'apple': %d\n", contains(&set1, "apple"));
    printf("Set1 contains 'mango': %d\n\n", contains(&set1, "mango"));
    
    // Union
    printf("Union of Set1 and Set2:\n");
    union_set(&set1, &set2, &resultSet);
    printf("Union size: %d\n", getSize(&resultSet));
    print(&resultSet);
    printf("\n");
    
    // Reset result set for intersection
    resultSet.size = 0;
    for (int i = 0; i < TABLE_SIZE; i++) {
        resultSet.entries[i].used = 0;
    }
    
    // Intersection
    printf("Intersection of Set1 and Set2:\n");
    intersection(&set1, &set2, &resultSet);
    printf("Intersection size: %d\n", getSize(&resultSet));
    print(&resultSet);
    printf("\n");
    
    // Remove operation
    printf("Removing 'banana' from Set1...\n");
    remove(&set1, "banana");
    printf("Set1 size: %d\n", getSize(&set1));
    printf("Set1 contains 'banana': %d\n\n", contains(&set1, "banana"));
    
    printf("=== HashSet Operations Complexity ===\n");
    printf("add(element):       O(1) average, O(n) worst\n");
    printf("contains(element):  O(1) average, O(n) worst\n");
    printf("remove(element):    O(1) average, O(n) worst\n");
    printf("union():            O(m + n) where m, n = set sizes\n");
    printf("intersection():     O(m + n) where m, n = set sizes\n");
    printf("Space Complexity:   O(n) where n = number of elements\n");
    
    return 0;
}
