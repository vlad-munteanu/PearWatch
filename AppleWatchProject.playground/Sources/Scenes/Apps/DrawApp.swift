
import SpriteKit
import GameplayKit

public class DrawApp: SKScene {
    
    private var spinnyNode : SKSpriteNode?
    let mainTime = SKTimeLabel(fontsizeNum: 40.0)
    let rightHandLabel = SKLabelNode()
    
    var spinDuration = 1.0
    var fadeOutTime = 1.0
  
     var firstPoint:CGPoint = CGPoint(x: 0.0, y: 0.0)
    
    
    override public func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        setupView()
        
        let w = (self.size.width + self.size.height) * 0.08
        self.spinnyNode = SKSpriteNode.init(texture: SKTexture(image: UIImage(named: "apple_emoji.png")!), size: CGSize(width: w, height: w))
        
        if let spinnyNode = self.spinnyNode {
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: spinDuration)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: fadeOutTime),
                                              SKAction.fadeOut(withDuration: fadeOutTime),
                                              SKAction.removeFromParent()]))
        }
        
        //setupButtons()
    }
    
    func setupView() {
        
        rightHandLabel.fontName = "HelveticaNeue-Medium"
        rightHandLabel.fontSize = 40.0
        rightHandLabel.fontColor = #colorLiteral(red: 0.1380134523, green: 0.1951457858, blue: 0.3819598556, alpha: 1)
        rightHandLabel.text = "Draw"
        rightHandLabel.position = CGPoint(x: size.width - 470, y: size.height * 0.87)
        addChild(rightHandLabel)
        
        mainTime.position = CGPoint(x: size.width - 100 , y: size.height * 0.87)
       mainTime.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addChild(mainTime)
    }
    
    func setupButtons() {
        let resetButton = createButton(myRect: CGRect(x: size.width , y: size.height * 0.1, width: size.width * 0.2, height: 120))
        resetButton.name = "reset"
        addChild(resetButton)
    }
    
    public override func update(_ currentTime: TimeInterval) {
        mainTime.text = DateTimeFormat.getTime()
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKSpriteNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKSpriteNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKSpriteNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    func createButton(myRect: CGRect) -> SKShapeNode {
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: myRect, cornerRadius: 60).cgPath
        shape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.8061454665)
        shape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.8061454665)
        return shape
    }
}
