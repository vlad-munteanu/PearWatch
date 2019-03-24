
import Foundation
import UIKit
import SpriteKit

public class SKDateLabel: SKLabelNode {
    
    
    init(top: Bool) {
        super.init()
        
        fontName = "HelveticaNeue"
        
        if top == true {
            fontColor = #colorLiteral(red: 0.9990773797, green: 0.2295021415, blue: 0.1888831556, alpha: 1)
            text = DateTimeFormat.getDayOfWeek()
            fontSize = 35.0
        } else {
            fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            text = DateTimeFormat.getNumDate()
            fontSize = 60.0
            fontName = "HelveticaNeue-Light"
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

