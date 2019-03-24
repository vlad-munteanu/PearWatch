import UIKit
import SpriteKit


public class MainView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect.zero
        
        intializeUI()
       // createConstraints()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func intializeUI() {
        addSubview(mainView)
        addSubview(secondView)
    }
    
    
    public let mainView: SKView = {
        let rand = SKView()
        rand.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return rand
    }()
    
    public let secondView: SKView = {
        let rand = SKView()
        rand.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return rand
    }()
}
