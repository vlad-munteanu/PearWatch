
import SpriteKit
import AVFoundation

public class MusicApp: SKScene {
    
    let mainTime = SKTimeLabel(fontsizeNum: 40.0)
    let rightHandLabel = SKLabelNode()
    var myAudioPlayer = AVAudioPlayer()
    
    override public func didMove(to view: SKView) {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setupView()
        setUpTitle()
    }
    
    func setUpTitle() {
        rightHandLabel.fontName = "HelveticaNeue-Medium"
        rightHandLabel.fontSize = 40.0
        rightHandLabel.fontColor = #colorLiteral(red: 1, green: 0, blue: 0.03624573524, alpha: 1)
        rightHandLabel.text = "Music"
        rightHandLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        rightHandLabel.position = CGPoint(x: 40, y: size.height * 0.9)
        rightHandLabel.name = "Stop"
        addChild(rightHandLabel)
        
        mainTime.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        mainTime.position = CGPoint(x: 430 , y: size.height * 0.9)
        mainTime.fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addChild(mainTime)
    }
    
    func setupView() {
        let frankStan = SKSpriteNode(imageNamed: "FrankStan.png")
       
        frankStan.position = CGPoint(x: size.width/2, y: size.height*0.75)
        frankStan.size = CGSize(width: size.width , height: 110)
        frankStan.name = "Frank_C_Stanley_-_08_-_When_The_Mockingbirds_Are_Singing_In_The_Wildwood"
        addChild(frankStan)
        
        let merryCHrist = SKSpriteNode(imageNamed: "MerryChrist.png")
        
        merryCHrist.position = CGPoint(x: size.width/2, y: size.height*0.55)
        merryCHrist.name = "United_States_Marine_Band_-_We_Wish_You_a_Merry_Christmas"
        merryCHrist.size = CGSize(width: size.width , height: 110)
        addChild(merryCHrist)
        
        let cmajor = SKSpriteNode(imageNamed: "CMajor.png")
        
        cmajor.position = CGPoint(x: size.width/2, y: size.height*0.35)
        cmajor.name = "Aaron_Dunn_-_Sonatina_No_1_in_C_Major_-_I_Allegro"
        cmajor.size = CGSize(width: size.width , height: 110)
        addChild(cmajor)
        
        let walkDog = SKSpriteNode(imageNamed: "WalkDog.png")
      walkDog.size = CGSize(width: size.width , height: 110)
        walkDog.position = CGPoint(x: size.width/2, y: size.height*0.15)
        walkDog.name = "US_Army_Blues_-_11_-_Walk_That_Dog"
        addChild(walkDog)
        
//        let stopPlaying = SKLabelNode()
//        stopPlaying.fontName = "HelveticaNeue-Medium"
//        stopPlaying.fontSize = 42.0
//        stopPlaying.fontColor = #colorLiteral(red: 0.9477472901, green: 0.02290730933, blue: 0, alpha: 1)
//        stopPlaying.text = "Stop Playing"
//        stopPlaying.position = CGPoint(x: 0, y: size.height * 0.9)
//        stopPlaying.name = "stop"
//        stopPlaying.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
//        addChild(stopPlaying)
    }
    
    override public func update(_ currentTime: TimeInterval) {
        mainTime.text = DateTimeFormat.getTime()
    }
    
    //TODO: Fix transitions to new scenes
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
//            var song = NSURL(fileURLWithPath: Bundle.main.pathForResource(forResource: "\(name)", ofType: "mp3")!)
//            var songPlayer = AVAudioPlayer(contentsOfURL: song, error: nil)
//            songPlayer.prepareToPlay()
//            songPlayer.play()
            
            if name == "stop" {
                
            } else {
                 playSong(song: name)
            }
        }
    }
    
    func playSong(song: String) {
        let audioFileURL = Bundle.main.url(forResource: "\(song)", withExtension: "mp3")
        
        do {
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print(error)
            }
            
            myAudioPlayer = try AVAudioPlayer(contentsOf: audioFileURL!)
        } catch let error {
            print(error.localizedDescription)
        }
        
        myAudioPlayer.play()
    }
    
}
