// Hash Functions in Java

public class HashFunctions {
    private static final int TABLE_SIZE = 100;
    
    static int divisionHash(int key) {
        return key % TABLE_SIZE;
    }
    
    static int multiplicationHash(int key) {
        float A = 0.618033988f;
        return (int)(TABLE_SIZE * (key * A - (int)(key * A)));
    }
    
    static int sumOfDigitsHash(int key) {
        int sum = 0;
        while (key > 0) {
            sum += key % 10;
            key /= 10;
        }
        return sum % TABLE_SIZE;
    }
    
    static int stringHash(String str) {
        long hash = 5381;
        for (char c : str.toCharArray()) {
            hash = ((hash << 5) + hash) + c;
        }
        return (int)(hash % TABLE_SIZE);
    }
    
    static int polynomialHash(String str) {
        int hash = 0;
        int p = 31;
        int p_pow = 1;
        
        for (char c : str.toCharArray()) {
            hash = (hash + (c - 'a' + 1) * p_pow) % TABLE_SIZE;
            p_pow = (p_pow * p) % TABLE_SIZE;
        }
        return hash;
    }
    
    public static void main(String[] args) {
        System.out.println("=== Hash Functions ===\n");
        
        System.out.println("Division Method (key % TABLE_SIZE):");
        System.out.println("Hash(45) = " + divisionHash(45));
        System.out.println("Hash(78) = " + divisionHash(78));
        System.out.println("Hash(150) = " + divisionHash(150) + "\n");
        
        System.out.println("Multiplication Method (A * 0.618...):");
        System.out.println("Hash(45) = " + multiplicationHash(45));
        System.out.println("Hash(78) = " + multiplicationHash(78));
        System.out.println("Hash(150) = " + multiplicationHash(150) + "\n");
        
        System.out.println("Sum of Digits Method:");
        System.out.println("Hash(45) = " + sumOfDigitsHash(45));
        System.out.println("Hash(78) = " + sumOfDigitsHash(78));
        System.out.println("Hash(150) = " + sumOfDigitsHash(150) + "\n");
        
        System.out.println("String Hash (Djb2):");
        System.out.println("Hash('apple') = " + stringHash("apple"));
        System.out.println("Hash('banana') = " + stringHash("banana"));
        System.out.println("Hash('orange') = " + stringHash("orange") + "\n");
        
        System.out.println("Polynomial Rolling Hash:");
        System.out.println("Hash('abc') = " + polynomialHash("abc"));
        System.out.println("Hash('bcd') = " + polynomialHash("bcd"));
        System.out.println("Hash('hello') = " + polynomialHash("hello") + "\n");
        
        System.out.println("Properties of Good Hash Function:");
        System.out.println("1. Deterministic: Same input always produces same output");
        System.out.println("2. Efficient: O(1) time complexity");
        System.out.println("3. Uniform Distribution: Minimizes collisions");
        System.out.println("4. Minimal Clustering: Avoids patterns");
    }
}
