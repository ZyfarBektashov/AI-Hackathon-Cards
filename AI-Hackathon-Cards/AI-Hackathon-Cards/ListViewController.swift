//
//  ListViewController.swift
//  AI-Hackathon-Cards
//
//  Created by Z on 15.03.2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var categoryId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categoryId == 1 {
            return Cards.listAnimal.count
        }
        return Cards.listPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        if categoryId == 1 {
            cell.name.text = Cards.listAnimal[indexPath.row].name
        } else {
            cell.name.text = Cards.listPerson[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.listId = indexPath.row
        vc.name = Cards.listPerson[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
}
