#include <iostream>
#include <string>
#include <vector>
using namespace std;

// Generate All Substrings in C++
// Print all possible substrings of a given string

void generateSubstrings(string str) {
    int len = str.length();
    int count = 0;
    
    cout << "All substrings:\n";
    
    // Outer loop for starting position
    for (int i = 0; i < len; i++) {
        // Inner loop for ending position
        for (int j = i; j < len; j++) {
            // Extract and print substring
            cout << str.substr(i, j - i + 1) << "\n";
            count++;
        }
    }
    cout << "Total substrings: " << count << "\n";
}

// Alternative method using vector
vector<string> generateSubstringsVector(string str) {
    vector<string> substrings;
    int len = str.length();
    
    for (int i = 0; i < len; i++) {
        for (int j = i; j < len; j++) {
            substrings.push_back(str.substr(i, j - i + 1));
        }
    }
    return substrings;
}

int main() {
    string str = "ABC";
    
    cout << "String: " << str << "\n";
    cout << "Length: " << str.length() << "\n\n";
    
    generateSubstrings(str);
    
    // Using vector method
    cout << "\n\nUsing vector:\n";
    string str2 = "HELLO";
    cout << "String: " << str2 << "\n";
    
    vector<string> substrings = generateSubstringsVector(str2);
    cout << "All substrings:\n";
    for (const auto& sub : substrings) {
        cout << sub << "\n";
    }
    cout << "Total substrings: " << substrings.size() << "\n";
    
    return 0;
}
