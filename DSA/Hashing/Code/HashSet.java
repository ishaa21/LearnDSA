// HashSet in Java

public class HashSet {
    private static final int TABLE_SIZE = 100;
    
    static class SetEntry {
        String element;
        boolean used;
        
        SetEntry() {
            used = false;
        }
    }
    
    private SetEntry[] entries = new SetEntry[TABLE_SIZE];
    private int sz = 0;
    
    public HashSet() {
        for (int i = 0; i < TABLE_SIZE; i++) {
            entries[i] = new SetEntry();
        }
    }
    
    private int hashFunction(String element) {
        int hash = 0;
        for (char c : element.toCharArray()) {
            hash += c;
        }
        return hash % TABLE_SIZE;
    }
    
    public void add(String element) {
        int index = hashFunction(element);
        
        while (entries[index].used) {
            if (entries[index].element.equals(element)) {
                return; // Element already exists
            }
            index = (index + 1) % TABLE_SIZE;
        }
        
        entries[index].element = element;
        entries[index].used = true;
        sz++;
    }
    
    public boolean contains(String element) {
        int index = hashFunction(element);
        
        while (entries[index].used) {
            if (entries[index].element.equals(element)) {
                return true;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        return false;
    }
    
    public void remove(String element) {
        int index = hashFunction(element);
        
        while (entries[index].used) {
            if (entries[index].element.equals(element)) {
                entries[index].used = false;
                sz--;
                return;
            }
            index = (index + 1) % TABLE_SIZE;
        }
    }
    
    public int size() {
        return sz;
    }
    
    public void printSet() {
        System.out.print("Set contents: { ");
        for (int i = 0; i < TABLE_SIZE; i++) {
            if (entries[i].used) {
                System.out.print(entries[i].element + " ");
            }
        }
        System.out.println("}");
    }
    
    public HashSet intersection(HashSet other) {
        HashSet result = new HashSet();
        for (int i = 0; i < TABLE_SIZE; i++) {
            if (this.entries[i].used) {
                if (other.contains(this.entries[i].element)) {
                    result.add(this.entries[i].element);
                }
            }
        }
        return result;
    }
    
    public HashSet unionSet(HashSet other) {
        HashSet result = new HashSet();
        for (int i = 0; i < TABLE_SIZE; i++) {
            if (this.entries[i].used) {
                result.add(this.entries[i].element);
            }
        }
        for (int i = 0; i < TABLE_SIZE; i++) {
            if (other.entries[i].used) {
                result.add(other.entries[i].element);
            }
        }
        return result;
    }
    
    public static void main(String[] args) {
        System.out.println("=== HashSet (Java) ===\n");
        
        HashSet set1 = new HashSet();
        HashSet set2 = new HashSet();
        
        // Add elements to set1
        System.out.println("Adding elements to Set1...");
        set1.add("apple");
        set1.add("banana");
        set1.add("orange");
        set1.add("grape");
        System.out.println("Set1 size: " + set1.size());
        set1.printSet();
        System.out.println();
        
        // Add elements to set2
        System.out.println("Adding elements to Set2...");
        set2.add("banana");
        set2.add("grape");
        set2.add("mango");
        set2.add("pear");
        System.out.println("Set2 size: " + set2.size());
        set2.printSet();
        System.out.println();
        
        // Contains operation
        System.out.println("Checking elements...");
        System.out.println("Set1 contains 'apple': " + set1.contains("apple"));
        System.out.println("Set1 contains 'mango': " + set1.contains("mango") + "\n");
        
        // Union
        System.out.println("Union of Set1 and Set2:");
        HashSet unionResult = set1.unionSet(set2);
        System.out.println("Union size: " + unionResult.size());
        unionResult.printSet();
        System.out.println();
        
        // Intersection
        System.out.println("Intersection of Set1 and Set2:");
        HashSet intersectResult = set1.intersection(set2);
        System.out.println("Intersection size: " + intersectResult.size());
        intersectResult.printSet();
        System.out.println();
        
        // Remove operation
        System.out.println("Removing 'banana' from Set1...");
        set1.remove("banana");
        System.out.println("Set1 size: " + set1.size());
        System.out.println("Set1 contains 'banana': " + set1.contains("banana") + "\n");
        
        System.out.println("=== HashSet Operations Complexity ===");
        System.out.println("add(element):       O(1) average, O(n) worst");
        System.out.println("contains(element):  O(1) average, O(n) worst");
        System.out.println("remove(element):    O(1) average, O(n) worst");
        System.out.println("unionSet():         O(m + n) where m, n = set sizes");
        System.out.println("intersection():     O(m + n) where m, n = set sizes");
        System.out.println("Space Complexity:   O(n) where n = number of elements");
    }
}
