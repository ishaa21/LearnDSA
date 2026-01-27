# Hash Functions in Python

TABLE_SIZE = 100

class HashFunctions:
    @staticmethod
    def division_hash(key):
        """Division Method"""
        return key % TABLE_SIZE
    
    @staticmethod
    def multiplication_hash(key):
        """Multiplication Method"""
        A = 0.618033988  # Golden ratio - 1
        return int(TABLE_SIZE * (key * A - int(key * A)))
    
    @staticmethod
    def sum_of_digits_hash(key):
        """Sum of digits method"""
        digit_sum = 0
        while key > 0:
            digit_sum += key % 10
            key //= 10
        return digit_sum % TABLE_SIZE
    
    @staticmethod
    def string_hash(string):
        """String hash (Djb2)"""
        hash_val = 5381
        for c in string:
            hash_val = ((hash_val << 5) + hash_val) + ord(c)
        return hash_val % TABLE_SIZE
    
    @staticmethod
    def polynomial_hash(string):
        """Polynomial rolling hash"""
        hash_val = 0
        p = 31
        p_pow = 1
        
        for c in string:
            hash_val = (hash_val + (ord(c) - ord('a') + 1) * p_pow) % TABLE_SIZE
            p_pow = (p_pow * p) % TABLE_SIZE
        return hash_val

# Test
print("=== Hash Functions ===\n")

print("Division Method (key % TABLE_SIZE):")
print(f"Hash(45) = {HashFunctions.division_hash(45)}")
print(f"Hash(78) = {HashFunctions.division_hash(78)}")
print(f"Hash(150) = {HashFunctions.division_hash(150)}\n")

print("Multiplication Method (A * 0.618...):")
print(f"Hash(45) = {HashFunctions.multiplication_hash(45)}")
print(f"Hash(78) = {HashFunctions.multiplication_hash(78)}")
print(f"Hash(150) = {HashFunctions.multiplication_hash(150)}\n")

print("Sum of Digits Method:")
print(f"Hash(45) = {HashFunctions.sum_of_digits_hash(45)}")
print(f"Hash(78) = {HashFunctions.sum_of_digits_hash(78)}")
print(f"Hash(150) = {HashFunctions.sum_of_digits_hash(150)}\n")

print("String Hash (Djb2):")
print(f"Hash('apple') = {HashFunctions.string_hash('apple')}")
print(f"Hash('banana') = {HashFunctions.string_hash('banana')}")
print(f"Hash('orange') = {HashFunctions.string_hash('orange')}\n")

print("Polynomial Rolling Hash:")
print(f"Hash('abc') = {HashFunctions.polynomial_hash('abc')}")
print(f"Hash('bcd') = {HashFunctions.polynomial_hash('bcd')}")
print(f"Hash('hello') = {HashFunctions.polynomial_hash('hello')}\n")

print("Properties of Good Hash Function:")
print("1. Deterministic: Same input always produces same output")
print("2. Efficient: O(1) time complexity")
print("3. Uniform Distribution: Minimizes collisions")
print("4. Minimal Clustering: Avoids patterns")
