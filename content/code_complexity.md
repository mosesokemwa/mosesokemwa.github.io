---
title: "Time Complexities Of Python Data Structures"
date: 2019-12-24T17:58:14+03:00
draft: true
slug: code complexity
---

### An Important Article For Everyone Using Python Programming Language In Data Science Projects
_This topic is not covered well here on Medium hence I have decided to outline the time complexities of Python data structures in an easy to understand manner._

#### Why Do We Need to Know Time Complexities?
It is crucial for a data scientist programmer to choose the right data structures for the job. In particular, if the algorithms are computationally intensive such as the ones that train a machine learning model or algorithms that manipulate large volumes of data then it is wise to ensure that special care is taken in choosing the appropriate data structures.
Choosing the right data type is often ignored and it ends up badly impacting the performance of the application.
Article Aim
This article explains the Big-O notation of the key operations of data structures in CPython. The big-O notation is a way to measure the time complexity of an operation.

1. Let’s Understand What Big O Notation Means?
A number of operations are performed in an algorithm. These operations could include iterating over a collection, copying an item or the entire collection, appending an item into a collection, inserting an item at the start or end of a collection, deleting an item or updating an item in a collection.
Big-O measures the time complexity of the operations of an algorithm. It measures how long it takes for the algorithm to compute the required operation. Although we could also measure the space complexity (how much space an algorithm takes) but this article will focus on time complexity.
In simplest terms, Big O notation is a way to measure performance of an operation based on the input size, known as n.
2. What Are The Different Big O Notation Measures?
There are a number of common Big O notations which we need to be familiar with.
Let’s consider n to be the size of the input collection. In terms of time complexity:
O(1): No matter how big your collection is, the time it takes to perform an operation is constant. This is the constant time complexity notation. These operations are as fast as we can get. As an instance, operations that check whether a collection has any items inside it is an O(1) operation.
O(log n): When the size of a collection increases, the time it takes to perform an operation increases logarithmically. This is the logarithmic time complexity notation. Potentially optimised searching algorithms are O(log n).
O(n): The time it takes to perform an operation is directly and linearly proportional to the number of items in the collection. This is the linear time complexity notation. This is some-what in-between or medium in terms of performance. As an instance, if we want to sum all of the items in a collection then we would have to iterate over the collection. Hence the iteration of a collection is an O(n) operation.
(n log n): Where the performance of performing an operation is a quasilinear function of the number of items in the collection. This is known as the quasilinear time complexity notation. Time complexity of optimised sorting algorithm is usually n(log n).
O(n square): When the time it takes to perform an operation is proportional to the square of the items in the collection. This is known as the quadratic time complexity notation.
(n!): When every single permutation of a collection is computed in an operation and hence the time it takes to perform an operation is factorial of the size of the items in the collection. This is known as factorial time complexity notation. It is very slow.
This image provides an overview of the Big-O notations.

O(1) is fast. O(n square) is slow. O(n!) is very slow.
Big O Notation is relative. Big O Notation is machine independent, ignores constants and is understood by wider audience including mathematicians, technologists, data scientists etc.
Best, Average, Worst Cases
When we compute the time complexity of an operation, we could produce the complexity based on the best, average or worst-case scenario.

Best case scenario: As the name implies, these are the scenarios when the data structures and the items in the collection along with the parameters are at their optimum state. As an instance, imagine we want to find an item in a collection. If that item happens to be the first item of the collection then it is the best-case scenario for the operation.
Average case scenario is when we define the complexity based on the distribution of the values of the input.
Worst case scenario could be an operation that requires finding an item that is positioned as the last item in a large-sized collection such as a list and the algorithm iterates over the collection from the very first item.
Python Collections & Time Complexity
In this part of the article, I will document the common collections in CPython and then I will outline their time complexities.
In particular, I will concentrate on the average case scenario.
1. list
List is by far one of the most important data structures in Python. We can use lists as stacks (the last item added is the first item out) or queues (the first item added is the first item out). Lists are ordered and mutable collections as we can update the items at will.
Let’s Review The Common List Operations And Their Big-O Notations
1. Insert: It’s Big-O Notation Is O(n)
2. Get Item: It’s Big-O Notation Is O(1)
3. Delete Item: It’s Big-O Notation Is O(n)
4. Iteration: It’s Big-O Notation Is O(n)
5. Get Length: It’s Big-O Notation Is O(1)

Photo by Joshua Sortino on Unsplash
2. set
Sets are also one of the most widely used data collections in Python. A set is essentially an unordered collection. Set does not permit duplicates and hence each item in a set is unique. Set supports many mathematical operations such as union, difference, the intersection of sets and so on.
Let’s Review The Common Set Operations
1. Check for item in set: It’s Big-O Notation Is O(1)
2. Difference of set A from B: It’s Big-O Notation Is O(length of A)
3. Intersection of set A and B: It’s Big-O Notation Is O(minimum of the length of either A or B)
4. Union of set A and B: It’s Big-O Notation Is O(N) with respect to length(A) + length(B)

Photo by fabio on Unsplash
3. dictionary
Lastly, I wanted to provide an overview of the dictionary data collection. Dictionary is a key-value pair collection. Keys are unique in a dictionary to prevent item collision. It is an extremely useful data collection.
Dictionaries are indexed by keys, where the keys could be strings, numbers or even tuples with strings, numbers or tuples.
We can perform a number of operations on a dictionary such as storing a value for a key, or retrieving an item based on a key, or iterating over the items and so on.
Let’s review the common dictionary time complexities:
Here, we consider that the key is used to get, set or delete an item.
1. Get Item: It’s Big-O Notation Is O(1)
2. Set Item: It’s Big-O Notation Is O(1)
3. Delete Item: It’s Big-O Notation Is O(1)
4. Iterate Over Dictionary: It’s Big-O Notation Is O(n)

Photo by NASA on Unsplash
Summary
This article explained the Big-O notation of the key operations of data structures in CPython. The big-o notation is essentially a way to measure the time complexity of an operation. The article also illustrated a number of common operations for a list, set and a dictionary.
It is crucial to design and choose the right data structures for your algorithm.
Hope it helps.