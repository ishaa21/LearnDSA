#include <iostream>
#include <string>
using namespace std;

// Insert a Character in a String in C++
// Insert character at specific position

int main() {
    string str = "Hello World";
    
    cout << "Original string: " << str << "\n";
    
    // Method 1: Using insert() function
    cout << "\nUsing insert():\n";
    string str1 = str;
    str1.insert(0, 1, 'H');  // Insert 'H' at position 0
    cout << "After inserting 'H' at position 0: " << str1 << "\n";
    
    // Method 2: Insert in middle
    string str2 = str;
    str2.insert(5, 1, '!');  // Insert '!' at position 5
    cout << "After inserting '!' at position 5: " << str2 << "\n";
    
    // Method 3: Insert at end
    string str3 = str;
    str3.insert(str3.length(), 1, '!');
    cout << "After inserting '!' at end: " << str3 << "\n";
    
    // Method 4: Insert string of characters
    string str4 = str;
    str4.insert(5, "***");  // Insert "***" at position 5
    cout << "After inserting '***' at position 5: " << str4 << "\n";
    
    // Method 5: Using + operator to rebuild string
    string str5 = str;
    int pos = 5;
    string result = str5.substr(0, pos) + "*" + str5.substr(pos);
    cout << "Using substr and +: " << result << "\n";
    
    // Method 6: Multiple insertions
    string str6 = str;
    str6.insert(0, 1, '*');
    str6.insert(str6.length(), 1, '*');
    cout << "After inserting '*' at both ends: " << str6 << "\n";
    
    return 0;
}
