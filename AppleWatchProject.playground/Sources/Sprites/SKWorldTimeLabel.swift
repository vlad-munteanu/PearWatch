
import Foundation
import UIKit
import SpriteKit

public class SKWorldTimeLabel: SKLabelNode {
    
    
    override init() {
        super.init()
        
        fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fontName = "HelveticaNeue"
        
        fontSize = 52.0
        
        text = DateTimeFormat.getTimeInNYC()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

