# algorithms

Common algorithms for interview questions

# How to use
Start with `irb`

```
require './min_heap.rb'
require './min_heap_search.rb'
```

# Tests

```
h = MinHeap.new
h.insert 2
h.insert 3
h.insert 5
h.insert 10
h.insert 10
h.insert 234

s = MinHeapSearch.new h
s.dfs 234
```