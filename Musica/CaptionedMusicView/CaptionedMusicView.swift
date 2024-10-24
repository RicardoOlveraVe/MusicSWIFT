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
            play.stop()
            image.image = captionedMusic.image
            caption.text = captionedMusic.name
            artist.text = captionedMusic.artist
            songName = captionedMusic.song
            typeSong = captionedMusic.songType
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
        play.stop()
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
        guard let parentViewController = self.parentViewController else {
            print("Error: No se puede obtener el controlador de vista padre.")
            return
        }
        let musicViewController = MusicViewController(nibName: "MusicViewController", bundle: nil)
        let musicNavigationController = UINavigationController(rootViewController: musicViewController)
        musicViewController.musicType = typeSong
        parentViewController.present(musicNavigationController, animated: true, completion: nil)
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            responder = responder?.next
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
