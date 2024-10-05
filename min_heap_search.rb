class MinHeapSearch
    attr_accessor :min_heap

    def initialize(min_heap)
        @min_heap = min_heap
    end

    # Returns the index of the value if found in heap. otherwise -1
    def dfs(value)
        visited = Set.new
        stack = []

        # Start with the root
        current_position = 0
        stack << 0
        visited << 0

        while stack.any?
            puts "check adj: #{@min_heap.heap[current_position]}"
            adjascent_unvisited = getAdjascentUnvisitedNode(current_position, visited)

            if adjascent_unvisited
                # haven't visited, push and visit and make new current
                current_position = adjascent_unvisited
                puts "has adj: #{@min_heap.heap[current_position]}"

                stack << current_position 
                visited << current_position
            else
                # We've hit the bottom, check and pop
                current_position = stack.pop Because we pop when we get to the top, stack is empty and exits while loop and doesnt go to the right side
                puts "has no adj, checking: #{@min_heap.heap[current_position]}"

                return current_position if @min_heap.heap[current_position] == value

                puts "#{@min_heap.heap[current_position]} was not the value"
            end
        end
    end

    def getAdjascentUnvisitedNode(position, visited)
        # first check left
        left = @min_heap.left(position)
        return left if left && !visited.include?(left)

        # otherwise check right
        right = @min_heap.right(position)
        return right if right && !visited.include?(right)

        # else visited all adjascent
        return nil
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