//
//  TeamsListViewController.swift
//  fantasyCricket_MVC
//
//  Created by Adaps on 13/02/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class TeamsListViewController: UIViewController {
    
    /// MARK  :-  Storyboard Outlets
    @IBOutlet weak var tableView: UITableView!
    
    /// MARK : - Custom Outlets
    var teamsList = [TeamCellModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.getTeamsData()
    }
    
    private func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TeamsListTableViewCell", bundle: nil), forCellReuseIdentifier: "TeamsListTableViewCell")
    }
    
    func getTeamsData(){
        APIService.shared.GET(endpoint: APIService.Endpoint.getPlayers)     {
                    (result: Result<CricketTeams, APIService.APIError>) in
                    switch result {
                    case let .success(response):
                        let mirror = Mirror(reflecting: response)
                        for child in mirror.children  {
                            let country = TeamCellModel(countryName: child.label ?? "", playersList: child.value as! [Player])
                            self.teamsList.append(country)
                        }
                        self.tableView.reloadData()
                    case let .failure(error):
                        print(error)
                        break
                    }
                }
    }
}

    /// MARK  : - UITableViewDelegate Methods
extension TeamsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teamsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TeamsListTableViewCell", for: indexPath) as! TeamsListTableViewCell
        cell.item = self.teamsList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "PlayersListViewController") as PlayersListViewController
        nextVC.team = self.teamsList[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
