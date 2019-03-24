import SpriteKit

public class LargeScene : SKScene {
    
    let hoursText = SKLabelNode()
    let minsText = SKLabelNode()
    let bColon = SKBlinkingColon()
    var minus = false
    
    var randNum = 0.0
  
    override public func didMove(to view: SKView) {
        setupNonCustomSprites()
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    func setupNonCustomSprites() {
        hoursText.fontColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        hoursText.fontName = "HelveticaNeue"
        hoursText.fontSize = 320.0
        hoursText.text = DateTimeFormat.getHour()
        hoursText.position = CGPoint(x: size.width - 185, y: size.height * 0.56)
        addChild(hoursText)
        
        minsText.fontColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        minsText.fontName = "HelveticaNeue"
        minsText.fontSize = 360.0
        minsText.text = DateTimeFormat.getMinute()
        minsText.position = CGPoint(x: size.width - 210, y: size.height * 0.05)
        addChild(minsText)
        
        bColon.fontColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        bColon.fontSize = 200.0
        bColon.position = CGPoint(x: 100, y: size.height * 0.05)
        addChild(bColon)
       
    }
    
    func makeColonBlink() {
        
        if minus == false {
            if(randNum >= 1.0) {
                minus = true
            } else {
                randNum += 0.05
            }
        } else {
            if randNum >= 0 {
                 randNum -= 0.05
            } else {
                minus = false
            }
        }
        bColon.alpha = CGFloat(randNum)
        
        
    }

    
    override public func update(_ currentTime: TimeInterval) {
        hoursText.text = DateTimeFormat.getHour()
        minsText.text = DateTimeFormat.getMinute()
        makeColonBlink()
    }
}
