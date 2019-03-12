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
//计算树的最大深度:二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
func maxDepth(_ root:TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }

    return max(maxDepth(root.left), maxDepth(root.right)) + 1
}
//print(maxDepth(nodes[0]))

//前序遍历
func preOrder(_ root:TreeNode?) {
    guard root != nil else {
        return
    }
//    print(root!.val)
    preOrder(root?.left)
    preOrder(root?.right)
}
//非递归前序遍历
func preOrder1(_ root:TreeNode?)-> [Int]{
    var res:[Int] = []
    var stack:[TreeNode] = []
    var node = root
    while !stack.isEmpty || node != nil {
        if node != nil {
            res.append(node!.val)
            stack.append(node!)
            node = node!.left
        }else{
            node = stack.removeLast().right
        }
    }
//    print(res)
    return res
}

preOrder(nodes[0])
preOrder1(nodes[0])


//中序遍历
func inOrder(_ root:TreeNode?) {
    guard root != nil else {
        return
    }
    inOrder(root?.left)
//    print(root!.val)
    inOrder(root?.right)
}

//func inOrder1(_ root:TreeNode?) -> [Int] {
//    var node = root
//    var stack:[TreeNode] = []
//    var res:[Int] = []
//    while !stack.isEmpty || node != nil{
//        if node != nil {
//            if node?.left != nil {
//                node = node?.left
//                stack.append(node!)
//            }else{
//                res.append(node!.val)
//            }
//        }else{
//
//            node = stack.removeLast()
//        }
//    }
//    return res
//
//}

//后序遍历
func postOrder(_ root:TreeNode?) {
    guard root != nil else {
        return
    }
    postOrder(root?.left)
    postOrder(root?.right)
//    print(root!.val)
}
//preOrder(nodes[0])


// 前序遍历 （非递归）
func p_preOrder(_ tree: TreeNode?) -> [Int] {
    guard let tree = tree else {
        return []
    }
    
    var res: [Int] = []
    var node: TreeNode? = tree
    var nodes: [TreeNode] = []
    while node != nil || !nodes.isEmpty {
        if node != nil {
            res.append(node!.val)
            nodes.append(node!)
            node = node?.left
        }
        else {
            node = nodes.popLast()!.right
        }
    }
    return res
}
print(p_preOrder(nodes[0]))
// 中序遍历 （非递归）
func p_midOrder(_ tree: TreeNode?) -> [Int] {
    guard let tree = tree else {
        return []
    }
    
    var res: [Int] = []
    var node: TreeNode? = tree
    var nodes: [TreeNode] = []
    while node != nil || !nodes.isEmpty {
        if node != nil {
            nodes.append(node!)
            node = node?.left
        }
        else {
            node = nodes.popLast()!
            res.append(node!.val)
            node = node?.right
        }
    }
    return res
}

func pre_order_2(_ tree:TreeNode?) -> [Int] {
    guard let tree = tree else {
        return []
    }
    
    var res: [Int] = []
    
    var nodes: [TreeNode] = [tree]
    
    while !nodes.isEmpty {
        let node = nodes.popLast()!
//        res.insert(node.val, at: 0)
        res.append(node.val)
        if let right = node.right {
            nodes.append(right)
        }
        if let left = node.left {
            nodes.append(left)
        }
    }
    
    return res
}
print(pre_order_2(nodes[0]))

// 后序遍历 （非递归）
func p_postOrder(_ tree: TreeNode?) -> [Int] {
    guard let tree = tree else {
        return []
    }
    
    var res: [Int] = []
    
    var nodes: [TreeNode] = [tree]
    
    while !nodes.isEmpty {
        let node = nodes.popLast()!
        res.insert(node.val, at: 0)
        if let left = node.left {
            nodes.append(left)
        }
        if let right = node.right {
            nodes.append(right)
        }
    }
    
    return res
}

//print(p_postOrder(nodes[0]))

//按层遍历
func p_levelOrder(_ tree: TreeNode?) -> [Int] {
    guard let tree = tree else {
        return []
    }
    var nextTree: [TreeNode] = [tree]
    var res: [Int] = []
    while !nextTree.isEmpty {
        let node = nextTree.remove(at: 0)
        res.append(node.val)
        if let leftTree = node.left {
            nextTree.append(leftTree)
        }
        if let rightTree = node.right {
            nextTree.append(rightTree)
        }
    }
    return res
}

//print(p_midOrder(nodes[0]))
