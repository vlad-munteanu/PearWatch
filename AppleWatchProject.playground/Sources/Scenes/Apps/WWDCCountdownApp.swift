import SpriteKit

public class WWDCCountdownApp: SKScene {
    
    let mainTime = SKTimeLabel(fontsizeNum: 40.0)
    let rightHandLabel = SKLabelNode()
    
    //Labels
    let daysLabel = SKLabelNode()
    let hoursLabel = SKLabelNode()
    let minutesLabel = SKLabelNode()
    let secondsLabel = SKLabelNode()
    
    
    override public func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setupView()
    }
    
    func setupView() {
//        let backgroundGif = SKSpriteNode(texture: SKTexture(image: (UIImage.gif(name: "starryNight")!)))
//        backgroundGif.position = CGPoint(x: 0, y: size.height)
//        addChild(backgroundGif)
        
        rightHandLabel.fontName = "HelveticaNeue-Medium"
        rightHandLabel.fontSize = 40.0
        rightHandLabel.fontColor = #colorLiteral(red: 0.1380134523, green: 0.1951457858, blue: 0.3819598556, alpha: 1)
        rightHandLabel.text = "WWDC Countdown"
        rightHandLabel.position = CGPoint(x: size.width - 330, y: size.height * 0.87)
        addChild(rightHandLabel)
        
        mainTime.position = CGPoint(x: size.width - 80, y: size.height * 0.87)
        addChild(mainTime)
        
        daysLabel.fontName = "HelveticaNeue-Medium"
        daysLabel.fontSize = 90.0
        daysLabel.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        daysLabel.text = "Days: \(CountdownFormat.daysUntilWWDC())"
        daysLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        daysLabel.position = CGPoint(x: 20, y: size.height * 0.7)
        addChild(daysLabel)

        
        hoursLabel.fontName = "HelveticaNeue-Medium"
        hoursLabel.fontSize = 90.0
        hoursLabel.fontColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        hoursLabel.text = "Hours: \(CountdownFormat.hoursUntilWWDC())"
        hoursLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        hoursLabel.position = CGPoint(x: 20, y: size.height * 0.5)
        addChild(hoursLabel)
        
        minutesLabel.fontName = "HelveticaNeue-Medium"
        minutesLabel.fontSize = 90.0
        minutesLabel.fontColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        minutesLabel.text = "Minutes: \(CountdownFormat.minutesUntilWWDC())"
        minutesLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        minutesLabel.position = CGPoint(x: 20, y: size.height * 0.3)
        addChild(minutesLabel)
        
        
        secondsLabel.fontName = "HelveticaNeue-Medium"
        secondsLabel.fontSize = 90.0
        secondsLabel.fontColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        secondsLabel.text = "Seconds: \(CountdownFormat.secondsUntilWWDC())"
        secondsLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        secondsLabel.position = CGPoint(x: 20, y: size.height * 0.1)
        addChild(secondsLabel)
        
    }
    
    override public func update(_ currentTime: TimeInterval) {
        mainTime.text = DateTimeFormat.getTime()
        
        daysLabel.text = "Days: \(CountdownFormat.daysUntilWWDC())"
        hoursLabel.text = "Hours: \(CountdownFormat.hoursUntilWWDC())"
        minutesLabel.text = "Minutes: \(CountdownFormat.minutesUntilWWDC())"
        secondsLabel.text = "Seconds: \(CountdownFormat.secondsUntilWWDC())"
    }
}
