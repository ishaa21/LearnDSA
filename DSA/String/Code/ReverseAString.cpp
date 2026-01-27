#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

// Reverse a String in C++
// Different methods to reverse a string

int main() {
    string str = "Hello World";
    
    // Method 1: Using reverse() algorithm
    cout << "Method 1: Using reverse() algorithm\n";
    string str1 = str;
    cout << "Original: " << str1 << "\n";
    reverse(str1.begin(), str1.end());
    cout << "Reversed: " << str1 << "\n";
    
    // Method 2: Using loop with swap
    cout << "\nMethod 2: Using loop\n";
    string str2 = str;
    cout << "Original: " << str2 << "\n";
    int len = str2.length();
    for (int i = 0; i < len / 2; i++) {
        swap(str2[i], str2[len - 1 - i]);
    }
    cout << "Reversed: " << str2 << "\n";
    
    // Method 3: Building new string
    cout << "\nMethod 3: Building new string\n";
    string str3 = "Programming";
    cout << "Original: " << str3 << "\n";
    string reversed = "";
    for (int i = str3.length() - 1; i >= 0; i--) {
        reversed += str3[i];
    }
    cout << "Reversed: " << reversed << "\n";
    
    // Method 4: Using iterators
    cout << "\nMethod 4: Using reverse iterators\n";
    string str4 = "Iteration";
    cout << "Original: " << str4 << "\n";
    cout << "Reversed: ";
    for (auto it = str4.rbegin(); it != str4.rend(); ++it) {
        cout << *it;
    }
    cout << "\n";
    
    // Method 5: Using recursion
    cout << "\nMethod 5: Using recursion\n";
    string str5 = "Recursion";
    cout << "Original: " << str5 << "\n";
    cout << "Reversed: ";
    
    function<void(const string&, int)> reverseRec = 
        [&](const string& s, int n) {
            if (n >= 0) {
                cout << s[n];
                reverseRec(s, n - 1);
            }
        };
    reverseRec(str5, str5.length() - 1);
    cout << "\n";
    
    return 0;
}
