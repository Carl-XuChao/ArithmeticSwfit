//
//  LinkList.swift
//  TreeNode
//
//  Created by Carl Xu on 2021/11/28.
//

import Foundation


class Node {
    
    var data: Any?
    
    var next: Node?
    
    init(_ value: Any?) {
        self.data = value
    }
}

typealias LinkList = Node



/// 单链表新增元素
/// - Parameters:
///   - l: 链表头结点
///   - index: 下标
/// - Returns: 值
func getElementValue(_ l: LinkList?, index: Int) -> Any? {
    var j = 0
    var p = l
    while (p != nil) {
        if (j == index) {
            return p?.data
        }
        j += 1
        p = p?.next
    }
    return nil
}

func getElement(_ l: LinkList?, index: Int) -> Node? {
    var j = 0
    var p = l
    while (p != nil) {
        if (j == index) {
            return p
        }
        j += 1
        p = p?.next
    }
    return nil
}



func insertElement(_ l: LinkList?, index: Int, s: Node) -> Bool {
    if let p = getElement(l, index: index) {
        s.next =  p.next
        p.next = s
        return true
    }
    return false
}


func deleteElement(_ l: LinkList?, index: Int) -> Bool {
    if let p = getElement(l, index: index - 1) {
        p.next = p.next?.next
        // 释放p.next = nil, 考虑到类是引用类型的， 不能这么搞
    }
    return false
}



func clearLinkList(_ l: inout LinkList?) {
    var p, q: LinkList?
    p = l
    while(p != nil) {
        print("clearLinkList: --\(String(describing: p?.data))")
        // todo: 深拷贝
        q = p?.next
        // p = nil
        p = q
    }
    // 头结点指针为空！！！
    l = nil
}


/// 头插法创建链表
/// - Parameter n: <#n description#>
/// - Returns: <#description#>
func creatListHead(n: Int) ->LinkList {
    let head = Node(nil)
    head.next = nil
    for i in 0..<n {
        let p = Node(i)
        p.next = head.next
        head.next = p
    }
    return head
}



/// 尾插法创建链表
/// - Parameter n: <#n description#>
/// - Returns: <#description#>
func creatListTail(n: Int) -> LinkList {
    var tail = Node(nil)
    for i in 0..<n {
        let p = Node(i)
        tail.next = p
        tail = p
    }
    tail.next = nil
    return tail
}





func testAddElement() {
    var head: LinkList? = Node(0)
    let a = Node(1)
    let b = Node(2)
    let c = Node(3)
    let d = Node(4)
    let e = Node(5)
    let f = Node(6)
    head?.next = a
    a.next = b
    b.next = c
    c.next = d
    d.next = e
    e.next = f
    f.next = nil
    
    let firstElement = getElementValue(head, index: 0)
    let secondElement = getElementValue(head, index: 2)
    print(firstElement)
    print(secondElement)
    _ = insertElement(head, index: 3, s: Node(9))
    let fourElement = getElementValue(head, index: 4)
    print(fourElement)
    _ = deleteElement(head, index: 4)
    
    clearLinkList(&head)
    
    var node: Node? = head
    while(node != nil) {
        print(node?.data ?? "-")
        node = node?.next
    }
    
    
}
