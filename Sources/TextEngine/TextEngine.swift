public typealias Point = (x:Int,y:Int)
public typealias Size = (width:Int,height:Int)
public typealias Rectangle = (origin:Point, size:Size)

public protocol ViewNode : AnyObject {
    var position : Point { get }
    var size     : Size { get }
    
    func render(to frameBuffer:FrameBuffer)
    
    func copy()->Self
}

public protocol ContainableNode : ViewNode {
    var parent   : ContainerNode? { get set }
}

public protocol ContainerNode : ViewNode {
    func add(child:ContainableNode)
    var  children : [ContainableNode] { get set}
}

public extension ContainerNode {

    var accumulatedSize : Size {
        var size : Size = (0,0)
        
        for child in children {
            size.width = max(size.width, child.position.x + child.size.width)
            size.height = max(size.height, child.position.y + child.size.height)
        }
        
        return size
    }
    
    func add(child:ContainableNode){
        children.append(child)
        child.parent = self
    }
    
    func renderChildren(to frameBuffer:FrameBuffer){
        for child in children {
            child.render(to: Context(offset: child.position, in: frameBuffer))
        }
    }
}


