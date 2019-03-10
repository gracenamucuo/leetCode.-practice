//
//  main.swift
//  leetCodePractice
//
//  Created by 戴运鹏 on 2019/3/9.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation

class TreeNode {
    var val:Int
    var left:TreeNode?
    var right:TreeNode?
    init(_ val:Int) {
        self.val = val
    }
}

/*
            1
        2          3
    4      5     6     7
 8    9  10  11
 
 */

var nodes:[TreeNode] = []

for value in 1...11 {//用来生成节点
    let node = TreeNode(value)
    nodes.append(node)
}

var idx = 0
while (idx + 1) * 2 <= 10 {//将数组中node链接起来
    let node = nodes[idx]
    let left = nodes[(idx + 1) * 2 - 1]
    let right = nodes[(idx + 1) * 2]
    node.left = left
    node.right = right
    idx += 1
}

let root = nodes[0]
//计算树的最大深度？？？？ 这个是层？？
func maxDepth(_ root:TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    return max(maxDepth(root.left), maxDepth(root.right)) + 1
}
print(maxDepth(nodes[0]))

//前序遍历
func preOrder(_ root:TreeNode?) {
    guard root != nil else {
        return
    }
    print(root!.val)
    preOrder(root?.left)
    preOrder(root?.right)
}
//中序遍历
func inOrder(_ root:TreeNode?) {
    guard root != nil else {
        return
    }
    inOrder(root?.left)
    print(root!.val)
    inOrder(root?.right)
}
//后序遍历
func postOrder(_ root:TreeNode?) {
    guard root != nil else {
        return
    }
    postOrder(root?.right)
    postOrder(root?.left)
    print(root!.val)
}
preOrder(nodes[0])


