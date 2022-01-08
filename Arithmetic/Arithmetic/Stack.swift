//
//  Stack.swift
//  Arithmetic
//
//  Created by Carl Xu on 2021/12/25.
//

import Foundation
import UIKit

/// 栈抽象数据类型
protocol StackDelegate {
    
    var data: Any { get set }
    
    func initStack() -> Void
    
    func destoryStack() -> Void
    
    func clearStack() -> Void
    
    func getTop() -> Any
    
    func push() -> Bool
    
    func pop() -> Any
    
    var length: Int {get}
    
}


