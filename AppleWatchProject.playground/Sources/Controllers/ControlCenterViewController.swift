import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport


public class ControlCenterViewController: UIViewController, WatchFaceDelegate {
    

    //current View
    let ccView = MainView()
    //res
    let resolution = CGSize(width: Constants.resolution.width, height: Constants.resolution.height)
    
    public override func loadView() {
        if iPadVers == false {
            ccView.mainView.frame = CGRect(origin: CGPoint.zero, size: resolution)
        } else {
            ccView.mainView.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width * 0.2 , y: 0), size: resolution)
        }
        self.view = ccView
        ccView.translatesAutoresizingMaskIntoConstraints = false
        
    }
  
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        let scene = ControlCenterScene(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
        scene.scaleMode =  .resizeFill
        scene.myWFDelegate = self
        ccView.mainView.presentScene(scene)
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(goBackToWatchFace))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        ccView.addGestureRecognizer(swipeDown)
    }
    
    @objc func goBackToWatchFace() {
       closeView()
    }
    
    func switchWatchFace(watchFace: String) {
      
        if watchFace == "mod" {
            currentWFIndex = 0
        } else if watchFace == "pride" {
           currentWFIndex = 1
        } else if watchFace == "earth" {
            currentWFIndex = 2
        } else if watchFace == "large" {
            currentWFIndex = 3
        } else if watchFace == "photo" {
            currentWFIndex = 4
        } else if watchFace == "number" {
            currentWFIndex = 5
        }
       closeView()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.removeFromSuperview()
        view = nil
    }
    
    func closeView() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey:nil)
        
        self.navigationController?.popViewController(animated: false)
    }
   
}
