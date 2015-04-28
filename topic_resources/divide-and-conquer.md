# Divide and Conquer Algorithms

### Solves a problem using these three steps:
1. __Divide__: Break the given problem into subproblems of the same type
2. __Conquer__: Recursively solve these problems
3. __Combine__: Appropriately combine the results

### Standard Divide and Conquer Algorithms
1. **Binary Search** is a searching algorithm. 
	+ Main algorithmic functionality: insertion, searching, deletion.  
	+ Node-based binary tree data structure where each node has a key value.  
		+ One node is designated the root of the tree.
		+ Each internal node contains a key and has two subtrees.
		+ The leaves (final nodes) of the tree contain no key. Leaves are commonly represented by a special leaf or nil symbol, a NULL pointer, etc.
		+ Each subtree is itself a binary search tree.
		+ The left subtree of a node contains only nodes with keys strictly less than the node's key.
		+ The right subtree of a node contains only nodes with keys strictly greater than the node's key.  
	+ [Interactive Visualization](https://www.cs.usfca.edu/~galles/visualization/BST.html)  
	![Picture](http://programminggeeks.com/wp-content/uploads/2014/01/nodes-in-binary-search-tree.png)  
	```
	search_recursive(key, node)  // call initially with node = root  
	    if node is Null or node.key equals key  
	        return node  
	    else if key < node.key  
	        return search_recursive(key, node.left)  
	    else  
	        return search_recursive(key, node.right)  
	```
2. **Quicksort** is a sorting algorithm.  
	+ The steps are:
		1. Pick an element, called a pivot, from the array.  
		2. Reorder the array so that all elements with values less than the pivot come before the pivot, while all elements with values greater than the pivot come after it (equal values can go either way). After this partitioning, the pivot is in its final position. This is called the partition operation.  
		3. Recursively apply the above steps to the sub-array of elements with smaller values and separately to the sub-array of elements with greater values.  
	```
	quicksort(A)  
		if A has fewer than 2 elements  
			return A  
		else  
			Pick a pivot p from A  
			L ← quicksort(Things in A ≤ p)  
			U ← quicksort(Things in A > p)  
			Return L + [p] + U
	```
	
	+ When implemented well, it can be about two or three times faster than its main competitors, merge sort and heapsort
	+ [Hungarian Dance](https://www.youtube.com/watch?v=ywWBy6J5gz8)
3. **Merge sort** is a sorting algorithm.  
	+ The steps are:
		1. Divide the unsorted list into __n__ sublists, each containing 1 element (a list of 1 element is considered sorted).
		2. __Repeatedly__ merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.  
	![Visualization](http://upload.wikimedia.org/wikipedia/commons/c/cc/Merge-sort-example-300px.gif)  
	+ [Hungarian Dance](https://www.youtube.com/watch?v=XaqR3G_NVoo)

	### Problem
	Create a merge sort algorithm that also removes duplicates.
