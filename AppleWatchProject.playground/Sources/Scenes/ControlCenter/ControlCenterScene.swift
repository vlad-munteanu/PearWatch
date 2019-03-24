import SpriteKit

public class ControlCenterScene : SKScene {

    weak var myWFDelegate: WatchFaceDelegate?
    
    //Device Top Left
    let deviceNode = SKSpriteNode(imageNamed: "tablet.png")
    //Location Top Right
    let locationarrowNode = SKSpriteNode(imageNamed: "location-arrow.png")
 
    override public func didMove(to view: SKView) {
        setupNonCustomSprites()
        setUpButtons()
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func setupNonCustomSprites() {
        
        let pullDownNode = createPDNode()
        addChild(pullDownNode)
        
        deviceNode.size = CGSize(width: 50 , height: 60)
        deviceNode.position = CGPoint(x: 40, y: size.height * 0.90 )
        addChild(deviceNode)
        
        locationarrowNode.size = CGSize(width: 50 , height: 50)
        locationarrowNode.position = CGPoint(x: 500, y: size.height * 0.90  )
        addChild(locationarrowNode)
    }
    
    func setUpLabels() {
        //Title
        let titleLabel = SKLabelNode()
        titleLabel.fontColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        titleLabel.fontName = "HelveticaNeue-Bold"
        titleLabel.fontSize = 35.0
        titleLabel.text = "Choose a Watch Face"
        titleLabel.position = CGPoint(x: 260, y: size.height * 0.87)
       
        addChild(titleLabel)
        
        //Row 1
        let modLabel = SKLabelNode()
        modLabel.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        modLabel.fontName = "HelveticaNeue-Light"
        modLabel.fontSize = 43.0
        modLabel.text = "Modular 🔨"
        modLabel.position = CGPoint(x: 138, y: size.height * 0.62)
        modLabel.name = "mod"
        addChild(modLabel)
        
        
        let prideLabel = SKLabelNode()
        prideLabel.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        prideLabel.fontName = "HelveticaNeue-Light"
        prideLabel.fontSize = 50.0
        prideLabel.text = "Pride 🏳️‍🌈"
        prideLabel.position = CGPoint(x: size.width - 135, y: size.height * 0.62)
        prideLabel.name = "pride"
        addChild(prideLabel)
        
         //Row 2
        let earthLabel = SKLabelNode()
        earthLabel.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        earthLabel.fontName = "HelveticaNeue-Light"
        earthLabel.fontSize = 40.0
        earthLabel.text = "Astronomy 🌎"
        earthLabel.position = CGPoint(x: 142, y: size.height * 0.39)
        earthLabel.name = "earth"
        addChild(earthLabel)
        
        let largeLabel = SKLabelNode()
        largeLabel.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        largeLabel.fontName = "HelveticaNeue-Light"
        largeLabel.fontSize = 50.0
        largeLabel.text = "X-Large ⌚️"
        largeLabel.position = CGPoint(x: size.width - 135, y: size.height * 0.37)
        largeLabel.name = "large"
        addChild(largeLabel)
        
        //Row 3
        let photoLabel = SKLabelNode()
        photoLabel.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        photoLabel.fontName = "HelveticaNeue-Light"
        photoLabel.fontSize = 50.0
        photoLabel.text = "Photos 📸"
        photoLabel.position = CGPoint(x: 142, y: size.height * 0.13)
        photoLabel.name = "photo"
        addChild(photoLabel)
        
        
        let numericalLabel = SKLabelNode()
        numericalLabel.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numericalLabel.fontName = "HelveticaNeue-Light"
        numericalLabel.fontSize = 40.0
        numericalLabel.text = "Numerals 🔢"
        numericalLabel.position = CGPoint(x: size.width - 135, y: size.height * 0.13)
        numericalLabel.name = "number"
        addChild(numericalLabel)
        
    
    }
    
    func setUpButtons() {
        
        //Row 1
        let modButton = createButton(myRect: CGRect(x: 20, y: size.height * 0.55, width: size.width * 0.45, height: 120))
        modButton.name = "mod"
      
        addChild(modButton)
    
        
        let prideButton = createButton(myRect: CGRect(x: size.width - size.width * 0.45 - 20, y: size.height * 0.55, width: size.width * 0.45, height: 120))
        prideButton.name = "pride"
         addChild(prideButton)
        
         //Row 2
        let earthButton = createButton(myRect: CGRect(x: 20, y: size.height * 0.3, width: size.width * 0.45, height: 120))
      earthButton.name = "earth"
        addChild(earthButton)


        let largeButton = createButton(myRect: CGRect(x: size.width - size.width * 0.45 - 20, y: size.height * 0.3, width: size.width * 0.45, height: 120))
       largeButton.name = "large"
        addChild(largeButton)

        //Row 3
        let photoButton = createButton(myRect: CGRect(x: 20, y: size.height * 0.05, width: size.width * 0.45, height: 120))
        photoButton.name = "photo"
        addChild(photoButton)

        let numericalButton = createButton(myRect: CGRect(x: size.width - size.width * 0.45 - 20, y: size.height * 0.05, width: size.width * 0.45, height: 120))
        numericalButton.name = "number"
        addChild(numericalButton)
        
        setUpLabels()
        
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            myWFDelegate!.switchWatchFace(watchFace: name)
            
        }
    }
    
    func createPDNode() -> SKShapeNode {
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: CGRect(x: size.width/2 - 28, y: size.height * 0.95, width: 60, height: 5), cornerRadius: 64).cgPath
        shape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.8061454665)
        shape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.8061454665)
        return shape
    }
    
    func createButton(myRect: CGRect) -> SKShapeNode {
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: myRect, cornerRadius: 60).cgPath
        shape.fillColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.8061454665)
        shape.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.8061454665)
        return shape
    }
    
    override public func update(_ currentTime: TimeInterval) {
       
    }
}
