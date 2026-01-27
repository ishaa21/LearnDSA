#include <iostream>
#include <string>
using namespace std;

#define TABLE_SIZE 100

// Hash Functions in C++
class HashFunctions {
public:
    // Division Method
    static int divisionHash(int key) {
        return key % TABLE_SIZE;
    }
    
    // Multiplication Method
    static int multiplicationHash(int key) {
        float A = 0.618033988f; // Golden ratio - 1
        return (int)(TABLE_SIZE * (key * A - (int)(key * A)));
    }
    
    // Sum of digits
    static int sumOfDigitsHash(int key) {
        int sum = 0;
        while (key > 0) {
            sum += key % 10;
            key /= 10;
        }
        return sum % TABLE_SIZE;
    }
    
    // String hash function (Djb2)
    static int stringHash(const string& str) {
        unsigned long hash = 5381;
        for (char c : str) {
            hash = ((hash << 5) + hash) + c;
        }
        return hash % TABLE_SIZE;
    }
    
    // Polynomial rolling hash
    static int polynomialHash(const string& str) {
        int hash = 0;
        int p = 31;
        int p_pow = 1;
        
        for (char c : str) {
            hash = (hash + (c - 'a' + 1) * p_pow) % TABLE_SIZE;
            p_pow = (p_pow * p) % TABLE_SIZE;
        }
        return hash;
    }
};

int main() {
    cout << "=== Hash Functions ===\n\n";
    
    cout << "Division Method (key % TABLE_SIZE):\n";
    cout << "Hash(45) = " << HashFunctions::divisionHash(45) << "\n";
    cout << "Hash(78) = " << HashFunctions::divisionHash(78) << "\n";
    cout << "Hash(150) = " << HashFunctions::divisionHash(150) << "\n\n";
    
    cout << "Multiplication Method (A * 0.618...):\n";
    cout << "Hash(45) = " << HashFunctions::multiplicationHash(45) << "\n";
    cout << "Hash(78) = " << HashFunctions::multiplicationHash(78) << "\n";
    cout << "Hash(150) = " << HashFunctions::multiplicationHash(150) << "\n\n";
    
    cout << "Sum of Digits Method:\n";
    cout << "Hash(45) = " << HashFunctions::sumOfDigitsHash(45) << "\n";
    cout << "Hash(78) = " << HashFunctions::sumOfDigitsHash(78) << "\n";
    cout << "Hash(150) = " << HashFunctions::sumOfDigitsHash(150) << "\n\n";
    
    cout << "String Hash (Djb2):\n";
    cout << "Hash('apple') = " << HashFunctions::stringHash("apple") << "\n";
    cout << "Hash('banana') = " << HashFunctions::stringHash("banana") << "\n";
    cout << "Hash('orange') = " << HashFunctions::stringHash("orange") << "\n\n";
    
    cout << "Polynomial Rolling Hash:\n";
    cout << "Hash('abc') = " << HashFunctions::polynomialHash("abc") << "\n";
    cout << "Hash('bcd') = " << HashFunctions::polynomialHash("bcd") << "\n";
    cout << "Hash('hello') = " << HashFunctions::polynomialHash("hello") << "\n\n";
    
    cout << "Properties of Good Hash Function:\n";
    cout << "1. Deterministic: Same input always produces same output\n";
    cout << "2. Efficient: O(1) time complexity\n";
    cout << "3. Uniform Distribution: Minimizes collisions\n";
    cout << "4. Minimal Clustering: Avoids patterns\n";
    
    return 0;
}
