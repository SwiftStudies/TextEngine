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

public class Screen : Node {
    private let _size : Size
    public override var size : Size {
        get {
            return _size
        }
        set {
            
        }
    }
    
    var background : Character
    
    public init(size:Size, background:Character = " "){
        _size = size
        self.background = background
        super.init(at: (0,0))
    }
    
    public override func render(to frameBuffer: FrameBuffer) {
        for x in 0..<size.width {
            for y in 0..<size.height {
                frameBuffer[x,y] = background
            }
        }
        super.render(to: frameBuffer)
    }

    public override func copy() -> Self {
        let copy = Screen(size: size, background: background)
        
        for child in children {
            add(child: child.copy())
        }
        
        return copy as! Self
    }
}
