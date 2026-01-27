// Fractional Knapsack in C#

using System;
using System.Collections.Generic;
using System.Linq;

class FractionalKnapsack {
    class Item : IComparable<Item> {
        public int Id { get; set; }
        public double Weight { get; set; }
        public double Value { get; set; }
        public double Ratio { get; set; }
        
        public Item(int id, double weight, double value) {
            Id = id;
            Weight = weight;
            Value = value;
            Ratio = value / weight;
        }
        
        public int CompareTo(Item other) {
            return other.Ratio.CompareTo(this.Ratio);
        }
    }
    
    public static void FractionalKnapsackSolver(List<Item> items, double capacity) {
        items.Sort();
        
        Console.WriteLine("Fractional Knapsack Solution:");
        double totalValue = 0;
        double usedCapacity = 0;
        
        foreach (Item item in items) {
            if (usedCapacity >= capacity) break;
            
            double take = Math.Min(capacity - usedCapacity, item.Weight);
            Console.WriteLine($"Item {item.Id}: Take {take:F2} units (Weight: {item.Weight}, Value/Weight: {item.Ratio:F2})");
            
            totalValue += take * item.Ratio;
            usedCapacity += take;
        }
        
        Console.WriteLine($"\nTotal Capacity Used: {usedCapacity:F2} / {capacity}");
        Console.WriteLine($"Total Value: {totalValue:F2}");
    }
    
    static void Main() {
        Console.WriteLine("=== Fractional Knapsack (C#) ===\n");
        
        List<Item> items = new List<Item> {
            new Item(1, 10, 60),
            new Item(2, 20, 100),
            new Item(3, 30, 120)
        };
        double capacity = 50;
        
        Console.WriteLine("Items (ID, Weight, Value):");
        foreach (var item in items) {
            Console.WriteLine($"Item {item.Id}: Weight {item.Weight}, Value {item.Value}");
        }
        Console.WriteLine($"Knapsack Capacity: {capacity}\n");
        
        FractionalKnapsackSolver(items, capacity);
        
        Console.WriteLine("\n=== Greedy Strategy ===");
        Console.WriteLine("1. Calculate value/weight ratio for each item");
        Console.WriteLine("2. Sort items by ratio (descending)");
        Console.WriteLine("3. For each item in sorted order:");
        Console.WriteLine("   - If item fits completely: take it");
        Console.WriteLine("   - Otherwise: take fraction that fits");
        Console.WriteLine("4. Repeat until capacity full\n");
        
        Console.WriteLine("=== Complexity ===");
        Console.WriteLine("Time Complexity:  O(n log n) for sorting");
        Console.WriteLine("Space Complexity: O(1)");
        Console.WriteLine("Optimal: Yes (greedy works for fractional)");
    }
}
