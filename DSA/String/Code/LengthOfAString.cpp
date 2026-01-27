#include <iostream>
#include <string>
#include <cstring>
using namespace std;

// Length of a String in C++
// Different methods to find the length of a string

int main() {
    string str = "Hello World";
    
    // Method 1: Using length() method
    int len1 = str.length();
    cout << "Using length(): " << len1 << "\n";
    
    // Method 2: Using size() method
    int len2 = str.size();
    cout << "Using size(): " << len2 << "\n";
    
    // Method 3: Manual counting with loop
    int len3 = 0;
    for (char c : str) {
        len3++;
    }
    cout << "Using range-based loop: " << len3 << "\n";
    
    // Method 4: C-style string with strlen()
    const char *cstr = "Hello World";
    int len4 = strlen(cstr);
    cout << "Using strlen() on C-string: " << len4 << "\n";
    
    // Method 5: Using count algorithm
    int len5 = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        len5++;
    }
    cout << "Using null terminator check: " << len5 << "\n";
    
    cout << "\nEmpty string length: " << string("").length() << "\n";
    cout << "Single character length: " << string("A").length() << "\n";
    
    return 0;
}
