typealias Point = (x:Int,y:Int)
typealias Size = (width:Int,height:Int)
typealias Rectangle = (origin:Point, size:Size)

protocol ViewNode : AnyObject {
    var position : Point { get }
    var size     : Size { get }
    
    func render(to frameBuffer:FrameBuffer)
}

protocol ContainableNode : ViewNode {
    var parent   : ContainerNode? { get set }
}

protocol ContainerNode : ViewNode {
    func add(child:ContainableNode)
    var children : [ViewNode] { get set}
}

extension ContainerNode {

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


