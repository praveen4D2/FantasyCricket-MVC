//
//  PlayersListViewController.swift
//  fantasyCricket_MVC
//
//  Created by Adaps on 13/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class PlayersListViewController: UIViewController {

    /// MARK  : - Storyboard Outlets
    @IBOutlet weak var tableView: UITableView!
    
    /// MARK : - Custom Outlets
    var team:TeamCellModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    private func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "PlayersListTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayersListTableViewCell")
    }

}

    /// MARK  : - UITableViewDelegate Methods
extension PlayersListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.team?.playersList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PlayersListTableViewCell", for: indexPath) as! PlayersListTableViewCell
        cell.item = self.team?.playersList[indexPath.row]
        return cell
    }
}
