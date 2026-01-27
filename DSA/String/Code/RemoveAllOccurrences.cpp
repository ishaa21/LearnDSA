#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

// Remove All Occurrences of a Character in C++
// Remove all instances of a specific character

int main() {
    string str = "Hello World";
    
    cout << "Original string: " << str << "\n";
    
    // Method 1: Using erase() with remove()
    cout << "\nUsing erase-remove idiom:\n";
    string str1 = str;
    str1.erase(remove(str1.begin(), str1.end(), 'l'), str1.end());
    cout << "After removing all 'l': " << str1 << "\n";
    
    // Method 2: Removing 'o'
    string str2 = str;
    str2.erase(remove(str2.begin(), str2.end(), 'o'), str2.end());
    cout << "After removing all 'o': " << str2 << "\n";
    
    // Method 3: Removing spaces
    string str3 = str;
    str3.erase(remove(str3.begin(), str3.end(), ' '), str3.end());
    cout << "After removing all spaces: " << str3 << "\n";
    
    // Method 4: Using loop and iterator
    cout << "\nUsing loop with iterator:\n";
    string str4 = str;
    for (auto it = str4.begin(); it != str4.end(); ) {
        if (*it == 'l') {
            it = str4.erase(it);
        } else {
            ++it;
        }
    }
    cout << "After removing all 'l': " << str4 << "\n";
    
    // Method 5: Building new string
    cout << "\nBuilding new string:\n";
    string original = "Programming Language";
    string result = "";
    char target = 'a';
    
    for (char c : original) {
        if (c != target) {
            result += c;
        }
    }
    cout << "Original: " << original << "\n";
    cout << "After removing all '" << target << "': " << result << "\n";
    
    return 0;
}
