# Activity Selection Problem in Python

class Activity:
    def __init__(self, id, start, end):
        self.id = id
        self.start = start
        self.end = end

def activity_selection(activities):
    # Sort by end time
    activities.sort(key=lambda x: x.end)
    
    print("Selected Activities:")
    print(f"Activity {activities[0].id} ({activities[0].start} - {activities[0].end})")
    
    last_end = activities[0].end
    count = 1
    
    for i in range(1, len(activities)):
        if activities[i].start >= last_end:
            print(f"Activity {activities[i].id} ({activities[i].start} - {activities[i].end})")
            last_end = activities[i].end
            count += 1
    
    print(f"\nTotal Activities Selected: {count}")

# Test
print("=== Activity Selection Problem (Python) ===\n")

activities = [
    Activity(1, 0, 5),
    Activity(2, 1, 2),
    Activity(3, 3, 4),
    Activity(4, 0, 6),
    Activity(5, 5, 7),
    Activity(6, 8, 9)
]

print("Activities (ID, Start, End):")
for a in activities:
    print(f"Activity {a.id}: {a.start} - {a.end}")
print()

activity_selection(activities)

print("\n=== Greedy Strategy ===")
print("1. Sort activities by end time")
print("2. Select first activity")
print("3. For remaining activities:")
print("   - If start >= last end: select it")
print("4. Repeat until all checked\n")

print("=== Complexity ===")
print("Time Complexity:  O(n log n) for sorting")
print("Space Complexity: O(1)")
print("Greedy Choice: Earliest finish time")
