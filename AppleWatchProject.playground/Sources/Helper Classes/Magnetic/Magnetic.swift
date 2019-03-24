import SpriteKit



@objcMembers open class Magnetic: SKScene {
    
    weak var myDelegate: AppScreenDelegate?
    
    open lazy var magneticField: SKFieldNode = { [unowned self] in
        let field = SKFieldNode.radialGravityField()
        self.addChild(field)
        return field
        }()
    
    open var allowsMultipleSelection: Bool = true
    
    open var isDragging: Bool = false
  
    
    override open var size: CGSize {
        didSet {
            configure()
        }
    }
    
    override public init(size: CGSize) {
        super.init(size: size)
        
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        scaleMode = .aspectFill
        configure()
    }
    
    func configure() {
        let strength = Float(max(size.width, size.height))
        let radius = strength.squareRoot() * 100
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: { () -> CGRect in
            var frame = self.frame
            frame.size.width = CGFloat(radius)
            frame.origin.x -= frame.size.width / 2
            return frame
        }())
        
        magneticField.region = SKRegion(radius: radius)
        magneticField.minimumRadius = radius
        magneticField.strength = strength
        magneticField.position = CGPoint(x: size.width / 2, y: size.height / 2)
    }
    
    override open func addChild(_ node: SKNode) {
        var x = CGFloat(90.0)
        if children.count % 2 == 0 {
            x = CGFloat(Constants.resolution.width-90.0)
        }
        let y = CGFloat.random(Constants.resolution.height-90, 90)
        node.position = CGPoint(x: x, y: y)
        super.addChild(node)
    }
    
}

extension Magnetic {
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let previous = touch.previousLocation(in: self)
        guard location.distance(from: previous) != 0 else { return }
        
        isDragging = true
        
        moveNodes(location: location, previous: previous)
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        defer { isDragging = false }
        guard !isDragging, let node = node(at: location) else { return }
        
        
        node.isSelected = true
        if node.nodeName == "clockNode"{
            myDelegate?.goHome()
        } else  {
            myDelegate?.openApp(nodeName: node.nodeName)
        }
        
        
        
    }
    
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDragging = false
    }
    
}

extension Magnetic {
    
    
    open func moveNodes(location: CGPoint, previous: CGPoint) {
        let x = location.x - previous.x
        let y = location.y - previous.y
        
        for node in children {
            let distance = node.position.distance(from: location)
            let acceleration: CGFloat = 2.5 * pow(distance, 1/2)
            let direction = CGVector(dx: x * acceleration, dy: y * acceleration)
            node.physicsBody?.applyForce(direction)
        }
    }
    
    open func node(at point: CGPoint) -> Node? {
        return nodes(at: point).compactMap { $0 as? Node }.filter { $0.path!.contains(convert(point, to: $0)) }.first
    }
    
}

extension CGPoint {
    public func distance(from point: CGPoint) -> CGFloat {
        return hypot(point.x - x, point.y - y)
    }
}
