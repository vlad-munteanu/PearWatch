import SpriteKit

public class MagneticView: SKView {
    
    @objc
public lazy var magnetic: Magnetic = { [unowned self] in
        let scene = Magnetic(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
        self.presentScene(scene)
        return scene
        }()
    
    override public init(frame: CGRect) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height)))
        
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        _ = magnetic
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        magnetic.size = bounds.size
    }
}
