import UIKit
import AVFoundation

class MusicViewController: UIViewController {
    
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var resDuration: UILabel!
    @IBOutlet weak var slideDuration: UISlider!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var nextSong: UIButton!
    @IBOutlet weak var backSong: UIButton!
    @IBOutlet weak var playSong: UIButton!
    
    var play = AVAudioPlayer()
    
    var musicType: MusicType = .morire
    var nameSong: String!
    var durationSong: TimeInterval!
    var statusPlay: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionedMusic()
        play.play()
    }
    
    private func captionedMusic() {
        let captionedSong = musicType.captionedSong
        nameSong = captionedSong[0].song
        songImage.image = captionedSong[0].image
        songName.text = captionedSong[0].name
        playSong.setImage( UIImage(systemName: "pause.fill") , for: .normal)
        song()
    }
    
    private func song() {
        
        if let audioPath = Bundle.main.path(forResource: nameSong, ofType: "MP3") {
            do {
                play = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                durationSong = play.duration
                play.prepareToPlay()
                let minutes = Int(durationSong) / 60
                let seconds = Int(durationSong) % 60
                duration.text = String(format: "%02d:%02d", minutes, seconds)
            } catch {
                print("Error loading audio file:", error)
            }
        } else {
            print("Audio file not found.")
        }
    }
    @IBAction func stopClick() {
        statusPlay = !statusPlay
        if statusPlay == true {
            play.play()
            playSong.setImage( UIImage(systemName: "pause.fill") , for: .normal)
        } else{
            play.stop()
            playSong.setImage( UIImage(systemName: "play.fill") , for: .normal)
        }
    }
    
    @IBAction func nextClick() {
        if musicType == .morire{
            musicType = .ellaSeFue
        }else {
            musicType = .morire
        }
    }
}
