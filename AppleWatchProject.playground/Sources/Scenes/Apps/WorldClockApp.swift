import SpriteKit

public class WorldClockApp: SKScene {
    
    let mainTime = SKTimeLabel(fontsizeNum: 40.0)
    let rightHandLabel = SKLabelNode()
    
     let NYCTime = SKLabelNode()
    let LATime = SKLabelNode()
    let LimaTime = SKLabelNode()
    let AmsTime = SKLabelNode()

    
    override public func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setupView()
        setUpTitle()
        setUpLabels()
    }
    
    func setupView() {
        let button1 = createButton(myRect: CGRect(x: 20, y: size.height * 0.67, width: size.width * 0.93, height: 115))
        button1.name = "nyc"
        addChild(button1)
        
        let button2 = createButton(myRect: CGRect(x: 20, y: size.height * 0.45, width: size.width * 0.93, height: 120))
        button2.name = "LosAngeles"
        addChild(button2)
        
        let button3 = createButton(myRect: CGRect(x: 20, y: size.height * 0.23, width: size.width * 0.93, height: 120))
        button3.name = "Lima"
        addChild(button3)
        
        let button4 = createButton(myRect: CGRect(x: 20, y: size.height * 0.01, width: size.width * 0.93, height: 120))
        button4.name = "ams"
        addChild(button4)
        
       
    }
    
    func setUpTitle() {
        rightHandLabel.fontName = "HelveticaNeue-Medium"
        rightHandLabel.fontSize = 40.0
        rightHandLabel.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        rightHandLabel.text = "World Clock"
        rightHandLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        rightHandLabel.position = CGPoint(x: 40, y: size.height * 0.9)
        addChild(rightHandLabel)
        
        mainTime.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        mainTime.position = CGPoint(x: 430 , y: size.height * 0.9)
        mainTime.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addChild(mainTime)
    }
    
    func setUpLabels() {
        //NYC
        let NYCTitle = SKLabelNode()
        NYCTitle.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        NYCTitle.fontName = "HelveticaNeue-Medium"
        NYCTitle.fontSize = 35.0
        NYCTitle.text = "New York"
        NYCTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        NYCTitle.position = CGPoint(x: 53, y: size.height * 0.79)
        NYCTitle.name = "nyc"
        addChild(NYCTitle)
        
    
        NYCTime.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        NYCTime.fontName = "HelveticaNeue-Medium"
        NYCTime.fontSize = 70.0
        NYCTime.text = DateTimeFormat.getTimeInternational(zone: "nyc")
        NYCTime.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        NYCTime.position = CGPoint(x: 50, y: size.height * 0.68)
        NYCTime.name = "nyc"
        addChild(NYCTime)
  
        //Los Angeles
        
        let LATitle = SKLabelNode()
        LATitle.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        LATitle.fontName = "HelveticaNeue-Medium"
        NYCTitle.fontSize = 35.0
        LATitle.text = "Los Angeles"
        LATitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        LATitle.position = CGPoint(x: 53, y: size.height * 0.6)
        LATitle.name = "LosAngeles"
        addChild(LATitle)
        
        
        LATime.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        LATime.fontName = "HelveticaNeue-Medium"
        LATime.fontSize = 70.0
        LATime.text = DateTimeFormat.getTimeInternational(zone: "LosAngeles")
        LATime.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        LATime.position = CGPoint(x: 50, y: size.height * 0.48)
        LATime.name = "LosAngeles"
        addChild(LATime)
        
        let LATimeDifference = SKLabelNode()
        LATimeDifference.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        LATimeDifference.fontName = "HelveticaNeue-Medium"
        LATimeDifference.fontSize = 70.0
        LATimeDifference.text = DateTimeFormat.getTimeDifference(zone: "LosAngeles")
        LATimeDifference.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        LATimeDifference.position = CGPoint(x: 100, y: size.height * 0.52)
        LATimeDifference.name = "LosAngeles"
      //  addChild(LATimeDifference)
        
        //Lima
        
        let LimaTitle = SKLabelNode()
        LimaTitle.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        LimaTitle.fontName = "HelveticaNeue-Medium"
        LimaTitle.fontSize = 35.0
        LimaTitle.text = "Lima"
        LimaTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        LimaTitle.position = CGPoint(x: 53, y: size.height * 0.38)
        LimaTitle.name = "Lime"
        addChild(LimaTitle)
        
        
        LimaTime.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        LimaTime.fontName = "HelveticaNeue-Medium"
        LimaTime.fontSize = 70.0
        LimaTime.text = DateTimeFormat.getTimeInternational(zone: "Lima")
        LimaTime.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        LimaTime.position = CGPoint(x: 50, y: size.height * 0.27)
        LimaTime.name = "Lima"
        addChild(LimaTime)
        
        //Ams
        
        let AmsTitle = SKLabelNode()
        AmsTitle.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        AmsTitle.fontName = "HelveticaNeue-Medium"
        AmsTitle.fontSize = 35.0
        AmsTitle.text = "Amsterdam"
        AmsTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        AmsTitle.position = CGPoint(x: 53, y: size.height * 0.16)
        AmsTitle.name = "ams"
        addChild(AmsTitle)
        
        
        AmsTime.fontColor = #colorLiteral(red: 1, green: 0.5881124829, blue: 0, alpha: 1)
        AmsTime.fontName = "HelveticaNeue-Medium"
        AmsTime.fontSize = 70.0
        AmsTime.text = DateTimeFormat.getTimeInternational(zone: "ams")
        AmsTime.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        AmsTime.position = CGPoint(x: 50, y: size.height * 0.05)
        AmsTime.name = "ams"
        addChild(AmsTime)
        
       
    }
    
    
    override public func update(_ currentTime: TimeInterval) {
        mainTime.text = DateTimeFormat.getTime()
        NYCTime.text = DateTimeFormat.getTimeInternational(zone: "nyc")
        LATime.text = DateTimeFormat.getTimeInternational(zone: "LosAngeles")
        LimaTime.text = DateTimeFormat.getTimeInternational(zone: "Lima")
        AmsTime.text = DateTimeFormat.getTimeInternational(zone: "ams")
    }
    
    func createButton(myRect: CGRect) -> SKShapeNode {
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: myRect, cornerRadius: 30).cgPath
        shape.fillColor = #colorLiteral(red: 1, green: 0.5865499377, blue: 0, alpha: 0.5)
        shape.strokeColor = #colorLiteral(red: 1, green: 0.5865499377, blue: 0, alpha: 0.5)
        return shape
    }
    
    //TODO: Fix transitions to new scenes
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
           //currentTimeZone = name
        }
    }
}
