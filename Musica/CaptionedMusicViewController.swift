import UIKit
import AVFoundation

class CaptionedMusicView: UIView {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var btn: UIButton!

    var play = AVAudioPlayer()
    
    var duration: Any!
    var songName: String!
    var typeSong:MusicType!
    
    var captionedMusic: CaptionedMusic! {
        didSet {
            image.image = captionedMusic.image
            caption.text = captionedMusic.name
            artist.text = captionedMusic.artist
            songName = captionedMusic.song
            typeSong = captionedMusic.type
            btn.setImage( UIImage(systemName: "play.fill") , for: .normal)
            song()
        }
    }

    var showCaption: Bool = true {
        didSet {
            caption.isHidden = !showCaption
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWithBundle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWithBundle()

    }
    
    private func song() {
                
                if let audioPath = Bundle.main.path(forResource: songName, ofType: "MP3") {
                    do {
                        play = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                        duration = play.duration
                        play.prepareToPlay()
                    } catch {
                        print("Error loading audio file:", error)
                    }
                } else {
                    print("Audio file not found.")
                }
        
    }
    
    private func setupWithBundle() {
        guard let view = Bundle.main.loadNibNamed("CaptionedMusicView", owner: self)?.first as? UIView else { return }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    @IBAction func playClick(_ sender: Any){
        let musicViewController = MusicViewController (nibName: nil, bundle: nil)
        musicViewController.musicType = typeSong
        navigationController?.pushViewController(musicViewController, animated: true)
    }
    
    
}
