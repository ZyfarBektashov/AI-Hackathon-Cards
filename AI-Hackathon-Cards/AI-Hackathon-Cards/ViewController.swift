//
//  ViewController.swift
//  AI-Hackathon-Cards
//
//  Created by Z on 14.03.2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordTableView: UITableView!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPalyer: AVAudioPlayer!
    var numberOfRecords = 0
    var listId = 0
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if listId == 1 {
            image.image = UIImage(named: "head")
        } else if listId == 2 {
            image.image = UIImage(named: "foot")
        } else if listId == 3 {
            image.image = UIImage(named: "eyes")
        } else {
            image.image = UIImage(named: "hand")
        }
        
        label.text = name
        numberOfRecords = DataManager.shared.getNumberOfRecords()
        
        AVAudioSession.sharedInstance().requestRecordPermission { (permission) in
            if permission {
                print("LOL")
            }
        }
        
        recordingSession = AVAudioSession.sharedInstance()
        setupRatingButton()
    }
    
    private func setupRatingButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Rating", style: .plain, target: self, action: #selector(openRating))
    }
    
    @objc private func openRating() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RatingViewController") as! RatingViewController
        vc.word = name
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func record(_ sender: UIButton) {
        if audioRecorder == nil {
            numberOfRecords += 1
            let fileName = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            
            do {
                audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                
                recordButton.setTitle("Recording...", for: .normal)
            } catch {
                setupAlert()
            }
        } else {
            audioRecorder.stop()
            audioRecorder = nil
            DataManager.shared.setNumberOfRecords(num: numberOfRecords)
            recordTableView.reloadData()
            recordButton.setTitle("Record", for: .normal)
        }
    }
    
    private func getDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func setupAlert() {
        let alert = UIAlertController(title: "OK", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRecords
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Play or submit to global rating", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play", style: .default, handler: { (action) in
            let path = self.getDirectory().appendingPathComponent("\(indexPath.row + 1).m4a")
            do {
                self.audioPalyer = try AVAudioPlayer(contentsOf: path)
                self.audioPalyer.play()
            } catch {
                
            }
        }))
        alert.addAction(UIAlertAction(title: "Submit voice", style: .default, handler: { (action) in
            
        }))
        present(alert, animated: true, completion: nil)
    }
}
