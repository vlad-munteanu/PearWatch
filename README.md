# PearWatch
My submission for WWDC Scholarship, a lightweight recreation of watchOS using Swift Playgrounds. Didn't end up getting choosen for a scholarship. 

![alt text](https://github.com/vlad-munteanu/PearWatch/blob/master/bg.png)


## Main Idea
I have always been fascinated by operating systems, especially watchOS since it was the first wearable OS that was consumer ready. I took this opportunity to be a "pseudo-OS" designer and made a simple watchOS recreation with 6 watch faces and 6 apps.

## Controls
```
Open playground in Full Live View to use.
```

- To view all the apps, simply swipe down from the watch face scene.
- To change the watch face, swipe up to reveal the watch face menu.
- To exit an app, swipe up.

## How it was Made
I used SpriteKit as the underlying library to build the UI, as I come from a background of game development. All the scenes are controlled by four main view controllers, all of which are in a navigation controller that has a hidden navigation and toolbar. A navigation controller was used as it was the most memory efficent means to support the constant switching of views in this project.

```
This Playground was made to be run on iPads, but it can also be run in XCode by changing the iPadVers variable to false. However, the project runs best on Swift Playgrounds for iPad.
```
