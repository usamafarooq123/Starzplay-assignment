//
//  VideoPlayer.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 22/09/2024.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayer: UIViewController {
    
    var player: AVPlayer?
    var playerViewController: AVPlayerViewController?
    
    // Initialize the class with a video URL
    init(videoURL: URL) {
        super.init(nibName: nil, bundle: nil)
        setupPlayer(url: videoURL)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Set up the player with the provided URL
    private func setupPlayer(url: URL) {
        player = AVPlayer(url: url)
        playerViewController = AVPlayerViewController()
        playerViewController?.player = player
    }
    
    // Present the player view controller when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let playerVC = playerViewController else { return }
        
        // Present the video player full-screen
        playerVC.view.frame = self.view.bounds
        self.addChild(playerVC)
        self.view.addSubview(playerVC.view)
        playerVC.didMove(toParent: self)
    }
    
    // Play the video when the view appears
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player?.play()
    }
}

