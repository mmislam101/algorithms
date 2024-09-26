class MinHeapSearch
    attr_accessor :min_heap

    def initialize(min_heap)
        @min_heap = min_heap
    end

    # Returns the index of the value if found in heap. otherwise -1
    def dfs(value)
        visited = Set.new
        stack = []

        # visit the root
        visited << 0
        stack << 0

        while 1
            current_position = stack.last
            # check if current position has the value, return index
            return current_position if @min_heap.heap[current_position] == value

            # check if we've visited every node, return -1
            return -1 if @min_heap.heap.size == visited.size

            left = @min_heap.left(current_position)
            right = @min_heap.right(current_position)
            if left && !visited.include?(left) # If left unvisited, move to the left
                visited << left
                stack << left
            elsif right && !visited.include?(right) # If right unvisited, move to the right
                visited << right
                stack << right
            else # Hit the bottom of branch, pop
                stack.pop
            end
        end
    end

    # Returns the index of the value if found in heap. otherwise -1
    def bfs(value)
        visited = Set.new
        queue = []

        # Start with root
        visited << 0
        queue.unshift 0

        while 1
            current_position = queue.pop

            # Return -1 if queue is empty
            return -1 if !current_position
            
            left = @min_heap.left(current_position)
            right = @min_heap.right(current_position)

            # push left into queue if exist and hasn't been visited
            queue.unshift left if left && !visited.include?(left)
            # push right into queue if exist and hasn't been visited
            queue.unshift right if right && !visited.include?(right)

            # Return position if it's been found
            return current_position if @min_heap.heap[current_position] == value
        end
    end
end