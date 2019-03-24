
import Foundation
import UIKit
import SpriteKit

public class SKCountDownLabel: SKLabelNode {
    
    override init() {
        super.init()
        fontColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        fontName = "HelveticaNeue"
        fontSize = 65.0
        
        text = "Days Left: \(CountdownFormat.daysUntilWWDC())"

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

