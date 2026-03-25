final Set<String> visualSubtopics = {
  // Sorting
  'MergeSort',
  'BubbleSort',
  'SelectionSort',
  'InsertionSort',
  'QuickSort',
  'HeapSort',
  'CountingSort',
  'RadixSort',

  // Arrays
  '3_1DArrays',
  '4_2DArrays',
  '5_ArrayInsertion',
  '6_ArrayDeletion',
  '7_ArrayUpdate',
  '8_ArrayTraversal',
  '9_SearchingInArrays',
  '10_SortingInArrays',

  // Stack
  'PushOperation',
  'PopOperation',
  'PeekOperation',
  'ValidParantheses',
  'StackImplementationArray',
  'StackImplementionLinkedList',

  // Queue
  'SimpleQueue',
  'CircularQueue',
  'Deque',
  'PriorityQueue',

  // Linked List
  'InsertionInLinkedList',
  'DeletionInLinkedList',
  'TraversalInLinkedList',
  'ReverseLinkedList',
  'SinglyLinkedList',
  'DoublyLinkedList',
  'CircularLinkedList',
  'InsertionInDoublyLinkedList',
  'DeletionInDoublyLinkedList',
  'TraversalInDoublyLinkedList',
  'ReverseDoublyLinkedList',

  // Graph
  'BFS_Graph',
  'DFS_Graph',
  'GraphRepresentation',
  'ConnectedComponents',
  'CycleDetection',
  'MinimunSpanningTree',

  // Tree
  'InorderTraversal',
  'PreorderTraversal',
  'PostorderTraversal',
  'LevelOrderTraversal',
  'BinaryTree',
  'BinarySearchTree',
  'InsertionBST',
  'DeletionBST',
  'HeightOfTree',
  'DiameterOfTree',

  // Searching
  'BinarySearch',
  'LinearSearch',

  // Hashing
  'HashTable',
  'HashMap',
  'HashSet',
  'HashFunctions',
  'CollisionHandling',

  // Heap
  'MaxHeap',
  'MinHeap',
  'Heapify',

  // Dynamic Programming
  'FibonacciDP',
  'Memoization',
  'Tabulation',
  'Knapsack01',
  'UnboundedKnapsack',

  // String
  'ReverseAString',
  'SearchACharacter',
  'LengthOfAString',
  'InsertACharacter',
  'RemoveACharacter',
  'RemoveAllOccurrences',
  'ConcatenatingTwoStrings',
  'CheckForSame',

  // Backtracking
  'NQueens',
};

bool hasVisualization(String subtopic) {
  return visualSubtopics.contains(subtopic);
}
