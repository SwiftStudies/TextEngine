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

import TiledKit
import TextEngine

extension TiledKit.Position  {
    var transform : TextEngine.Point {
        return (Int(x), Int(y))
    }
}

extension TiledKit.Size {
    var transform : TextEngine.Size {
        return (Int(width), Int(height))
    }
}

extension Double : ExpressibleAsTiledFloat  {
    public static func instance(bridging value: Double) -> Self {
        return Self(value)
    }
}

extension Character : ExpressibleAsTiledColor {
    public static func instance(bridging color: Color) -> Character {
        if color.alpha == 0 {
            return " "
        }
        let average = (color.red+color.green+color.blue)/3
        switch average {
        case 0..<15:
            return " "
        case 15..<200:
            return "▓"
        default:
            return "█"
        }
    }
}

extension Character : DeepCopyable {
    /// As character is  a value type, there's no need to do anything other than return self
    public func deepCopy() -> Character {
        return self
    }
    
    
}

extension Dot : EngineObject {
    public typealias EngineType = TKTextEngine
}

extension Ellipse : EngineObject {
    public typealias EngineType = TKTextEngine
}

extension Box : EngineObject {
    public typealias EngineType = TKTextEngine
}

extension Polygon : EngineObject {
    public typealias EngineType = TKTextEngine
}

extension Sprite : DeepCopyable, EngineObject {
    public typealias EngineType = TKTextEngine
    public func deepCopy() -> Self {
        return copy()
    }
}

extension Node : EngineLayerContainer, EngineObjectContainer {
    public typealias EngineType = TKTextEngine
    
    public func add(text: Node) {
        add(child: text)
    }
    
    public func add(ellipse: EngineType.EllipseObjectType) {
        add(child: ellipse)
    }
    
    public func add(polygon: EngineType.PolygonObjectType) {
        add(child: polygon)
    }
    
    public func add(polyline: EngineType.PolylineObjectType) {
        add(child: polyline)
    }
    
    public func add(rectangle: EngineType.RectangleObjectType) {
        add(child: rectangle)
    }
    
    public func add(layer: Node) {
        add(child: layer)
    }
    
    public func add(sprite: Sprite) {
        add(child: sprite)
    }
    
    public func add(point: EngineType.PointObjectType) {
        add(child: point)
    }
    

}

extension Character : EngineTexture {    
    public typealias EngineType = TKTextEngine

    public func newInstance() -> Character {
        return self
    }
}

extension Screen : EngineMap {
    
    public var cache: Bool {
        return true
    }
    
    public func newInstance() -> Self {
        return copy()
    }
    
    
}
