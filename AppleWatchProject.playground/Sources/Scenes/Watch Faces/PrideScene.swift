import SpriteKit

public class PrideScene : SKScene {
    
    //Main Time
    let mainTime = SKTimeLabel(fontsizeNum: 110.0)
    
    //Date
    let dateTitle = SKDateLabel(top: true)
    let dateSubtitle = SKDateLabel(top: false)
    
     var frames = [SKTexture]()
    
    
    override public func didMove(to view: SKView) {
        setupNonCustomSprites()
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    var bgImage = SKSpriteNode()
    
    func setupNonCustomSprites() {
        mainTime.position = CGPoint(x: size.width - 230, y: size.height * 0.67)
        addChild(mainTime)
        
        dateTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        dateTitle.position = CGPoint(x: size.width - 155, y: size.height * 0.85 )
        dateTitle.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addChild(dateTitle)
        dateTitle.fontSize = 38.0
        
        
        dateSubtitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        dateSubtitle.position = CGPoint(x: size.width - 65, y: size.height * 0.85)
        dateSubtitle.fontSize = 38.0
        dateSubtitle.color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addChild(dateSubtitle)
        
        
        
        for i in 0..<23 {
            
            if (i < 10) {
                frames.append(SKTexture.init(imageNamed: "frame_0\(i)_delay-0.04s.png"))
            } else {
                frames.append(SKTexture.init(imageNamed: "frame_\(i)_delay-0.04s.png"))
            }
        }
        
        // Load the first frame as initialization
        bgImage = SKSpriteNode(imageNamed: "frame_00_delay-0.04s.png")
        bgImage.size = CGSize(width: size.width*0.8, height: size.height*0.6)
        bgImage.position =  CGPoint(x: size.width/2, y: size.height * 0.38)
//
//        // Change the frame per 0.2 sec
//        let animation = SKAction.animate(with: frames, timePerFrame: 0.4)
//        bgImage.runAction(SKAction.repeatActionForever(animation))
        
        self.addChild(bgImage)
    }
    
    //TODO: Fix transitions to new scenes
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
//        bgImage.removeFromParent()
//
//        // Load the first frame as initialization
//        bgImage = SKSpriteNode(imageNamed: "frame_00_delay-0.04s.png")
//        bgImage.position =  CGPoint(x: size.width/2, y: size.height * 0.3)
        
        // Change the frame per 0.2 sec
        let animation = SKAction.animate(with: frames, timePerFrame: 0.1)
        bgImage.run(SKAction.repeat(animation, count: 2))
//        bgImage.size = CGSize(width: size.width*0.8, height: size.height*0.6)
//
//        self.addChild(bgImage)
    }
    
   
    
    override public func update(_ currentTime: TimeInterval) {
       mainTime.text = DateTimeFormat.getTime()
    }
}
