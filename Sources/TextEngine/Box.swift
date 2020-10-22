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

class Box : ContainableNode {
    var parent: ContainerNode? = nil
    var position: Point
    var size: Size
    
    init(at position:Point, of size:Size){
        self.position = position
        self.size = size
    }
    
    func render(to frameBuffer: FrameBuffer) {
        for x in 0..<size.width {
            frameBuffer[x,0] = "-"
            frameBuffer[x,size.height-1] = "-"
        }
        for y in 0..<size.height {
            frameBuffer[0,y] = "|"
            frameBuffer[size.width-1,y] = "|"
        }
    }
    
    func copy() -> Self {
        let copy = Box(at: position, of: size)
        
        return copy as! Self
    }
}
