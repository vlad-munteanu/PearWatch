import UIKit
import SpriteKit
import GameplayKit


public class ComplicationAppView: UIViewController {
    
    //current View
    let currentView = MainView()
    //res
    let resolution = CGSize(width: Constants.resolution.width, height: Constants.resolution.height)
    //scene
    var currentScene = ""
    
    public override func loadView() {
        if iPadVers == false {
            currentView.mainView.frame = CGRect(origin: CGPoint.zero, size: resolution)
        } else {
            currentView.mainView.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width * 0.2 , y: 0), size: resolution)
        }
        self.view = currentView
        currentView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        var scene = SKScene()
     
        if currentScene == "worldClock" {
            scene = WorldClockApp(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
        
        } else if currentScene == "music" {
            scene = MusicApp(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
        } else if currentScene == "countdown" {
            scene = WWDCCountdownApp(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
        } else if currentScene == "cal" {
            scene = CalendarApp(size: CGSize(width: Constants.resolution.width, height: Constants.resolution.height))
        }
        
        let transition = SKTransition.fade(withDuration: 2.5)
        currentView.mainView.presentScene(scene, transition: transition)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(goBackToWatchFace))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        currentView.addGestureRecognizer(swipeUp)
    }
    
    @objc func goBackToWatchFace() {
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
