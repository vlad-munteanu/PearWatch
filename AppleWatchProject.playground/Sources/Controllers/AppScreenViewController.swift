import UIKit
import SpriteKit
import GameplayKit



public class AppScreenViewController: UIViewController, AppScreenDelegate {
    
    var currentView = AppScreenView()
    let presentAppView = MainView()
    
     let resolution = CGSize(width: Constants.resolution.width, height: Constants.resolution.height)
    
    public override func loadView() {
        if iPadVers == false {
            currentView.mainView.frame = CGRect(origin: CGPoint.zero, size: resolution)
            
        } else {
            currentView.mainView.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width * 0.2 , y: 0), size: resolution)
        }
     
        self.view = currentView
        currentView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    unowned var magnetic: Magnetic {
        return magneticView.magnetic
    }
    
    unowned var magneticView: MagneticView { return currentView.mainView}
    
    
    public override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        super.viewDidLoad()
        magnetic.myDelegate = self
        
         let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(goToAppScreen))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        presentAppView.addGestureRecognizer(swipeUp)
        //add()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        add()
    }
    
    @objc func goToAppScreen() {
        self.view = currentView
    }
    
    func add() {
//         let cameraNode = ImageNode(name: "camera", image: UIImage(named: "CameraIcon.png"), color: UIColor.black, radius: 80)
//        magnetic.addChild(cameraNode)
        
         let calendarNode = ImageNode(name: "calendar", image: UIImage(named: "CalIcon.png"), color: UIColor.black, radius: 80)
        magnetic.addChild(calendarNode)
        
         let musicNode = ImageNode(name: "music", image: UIImage(named: "MusicIcon.png"), color: UIColor.black, radius: 80)
        magnetic.addChild(musicNode)
        
         let worldClockNode = ImageNode(name: "worldClock", image: UIImage(named: "WorldTimeIcon.png"), color: UIColor.black, radius: 80)
        magnetic.addChild(worldClockNode)
        
        
         let heartRateNode = ImageNode(name: "heartRate", image: UIImage(named: "HeartRateIcon.png"), color: UIColor.black, radius: 80)
        magnetic.addChild(heartRateNode)
        
         let wwdcCDNode = ImageNode(name: "countdown", image: UIImage(named: "wwdcCountdownIcon.png"), color: UIColor.black, radius: 80)
        magnetic.addChild(wwdcCDNode)
        
         let drawNode = ImageNode(name: "draw", image: UIImage(named: "DrawIcon.png"), color: UIColor.black, radius: 80)
        magnetic.addChild(drawNode)
        
         let clockNode = ImageNode(name: "clockNode", image: UIImage(named: "WatchIcon.png"), color: UIColor.white, radius: 80)
        magnetic.addChild(clockNode)

    }
    
    func goHome() {
         closeView()
    }
    
    func closeView() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey:nil)
        
        self.navigationController?.popViewController(animated: false)
    }
    
    
    
    func openApp(nodeName: String) {
        if iPadVers == false {
            presentAppView.mainView.frame = CGRect(origin: CGPoint.zero, size: resolution)
        } else {
            presentAppView.mainView.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width * 0.2 , y: 0), size: resolution)
        }
        
        
        self.view = presentAppView
        presentAppView.translatesAutoresizingMaskIntoConstraints = false
        
        if nodeName == "camera"{
//            let vc = CameraAppViewController()
//            let transition = CATransition()
//            transition.duration = 0.2
//            transition.type = CATransitionType.fade
//            self.navigationController?.view.layer.add(transition, forKey:nil)
//            self.navigationController?.pushViewController(vc, animated: false)
        } else if nodeName == "calendar"{
            let scene = CalendarApp(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            presentAppView.mainView.presentScene(scene)
        } else if nodeName == "music"{
             let scene = MusicApp(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            presentAppView.mainView.presentScene(scene)
        } else if nodeName == "worldClock"{
             let scene = WorldClockApp(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            presentAppView.mainView.presentScene(scene)
        } else if nodeName == "heartRate"{
             let scene = HeartRateApp(size: CGSize(width: Constants.resolution.width,height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            presentAppView.mainView.presentScene(scene)
        } else if nodeName == "countdown"{
              let scene = WWDCCountdownApp(size: CGSize(width: Constants.resolution.width,height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            presentAppView.mainView.presentScene(scene)
        } else if nodeName == "draw"{
             let scene = DrawApp(size: CGSize(width: Constants.resolution.width,height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            presentAppView.mainView.presentScene(scene)
        }
        
    }
    
}


// MARK: - ImageNode
class ImageNode: Node {
    override public var image: UIImage? {
        didSet {
            sprite.texture =  image.map { SKTexture(image: $0) }
        }
    }
    public func selectedNode() {}
}
