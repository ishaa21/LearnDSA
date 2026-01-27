#include <iostream>
#include <string>
using namespace std;

// Concatenating Two Strings in C++
// Join two strings together

int main() {
    string str1 = "Hello";
    string str2 = "World";
    
    // Method 1: Using + operator
    cout << "Method 1: Using + operator\n";
    string result1 = str1 + " " + str2;
    cout << "Result: " << result1 << "\n";
    
    // Method 2: Using += operator
    cout << "\nMethod 2: Using += operator\n";
    string result2 = str1;
    result2 += " ";
    result2 += str2;
    cout << "Result: " << result2 << "\n";
    
    // Method 3: Using append() method
    cout << "\nMethod 3: Using append()\n";
    string result3 = str1;
    result3.append(" ");
    result3.append(str2);
    cout << "Result: " << result3 << "\n";
    
    // Method 4: Using concatenate function
    cout << "\nMethod 4: Using string constructor\n";
    string result4 = string(str1) + " " + string(str2);
    cout << "Result: " << result4 << "\n";
    
    // Method 5: Concatenating multiple strings
    cout << "\nMethod 5: Multiple strings\n";
    string str3 = "from";
    string str4 = "C++";
    string result5 = str1 + " " + str2 + " " + str3 + " " + str4;
    cout << "Result: " << result5 << "\n";
    
    // Method 6: Using insert()
    cout << "\nMethod 6: Using insert()\n";
    string result6 = str1;
    result6.insert(str1.length(), " " + str2);
    cout << "Result: " << result6 << "\n";
    
    return 0;
}
