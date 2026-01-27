# Fractional Knapsack in Python

class Item:
    def __init__(self, id, weight, value):
        self.id = id
        self.weight = weight
        self.value = value
        self.ratio = value / weight

def fractional_knapsack(items, capacity):
    # Sort by value/weight ratio
    items.sort(key=lambda x: x.ratio, reverse=True)
    
    print("Fractional Knapsack Solution:")
    total_value = 0
    used_capacity = 0
    
    for item in items:
        if used_capacity >= capacity:
            break
        
        take = min(capacity - used_capacity, item.weight)
        print(f"Item {item.id}: Take {take:.2f} units (Weight: {item.weight}, Value/Weight: {item.ratio:.2f})")
        
        total_value += take * item.ratio
        used_capacity += take
    
    print(f"\nTotal Capacity Used: {used_capacity:.2f} / {capacity}")
    print(f"Total Value: {total_value:.2f}")

# Test
print("=== Fractional Knapsack (Python) ===\n")

items = [
    Item(1, 10, 60),
    Item(2, 20, 100),
    Item(3, 30, 120)
]
capacity = 50

print("Items (ID, Weight, Value):")
for item in items:
    print(f"Item {item.id}: Weight {item.weight}, Value {item.value}")
print(f"Knapsack Capacity: {capacity}\n")

fractional_knapsack(items, capacity)

print("\n=== Greedy Strategy ===")
print("1. Calculate value/weight ratio for each item")
print("2. Sort items by ratio (descending)")
print("3. For each item in sorted order:")
print("   - If item fits completely: take it")
print("   - Otherwise: take fraction that fits")
print("4. Repeat until capacity full\n")

print("=== Complexity ===")
print("Time Complexity:  O(n log n) for sorting")
print("Space Complexity: O(1)")
print("Optimal: Yes (greedy works for fractional)")
