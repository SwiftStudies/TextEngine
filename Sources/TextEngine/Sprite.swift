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

class Sprite : ContainableNode {
    var position: Point
    var size: Size
    var parent: ContainerNode? = nil
    let character : Character
    
    init(at position:Point, with size:Size, rendering character:Character){
        self.position = position
        self.size = size
        self.character = character
    }
    
    func render(to frameBuffer: FrameBuffer) {
        for x in 0..<size.width {
            for y in 0..<size.height {
                frameBuffer[x,y] = character
            }
        }
    }
    
}
