import UIKit
import SpriteKit


public class AppScreenView: UIView {
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
        
    }
    
    public let mainView: MagneticView = {
        let rand = MagneticView()
       // rand.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return rand
    }()
    
    public let backView: UIView = {
        let rand = MagneticView()
        // rand.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return rand
    }()
    
}
