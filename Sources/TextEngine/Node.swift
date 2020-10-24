//    Copyright 2020 Swift Studies
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

import Foundation

public class BaseNode : ContainableNode {
    public var parent: ContainerNode? = nil
    public var position: Point = (0,0)
    public var size: Size = (0,0)
    
    
    
    public func render(to frameBuffer: FrameBuffer) {
        fatalError("Implement this!")
    }
    
    public func copy() -> Self {
        fatalError("Implement this!")
    }
    
    
}

public class Node : BaseNode, ContainerNode {
    public var children = [ContainableNode]()
    
    public init(at position:Point){
        super.init()
        self.position = position
    }
    
    public override var size: Size {
        get {
            return accumulatedSize
        }
        set {
            
        }
    }
    
    public override func render(to frameBuffer: FrameBuffer) {
        renderChildren(to: frameBuffer)
    }
    
    public override func copy() -> Self {
        let copy = Node(at: position)

        for child in children {
            add(child: child.copy())
        }
        
        return copy as! Self
    }
}

