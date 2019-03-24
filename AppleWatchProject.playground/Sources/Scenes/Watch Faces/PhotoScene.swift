import SpriteKit

public class PhotoScene : SKScene {
    
    //Main Time
    let mainTime = SKTimeLabel(fontsizeNum: 110.0)
    
    //Date
    let dateTitle = SKDateLabel(top: true)
    let dateSubtitle = SKDateLabel(top: false)
    
    var bgImage = SKSpriteNode()
    override public func didMove(to view: SKView) {
        setupNonCustomSprites()
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    func setupNonCustomSprites() {
        
        // Load the first frame as initialization
        var randImage = "rand\(Int.random(in: 1 ..< 13)).jpeg"
        bgImage = SKSpriteNode(imageNamed: randImage)
        bgImage.size = CGSize(width: size.width, height: size.height)
        bgImage.position =  CGPoint(x: size.width/2, y: size.height/2)
        bgImage.zPosition = 0
        
        
        self.addChild(bgImage)
        
        mainTime.position = CGPoint(x: size.width - 230, y: size.height * 0.1)
        mainTime.zPosition = 1
        addChild(mainTime)
        
        dateTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        dateTitle.position = CGPoint(x: size.width - 155, y: size.height * 0.25 )
        dateTitle.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        dateTitle.zPosition = 1
        addChild(dateTitle)
        dateTitle.fontSize = 38.0
        
        
        dateSubtitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        dateSubtitle.position = CGPoint(x: size.width - 65, y: size.height * 0.25)
        dateSubtitle.fontSize = 38.0
        dateSubtitle.zPosition = 1
        dateSubtitle.color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addChild(dateSubtitle)
        
    }
    
    //TODO: Fix transitions to new scenes
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        var randImage = "rand\(Int.random(in: 1 ..< 13)).jpeg"
        bgImage = SKSpriteNode(imageNamed: randImage)
        bgImage.size = CGSize(width: size.width, height: size.height)
        bgImage.position =  CGPoint(x: size.width/2, y: size.height/2)
        bgImage.zPosition = 0
        
        self.addChild(bgImage)
       
    }
    
    
    override public func update(_ currentTime: TimeInterval) {
        mainTime.text = DateTimeFormat.getTime()
    }
}
