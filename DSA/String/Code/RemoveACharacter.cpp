#include <iostream>
#include <string>
using namespace std;

// Remove a Character from a String in C++
// Remove character at specific position

int main() {
    string str = "Hello World";
    
    cout << "Original string: " << str << "\n";
    
    // Method 1: Using erase()
    cout << "\nUsing erase():\n";
    string str1 = str;
    str1.erase(0, 1);  // Remove 1 character at position 0
    cout << "After removing character at position 0: " << str1 << "\n";
    
    // Method 2: Remove from middle
    string str2 = str;
    str2.erase(5, 1);  // Remove 1 character at position 5
    cout << "After removing character at position 5: " << str2 << "\n";
    
    // Method 3: Remove last character
    string str3 = str;
    str3.erase(str3.length() - 1);
    cout << "After removing last character: " << str3 << "\n";
    
    // Method 4: Using substr() to rebuild
    string str4 = str;
    int pos = 6;
    string result = str4.substr(0, pos) + str4.substr(pos + 1);
    cout << "Using substr: " << result << "\n";
    
    // Method 5: Remove all occurrences of a character
    cout << "\nRemoving all 'l':\n";
    string str5 = str;
    str5.erase(remove(str5.begin(), str5.end(), 'l'), str5.end());
    cout << "Result: " << str5 << "\n";
    
    // Method 6: Remove character using erase with iterator
    cout << "\nUsing erase with iterator:\n";
    string str6 = str;
    for (auto it = str6.begin(); it != str6.end(); ++it) {
        if (*it == 'l') {
            it = str6.erase(it) - 1;
        }
    }
    cout << "After removing all 'l': " << str6 << "\n";
    
    return 0;
}
