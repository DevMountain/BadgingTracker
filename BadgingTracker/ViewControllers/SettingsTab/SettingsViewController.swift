//  SettingsViewController.swift
//  Created by Jayden Garrick on 6/25/18.
//  BadgingTracker
//  Copyright © 2018 Nick Reichard. All rights reserved.

import UIKit

class SettingsViewController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewController()
        view.backgroundColor = .white
    }
    
    // MARK: - Setup
    func setupTableViewController() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = false
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "settingsCell")
        tableView.separatorStyle = .none
    }
    
}

// MARK: - TableView Delegate and Datasource
extension SettingsViewController {
    
    // MAIN CELL //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
        if indexPath.row % 2 == 0 {
            cell.cellSwitch = nil
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    // HEADER //
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return SettingsHeader()
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 200
        } else {
            return 0
        }
    }
    
    // FOOTER //
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // Create footerView
        let footerView = UIView()
        footerView.backgroundColor = .white
        
        // Create button
        let logoutButton = UIButton(type: UIButtonType.system)
        logoutButton.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.6705882353, blue: 0.8862745098, alpha: 1)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.title
        logoutButton.layer.cornerRadius = 6
        logoutButton.setTitle("Log Out", for: .normal)
        footerView.addSubview(logoutButton)
        
        // Constraints for logoutButton
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 92
        } else {
            return 0
        }
    }
    
}


