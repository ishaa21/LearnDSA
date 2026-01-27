#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

// Search a Character in a String in C++
// Find position and count of a character

int main() {
    string str = "Hello World";
    char target = 'l';
    
    // Method 1: Using find() - finds first occurrence
    cout << "Using find():\n";
    size_t pos = str.find(target);
    if (pos != string::npos) {
        cout << "Character '" << target << "' found at index: " << pos << "\n";
    } else {
        cout << "Character '" << target << "' not found\n";
    }
    
    // Method 2: Using rfind() - finds last occurrence
    cout << "\nUsing rfind():\n";
    size_t lastPos = str.rfind(target);
    if (lastPos != string::npos) {
        cout << "Last occurrence of '" << target << "' at index: " << lastPos << "\n";
    }
    
    // Method 3: Manual search with loop
    cout << "\nManual search:\n";
    int count = 0;
    for (int i = 0; i < str.length(); i++) {
        if (str[i] == target) {
            cout << "Found at index: " << i << "\n";
            count++;
        }
    }
    cout << "Total occurrences: " << count << "\n";
    
    // Method 4: Finding all occurrences
    cout << "\nFinding all occurrences:\n";
    size_t index = 0;
    int occurrences = 0;
    while ((index = str.find(target, index)) != string::npos) {
        cout << "Found at index: " << index << "\n";
        index++;
        occurrences++;
    }
    cout << "Total: " << occurrences << "\n";
    
    // Method 5: Using count algorithm
    cout << "\nUsing count algorithm:\n";
    int total = count(str.begin(), str.end(), target);
    cout << "Count of '" << target << "': " << total << "\n";
    
    // Method 6: Case-insensitive search
    cout << "\nCase-insensitive search:\n";
    string lowerStr = str;
    transform(lowerStr.begin(), lowerStr.end(), lowerStr.begin(), ::tolower);
    char lowerTarget = tolower('W');
    int caseCount = count(lowerStr.begin(), lowerStr.end(), lowerTarget);
    cout << "Case-insensitive count: " << caseCount << "\n";
    
    return 0;
}
