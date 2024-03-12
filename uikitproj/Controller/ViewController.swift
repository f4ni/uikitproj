//
//  ViewController.swift
//  uikitproj
//
//  Created by Furkan ic on 12.03.2024.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data: ResponseDTO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        prepareTable()
        APIService().fetchItems { [weak self] response in
            guard let self else { return }
            self.data = response
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func prepareTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let item = data?.results?[indexPath.row],
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            
            cell.name.text = item.name
            cell.species.text = item.species
            cell.status.text = item.status
            cell.imageV.kf.setImage(with: URL(string: item.image ?? ""))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
