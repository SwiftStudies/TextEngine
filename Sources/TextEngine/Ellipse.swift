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

class Ellipse : ContainableNode {
    var parent: ContainerNode? = nil
    var position: Point
    var size: Size
    
    init(at position:Point, of size:Size){
        self.position = position
        self.size = size
    }
    
    func render(to frameBuffer: FrameBuffer) {
        let center = (x:Double(size.width / 2), y:Double(size.height / 2))
        let size = (width:Double(self.size.width), height:Double(self.size.height))
        
        for theta : Double in stride(from: 0.0, to: Double.pi * 2, by: Double.pi / 180) {
            let x = center.x + ((size.width/2) * cos(theta))
            let y = center.y - ((size.height/2) * sin(theta))

            frameBuffer[Int(x), Int(y)] = "*"
        }
        
    }
    
    
}
