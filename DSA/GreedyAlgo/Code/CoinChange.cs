// Coin Change Problem in C#

using System;
using System.Collections.Generic;
using System.Linq;

class CoinChange {
    public static void CoinChangeProblem(int[] coins, int amount) {
        Array.Sort(coins);
        Array.Reverse(coins);
        
        Console.WriteLine($"Coin Change for amount {amount}:");
        int coinsUsed = 0;
        
        foreach (int coin in coins) {
            while (amount >= coin) {
                Console.WriteLine($"Take coin of value {coin}");
                amount -= coin;
                coinsUsed++;
            }
        }
        
        Console.WriteLine($"\nTotal Coins Used: {coinsUsed}");
        if (amount > 0) {
            Console.WriteLine($"Warning: Cannot make exact change (Remaining: {amount})");
        } else {
            Console.WriteLine("Amount Made: Complete");
        }
    }
    
    static void Main() {
        Console.WriteLine("=== Coin Change Problem (C#) ===\n");
        
        int[] coins = {1, 5, 10, 25};
        int amount = 41;
        
        Console.Write("Available Coins: ");
        foreach (int coin in coins) {
            Console.Write(coin + " ");
        }
        Console.WriteLine($"\nAmount to Make: {amount}\n");
        
        CoinChangeProblem(coins, amount);
        
        Console.WriteLine("\n=== Greedy Strategy ===");
        Console.WriteLine("1. Sort coins in descending order");
        Console.WriteLine("2. For each coin (largest to smallest):");
        Console.WriteLine("   - Use as many as possible");
        Console.WriteLine("   - Subtract from amount");
        Console.WriteLine("3. Continue until amount becomes 0\n");
        
        Console.WriteLine("=== Complexity ===");
        Console.WriteLine("Time Complexity:  O(n log n) for sorting + O(amount)");
        Console.WriteLine("Space Complexity: O(1)");
        Console.WriteLine("Note: Greedy works for standard coin systems");
    }
}
