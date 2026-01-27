// Rabin-Karp Algorithm for Pattern Searching in C#

using System;

class RabinKarp {
    const int d = 256;
    const int q = 101;
    static void RabinKarpSearch(string txt, string pat) {
        int n = txt.Length;
        int m = pat.Length;
        int h = 1, p = 0, t = 0;
        for (int i = 0; i < m-1; i++)
            h = (h * d) % q;
        for (int i = 0; i < m; i++) {
            p = (d * p + pat[i]) % q;
            t = (d * t + txt[i]) % q;
        }
        for (int i = 0; i <= n-m; i++) {
            if (p == t) {
                bool match = true;
                for (int j = 0; j < m; j++)
                    if (txt[i+j] != pat[j]) { match = false; break; }
                if (match) Console.WriteLine($"Pattern found at index {i}");
            }
            if (i < n-m) {
                t = (d*(t - txt[i]*h) + txt[i+m]) % q;
                if (t < 0) t += q;
            }
        }
    }
    static void Main() {
        Console.WriteLine("=== Rabin-Karp Algorithm (C#) ===\n");
        string txt = "ABCCDDAEFG";
        string pat = "CDD";
        RabinKarpSearch(txt, pat);
        Console.WriteLine("\nTime Complexity: O(n+m) average, O(nm) worst");
        Console.WriteLine("Space Complexity: O(1)");
    }
}
