// Coin Change Problem in Java

import java.util.*;

public class CoinChange {
    public static void coinChange(int[] coins, int amount) {
        Arrays.sort(coins);
        
        System.out.println("Coin Change for amount " + amount + ":");
        int coinsUsed = 0;
        
        for (int i = coins.length - 1; i >= 0 && amount > 0; i--) {
            while (amount >= coins[i]) {
                System.out.println("Take coin of value " + coins[i]);
                amount -= coins[i];
                coinsUsed++;
            }
        }
        
        System.out.println("\nTotal Coins Used: " + coinsUsed);
        if (amount > 0) {
            System.out.println("Warning: Cannot make exact change (Remaining: " + amount + ")");
        } else {
            System.out.println("Amount Made: Complete");
        }
    }
    
    public static void main(String[] args) {
        System.out.println("=== Coin Change Problem (Java) ===\n");
        
        int[] coins = {1, 5, 10, 25};
        int amount = 41;
        
        System.out.print("Available Coins: ");
        for (int coin : coins) {
            System.out.print(coin + " ");
        }
        System.out.println("\nAmount to Make: " + amount + "\n");
        
        coinChange(coins, amount);
        
        System.out.println("\n=== Greedy Strategy ===");
        System.out.println("1. Sort coins in descending order");
        System.out.println("2. For each coin (largest to smallest):");
        System.out.println("   - Use as many as possible");
        System.out.println("   - Subtract from amount");
        System.out.println("3. Continue until amount becomes 0\n");
        
        System.out.println("=== Complexity ===");
        System.out.println("Time Complexity:  O(n log n) for sorting + O(amount)");
        System.out.println("Space Complexity: O(1)");
        System.out.println("Note: Greedy works for standard coin systems");
    }
}
