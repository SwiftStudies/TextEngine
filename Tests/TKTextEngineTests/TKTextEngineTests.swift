import XCTest
import TextEngine
import TiledKit
import TKTextEngine

#warning("Temporary Solution until https://bugs.swift.org/browse/SR-13714 is fixed and I can reference TiledResources from here")
enum Projects {
    case genericTiled
    
    var url : URL {
        let tiledResourcesURL = URL(fileURLWithPath: #filePath).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent().appendingPathComponent(".build/checkouts/TiledResources/Sources/TiledResources/Generic Tiled Project/Generic Tiled Project.tiled-project")
        return tiledResourcesURL
//        switch self {
//        case .genericTiled:
//            return URL(fileURLWithPath: <#T##String#>)
//        }
    }
}

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
    
    func testIsometric(){
        print(Projects.genericTiled.url.path)
        do {
            let project = Project(at: Projects.genericTiled.url)

            let map = try project.retrieve(TKTextEngine.self, mapNamed: "Isometric", in: "Maps")
            
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
