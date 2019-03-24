
import Foundation
import UIKit
import SpriteKit

public class ControlCenterNode: SKSpriteNode {
    
    
    init(imagename: String) {
        var imageHeight = 85
        var imageWidth = 105
        
        var imageToBeUsed = SKTexture(imageNamed: imagename)
//        if rising == true {
//            imageToBeUsed = SKTexture(imageNamed: "sunrise.png")
//            imageHeight = 85
//            imageWidth = 90
//        } else {
//            imageToBeUsed = SKTexture(imageNamed: "sunset.png")
//        }
        
        super.init(texture: imageToBeUsed, color: UIColor.clear, size: CGSize(width: imageWidth,height: imageHeight))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

