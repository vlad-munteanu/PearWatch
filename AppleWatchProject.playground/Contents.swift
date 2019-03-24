/*:
 
 # Pear Watch
 ### A lightweight recreation of watchOS using Swift Playgrounds.
 
 Created By [Vlad Munteanu](https://github.com/vlad-munteanu)
 
 - note:
 Open playground in Full Live View.

 
 ## Main Idea
 I have always been fascinated by operating systems, especially watchOS since it was the first wearable OS that was consumer ready. I took this opportunity to be a "pseudo-OS" designer and made a simple watchOS recreation with 6 watch faces and 6 apps.

 
 ## Controls
 - To view all the apps, simply swipe down from the watch face scene.
 - To change the watch face, swipe up to reveal the watch face menu.
 - To exit an app, swipe up.
 
 ## How it was Made
 I used SpriteKit as the underlying library to build the UI, as I come from a background of game development. All the scenes are controlled by four main view controllers, all of which are in a navigation controller that has a hidden navigation and toolbar. A navigation controller was used as it was the most memory efficent means to support the constant switching of views in this project.
 
 
 
 - note:
 This Playground was made to be run on iPads, but it can also be run in XCode by changing the iPadVers variable to false. However, the project runs best on Swift Playgrounds for iPad.
 
 */


import UIKit
import PlaygroundSupport
import SpriteKit



//Running on iPad or No
iPadVers = true

let vc = MainViewController()
let nav = UINavigationController(rootViewController: vc)
vc.preferredContentSize = CGSize(width: Constants.resolution.width, height: Constants.resolution.height)

firstBoot = true
nav.isNavigationBarHidden = true

//Set the forground as the live view
PlaygroundPage.current.liveView = nav
PlaygroundPage.current.needsIndefiniteExecution = true

DispatchQueue.main.asyncAfter(deadline: .now()  + 5.0) {
    vc.checkWhatScene()
    firstBoot = false
}





