import UIKit

enum SongType {
    case song
    
    var captionedMusic: [CaptionedMusic] {
        switch self {
        case .song: return [
            CaptionedMusic(image: .ellaSeFue, name: "Ella se fue", artist: "KintoSol", song: "ellaSeFue", songType: .ellaSeFue),
            CaptionedMusic(image: .ellaSeFue, name: "Ella se fue", artist: "KintoSol", song: "ellaSeFue", songType: .ellaSeFue),
            CaptionedMusic(image: .ellaSeFue, name: "Ella se fue", artist: "KintoSol", song: "ellaSeFue", songType: .ellaSeFue),
            CaptionedMusic(image: .ellaSeFue, name: "Ella se fue", artist: "KintoSol", song: "ellaSeFue", songType: .ellaSeFue),
            
            CaptionedMusic(image: .morire, name: "Moriré", artist: "La Factoria", song: "morire", songType: .morire)
        ]
        }
        
    }
}
