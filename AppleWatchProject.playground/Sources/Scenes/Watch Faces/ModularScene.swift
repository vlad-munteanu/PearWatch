import SpriteKit

public var currentTimeZone = "nyc"
public class ModularScene : SKScene {
    
     weak var myAppDelegate: OpenAppDelegate?
    
    //Date
    let dateTitle = SKDateLabel(top: true)
    let dateSubtitle = SKDateLabel(top: false)
    
    //Main Time
    let hoursText = SKLabelNode()
    let minsText = SKLabelNode()
    let bColon = SKBlinkingColon()
    var minus = false
    
    var randNum = 0.0
    
    
    //CountDown
    let countdownTitle = SKLabelNode()
    let countdownText = SKCountDownLabel()
    
    //Activity
    let musicAppComp = SKSpriteNode(imageNamed: "music-player.png")
    
    //Time
    let worldClockTitle = SKLabelNode()
    let worldHoursText = SKLabelNode()
    let worldMinsText = SKLabelNode()
    let bbColon = SKBlinkingColon()
    
    //Sunset
    let sunImage = SKSunComp(rising: DateTimeFormat.isSunRising())
    let sunLabel = SKSunLabel(rising: DateTimeFormat.isSunRising())
    
    override public func didMove(to view: SKView) {
        setupNonCustomSprites()
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        hoursText.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        hoursText.fontName = "HelveticaNeue"
        hoursText.fontSize = 110.0
        hoursText.text = DateTimeFormat.getHour()
        hoursText.position = CGPoint(x:size.width - 255, y: size.height * 0.75)
        addChild(hoursText)
        
        bColon.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bColon.fontSize = 110.0
        bColon.position = CGPoint(x: size.width - 180 , y: size.height * 0.75)
        addChild(bColon)
        
        minsText.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        minsText.fontName = "HelveticaNeue"
        minsText.fontSize = 110.0
        minsText.text = DateTimeFormat.getMinute()
        minsText.position = CGPoint(x: size.width - 105, y: size.height * 0.75)
        addChild(minsText)
       
        dateTitle.position = CGPoint(x: 90, y: size.height * 0.83 )
        dateTitle.name = "cal"
        addChild(dateTitle)
        
      
        dateSubtitle.position = CGPoint(x: 90, y: size.height * 0.73)
        dateSubtitle.name = "cal"
        addChild(dateSubtitle)
        
        countdownText.position = CGPoint(x: 226, y: size.height * 0.42 )
        countdownText.name = "countdown"
        addChild(countdownText)
    
      
        if sunLabel.sunRising == true {
            sunImage.position = CGPoint(x: 447, y: size.height * 0.23 )
        } else  {
            sunImage.position = CGPoint(x: 450, y: size.height * 0.23)
        }
        
        addChild(sunImage)
        
        sunLabel.position = CGPoint(x: 445, y: size.height * 0.08)
        addChild(sunLabel)
        
        setUpWorldClock()
    }
    
    func setUpWorldClock() {
        
        worldClockTitle.fontName = "HelveticaNeue-Medium"
        worldClockTitle.fontSize = 50.0
        worldClockTitle.fontColor = #colorLiteral(red: 1, green: 0.5865499377, blue: 0, alpha: 1)
        
        worldClockTitle.position = CGPoint(x: 260, y: size.height * 0.19)
        worldClockTitle.name = "worldClock"
        
        
        worldHoursText.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        worldHoursText.fontName = "HelveticaNeue"
        worldHoursText.fontSize = 52.0
       
        worldHoursText.position = CGPoint(x:213, y: size.height * 0.08)
        worldHoursText.name = "worldClock"
        
        
        bbColon.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bbColon.fontSize = 52.0
        bbColon.position = CGPoint(x: 250 , y: size.height * 0.08)
        bbColon.name = "worldClock"
        
        
        worldMinsText.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        worldMinsText.fontName = "HelveticaNeue"
        worldMinsText.fontSize = 52.0
        
        worldMinsText.position = CGPoint(x: 290, y: size.height * 0.08)
        worldMinsText.name = "worldClock"
        
        if currentTimeZone == "nyc" {
            worldClockTitle.text = "NYC"
            worldHoursText.text = DateTimeFormat.getHourInNYC()
            worldMinsText.text = DateTimeFormat.getMinuteInNYC()
        } else if currentTimeZone == "LosAngeles" {
            worldClockTitle.text = "LA"
            worldHoursText.text = DateTimeFormat.getHourInWorld(zone: "LosAngeles")
            worldMinsText.text = DateTimeFormat.getMinuteInWorld(zone: "LosAngeles")
        } else if currentTimeZone == "Lima" {
            worldClockTitle.text = "Lima"
            worldHoursText.text = DateTimeFormat.getHourInWorld(zone: "Lima")
            worldMinsText.text = DateTimeFormat.getMinuteInWorld(zone: "Lima")
        } else if currentTimeZone == "ams" {
            worldClockTitle.text = "AMS"
            worldHoursText.text = DateTimeFormat.getHourInWorld(zone: "ams")
            worldMinsText.text = DateTimeFormat.getMinuteInWorld(zone: "ams")
        }
        
        addChild(worldMinsText)
        addChild(worldClockTitle)
        addChild(worldHoursText)
        addChild(bbColon)
        
    }
    
    func setupNonCustomSprites() {
        countdownTitle.fontName = "HelveticaNeue-Medium"
        countdownTitle.fontSize = 42.0
        countdownTitle.fontColor = #colorLiteral(red: 0.3276104331, green: 0.3677076101, blue: 0.9477472901, alpha: 1)
        countdownTitle.text = "WWDC Countdown"
        countdownTitle.position = CGPoint(x: 225, y: size.height * 0.55 )
        countdownTitle.name = "countdown"
        addChild(countdownTitle)
        
        musicAppComp.size = CGSize(width: 110 , height: 110)
        musicAppComp.position = CGPoint(x: 80, y: size.height * 0.15 )
        musicAppComp.name = "music"
        addChild(musicAppComp)
    
        
    }
    
    //TODO: Fix transitions to new scenes
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
           myAppDelegate?.openApp(nodeName: name)
        }
    }
    
    override public func update(_ currentTime: TimeInterval) {
        hoursText.text = DateTimeFormat.getHour()
        minsText.text = DateTimeFormat.getMinute()
        
        worldHoursText.text = DateTimeFormat.getHourInWorld(zone: currentTimeZone)
        worldMinsText.text = DateTimeFormat.getMinuteInWorld(zone: currentTimeZone)
        
        makeColonBlink()
    }
    
    func makeColonBlink() {
        
        if minus == false {
            if(randNum >= 1.0) {
                minus = true
            } else {
                randNum += 0.03
            }
        } else {
            if randNum >= 0 {
                randNum -= 0.03
            } else {
                minus = false
            }
        }
        bColon.alpha = CGFloat(randNum)
        bbColon.alpha = CGFloat(randNum)
        
        
    }
}

extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}
