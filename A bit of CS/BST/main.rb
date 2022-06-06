#  frozen_string_literal: true

require_relative 'tree'

tree = Tree.new
arr = [10, 23, 17, 5, 8, 19, 12, 20, 30]
# arr = [10, 5, 23]
# arr = [10, 5]
tree.build_tree(arr)
tree.pretty_print
tree.root = tree.rebalance
tree.pretty_print
# tree.level_order


# tree.delete(17)
# tree.level_order

# puts tree.find(17).inspect
# puts tree.find(2).inspect

# puts tree.height(tree.root)
# puts tree.inorder(tree.root).inspect
# puts tree.depth(tree.root.left.right)
# puts tree.balanced?
