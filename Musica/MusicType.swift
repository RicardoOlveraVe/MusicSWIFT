import UIKit

enum MusicType {
    case ellaSeFue, morire, agarrala, morena, rehuso
    
    var captionedSong: [CaptionedMusic] {
        switch self {
        case .ellaSeFue: return [
            CaptionedMusic(image: .ellaSeFue, name: "Ella se fue", artist: "KintoSol", song: "ellaSeFue", songType: .ellaSeFue)
        ]
        case .morire: return [
            CaptionedMusic(image: .morire, name: "Moriré", artist: "La Factoria", song: "morire", songType: .morire)
        ]
        case .agarrala: return [
            CaptionedMusic(image: .agarrala, name: "Agarrala", artist: "Trebol Clan", song: "agarrala", songType: .agarrala)
        ]
        case .morena: return [
            CaptionedMusic(image: .morena, name: "Baila Morena", artist: "Hector y Tito", song: "morena", songType: .morena)
        ]
        case .rehuso: return [
            CaptionedMusic(image: .rehuso, name: "Me rehuso", artist: "Danny Ocean", song: "rehuso", songType: .rehuso)
        ]
        }
    }
    
}
