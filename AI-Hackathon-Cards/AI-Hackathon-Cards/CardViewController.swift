//
//  CardViewController.swift
//  AI-Hackathon-Cards
//
//  Created by Z on 15.03.2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import UIKit
import AVFoundation

class CardViewController: UIViewController, AVSpeechSynthesizerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordTableView: UITableView!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPalyer: AVAudioPlayer!
    var numberOfRecords = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.blue
        collectionView.isPagingEnabled = true
        numberOfRecords = DataManager.shared.getNumberOfRecords()
        
        AVAudioSession.sharedInstance().requestRecordPermission { (permission) in
            if permission {
                print("LOL")
            }
        }
        
        recordingSession = AVAudioSession.sharedInstance()
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

extension CardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRecords
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = getDirectory().appendingPathComponent("\(indexPath.row + 1).m4a")
        do {
            audioPalyer = try AVAudioPlayer(contentsOf: path)
            audioPalyer.play()
        } catch {
            
        }
    }
}
