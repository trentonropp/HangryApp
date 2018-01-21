//
//  ViewController.swift
//  HangryApp
//
//  Created by Trenton Ropp on 1/19/18.
//  Copyright © 2018 Trenton and Lauren. All rights reserved.
//

import UIKit
//import Alamofire
import AVFoundation

class ViewController: UIViewController , AVAudioRecorderDelegate, AVAudioPlayerDelegate {

    var timer = Timer()
    
    var recordingSession : AVAudioSession!
    var audioRecorder    :AVAudioRecorder!
    var settings         = [String : Int]()
    
    var audioPlayer : AVAudioPlayer!
    
    @IBOutlet weak var GradBack2: UIImageView!
    @IBOutlet weak var Mic1: UIImageView!
    @IBOutlet weak var NowListening: UIImageView!
    @IBOutlet weak var ListeningHolder: UIView!
    @IBOutlet weak var GradBack1: UIImageView!
    @IBOutlet weak var PowerButton: UIButton!
    @IBOutlet weak var ImFeeling: UIImageView!
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var Mic2: UIImageView!
    @IBOutlet weak var Mic3: UIImageView!
    @IBOutlet weak var StopButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
   
            recordingSession = AVAudioSession.sharedInstance()
            do {
                try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                try recordingSession.setActive(true)
                recordingSession.requestRecordPermission() { [unowned self] allowed in
                    DispatchQueue.main.async {
                        if allowed {
                            print("Allow")
                        } else {
                            print("Dont Allow")
                        }
                    }
                }
            } catch {
                print("failed to record!")
            }
            
            // Audio Settings
            
            settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func directoryURL() -> NSURL? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = urls[0] as NSURL
        let soundURL = documentDirectory.appendingPathComponent("sound.m4a")
        print(soundURL)
        return soundURL as NSURL?
    }

    
    
    @IBAction func PowerButton(_ sender: Any) {
        ListeningHolder.isHidden = false
        GradBack1.isHidden = true
        PowerButton.isHidden = true
        ImFeeling.isHidden = true
        Logo.isHidden = true
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            audioRecorder = try AVAudioRecorder(url: self.directoryURL()! as URL,
                                                settings: settings)
            audioRecorder.delegate = self
            audioRecorder.prepareToRecord()
        } catch {
            finishRecording(success: false)
        }
        do {
            try audioSession.setActive(true)
            audioRecorder.record()
        } catch {
        }
        
        
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.sayHello), userInfo: nil, repeats: true)
        }
    
    var i = 1;
    @objc func sayHello()
    {
        if(i==1){
        self.Mic1.isHidden = false
        self.Mic2.isHidden = true
        self.Mic3.isHidden = true
        }
            
        else if (i==2){
            self.Mic1.isHidden = true
            self.Mic2.isHidden = false
            self.Mic3.isHidden = true
        }
        else {
            self.Mic1.isHidden = true
            self.Mic2.isHidden = true
            self.Mic3.isHidden = false
        }
        i = i + 1
        if(i==4){
            i=1
        }
    }
   
    @IBAction func StopButton(_ sender: Any) {
    self.finishRecording(success: true)
        
        if !audioRecorder.isRecording {
            self.audioPlayer = try! AVAudioPlayer(contentsOf: audioRecorder.url)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.delegate = self
            self.audioPlayer.play()
            
              
            
                    
                
                
            
        }
    }
    
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        if success {
            print(success)
            
        } else {
            audioRecorder = nil
            print("Somthing Wrong.")
        }
    }
    
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    @IBAction func doPlay(_ sender: AnyObject) {
        if !audioRecorder.isRecording {
            self.audioPlayer = try! AVAudioPlayer(contentsOf: audioRecorder.url)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.delegate = self
            self.audioPlayer.play()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(flag)
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?){
        print(error.debugDescription)
    }
    internal func audioPlayerBeginInterruption(_ player: AVAudioPlayer){
        print(player.debugDescription)
    }
    




   

}
