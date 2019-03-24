
import Foundation
import UIKit
import SpriteKit

public class SKSunLabel: SKLabelNode {
    
   var sunRising = false
    
    init(rising: Bool) {
        super.init()
        sunRising = DateTimeFormat.isSunRising()
        fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fontName = "HelveticaNeue"
        
        fontSize = 45.0
        
       // text = DateTimeFormat.getSunTime()
        text = DateTimeFormat.sunrise()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

