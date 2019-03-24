import UIKit
import SpriteKit
import GameplayKit

public var iPadVers = false
public var currentWFIndex = 0

//loading
public var firstBoot = true

public class MainViewController: UIViewController, OpenAppDelegate {

    //current View
    let currentView = MainView()
    //res
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
    
    public override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        if firstBoot == false { checkWhatScene()}
        
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(goToControlCenter))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        currentView.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(goToHomeScreen))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        currentView.addGestureRecognizer(swipeDown)
    }
    
   
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if iPadVers == false {
            self.view.frame = CGRect(origin: CGPoint.zero, size: resolution)
        } else {
            self.view.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width * 0.2 , y: 0), size: resolution)
        }
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        if firstBoot == true {
            let scene = LoadingScene(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            //scene.myDelegate = self
            scene.scaleMode =  .resizeFill
            currentView.mainView.presentScene(scene)
            
        } else {
            checkWhatScene()
        }
        
    }
    
    public func checkWhatScene() {
        if currentWFIndex == 0 {
            let scene = ModularScene(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            scene.myAppDelegate = self
            scene.scaleMode =  .resizeFill
            currentView.mainView.presentScene(scene)
        } else if currentWFIndex == 1 {
            let scene = PrideScene(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            currentView.mainView.presentScene(scene)
        } else if currentWFIndex == 2 {
            let scene = EarthScene(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            currentView.mainView.presentScene(scene)
        } else if currentWFIndex == 3 {
            let scene = LargeScene(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            currentView.mainView.presentScene(scene)
        } else if currentWFIndex == 4 {
            let scene = PhotoScene(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            currentView.mainView.presentScene(scene)
        } else if currentWFIndex == 5 {
            let scene = NormalWatchScene(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
            scene.scaleMode =  .resizeFill
            currentView.mainView.presentScene(scene)
        }
    }
    
    
    @objc func goToHomeScreen() {
        moveToAppScreen()
    }
    
    @objc func goToControlCenter() {
        openControlCenter()
    }
    
    
    func moveToAppScreen() {
        let vc = AppScreenViewController()
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey:nil)
        self.navigationController?.pushViewController(vc, animated: false)

    }
    
    func openControlCenter() {
        let vc = ControlCenterViewController()
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController?.view.layer.add(transition, forKey: nil)
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.removeFromSuperview()
        view = nil
    }
    
    public func openApp(nodeName: String) {
        let vc = ComplicationAppView()
        vc.currentScene = nodeName
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController?.view.layer.add(transition, forKey: nil)
        
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    
   
}
