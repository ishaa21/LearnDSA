final Set<String> visualSubtopics = {
  'MergeSort',
  'BubbleSort',
  'SelectionSort',

  '3_1DArrays',
  '4_2DArrays',
  '5_ArrayInsertion',
  '6_ArrayDeletion',
  '7_ArrayUpdate',
  '8_ArrayTraversal',
  '9_SearchingInArrays',

  'PushOperation',
  'PopOperation',
  'PeekOperation',

  'SimpleQueue',
  'CircularQueue',
  'Deque',
  'PriorityQueue',

  'InsertionInLinkedList',
  'DeletionInLinkedList',
  'TraversalInLinkedList',
  'ReverseLinkedList',

  'BFS_Graph',
  'DFS_Graph',

  'InorderTraversal',
  'PreorderTraversal',
  'PostorderTraversal',
  'LevelOrderTraversal',
};

bool hasVisualization(String subtopic) {
  return visualSubtopics.contains(subtopic);
}
