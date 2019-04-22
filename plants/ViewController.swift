//
//  ViewController.swift
//  plants
//
//  Created by Adriana González Martínez on 4/21/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    var dates: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Water log"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }

    @IBAction func addLog(_ sender: Any) {
        dates.append(Date())
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let date = dates[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dateFormatter.string(from: date)
        
        
        return cell
    }
    
}

