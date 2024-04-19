import UIKit

enum SongType {
    case song
    
    var captionedMusic: [CaptionedMusic] {
        switch self {
        case .song: return [
            CaptionedMusic(image: .ellaSeFue, name: "Ella se fue", artist: "KintoSol", song: "ellaSeFue", songType: .ellaSeFue),
            CaptionedMusic(image: .agarrala, name: "Agarrala", artist: "Trebol Clan", song: "agarrala", songType: .agarrala),
            CaptionedMusic(image: .morena, name: "Baila Morena", artist: "Hector y Tito", song: "morena", songType: .morena),
            CaptionedMusic(image: .rehuso, name: "Me Rehuso", artist: "Danny Ocean", song: "rehuso", songType: .rehuso),
            
            CaptionedMusic(image: .morire, name: "Moriré", artist: "La Factoria", song: "morire", songType: .morire)
        ]
        }
        
    }
}
