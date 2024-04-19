import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var captionedSong: CaptionedMusicView!
    
    var songType: SongType = .song
    
    override func viewDidLoad() {
        super.viewDidLoad()
setSong()
        // Do any additional setup after loading the view.
    }
    
    private func setSong() {
        let captionedSongs = songType.captionedMusic
        
        for captionedMusic in captionedSongs {
                    let captionedMusicView = CaptionedMusicView()
            captionedMusicView.captionedMusic = captionedMusic
                    (captionedSong.superview as? UIStackView)?.addArrangedSubview(captionedMusicView)
                }
        if let firstSongView = (captionedSong.superview as? UIStackView)?.arrangedSubviews.first as? CaptionedMusicView {
            firstSongView.isHidden = true
        }
    }

}