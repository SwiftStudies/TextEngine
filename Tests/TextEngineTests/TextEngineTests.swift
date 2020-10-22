import XCTest
@testable import TextEngine

final class TextEngineTests: XCTestCase {
    
    func testRenderingHierarchy(){
        let screen = Screen(size: (160,160), background: " ")
        
        let ellipse = Ellipse(at: (-20,-20), of: (40,40))
        
        let node = Node()
        node.position = (80,80)
        node.add(child: ellipse)

        screen.add(child: Box(at: (0,0), of: screen.size))
        screen.add(child: node)
        
        let frameBuffer = Display((160,160), pixelsPerCharacter: (8,16))
        
        screen.render(to: frameBuffer)
        
        let expected = """
        |------------------|
        |                  |
        |                  |
        |       ****       |
        |      **  **      |
        |      **  **      |
        |       ****       |
        |                  |
        |                  |
        |------------------|

        """
        
        XCTAssertEqual(frameBuffer.description, expected)
        print(frameBuffer)
    }
    
    func testRenderingElements(){
        let screen = Screen(size: (160,160), background: " ")
        
        screen.add(child: Box(at: (0,0), of: screen.size))
        screen.add(child: Sprite(at: (72,72), with: (16,16), rendering: "@"))
        screen.add(child: Ellipse(at: (0,0), of: screen.size))
        
        screen.add(child: Dot(at:(0,0)))
        screen.add(child: Dot(at:(0,159)))
        screen.add(child: Dot(at:(159,0)))
        screen.add(child: Dot(at:(159,159)))
        
        screen.add(child: Polygon(at:(0,0), path: [(79,0),(159,79),(79,159),(0,79)], closed: true))

        screen.add(child: Polygon(at:(0,0), path: [(0,159),(159,0)], closed: false, drawWith: "/"))

        
        let frameBuffer = Display((160,160), pixelsPerCharacter: (8,16))
        
        screen.render(to: frameBuffer)
        
        let expected = """
        O---****XXXX****--//
        | **  XX   XXX  // |
        **  XX       X//  **
        * XX        //  XX *
        XX       @//      XX
        XXX     //@      XXX
        * XXX //       XXX *
        **  //X      XXX  **
        | //  XXX  XXX  ** |
        //--****XXXX****---O

        """
        
        XCTAssertEqual(frameBuffer.description, expected)
    }
    
    func testScreen(){
        let screen = Screen(size: (160,160), background: "-")
        let frameBuffer = Display((160,160), pixelsPerCharacter: (8,16))
        
        screen.render(to: frameBuffer)
        
        let expected = """
        --------------------
        --------------------
        --------------------
        --------------------
        --------------------
        --------------------
        --------------------
        --------------------
        --------------------
        --------------------

        """
        
        XCTAssertEqual(frameBuffer.description, expected)
    }
    func testDisplay() {
        let display = Display((160,160), pixelsPerCharacter: (8,16))
                
        for y in 0..<160{
            display[0,y] = "X"
            display[159,y] = "X"
        }
        
        for x in 0..<160{
            display[x,0] = "X"
            display[x,159] = "X"
        }
        
        let expected = """
        XXXXXXXXXXXXXXXXXXXX
        X                  X
        X                  X
        X                  X
        X                  X
        X                  X
        X                  X
        X                  X
        X                  X
        XXXXXXXXXXXXXXXXXXXX

        """
        
        XCTAssertEqual(display.description, expected)
    }

    static var allTests = [
        ("testDisplay", testDisplay),
        ("testScreen", testScreen),
        ("testRenderingElements", testRenderingElements),
        ("testRenderingHierarchy", testRenderingHierarchy),
    ]
}
