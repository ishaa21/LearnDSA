// HashMap in Java

public class HashMap {
    private static final int TABLE_SIZE = 100;
    
    static class MapEntry {
        String key;
        int value;
        boolean used;
        
        MapEntry() {
            used = false;
        }
    }
    
    private MapEntry[] entries = new MapEntry[TABLE_SIZE];
    
    public HashMap() {
        for (int i = 0; i < TABLE_SIZE; i++) {
            entries[i] = new MapEntry();
        }
    }
    
    private int hashFunction(String key) {
        int hash = 0;
        for (char c : key.toCharArray()) {
            hash += c;
        }
        return hash % TABLE_SIZE;
    }
    
    public void put(String key, int value) {
        int index = hashFunction(key);
        
        while (entries[index].used) {
            if (entries[index].key.equals(key)) {
                entries[index].value = value;
                return;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        
        entries[index].key = key;
        entries[index].value = value;
        entries[index].used = true;
    }
    
    public int get(String key) {
        int index = hashFunction(key);
        
        while (entries[index].used) {
            if (entries[index].key.equals(key)) {
                return entries[index].value;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        return -1;
    }
    
    public boolean containsKey(String key) {
        int index = hashFunction(key);
        
        while (entries[index].used) {
            if (entries[index].key.equals(key)) {
                return true;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        return false;
    }
    
    public void remove(String key) {
        int index = hashFunction(key);
        
        while (entries[index].used) {
            if (entries[index].key.equals(key)) {
                entries[index].used = false;
                return;
            }
            index = (index + 1) % TABLE_SIZE;
        }
    }
    
    public static void main(String[] args) {
        HashMap map = new HashMap();
        
        System.out.println("=== HashMap (Java) ===\n");
        
        // Put operations
        System.out.println("Inserting key-value pairs...");
        map.put("apple", 5);
        map.put("banana", 3);
        map.put("orange", 7);
        map.put("grape", 4);
        System.out.println("Inserted: apple->5, banana->3, orange->7, grape->4\n");
        
        // Get operations
        System.out.println("Retrieving values...");
        System.out.println("get('apple') = " + map.get("apple"));
        System.out.println("get('banana') = " + map.get("banana"));
        System.out.println("get('grape') = " + map.get("grape"));
        System.out.println("get('mango') = " + map.get("mango") + " (not found)\n");
        
        // Contains key
        System.out.println("Checking keys...");
        System.out.println("containsKey('apple') = " + map.containsKey("apple"));
        System.out.println("containsKey('mango') = " + map.containsKey("mango") + "\n");
        
        // Update value
        System.out.println("Updating value...");
        map.put("apple", 10);
        System.out.println("Updated apple->10");
        System.out.println("get('apple') = " + map.get("apple") + "\n");
        
        // Remove operation
        System.out.println("Removing 'banana'...");
        map.remove("banana");
        System.out.println("get('banana') = " + map.get("banana") + " (removed)\n");
        
        System.out.println("=== HashMap Operations Complexity ===");
        System.out.println("put(key, value):    O(1) average, O(n) worst");
        System.out.println("get(key):           O(1) average, O(n) worst");
        System.out.println("containsKey(key):   O(1) average, O(n) worst");
        System.out.println("remove(key):        O(1) average, O(n) worst");
        System.out.println("Space Complexity:   O(n) where n = number of entries");
    }
}
