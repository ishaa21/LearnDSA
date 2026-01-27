// Rabin-Karp Algorithm for Pattern Searching in Java

public class RabinKarp {
    static final int d = 256;
    static final int q = 101;
    static void rabinKarp(String txt, String pat) {
        int n = txt.length();
        int m = pat.length();
        int h = 1, p = 0, t = 0;
        for (int i = 0; i < m-1; i++)
            h = (h * d) % q;
        for (int i = 0; i < m; i++) {
            p = (d * p + pat.charAt(i)) % q;
            t = (d * t + txt.charAt(i)) % q;
        }
        for (int i = 0; i <= n-m; i++) {
            if (p == t) {
                boolean match = true;
                for (int j = 0; j < m; j++)
                    if (txt.charAt(i+j) != pat.charAt(j)) { match = false; break; }
                if (match) System.out.println("Pattern found at index " + i);
            }
            if (i < n-m) {
                t = (d*(t - txt.charAt(i)*h) + txt.charAt(i+m)) % q;
                if (t < 0) t += q;
            }
        }
    }
    public static void main(String[] args) {
        System.out.println("=== Rabin-Karp Algorithm (Java) ===\n");
        String txt = "ABCCDDAEFG";
        String pat = "CDD";
        rabinKarp(txt, pat);
        System.out.println("\nTime Complexity: O(n+m) average, O(nm) worst");
        System.out.println("Space Complexity: O(1)");
    }
}
