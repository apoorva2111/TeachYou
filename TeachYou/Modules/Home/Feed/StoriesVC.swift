//
//  StoriesVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 08/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import CoreMedia
import Alamofire

class StoriesVC: UIViewController, SegmentedProgressBarDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var videoView: UIView!
    
    var pageIndex : Int = 0
    var items: [StoriesItems] = []
    //    var item: [StoryData] = []
    var SPB: SegmentedProgressBar!
    let loader = ImageLoader()
    var player : AVPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStories()
        
    }
    
    
    func getStories() {
        
        self.SPB = SegmentedProgressBar(numberOfSegments: self.items.count, duration: 5)
        if #available(iOS 11.0, *) {
            self.SPB.frame = CGRect(x: 18, y: UIApplication.shared.statusBarFrame.height + 35, width: self.view.frame.width - 5, height: 3)
        } else {
            // Fallback on earlier versions
            self.SPB.frame = CGRect(x: 18, y: 15, width: self.view.frame.width - 35, height: 3)
        }
        
        self.SPB.delegate = self
        self.SPB.topColor = UIColor.white
        self.SPB.bottomColor = UIColor.white.withAlphaComponent(0.25)
        self.SPB.padding = 2
        self.SPB.isPaused = true
        self.SPB.currentAnimationIndex = 0
        self.SPB.duration = self.getDuration(at: 0)
        self.view.addSubview(self.SPB)
        self.view.bringSubviewToFront(self.SPB)
        
        let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(self.tapOn(_:)))
        tapGestureImage.numberOfTapsRequired = 1
        tapGestureImage.numberOfTouchesRequired = 1
        self.imagePreview.addGestureRecognizer(tapGestureImage)
        
        let tapGestureVideo = UITapGestureRecognizer(target: self, action: #selector(self.tapOn(_:)))
        tapGestureVideo.numberOfTapsRequired = 1
        tapGestureVideo.numberOfTouchesRequired = 1
        self.videoView.addGestureRecognizer(tapGestureVideo)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.8) {
            self.view.transform = .identity
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.SPB.startAnimation()
            self.playVideoOrLoadImage(index: 0)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        DispatchQueue.main.async {
            self.SPB.currentAnimationIndex = 0
            self.SPB.cancel()
            self.SPB.isPaused = true
            self.resetPlayer()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - SegmentedProgressBarDelegate
    //1
    func segmentedProgressBarChangedIndex(index: Int) {
        playVideoOrLoadImage(index: index)
    }
    
    //2
    func segmentedProgressBarFinished() {
        if pageIndex == 0 {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            ContentViewControllerVC.goNextPage(fowardTo: pageIndex + 1)
        }
    }
    
    @objc func tapOn(_ sender: UITapGestureRecognizer) {
        SPB.skip()
    }
    
    //MARK: - Play or show image
    func playVideoOrLoadImage(index: NSInteger) {
        if items[index].type == "photo" {
            self.SPB.duration = 5
            self.imagePreview.isHidden = false
            self.videoView.isHidden = true
            self.imagePreview.sd_setImage(with: URL(string: items[index].src ?? ""), placeholderImage: UIImage())
        } else {
            self.imagePreview.isHidden = true
            self.videoView.isHidden = false
            resetPlayer()
            guard let url = NSURL(string: items[index].src ?? "") as URL? else {return}
            self.player = AVPlayer(url: url)
            
            let videoLayer = AVPlayerLayer(player: self.player)
            videoLayer.frame = view.bounds
            videoLayer.videoGravity = .resizeAspect
            self.videoView.layer.addSublayer(videoLayer)
            
            let asset = AVAsset(url: url)
            let duration = asset.duration
            let durationTime = CMTimeGetSeconds(duration)
            
            self.SPB.duration = durationTime
            self.player?.play()
        }
    }
    
    // MARK: Private func
    private func getDuration(at index: Int) -> TimeInterval {
        return 5.0
    }
    
    private func resetPlayer() {
        if player != nil {
            player?.pause()
            player?.replaceCurrentItem(with: nil)
            player = nil
        }
    }
    
    //MARK: - Button actions
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension StoriesVC {
    @IBAction func backScreenNavigator(_ sender: UIButton) {
        self.resetPlayer()
        self.navigationController?.popViewController(animated: true)
    }
    
}
