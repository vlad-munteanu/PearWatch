
import Foundation
import SpriteKit

public class LoadingScene: SKScene {
    
    let imageNode = SKSpriteNode(imageNamed: "pear.png")
    override public func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        imageNode.size = CGSize(width: 180, height: 180)
        imageNode.position = CGPoint(x: size.width * 0.5 , y: size.height * 0.5)
        addChild(imageNode)
    }
    
}
