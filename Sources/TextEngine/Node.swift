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

class Node : ContainableNode, ContainerNode {
    var parent: ContainerNode?
    
    var children = [ContainableNode]()
    
    var position: Point = (0,0)
    
    var size: Size {
        return accumulatedSize
    }
    
    func render(to frameBuffer: FrameBuffer) {
        renderChildren(to: frameBuffer)
    }
    
    func copy() -> Self {
        let copy = Node()
        
        copy.position = position
        for child in children {
            add(child: child.copy())
        }
        
        return copy as! Self
    }
}

