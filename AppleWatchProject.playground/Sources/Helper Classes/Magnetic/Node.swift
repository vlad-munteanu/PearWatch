import SpriteKit

@objcMembers open class Node: MaskNode {
    
    var nodeName = ""
    public lazy var sprite: SKSpriteNode = { [unowned self] in
        let sprite = SKSpriteNode()
        sprite.size = self.frame.size
        sprite.colorBlendFactor = 0.01
        self.mask.addChild(sprite)
        return sprite
        }()
    
    open var image: UIImage? {
        didSet {
            texture = image.map { SKTexture(image: $0.aspectFill(self.frame.size)) }
            sprite.size = texture?.size() ?? self.frame.size
        }
    }
    
    open var color: UIColor {
        get { return sprite.color }
        set { sprite.color = newValue }
    }
    
    private(set) var texture: SKTexture?
   
    open var isSelected: Bool = false {
        didSet {
            nodeWasSelected()
        }
    }
    
    public init(name: String, image: UIImage?, color: UIColor, path: CGPath, marginScale: CGFloat = 1.01) {
        super.init(path: path)
        
         nodeName = name
        
        self.physicsBody = {
            var transform = CGAffineTransform.identity.scaledBy(x: marginScale, y: marginScale)
            let body = SKPhysicsBody(polygonFrom: path.copy(using: &transform)!)
            body.allowsRotation = false
            body.friction = 0
            body.linearDamping = 3
            return body
        }()
        self.fillColor = .white
        _ = self.sprite
        configure(image: image, color: color)
    }
    
    
    public convenience init(name: String, image: UIImage?, color: UIColor, radius: CGFloat, marginScale: CGFloat = 1.01) {
        let path = SKShapeNode(circleOfRadius: radius).path!
        self.init(name: name, image: image, color: color, path: path, marginScale: marginScale)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure(image: UIImage?, color: UIColor) {
        self.image = image
        self.color = color
        
    }
  
    open func nodeWasSelected() {
    }
    
}

open class MaskNode: SKShapeNode {
    
    let mask: SKCropNode
    let maskOverlay: SKShapeNode
    
    public init(path: CGPath) {
        mask = SKCropNode()
        mask.maskNode = {
            let node = SKShapeNode(path: path)
            node.fillColor = .white
            return node
        }()
        
        maskOverlay = SKShapeNode(path: path)
        maskOverlay.fillColor = .clear
        
        super.init()
        self.path = path
        
        self.addChild(mask)
        self.addChild(maskOverlay)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
