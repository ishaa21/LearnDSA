#include <iostream>
#include <string>
#include <cstring>
#include <algorithm>
using namespace std;

// Check for Same (String Comparison) in C++
// Different methods to compare two strings

int main() {
    string str1 = "Hello";
    string str2 = "Hello";
    string str3 = "hello";
    string str4 = "World";
    
    // Method 1: Using == operator for string objects
    cout << "Using == operator:\n";
    cout << "(str1 == str2): " << (str1 == str2) << "\n";  // 1 = true
    cout << "(str1 == str3): " << (str1 == str3) << "\n";  // 0 = false
    cout << "(str1 == str4): " << (str1 == str4) << "\n";  // 0 = false
    
    // Method 2: Using compare() method
    cout << "\nUsing compare() method:\n";
    cout << "str1.compare(str2): " << str1.compare(str2) << "\n";
    cout << "str1.compare(str3): " << str1.compare(str3) << "\n";
    
    // Method 3: Case-insensitive comparison
    cout << "\nCase-insensitive comparison:\n";
    string lower1 = str1;
    string lower3 = str3;
    transform(lower1.begin(), lower1.end(), lower1.begin(), ::tolower);
    transform(lower3.begin(), lower3.end(), lower3.begin(), ::tolower);
    cout << "Lower case equal: " << (lower1 == lower3) << "\n";
    
    // Method 4: Comparing first n characters
    cout << "\nComparing first 3 characters:\n";
    string str5 = "Helloworld";
    string str6 = "Hellouni";
    cout << "substr comparison: " << (str5.substr(0, 3) == str6.substr(0, 3)) << "\n";
    
    // Method 5: C-style string comparison with strcmp()
    cout << "\nC-style string comparison:\n";
    const char *cstr1 = "Hello";
    const char *cstr2 = "Hello";
    cout << "strcmp result: " << strcmp(cstr1, cstr2) << "\n";
    
    return 0;
}
