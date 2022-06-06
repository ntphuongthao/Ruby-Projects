# frozen_string_literal: true

require_relative 'node'

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_tree(arr)
    arr.each do |value|
      insert(value)
    end
    root
  end

  def insert(value)
    new_node = Node.new(value)
    if !root
      @root = new_node
    else
      temp = @root
      flag = false

      while temp
        if temp.data <= value
          if temp.right
            temp = temp.right
          else
            temp.right = new_node
            flag = true
          end
        elsif temp.left
          temp = temp.left
        else
          temp.left = new_node
          flag = true
        end
        break if flag
      end
    end
  end

  def delete(value)
    if !has_value?(value)
      puts 'There is no such value to be deleted.'
    else
      temp = @root
      prev = nil
      while temp
        if temp.data == value
          # Case 1: The root contains the value
          if prev.nil?
            if !temp.left && !temp.right
              # The root doesn't have left and right nodes
              @root = nil
            elsif !temp.left
              # The root has only right node
              @root = temp.right
            elsif !temp.right
              # The root has only left node
              @root = temp.left
            else
              # The root has both left and right nodes
              chosen = temp.left
              prev = temp

              while chosen.left
                prev = chosen
                chosen = chosen.left
              end

              prev.left = (chosen.right)
              chosen.right = nil
              temp.data = chosen.data
            end
            # Case 2: It is not the root that contains the value
          elsif !temp.left && !temp.right
            if prev.left.data == temp.data
              prev.left = nil
            elsif prev.right.data == temp.data
              prev.right = nil
            end
          elsif !temp.left
            if prev.left.data == temp.data
              prev.left = temp.right
            elsif prev.right.data == temp.data
              prev.right = temp.right
            end
          elsif !temp.right
            if prev.left.data == temp.data
              prev.left = temp.left
            elsif prev.right.data == temp.data
              prev.right = temp.left
            end
          else
            chosen = temp.left
            previous = temp

            while chosen.left
              previous = chosen
              chosen = chosen.left
            end

            previous.left = chosen.right if chosen.right

            chosen.right = nil
            temp.data = chosen.data
          end
          break
        end

        prev = temp
        temp = if temp.data <= value
                 temp.right
               else
                 temp.left
               end
      end
      puts 'Successfully deleted the node with such value!'
    end
  end

  def has_value?(value)
    result = false
    temp = @root

    while temp
      if temp.data == value
        result = true
        break
      end

      temp = if temp.data <= value
               temp.right
             else
               temp.left
             end
    end

    result
  end

  def find(value)
    if !has_value?(value)
      puts 'Could not find the node with such value!'
      return nil
    else
      temp = @root
      while temp
        if temp.data == value
          puts 'The node with such value was found!'
          return temp
        end
        temp = if temp.data <= value
                 temp.right
               else
                 temp.left
               end
      end
    end
  end

  def level_order
    res = []
    if @root
      queue = Queue.new
      queue << @root
      until queue.empty?
        cur = queue.pop
        res.append(cur.data)
        queue << cur.left if cur.left

        queue << cur.right if cur.right
      end
    end
    puts res.inspect
  end

  def inorder(root)
    res = []
    if !root
      res
    else
      res += inorder(root.left) + [root.data] + inorder(root.right)
    end
  end

  def preorder(root) 
    res = []
    if !root
      res
    else 
      res += [root.data] + preorder(root.left) + preorder(root.right)
    end
  end

  def postorder(root)
    res = []
    if !root
      res
    else
      res += postorder(root.left) + postorder(root.right) + [root.data]
    end
  end

  def height(node)
    if !node
      0
    else
      [1 + height(node.left), 1 + height(node.right)].max
    end
  end

  def depth(node)
    value = node.data
    depth = 0
    temp = @root
    while temp && temp.data != value
      depth += 1
      if temp.data < value
        temp = temp.right
      else
        temp = temp.left
      end
    end
    (temp && temp.data == value)? depth: -1
  end

  def balanced?
    res = dfs(@root)
    res[0]
  end

  def dfs(root)
    if !root
      # [balanced, height]
      [true, 0]
    else
      left, right = dfs(root.left), dfs(root.right)

      balanced = left[0] && right[0] && (left[1] - right[1]).abs <= 1 
      if balanced
        [true, 1 + [left[1], right[1]].max]
      else
        [false, 1 + [left[1], right[1]].max]
      end
    end
  end

  def rebalance
    nodes = inorder(@root)
    n = nodes.length
    rebalance_helper(nodes, 0, n - 1)
  end

  def rebalance_helper(nodes, s, e)
    if s > e
      return
    end

    mid = (s + e) / 2
    node = Node.new(nodes[mid])

    node.left = rebalance_helper(nodes, s, mid - 1)
    node.right = rebalance_helper(nodes, mid + 1, e)
    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
