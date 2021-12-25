//
//  Tree.swift
//  TreeNode
//
//  Created by Carl Xu on 2021/11/27.
//

import Foundation
import UIKit


/// 树结点类
class TreeNode {
    
    var data: Int?
    
    var leftNode: TreeNode?
    
    var rightNode: TreeNode?
    
}


/// 树的数据结构
protocol Tree {
    
    func initTree(t: Tree)
    
    func destroyTree(t: Tree)
    
    func createTree<T>(t: Tree, rule: T)
    
    func clearTree(t: Tree)
    
    func isEmpty() -> Bool
    
    func treeDepth() -> Int
    
    func root(t: Tree) -> TreeNode
    
    func value(t: Tree, node: TreeNode)
    
    func assign(t: Tree, node: TreeNode)
    
    func parent(t: Tree, node: TreeNode) -> TreeNode?
    
    func leftChild(t: Tree, node: TreeNode) -> TreeNode?
    
    func rightSlibing(t: Tree, node: TreeNode) -> TreeNode?
    
    func insertChild(t: Tree, p: TreeNode, i: Int, c: TreeNode)
    
    func deleteChild(t: Tree, p: TreeNode, i: Int)
    
}



/// ------------------------- 双亲表示法 -------------------------

/// 双亲表示法结点
struct PTNode<T> {
    
    /// 结点数据
    var data: T
    
    
    /// 双亲位置下表, 根结点为-1
    var parentIndex: Int = -1
    
    
    /// 长子阈： 最左边孩子下表， 没有设置 -1
    var leftChildIndex: Int? = -1
    
    
    /// 右子
    var rightChildIndex: Int? = -1
    
}


/// 双亲表示法树 ： 数组按层级从上到下从左到右顺序存储， 一个数组每个元素根据需要是否记录双亲，左儿子， 右儿子的下表， 方便进行查找
struct PTree {
    
    /// 结点数组
    var nodes: [PTNode<Any>]
    
    /// 根的位置
    var rootNodeIndex: Int
    
    /// 结点数量
    var totalNodeNumber: Int
}



/// ------------------------- 孩子表示法 -------------------------

/// 孩子表示法表头结构
struct CTBox {
    
    /// 表头数组下表
    var data: Int
    
    /// 孩子链表的头指针
    var firstChild: CTNode?
    
    /// 孩子结点
    class CTNode {
        
        
        /// 当前结点子表头数组中的下表
        var child: Int?
        
        
        /// 当前结点的下个孩子结点的指针
        var next: CTNode?
        
    }

}


/// 孩子表示法树
struct CTree {
    
    /// 表头结点数组
    var nodes: [CTBox]
    
    /// 根的位置
    var rootIndex: Int
    
    /// 结点数
    var nodeNumber: Int
}



/// ------------------------- 双亲孩子表示法 -------------------------

/// 双亲孩子表示法表头结构
struct PCTBox {
    
    /// 表头数组下表
    var data: Int
    
    /// 双亲位置下表, 根结点为-1
    var parentIndex: Int
    
    /// 孩子链表的头指针
    var firstChild: CTNode?
    
    /// 孩子结点
    class CTNode {
        
        
        /// 当前结点子表头数组中的下表
        var child: Int?
        
        
        /// 当前结点的下个孩子结点的指针
        var next: CTNode?
        
    }

}

/// 双亲孩子表示法树
struct PCTree {
    
    /// 表头结点数组
    var nodes: [PCTBox]
    
    /// 根的位置
    var rootIndex: Int
    
    /// 结点数
    var nodeNumber: Int
}




/// ------------------------- 孩子兄弟表示法 -------------------------
/// 这个表示法的最大好处就是把一颗复杂的树变成了一颗二叉树
/// 孩子兄弟表示法
class CSNode {
    
    var data: Int = 0
    
    var firstChild: CSNode?
    
    var rightChild: CSNode?
    
    var parentNode: CSNode?
    
}

class CSTree  {
    /// 头指针
    var head: CSNode?
}




/// 链式存储结构
class BiTNode {
    
    /// 数据
    var data: Any?
    
    /// 左结点指针
    var leftChild: BiTNode?
    
    /// 右结点指针
    var rightChild: BiTNode?
    
    
    /// 双亲指针 ------------ 三叉链表
    var parent: BiTNode?
    
    init(_ value: Any?) {
        self.data = value
    }
    
    
}

typealias BiTree = BiTNode


/// ------------------------- 二叉树的遍历 -------------------------


/// 前序遍历
/// - Parameter t: 树
func preOrderTraverse(t: BiTree?) {
    guard let tree = t else {
        return
    }
    // 显示结点数据
    print(tree.data ?? "")
    // 遍历左子树
    preOrderTraverse(t: tree.leftChild)
    // 遍历右子树
    preOrderTraverse(t: tree.rightChild)
}



/// 中序遍历
/// - Parameter t: 树
func inOrderTraverse(t: BiTree?) {
    guard let tree = t else {
        return
    }
    // 遍历左子树
    inOrderTraverse(t: tree.leftChild)
    // 显示结点数据
    print(tree.data ?? "")
    // 遍历右子树
    inOrderTraverse(t: tree.rightChild)
}



/// 后序遍历
/// - Parameter t: 树
func postOrderTraverse(t: BiTree?) {
    guard let tree = t else {
        return
    }
    // 遍历左子树
    postOrderTraverse(t: tree.leftChild)
    // 遍历右子树
    postOrderTraverse(t: tree.rightChild)
    // 显示结点数据
    print(tree.data ?? "")
}





/// ------------------------- 创建二叉树 -------------------------


/// 前序遍历创建二叉树
func preCreateTree()  {
    
    let array = ["A", "B", "D", "G", "#", "#", "H", "#", "#", "#", "C", "E", "#", "I", "#", "#", "F"]
    var index = 0
    var root: BiTree? = BiTree(nil)
    

    func creatBiTree(_ tree: inout BiTree?) {
        if (index > array.count - 1) {
            return
        }
        let value = array[index]
        index += 1
        if (value  == "#") {
            tree = nil
        } else {
            tree = BiTree(value)
            creatBiTree(&tree!.leftChild)
            creatBiTree(&tree!.rightChild)
        }
            
    }
    
    // 创建树
    creatBiTree(&root)
    
    debugPrint("---------前序遍历--------------")
    // 前序遍历
    preOrderTraverse(t: root)
    debugPrint("----------中序遍历-------------")
    inOrderTraverse(t: root)
    debugPrint("----------后序遍历-------------")
    postOrderTraverse(t: root)
    
    
}



/// 线索二叉树
class BiThrNode {
    
    var data: Any?
    
    var leftChild: BiThrNode?
    
    var rightChild: BiThrNode?
    
    /// 0 - 左孩子， 1-前驱结点
    var leftTag: Int = 0
    
    /// 0 - 右孩子， 1-后继结点
    var rightTag: Int = 0
    
}


var pre = BiThrNode()

/// 中序遍历线索化
/// - Parameter tree: <#tree description#>
func inThreading(_ tree: BiThrNode?) {
    if let t = tree {
        inThreading(t.leftChild)
        if (t.leftChild == nil) {
            t.leftTag = 1
            t.leftChild = pre
        }
        if (t.rightChild == nil) {
            pre.rightTag = 1
            pre.rightChild = t
        }
        pre = t
        inThreading(t.rightChild)
    }
}
