#include <stdio.h>
#include <string.h>
#define d 256
#define q 101

// Rabin-Karp Algorithm for Pattern Searching
void rabinKarp(char* txt, char* pat) {
    int n = strlen(txt);
    int m = strlen(pat);
    int h = 1, p = 0, t = 0;
    for (int i = 0; i < m-1; i++)
        h = (h * d) % q;
    for (int i = 0; i < m; i++) {
        p = (d * p + pat[i]) % q;
        t = (d * t + txt[i]) % q;
    }
    for (int i = 0; i <= n-m; i++) {
        if (p == t) {
            int match = 1;
            for (int j = 0; j < m; j++)
                if (txt[i+j] != pat[j]) { match = 0; break; }
            if (match) printf("Pattern found at index %d\n", i);
        }
        if (i < n-m) {
            t = (d*(t - txt[i]*h) + txt[i+m]) % q;
            if (t < 0) t += q;
        }
    }
}

int main() {
    printf("=== Rabin-Karp Algorithm (C) ===\n\n");
    char txt[] = "ABCCDDAEFG";
    char pat[] = "CDD";
    rabinKarp(txt, pat);
    printf("\nTime Complexity: O(n+m) average, O(nm) worst\nSpace Complexity: O(1)\n");
    return 0;
}
