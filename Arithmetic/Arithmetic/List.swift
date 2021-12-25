//
//  List.swift
//  TreeNode
//
//  Created by Carl Xu on 2021/11/28.
//

import Foundation

/// 线性表

let maxSize = 20

struct SqList {
    
    var data = NSMutableArray(capacity: maxSize)
    
    var length: Int = 0
    
    
    func getElementAtIndex(_ index: Int) -> Any? {
        // 空数组， 容量越界， 数组下表越界
        if (length == 0 || index > maxSize - 1 || index > length - 1) {
            return nil
        }
        return data[index]
    }
    
    mutating func insertElementAtIndex(_ index: Int, _ value: Any) -> Bool {
        // 数组下表越界
        if (index >= length - 1) {
            return false
        }
        // 容量越界
        if (length + 1 > maxSize) {
            return false
        }
        var position = index
        while(position < length - 1) {
            data[position+1] = data[position];
            position += 1
        }
        data[index] = value
        length += 1
        return true
    }
    
    
    mutating func deleteElementAtIndex(_ index: Int) -> Bool {
        // 数组下表越界
        if (index > length - 1) {
            return false
        }
        var position = index
        while(position < length - 1) {
            data[position] = data[position+1];
            position += 1
        }
        length -= 1
        return true
    }
    
    
    
    
}
