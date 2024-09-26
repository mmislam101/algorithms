class MinHeap
    attr_accessor :heap

    def initialize
        @heap = []
    end

    def insert(value)
        # insert at end of heap
        @heap << value

        heapify(heap.size - 1)

        @heap
    end

    def heapify(position)
        # If we are at root, we're done
        if position == 0
            return
        end
        
        # find parent
        parent_i = parent(position)

        if @heap[parent_i] > @heap[position]
            # the child is smaller than the parent, need to swap
            @heap[parent_i], @heap[position] = @heap[position], @heap[parent_i]
        end

        # recursively heapify
        heapify(parent_i)
    end

    # return nil if there is at root
    def parent(position)
        return nil if position == 0

        (position - 1) / 2
    end

    # return nil if there is no right node
    def right(position)
        p = position * 2 + 2
        return nil if p >= @heap.size
        p
    end

    # return nil if there is no left node
    def left(position)
        p = position * 2 + 1
        return nil if p >= @heap.size
        p
    end
end