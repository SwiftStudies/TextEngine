import XCTest
import TextEngine
import TiledKit
import TKTextEngine
import TiledResources

final class TKTextEngineTests: XCTestCase {
    
    func testLoading(){
        
        do {
            let map = try TiledResources.GenericTiledProject.Maps.oneOfEverything.load(for: TKTextEngine.self)
            
            let display = Display(map.size, pixelsPerCharacter: (6,12))
            
            map.render(to: display)
            
            let expected = """
            AACCCC               CCCAA
            CC|--|     AAAA      ***CC
            CC|--|     AAAA      ****C
                                      
                                      
                                      
            S            O            
                                      
                                      
                                      
            CCCXX                  XCC
            CCXXXX               XXXCC
            AACCCC               XCCAA

            """
            XCTAssertEqual(expected, display.description)
        } catch {
            return XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testIsometric(){
        do {

            let map = try TiledResources.GenericTiledProject.Maps.isometric.load(for: TKTextEngine.self)
            
            let display = Display(map.size, pixelsPerCharacter: (12,24))
            
            map.render(to: display)

            let expected = """
                                  IIIIIIIII                      
                              IIIIIIIIIIIIIIIII                  
                          IIIIIIIIIIIIIIIIIIIIIIIII              
                      IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII          
                  IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII      
              IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII  
            IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
             IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII 
                 IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII     
                     IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII         
                         IIIIIIIIIIIIIIIIIIIIIIIIIII             
                             IIIIIIIIIIIIIIIIIII                 
                                 IIIIIIIIIII                     

            """

            XCTAssertEqual(expected, display.description)
            
            print(display.description)
        } catch {
            return XCTFail("Unexpected error: \(error)")
        }
    }
    
    static var allTests = [
        ("testLoading", testLoading),
    ]
}
