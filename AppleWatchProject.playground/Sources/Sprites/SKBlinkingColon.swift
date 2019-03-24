
import Foundation
import UIKit
import SpriteKit

public class SKBlinkingColon: SKLabelNode {
    
    override init() {
        super.init()
        fontColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        fontSize = 65.0
        text = ":"
        fontName = "HelveticaNeue"
        colorBlendFactor = 0.0
        
//        let duration:TimeInterval = 3.0
//        self.runAction(SKAction.customActionWithDuration(duration, actionBlock: {
//            node, elapsedTime in
//
//            let label = node as SKLabelNode
//            label.colorBlendFactor = elapsedTime / CGFloat(duration);
//        }))
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

