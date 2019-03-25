//
//  BinarySearchTree.swift
//  leetCodePractice
//
//  Created by 戴运鹏 on 2019/3/25.
//  Copyright © 2019 戴运鹏. All rights reserved.
//




//二叉查找树（二叉搜索树）
import Foundation

/*
 二叉查找树要求树中的任意一个节点，其左子树中的每个节点的值，都要小于这个节点的值，而右子节点的值都要大于这个节点的值。
 */

/*
        13
    5           19
 3   9       17         23
 
 
*/

//整体看待一颗树，不要看到节点，要看到树；从根节点看，垂直方向一分为二，左边的是左树，要小于根;右边的是右树，要大于根节点。再把每个节点看成根节点，垂直一分为二，左边小，右边大。


/// 创建二叉查找树
///
/// - Returns: 二叉查找树的根节点
func createBinarySearchTree() -> TreeNode?{
    let values = [13,5,19,3,9,17,23]
    var nodes:[TreeNode] = []
    values.forEach {
        nodes.append(TreeNode($0))
    }
    var idx = 0
    while (idx + 1) * 2 <= values.count - 1 {//因为是完全二叉树，所以以这种方法将其全部链起来
        let node = nodes[idx]
        let left = nodes[(idx + 1) * 2 - 1]
        let right = nodes[(idx + 1) * 2]
        node.left = left
        node.right = right
        idx += 1
    }
    return nodes[0]
}


/// 在二叉查找树中找某一个值
///
/// - Parameters:
///   - value: 要找的值
///   - binarySearchTree: 给定的二叉查找树
/// - Returns: 节点
func searchValue(value:Int, in binarySearchTree:TreeNode?) -> TreeNode? {
    guard binarySearchTree != nil else {
        return nil
    }
    var tree = binarySearchTree
    if tree!.val == value {//等于根节点
        return tree
    }
    var valueNode:TreeNode? = nil
    while tree != nil {
        if value == tree!.val {
            valueNode = tree
            break
        }else if value < tree!.val {
            tree = tree?.left
        }else{
            tree = tree?.right
        }
    }
    return valueNode
}

func insertValue(value:Int,in binarySearchTree:TreeNode?) -> TreeNode? {
    guard binarySearchTree != nil else {
        return  TreeNode(value)
    }
    let insertNode = TreeNode(value)
    var tree = binarySearchTree
    while tree != nil {//不考虑相等的情况
        if insertNode.val > tree!.val{
            if tree?.right == nil {
                tree?.right = insertNode
                return binarySearchTree
            }
            tree = tree!.right
        }else{
            if tree?.left == nil {
                tree?.left = insertNode
                return binarySearchTree
            }
            tree = tree!.left
        }
    }
    return binarySearchTree;
}
