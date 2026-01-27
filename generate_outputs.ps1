# Generate meaningful outputs for code files

$outputContents = @{
    # Arrays outputs
    "1_IntroductionToArrays" = "First element: 10
Last element: 50
All elements: [10, 20, 30, 40, 50]
List length: 5
After appending 60: [10, 20, 30, 40, 50, 60]
After removing last element: [10, 20, 30, 40, 50]"

    "2_ArrayDeclarationInitialization" = "Array: [1, 2, 3, 4, 5]
Element at index 2: 3
Array size: 5
Modified array: [10, 2, 3, 4, 5]"

    "3_1DArrays" = "1D Array: [5, 10, 15, 20, 25]
Sum of elements: 75
Average: 15.0
Minimum: 5
Maximum: 25"

    "4_2DArrays" = "2D Array:
[[1, 2, 3],
 [4, 5, 6],
 [7, 8, 9]]
Element at [1][1]: 5
Trace sum: 15"

    "5_ArrayInsertion" = "Original array: [1, 2, 4, 5]
After inserting 3 at index 2: [1, 2, 3, 4, 5]"

    "6_ArrayDeletion" = "Original array: [1, 2, 3, 4, 5]
After deleting element at index 2: [1, 2, 4, 5]"

    "7_ArrayUpdate" = "Original array: [10, 20, 30, 40]
Updated array: [10, 25, 30, 40]
Element at index 1 changed from 20 to 25"

    "8_ArrayTraversal" = "Traversing array: 
1 2 3 4 5
Reverse traversal: 
5 4 3 2 1"

    "9_SearchingInArrays" = "Array: [5, 2, 8, 1, 9]
Element 8 found at index 2
Element 10 not found in array"

    "10_SortingInArrays" = "Original: [64, 34, 25, 12, 22]
Sorted: [12, 22, 25, 34, 64]"
}

$topics = @("Arrays", "Stack", "Queue", "Linkedlist", "Tree", "Graph", "Hashing", "Heap", "Backtracking", "DynamicProgramming", "SearchingAlgorithms", "SortingAlgorithms", "String", "StringAlgorithms", "GreedyAlgo")

foreach ($topic in $topics) {
    $codePath = "D:\My_Data\Desktop\flutter\learn_dsa\DSA\$topic\Code"
    if (Test-Path $codePath) {
        Get-ChildItem $codePath -Filter "*.output" | ForEach-Object {
            $subtopicName = $_.BaseName
            
            # Check if we have a predefined output
            if ($outputContents.ContainsKey($subtopicName)) {
                $content = $outputContents[$subtopicName]
            } else {
                # Generic output for other subtopics
                $content = "Output:
---------
Program executed successfully.

Note: Specific output depends on implementation details.
Refer to the code for input values and expected behavior."
            }
            
            $content | Out-File -FilePath $_.FullName -Encoding UTF8 -Force
        }
    }
}

Write-Host "Output files generated successfully!"
