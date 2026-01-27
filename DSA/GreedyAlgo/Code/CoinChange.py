# Coin Change Problem in Python

def coin_change(coins, amount):
    coins.sort(reverse=True)
    
    print(f"Coin Change for amount {amount}:")
    coins_used = 0
    
    for coin in coins:
        while amount >= coin:
            print(f"Take coin of value {coin}")
            amount -= coin
            coins_used += 1
    
    print(f"\nTotal Coins Used: {coins_used}")
    if amount > 0:
        print(f"Warning: Cannot make exact change (Remaining: {amount})")
    else:
        print("Amount Made: Complete")

# Test
print("=== Coin Change Problem (Python) ===\n")

coins = [1, 5, 10, 25]
amount = 41

print("Available Coins:", coins)
print(f"Amount to Make: {amount}\n")

coin_change(coins, amount)

print("\n=== Greedy Strategy ===")
print("1. Sort coins in descending order")
print("2. For each coin (largest to smallest):")
print("   - Use as many as possible")
print("   - Subtract from amount")
print("3. Continue until amount becomes 0\n")

print("=== Complexity ===")
print("Time Complexity:  O(n log n) for sorting + O(amount)")
print("Space Complexity: O(1)")
print("Note: Greedy works for standard coin systems")
