import UIKit
import AVFoundation

class MusicViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var resDuration: UILabel!
    @IBOutlet weak var slideDuration: UISlider!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var nextSong: UIButton!
    @IBOutlet weak var backSong: UIButton!
    @IBOutlet weak var playSong: UIButton!
    
    var play = AVAudioPlayer()
    
    var musicType: MusicType!
    var nameSong: String!
    var durationSong: TimeInterval!
    var statusPlay: Bool = true
    var timer = Timer()
    
    override func viewDidLoad() {
        play.stop()
        super.viewDidLoad()
        sessionAudio()
        play.delegate = self
        captionedMusic()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        play.stop()
    }
    
    private func sessionAudio() {
        // Configurar la sesión de audio
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error setting audio session category: \(error)")
        }
    }
    
    @objc private func updateTime() {
        slideDuration.value = Float(play.currentTime)
        let minutes = Int(play.currentTime) / 60
        let seconds = Int(play.currentTime) % 60
        resDuration.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func captionedMusic() {
        play.stop()
        let captionedSong = musicType.captionedSong
        nameSong = captionedSong[0].song
        songImage.image = captionedSong[0].image
        songName.text = captionedSong[0].name
        playSong.setImage( UIImage(systemName: "pause.fill") , for: .normal)
        song()
        slideDuration.maximumValue = Float(durationSong)
        play.play()
    }
    
    private func song() {
        
        if let audioPath = Bundle.main.path(forResource: nameSong, ofType: "MP3") {
            do {
                play = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                durationSong = play.duration
                play.delegate = self
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
    
    private func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopClick() {
        statusPlay = !statusPlay
        if statusPlay == true {
            play.play()
            startTimer()
            playSong.setImage( UIImage(systemName: "pause.fill") , for: .normal)
        } else{
            play.pause()
            playSong.setImage( UIImage(systemName: "play.fill") , for: .normal)
            timer.invalidate()        }
    }
    
    @IBAction func nextClick() {
        play.stop()
        songNext()
    }
    
    @IBAction func backClick() {
        play.stop()
        songBack()
    }
    
    @IBAction func timeSlide(_ sender: UISlider) {
        play.currentTime = TimeInterval(Float(sender.value))
    }
    
    private func songNext() {
        if musicType == .ellaSeFue{
            musicType = .agarrala
        }else if musicType == .agarrala{
            musicType = .morena
        }else if musicType == .morena{
            musicType = .rehuso
        }else if musicType == .rehuso{
            musicType = .morire
        }else{
            musicType = .ellaSeFue
        }
        captionedMusic()
    }
    
    private func songBack() {
        if musicType == .ellaSeFue{
            musicType = .morire
        }else if musicType == .morire{
            musicType = .rehuso
        }else if musicType == .rehuso{
            musicType = .morena
        }else if musicType == .morena{
            musicType = .agarrala
        }else{
            musicType = .ellaSeFue
        }
        captionedMusic()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            songNext()
        }
    }
}
