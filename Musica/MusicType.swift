import UIKit

enum MusicType {
    case ellaSeFue, morire
    
    var captionedSong: [CaptionedMusic] {
        switch self {
        case .ellaSeFue: return [
            CaptionedMusic(image: .ellaSeFue, name: "Ella se fue", artist: "KintoSol", song: "ellaSeFue", songType: .ellaSeFue)
        ]
        case .morire: return [
            CaptionedMusic(image: .morire, name: "Moriré", artist: "La Factoria", song: "morire", songType: .morire)
        ]
        }
    }
    
}
