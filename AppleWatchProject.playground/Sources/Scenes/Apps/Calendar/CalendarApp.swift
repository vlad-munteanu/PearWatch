
import SpriteKit

public class CalendarApp: SKScene {
    
    let mainTime = SKTimeLabel(fontsizeNum: 40.0)
    
    //Date
    let dateTitle = SKDateLabel(top: true)
    let dateSubtitle = SKDateLabel(top: false)
    
   //BG
    var backgroundRect = SKShapeNode()
    var foregroundRect = SKShapeNode()
    
    //Event
    let eventTitle = SKLabelNode()
    let eventDesc = SKLabelNode()
   
    
    override public func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setupView()
    }
    
    func setupView() {
        dateTitle.text = "Today"
        dateTitle.position = CGPoint(x: 90, y: size.height * 0.87 )
        addChild(dateTitle)
        dateTitle.fontSize = 45.0
        
        dateSubtitle.position = CGPoint(x: 90, y: size.height * 0.68)
        dateSubtitle.fontSize = 115.0
        addChild(dateSubtitle)
        
        mainTime.position = CGPoint(x: size.width - 90 , y: size.height * 0.87)
        addChild(mainTime)
        
        backgroundRect = createBGRect()
        foregroundRect = createOverRect()
        
        addChild(backgroundRect)
        addChild(foregroundRect)
        
        eventTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        eventDesc.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        
        eventTitle.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        eventTitle.fontName = "HelveticaNeue-Medium"
        eventTitle.fontSize = 35.0
        eventTitle.text = "All Day"
        eventTitle.position = CGPoint(x: 20, y: size.height * 0.5)
        addChild(eventTitle)
        
        
        eventDesc.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        eventDesc.fontName = "HelveticaNeue-Medium"
        eventDesc.fontSize = 45.0
        eventDesc.text = "Get ready for WWDC"
        eventDesc.position = CGPoint(x: 30, y: size.height * 0.37)
        addChild(eventDesc)

    }
    
    override public func update(_ currentTime: TimeInterval) {
        mainTime.text = DateTimeFormat.getTime()
    }
    
    func createBGRect() -> SKShapeNode {
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 20, width: Constants.resolution.width, height: 330), cornerRadius: 30).cgPath
        shape.fillColor = #colorLiteral(red: 0.9990773797, green: 0.2295021415, blue: 0.1888831556, alpha: 1)
        shape.strokeColor = #colorLiteral(red: 0.9990773797, green: 0.2295021415, blue: 0.1888831556, alpha: 1)
        return shape
    }
    
    func createOverRect() -> SKShapeNode {
        let shape = SKShapeNode()
        shape.path = UIBezierPath(
            roundedRect: CGRect(x: 0, y: 20, width: Constants.resolution.width, height: 240),
            byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width: 30, height: 30)).cgPath
        shape.fillColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        shape.strokeColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        return shape
    }
}
