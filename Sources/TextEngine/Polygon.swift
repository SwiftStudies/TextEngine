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

public class Polygon : BaseNode {
    var character : Character
    var path : [Point]
    public override var size: Size {
        get {
            var size : Size = (0,0)
            for point in path {
                size.width = max(size.width,point.x)
                size.height = max(size.height, point.y)
            }
            return size
        }
        set {
            
        }
    }
    
    public init(at position:Point, path:[Point], closed : Bool,  drawWith character:Character = "X"){
        self.character = character
        self.path = path
        if closed {
            self.path.append(path[0])
        }
        super.init()
        self.position = position
    }
    
    private func line(from p0:Point, to p1:Point, in frameBuffer:FrameBuffer){
        if (p0.x > p1.x){
            return line(from: p1,to: p0, in: frameBuffer)
        }
        let dx = abs(p1.x - p0.x)
        let dy = abs(p1.y - p0.y)
     
        var x = p0.x
        var y = p0.y
        var p = 2 * dy-dx

        while x<p1.x {
            if p >= 0 {
                frameBuffer[x,y] = character
                y += p1.y >= p0.y ? 1 : -1
                p = p + 2*dy - 2*dx
            } else {
                frameBuffer[x,y] = character
                p = p + 2*dy
            }
            x += 1
        }
    }
    
    public override func render(to frameBuffer: FrameBuffer) {
        for p in 1..<path.count {
            let p0 = path[p-1]
            let p1 = path[p]
            
            line(from: p0, to: p1, in: frameBuffer)
        }
    }
    
    public override func copy() -> Self {
        let copy = Polygon(at: position, path: path, closed: false, drawWith: character)
        
        return copy as! Self
    }
}
