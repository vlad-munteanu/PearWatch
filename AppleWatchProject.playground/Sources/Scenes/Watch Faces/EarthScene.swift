import SpriteKit

public class EarthScene : SKScene {
    
    //Main Time
    let hoursText = SKLabelNode()
    let minsText = SKLabelNode()
    let bColon = SKBlinkingColon()
    var minus = false
     var randNum = 0.0
    
    //Date
    let dateTitle = SKDateLabel(top: true)
    let dateSubtitle = SKDateLabel(top: false)
    
    var bgImage = SKSpriteNode()
    override public func didMove(to view: SKView) {
        setupNonCustomSprites()
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    var currentTime = DateTimeFormat.getGMTHour()
    
    
    
    func setupNonCustomSprites() {
        
        // Load the first frame as initialization
        
        let imageName = DateTimeFormat.getGMTHour() + ".png"
        
        bgImage = SKSpriteNode(imageNamed: imageName)
        bgImage.size = CGSize(width: size.width * 0.83, height: size.height * 0.8)
        bgImage.position =  CGPoint(x: size.width/2, y: size.height/2)
        bgImage.zPosition = 0
        self.addChild(bgImage)
        
        hoursText.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        hoursText.fontName = "HelveticaNeue"
        hoursText.fontSize = 110.0
        hoursText.text = DateTimeFormat.getHour()
        hoursText.position = CGPoint(x:size.width - 255, y: size.height * 0.75)
        addChild(hoursText)
        
        bColon.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bColon.fontSize = 110.0
        bColon.position = CGPoint(x: size.width - 180 , y: size.height * 0.75)
        addChild(bColon)
        
        minsText.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        minsText.fontName = "HelveticaNeue"
        minsText.fontSize = 110.0
        minsText.text = DateTimeFormat.getMinute()
        minsText.position = CGPoint(x: size.width - 105, y: size.height * 0.75)
        addChild(minsText)
        
        dateTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        dateTitle.position = CGPoint(x: 20, y: size.height * 0.9 )
        dateTitle.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        dateTitle.zPosition = 1
        addChild(dateTitle)
        dateTitle.fontSize = 38.0
        
        
        dateSubtitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        dateSubtitle.position = CGPoint(x: 110, y: size.height * 0.9)
        dateSubtitle.fontSize = 38.0
        dateSubtitle.zPosition = 1
        dateSubtitle.color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addChild(dateSubtitle)
        
    }
    
    func checkTime() {
        let imageName = DateTimeFormat.getGMTHour() + ".png"
        bgImage.texture = SKTexture(imageNamed: imageName)
    }
    
    override public func update(_ currentTime: TimeInterval) {
        hoursText.text = DateTimeFormat.getHour()
        minsText.text = DateTimeFormat.getMinute()
        
        checkTime()
        makeColonBlink()
    }
    
    func makeColonBlink() {
        
        if minus == false {
            if(randNum >= 1.0) {
                minus = true
            } else {
                randNum += 0.03
            }
        } else {
            if randNum >= 0 {
                randNum -= 0.03
            } else {
                minus = false
            }
        }
        bColon.alpha = CGFloat(randNum)
    }
}
