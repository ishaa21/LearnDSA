# Rabin-Karp Algorithm for Pattern Searching in Python
d = 256
q = 101

def rabin_karp(txt, pat):
    n = len(txt)
    m = len(pat)
    h = 1
    for i in range(m-1):
        h = (h * d) % q
    p = 0
    t = 0
    for i in range(m):
        p = (d * p + ord(pat[i])) % q
        t = (d * t + ord(txt[i])) % q
    for i in range(n-m+1):
        if p == t:
            if txt[i:i+m] == pat:
                print(f"Pattern found at index {i}")
        if i < n-m:
            t = (d*(t - ord(txt[i])*h) + ord(txt[i+m])) % q
            if t < 0:
                t += q

print("=== Rabin-Karp Algorithm (Python) ===\n")
txt = "ABCCDDAEFG"
pat = "CDD"
rabin_karp(txt, pat)
print("\nTime Complexity: O(n+m) average, O(nm) worst")
print("Space Complexity: O(1)")
