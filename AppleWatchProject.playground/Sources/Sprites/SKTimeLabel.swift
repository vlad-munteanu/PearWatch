
import Foundation
import UIKit
import SpriteKit

public class SKTimeLabel: SKLabelNode {
    
    
    init(fontsizeNum: Double) {
        super.init()
        
        fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fontName = "HelveticaNeue"
    
        fontSize = CGFloat(fontsizeNum)

        text = DateTimeFormat.getTime()
        horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
       
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

