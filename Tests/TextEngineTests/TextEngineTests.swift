import XCTest
@testable import TextEngine

final class TextEngineTests: XCTestCase {
    
    func testRenderingHierarchy(){
        let screen = Screen(size: (160,160), background: " ")
        
        screen.add(child: Sprite(at: (16,16), with: (8,8), rendering: "@"))
        
        let frameBuffer = Display((160,160), pixelsPerCharacter: (8,16))
        
        screen.render(to: frameBuffer)
        
        print(frameBuffer)
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
        ("testRenderingHierarchy", testRenderingHierarchy),
    ]
}
