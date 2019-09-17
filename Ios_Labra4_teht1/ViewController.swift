//
//  ViewController.swift
//  Ios_Labra4_teht1
//
//  Created by Saku Huuha on 17/09/2019.
//  Copyright © 2019 Saku Huuha. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            imageView1.image = UIImage(named: "bear.jpg")
            imageView2.image = UIImage(named: "elephant.jpg")
            imageView3.image = UIImage(named: "lamb.jpg")
            imageView4.image = UIImage(named: "wolf.jpg")
        case 1:
            imageView1.image = UIImage(named: "huuhkaja.jpg")
            imageView2.image = UIImage(named: "peippo.jpg")
            imageView3.image = UIImage(named: "peukaloinen.jpg")
            imageView4.image = UIImage(named: "punatulkku.jpg")
        default:
            break
        }
    }
    
    @objc func tapDetected(sender: UITapGestureRecognizer){
        var animal: String?
        var fileType: String?
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            fileType = "wav"
            if sender.view == imageView1 {
                animal = "bear"
            }
            else if sender.view == imageView2 {
                animal = "elephant"
            }
            else if sender.view == imageView3 {
               animal = "lamb"
            }
            else if sender.view == imageView4 {
                animal = "wolf"
            }

        case 1:
            fileType = "mp3"
            if sender.view == imageView1 {
                animal = "huuhkaja_norther_eagle_owl"
            }
            else if sender.view == imageView2 {
                animal = "peippo_chaffinch"
            }
            else if sender.view == imageView3 {
                animal = "peukaloinen_wren"
            }
            else if sender.view == imageView4 {
                animal = "punatulkku_northern_bullfinch"
            }

        default:
            break
        }
        do {
            if let fileURL = Bundle.main.path(forResource: animal , ofType: fileType) {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                audioPlayer?.play()
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        singleTap1.numberOfTapsRequired = 1
        imageView1.isUserInteractionEnabled = true
        imageView1.addGestureRecognizer(singleTap1)
        
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        singleTap2.numberOfTapsRequired = 1
        imageView2.isUserInteractionEnabled = true
        imageView2.addGestureRecognizer(singleTap2)
        
        let singleTap3 = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        singleTap3.numberOfTapsRequired = 1
        imageView3.isUserInteractionEnabled = true
        imageView3.addGestureRecognizer(singleTap3)
        
        let singleTap4 = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        singleTap4.numberOfTapsRequired = 1
        imageView4.isUserInteractionEnabled = true
        imageView4.addGestureRecognizer(singleTap4)
        
        imageView1.image = UIImage(named: "bear.jpg")
        imageView2.image = UIImage(named: "elephant.jpg")
        imageView3.image = UIImage(named: "lamb.jpg")
        imageView4.image = UIImage(named: "wolf.jpg")
        
        // Do any additional setup after loading the view.
    }


}

