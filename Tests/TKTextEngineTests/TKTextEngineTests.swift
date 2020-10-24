import XCTest
import TextEngine
import TiledKit
import TKTextEngine

final class TKTextEngineTests: XCTestCase {
    
    func testLoading(){
        let testsProject = Project(using: Bundle.module)
        
        do {
            let map = try testsProject.retrieve(TKTextEngine.self, mapNamed: "Example")
            
            let display = Display(map.size, pixelsPerCharacter: (6,12))
            
            map.render(to: display)
            
            print(display)
        } catch {
            return XCTFail("Unexpected error: \(error)")
        }
    }
    
    static var allTests = [
        ("testLoading", testLoading),
    ]
}
