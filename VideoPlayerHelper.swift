//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Florent on 16/10/2020.
//

import AVKit
import Foundation


var video: AVPlayer?

func playVideo(filename: String, fileFormat: String) -> AVPlayer {
    
    if Bundle.main.url(forResource: filename, withExtension: fileFormat) != nil {
        video = AVPlayer(url: Bundle.main.url(forResource: filename, withExtension: fileFormat)!)
        video?.play()
    }
    
    return video!
}

 

