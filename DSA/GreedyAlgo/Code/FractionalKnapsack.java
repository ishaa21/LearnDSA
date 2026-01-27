// Fractional Knapsack in Java

import java.util.*;

public class FractionalKnapsack {
    static class Item implements Comparable<Item> {
        int id;
        double weight;
        double value;
        double ratio;
        
        Item(int id, double weight, double value) {
            this.id = id;
            this.weight = weight;
            this.value = value;
            this.ratio = value / weight;
        }
        
        public int compareTo(Item other) {
            return Double.compare(other.ratio, this.ratio);
        }
    }
    
    public static void fractionalKnapsack(Item[] items, double capacity) {
        Arrays.sort(items);
        
        System.out.println("Fractional Knapsack Solution:");
        double totalValue = 0;
        double usedCapacity = 0;
        
        for (Item item : items) {
            if (usedCapacity >= capacity) break;
            
            double take = Math.min(capacity - usedCapacity, item.weight);
            System.out.printf("Item %d: Take %.2f units (Weight: %.2f, Value/Weight: %.2f)%n",
                    item.id, take, item.weight, item.ratio);
            
            totalValue += take * item.ratio;
            usedCapacity += take;
        }
        
        System.out.printf("%nTotal Capacity Used: %.2f / %.2f%n", usedCapacity, capacity);
        System.out.printf("Total Value: %.2f%n", totalValue);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Fractional Knapsack (Java) ===\n");
        
        Item[] items = {
            new Item(1, 10, 60),
            new Item(2, 20, 100),
            new Item(3, 30, 120)
        };
        double capacity = 50;
        
        System.out.println("Items (ID, Weight, Value):");
        for (Item item : items) {
            System.out.printf("Item %d: Weight %.2f, Value %.2f%n", item.id, item.weight, item.value);
        }
        System.out.printf("Knapsack Capacity: %.2f%n%n", capacity);
        
        fractionalKnapsack(items, capacity);
        
        System.out.println("\n=== Greedy Strategy ===");
        System.out.println("1. Calculate value/weight ratio for each item");
        System.out.println("2. Sort items by ratio (descending)");
        System.out.println("3. For each item in sorted order:");
        System.out.println("   - If item fits completely: take it");
        System.out.println("   - Otherwise: take fraction that fits");
        System.out.println("4. Repeat until capacity full\n");
        
        System.out.println("=== Complexity ===");
        System.out.println("Time Complexity:  O(n log n) for sorting");
        System.out.println("Space Complexity: O(1)");
        System.out.println("Optimal: Yes (greedy works for fractional)");
    }
}
