import SpriteKit

public class AppScene: SKScene {
    
    override public func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    //TODO: Fix transitions to new scenes
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {

        }
        
    }
}
