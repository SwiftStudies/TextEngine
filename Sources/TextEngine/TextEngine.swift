typealias Point = (x:Int,y:Int)
typealias Size = (width:Int,height:Int)
typealias Rectangle = (origin:Point, size:Size)

protocol ViewNode : AnyObject {
    var position : Point { get }
    var size     : Size { get }
    
    func render(to frameBuffer:FrameBuffer)
    
    func copy()->Self
}

protocol ContainableNode : ViewNode {
    var parent   : ContainerNode? { get set }
}

protocol ContainerNode : ViewNode {
    func add(child:ContainableNode)
    var  children : [ContainableNode] { get set}
}

extension ContainerNode {

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


