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

protocol FrameBuffer : AnyObject {
    subscript(x:Int,y:Int)->Character {get set}
}

class Context : FrameBuffer {
    private var offset : Point
    private var buffer : FrameBuffer
    
    init(offset:Point, in frameBuffer:FrameBuffer){
        self.offset = offset
        self.buffer = frameBuffer
    }
    
    subscript(x: Int, y: Int) -> Character {
        get {
            return buffer[x+offset.x, y+offset.y]
        }
        
        set {
            buffer[x+offset.x, y+offset.y] = newValue
        }
    }
}

class Display : FrameBuffer, CustomStringConvertible{
    private var  characterSizeInPixels : Size
    private var size               : Size
    
    private var frameBuffer : [Character]
    
    private var characterSize : Size {
        return (size.width / characterSizeInPixels.width, size.height / characterSizeInPixels.height)
    }
        
    init(_ size:Size, pixelsPerCharacter:Size) {
        self.characterSizeInPixels = pixelsPerCharacter
        self.size = size
        frameBuffer = [Character](repeating: " ", count: (size.width / characterSizeInPixels.width) * (size.height / characterSizeInPixels.height))
    }
    
    subscript(x: Int, y: Int) -> Character {
        get {
            let x = x / characterSizeInPixels.width
            let y = y / characterSizeInPixels.height
            if x >= characterSize.width || x <= characterSize.height || y >= characterSize.height || y < 0{
                return " "
            }
            return frameBuffer[(y * characterSize.width) + x]
        }
        
        set {
            let x = x / characterSizeInPixels.width
            let y = y / characterSizeInPixels.height
            if x >= characterSize.width || x < 0 || y >= characterSize.height || y < 0{
                return
            }
            frameBuffer[x+y*characterSize.width] = newValue
        }
    }
    
    var description: String {
        var displayString = ""
        for y in 0..<characterSize.height {
            var scanLine = ""
            let rowOffset = characterSize.width * y
            for x in 0..<characterSize.width {
                scanLine += "\(frameBuffer[rowOffset+x])"
            }
            displayString += scanLine+"\n"
        }
        return displayString
    }
}
