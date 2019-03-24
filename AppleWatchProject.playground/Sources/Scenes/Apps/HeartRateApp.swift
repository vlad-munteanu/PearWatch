import SpriteKit

public class HeartRateApp: SKScene {
    
    let mainTime = SKTimeLabel(fontsizeNum: 40.0)
    let rightHandLabel = SKLabelNode()
    
    var myTimer = Timer()
    
    //Heart Rate
    let heartRateNum = SKLabelNode()
    let heartNode = SKLabelNode()
    
    var minus = false
    
    var randNum2 = 0.0
    
    override public func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setupView()
        setUpTitle()
        
        let action = SKAction.sequence([SKAction.run(randHR), SKAction.wait(forDuration: 3.0)])
        run(SKAction.repeatForever(action))
    }
    
    
    @objc func randHR() {
        var randNum = Int.random(in: 55 ..< 100)
        heartRateNum.text = String(randNum)
    }
    
    func setupView() {
        var randNum = Int.random(in: 55 ..< 100)
        
        heartRateNum.fontName = "HelveticaNeue-Medium"
        heartRateNum.fontSize = 300.0
        heartRateNum.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        heartRateNum.text = String(randNum)
        heartRateNum.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        heartRateNum.position = CGPoint(x: 20, y: size.height * 0.3)
        addChild(heartRateNum)
        
        let BPMText = SKLabelNode()
        BPMText.fontName = "HelveticaNeue-Medium"
        BPMText.fontSize = 80.0
        BPMText.fontColor = #colorLiteral(red: 1, green: 0, blue: 0.01208707165, alpha: 1)
        BPMText.text = "BPM"
        BPMText.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        BPMText.position = CGPoint(x: 340, y: size.height * 0.58)
        addChild(BPMText)
        
        heartNode.fontName = "HelveticaNeue-Medium"
        heartNode.fontSize = 180.0
        heartNode.text = "❤️"
        heartNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        heartNode.position = CGPoint(x: 340, y: size.height * 0.31)
        addChild(heartNode)
        
        
    }
    
    func makeHeartBlink() {
        
        if minus == false {
            if(randNum2 >= 1.0) {
                minus = true
            } else {
                randNum2 += 0.05
            }
        } else {
            if randNum2 >= 0 {
                randNum2 -= 0.05
            } else {
                minus = false
            }
        }
        heartNode.alpha = CGFloat(randNum2)
    }
    
    func setUpTitle() {
        rightHandLabel.fontName = "HelveticaNeue-Medium"
        rightHandLabel.fontSize = 40.0
        rightHandLabel.fontColor = #colorLiteral(red: 1, green: 0.01208707165, blue: 0, alpha: 1)
        rightHandLabel.text = "Heart Rate"
        rightHandLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        rightHandLabel.position = CGPoint(x: 40, y: size.height * 0.9)
        addChild(rightHandLabel)
        
        mainTime.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        mainTime.position = CGPoint(x: 430 , y: size.height * 0.9)
        mainTime.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addChild(mainTime)
    }
    
    
    
    override public func update(_ currentTime: TimeInterval) {
        mainTime.text = DateTimeFormat.getTime()
        makeHeartBlink()
    }
}
