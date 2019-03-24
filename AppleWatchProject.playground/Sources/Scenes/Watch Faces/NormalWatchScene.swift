import SpriteKit

class NormalWatchScene: SKScene {
    
    
    var backgroundImage:SKSpriteNode = SKSpriteNode(imageNamed: "normalDial.png")
    var secondHand:SKSpriteNode = SKSpriteNode(imageNamed: "second.png")
    var minuteHand:SKSpriteNode = SKSpriteNode(imageNamed: "minute.png")
    var hourHand:SKSpriteNode = SKSpriteNode(imageNamed: "heure.png")
    
    var pearLogo:SKSpriteNode = SKSpriteNode(imageNamed: "pear.png")
    
    override func sceneDidLoad() {
        
        backgroundImage.size = CGSize(width: size.width, height: size.height)
        backgroundImage.position =  CGPoint(x: size.width/2, y: size.height/2)
        addChild(backgroundImage)
        
        secondHand.position =  CGPoint(x: size.width/2, y: size.height/2)
        addChild(secondHand)
        
        minuteHand.position =  CGPoint(x: size.width/2, y: size.height/2)
        addChild(minuteHand)
        
        hourHand.position =  CGPoint(x: size.width/2, y: size.height/2)
        addChild(hourHand)
        
        pearLogo.size = CGSize(width: 65, height: 65)
        pearLogo.position =  CGPoint(x: size.width/2, y: size.height * 0.75)
        addChild(pearLogo)
        
        
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        let date = Date()
        let calendar = Calendar.current
        let hour = CGFloat(calendar.component(.hour, from: date))
        let minutes = CGFloat(calendar.component(.minute, from: date))
        let seconds = CGFloat(calendar.component(.second, from: date))
        secondHand.zRotation = -1 * deg2rad(seconds * 6)
        minuteHand.zRotation = -1 * deg2rad(minutes * 6)
        hourHand.zRotation = -1 * deg2rad(hour * 30 + minutes/2)
    }
    
    func deg2rad(_ number: CGFloat) -> CGFloat {
        return number * .pi / 180
    }
}
