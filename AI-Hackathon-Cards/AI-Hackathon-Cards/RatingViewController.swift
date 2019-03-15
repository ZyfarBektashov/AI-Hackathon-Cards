//
//  RatingViewController.swift
//  AI-Hackathon-Cards
//
//  Created by Z on 15.03.2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    var word = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension RatingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ratings.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTableViewCell", for: indexPath) as! RatingTableViewCell
        cell.like.text = "\(Ratings.list[indexPath.row].like)"
        cell.dislike.text = "\(Ratings.list[indexPath.row].dislike)"
        cell.label.text = word
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
