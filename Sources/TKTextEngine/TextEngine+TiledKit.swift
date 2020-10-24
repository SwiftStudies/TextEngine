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
import Foundation

public struct TKTextEngine : Engine {
    public typealias MapType = Screen
    public typealias TextureType = Character
    public typealias SpriteType = Sprite
    public typealias TileLayerType = Node
    public typealias GroupLayerType = Node
    public typealias ObjectLayerType = Node
    public typealias PointObjectType = Dot
    public typealias RectangleObjectType = Box
    public typealias EllipseObjectType = Ellipse
    public typealias TextObjectType = Node
    public typealias PolylineObjectType = TextEngine.Polygon
    public typealias PolygonObjectType = TextEngine.Polygon
    public typealias FloatType = Double
    public typealias ColorType = Character

    
    //
    // Textures
    //
    public static func load<LoaderType>(textureFrom url: URL, by loader: LoaderType) throws -> Character where LoaderType : EngineImageLoader {
        return url.lastPathComponent.first!
    }
    
    public static func make(texture: Character, with bounds: PixelBounds?, and properties: Properties, in project: Project) throws -> Character {
        return texture
    }

    //
    // Maps
    //
    public static func make(mapFor tiledMap: Map) throws -> Screen {
        return Screen(size: (tiledMap.pixelSize.width, tiledMap.pixelSize.height))
    }
    
    public static func process(engineMap specializedMap: Screen, for tiledMap: Map, in project: Project) throws -> Screen {
        return specializedMap
    }
    
    //
    // Tile Sets
    //
    
    public static func make(spriteFor tile: Tile, in tileset: TileSet, with texture: Character, from project: Project) throws -> Sprite {
        return Sprite(at: (0,0), with: (tileset.tileSize.width, tileset.tileSize.height), rendering: texture)
    }
    
    public static func process(_ sprite: Sprite, from tile: Tile, in tileset: TileSet, with setSprites: [UInt32 : Sprite], for map: Map, from project: Project) throws -> Sprite {
        return sprite
    }
    
    //
    // Layers
    //
    public static func make(spriteFrom texture: Character, for layer: LayerProtocol, in map: Map, from project: Project) throws -> Sprite? {
        #warning("Need to actually represent textures that have a size")
        let position = layer.position.transform
        let size : TextEngine.Size = (1,1)
        return Sprite(at: position, with: size, rendering: "S")
    }
    
    public static func make(objectContainerFrom layer: LayerProtocol, in map: Map, from project: Project) throws -> Node? {
        return Node(at: layer.position.transform)
    }
    
    public static func make(groupFrom layer: LayerProtocol, in map: Map, from project: Project) throws -> Node? {
        return Node(at: layer.position.transform)
    }
    
    public static func make(tileLayer tileGrid: TileGrid, for layer: LayerProtocol, with sprites: MapTiles<TKTextEngine>, in map: Map, from project: Project) throws -> Node? {
        #warning("Needs to be implemented")
        return Node(at: layer.position.transform)
    }

    
    //
    // Objects
    //
    
    public static func make(pointFor object: ObjectProtocol, in map: Map, from project: Project) throws -> Dot {
        return Dot(at:object.position.transform)
    }
    
    public static func make(rectangleOf size: TiledKit.Size, at angle: Double, for object: ObjectProtocol, in map: Map, from project: Project) throws -> Box {
        return Box(at: object.position.transform, of: size.transform)
    }
    
    public static func make(ellipseOf size: TiledKit.Size, at angle: Double, for object: ObjectProtocol, in map: Map, from project: Project) throws -> Ellipse {
        return Ellipse(at: object.position.transform, of: size.transform)
    }
    
    public static func make(polylineWith path: Path, at angle: Double, for object: ObjectProtocol, in map: Map, from project: Project) throws -> TextEngine.Polygon {
        return TextEngine.Polygon(at: object.position.transform, path: path.compactMap({$0.transform}), closed: false)
    }
    
    public static func make(polygonWith path: Path, at angle: Double, for object: ObjectProtocol, in map: Map, from project: Project) throws -> TextEngine.Polygon {
        return TextEngine.Polygon(at: object.position.transform, path: path.compactMap({$0.transform}), closed: true)
    }
    
    public static func make(textWith string: String, of size: TiledKit.Size, at angle: Double, with style: TextStyle, for object: ObjectProtocol, in map: Map, from project: Project) throws -> Node {
        return Node(at: object.position.transform)
    }
    
    public static func make(spriteWith tile: Sprite, of size: TiledKit.Size, at angle: Double, for object: ObjectProtocol, in map: Map, from project: Project) throws -> Sprite {
        let copy = tile.deepCopy()
        copy.position = object.position.transform
        copy.size = size.transform
        return copy
    }
    
    //
    // Super Specialization
    //
    public static var objectTypes = ObjectTypes()
    
    public static func registerProducers() {
        
    }
}
