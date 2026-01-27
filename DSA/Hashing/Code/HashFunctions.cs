// Hash Functions in C#

using System;

class HashFunctions {
    private const int TABLE_SIZE = 100;
    
    static int DivisionHash(int key) {
        return key % TABLE_SIZE;
    }
    
    static int MultiplicationHash(int key) {
        float A = 0.618033988f;
        return (int)(TABLE_SIZE * (key * A - (int)(key * A)));
    }
    
    static int SumOfDigitsHash(int key) {
        int sum = 0;
        while (key > 0) {
            sum += key % 10;
            key /= 10;
        }
        return sum % TABLE_SIZE;
    }
    
    static int StringHash(string str) {
        long hash = 5381;
        foreach (char c in str) {
            hash = ((hash << 5) + hash) + c;
        }
        return (int)(hash % TABLE_SIZE);
    }
    
    static int PolynomialHash(string str) {
        int hash = 0;
        int p = 31;
        int p_pow = 1;
        
        foreach (char c in str) {
            hash = (hash + (c - 'a' + 1) * p_pow) % TABLE_SIZE;
            p_pow = (p_pow * p) % TABLE_SIZE;
        }
        return hash;
    }
    
    static void Main() {
        Console.WriteLine("=== Hash Functions ===\n");
        
        Console.WriteLine("Division Method (key % TABLE_SIZE):");
        Console.WriteLine("Hash(45) = " + DivisionHash(45));
        Console.WriteLine("Hash(78) = " + DivisionHash(78));
        Console.WriteLine("Hash(150) = " + DivisionHash(150) + "\n");
        
        Console.WriteLine("Multiplication Method (A * 0.618...):");
        Console.WriteLine("Hash(45) = " + MultiplicationHash(45));
        Console.WriteLine("Hash(78) = " + MultiplicationHash(78));
        Console.WriteLine("Hash(150) = " + MultiplicationHash(150) + "\n");
        
        Console.WriteLine("Sum of Digits Method:");
        Console.WriteLine("Hash(45) = " + SumOfDigitsHash(45));
        Console.WriteLine("Hash(78) = " + SumOfDigitsHash(78));
        Console.WriteLine("Hash(150) = " + SumOfDigitsHash(150) + "\n");
        
        Console.WriteLine("String Hash (Djb2):");
        Console.WriteLine("Hash('apple') = " + StringHash("apple"));
        Console.WriteLine("Hash('banana') = " + StringHash("banana"));
        Console.WriteLine("Hash('orange') = " + StringHash("orange") + "\n");
        
        Console.WriteLine("Polynomial Rolling Hash:");
        Console.WriteLine("Hash('abc') = " + PolynomialHash("abc"));
        Console.WriteLine("Hash('bcd') = " + PolynomialHash("bcd"));
        Console.WriteLine("Hash('hello') = " + PolynomialHash("hello") + "\n");
        
        Console.WriteLine("Properties of Good Hash Function:");
        Console.WriteLine("1. Deterministic: Same input always produces same output");
        Console.WriteLine("2. Efficient: O(1) time complexity");
        Console.WriteLine("3. Uniform Distribution: Minimizes collisions");
        Console.WriteLine("4. Minimal Clustering: Avoids patterns");
    }
}
