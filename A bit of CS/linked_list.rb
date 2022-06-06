class Node
    attr_accessor :data, :next
    def initialize(data)
        @data = data
        @next = nil
    end
end

class LinkedList
    attr_reader :head, :tail
    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        new_node = Node.new(value)
        if @head == nil
            @head = new_node
            @tail = new_node
        else
            temp = @head
            while temp.next != nil
                temp = temp.next
            end
            temp.next = new_node
            tail = temp.next
        end
    end

    def prepend(value)
        new_node = Node.new(value)
        if @head == nil
            @head = new_node
            @tail = new_node
        else
            new_node.next = @head
            @head = new_node
        end
    end

    def size
        result = 0
        temp = @head
        while temp != nil
            result += 1
            temp = temp.next
        end
        result
    end

    def at(index)
        if size() < index
            puts "There is no node at such index"
        else
            temp = @head
            while index > 0
                index -= 1
                temp = temp.next
            end
            return temp
        end
    end

    def pop 
        prev = nil
        temp = @head

        while temp.next != nil
            prev = temp
            temp = temp.next
        end
        
        if prev == nil
            @head = nil
            @tail = nil
        else
            prev.next = nil
            @tail = prev
        end
    end

    def contains?(value)
        flag = false
        temp = @head
        while temp != nil
            if temp.data == value
                flag = true
                break
            end
            temp = temp.next
        end
        flag
    end

    def find(value)
        flag = false
        res = -1
        temp = @head

        while temp != nil
            res += 1
            if temp.data == value
                flag = true
                break
            end
            temp = temp.next
        end

        if !flag
            nil
        else
            res 
        end
    end

    def to_s
        temp = @head
        res = []
        while temp != nil
            res.push("#{temp.data}->")
            temp = temp.next
        end
        res.append("nil")
        res.join
    end
end

linked_list = LinkedList.new
linked_list.append(1)
linked_list.append(2)
linked_list.append(3)
linked_list.append(4)
linked_list.append(5)
linked_list.append(6)
linked_list.prepend(0)

puts linked_list.to_s

puts linked_list.contains?(10)
puts linked_list.contains?(1)

puts linked_list.at(5).inspect
puts linked_list.find(6)
puts linked_list.find(8)
puts linked_list.find(1)

linked_list.pop
puts linked_list.to_s