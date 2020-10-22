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


class Dot : ContainableNode {
    var parent: ContainerNode? = nil
    var position: Point
    var character : Character
    
    var size: Size {
        return (1,1)
    }
    
    init(at position:Point, drawAs character: Character = "O"){
        self.position = position
        self.character = character
    }
    
    func render(to frameBuffer: FrameBuffer) {
        frameBuffer[0, 0] = character
    }
    
    func copy() -> Self {
        let copy = Dot(at: position, drawAs: character)
        
        return copy as! Self
    }
}

