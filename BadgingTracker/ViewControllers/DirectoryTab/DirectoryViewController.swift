//
//  DirectoryViewController.swift
//  BadgingTracker
//
//  Created by Jayden Garrick on 6/25/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class DirectoryViewController: UIViewController {
    
    // MARK: - Properties
    let tableView = UITableView()
    
    let filterView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = false
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1).cgColor
        return view
    }()
    
    var searchBar: UISearchBar?
    
    let allButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 3
        button.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1).cgColor
        button.layer.borderWidth = 1
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.setTitleColor(#colorLiteral(red: 0.737254902, green: 0.7215686275, blue: 0.7215686275, alpha: 1), for: .normal)
        button.setTitle("All", for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    let badgedButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 3
        button.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1).cgColor
        button.layer.borderWidth = 1
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.setTitleColor(#colorLiteral(red: 0.737254902, green: 0.7215686275, blue: 0.7215686275, alpha: 1), for: .normal)
        button.setTitle("Badged", for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    let iOSButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 3
        button.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1).cgColor
        button.layer.borderWidth = 1
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.setTitleColor(#colorLiteral(red: 0.737254902, green: 0.7215686275, blue: 0.7215686275, alpha: 1), for: .normal)
        button.setTitle("iOS", for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    let uxDesignButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 3
        button.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1).cgColor
        button.layer.borderWidth = 1
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.setTitleColor(#colorLiteral(red: 0.737254902, green: 0.7215686275, blue: 0.7215686275, alpha: 1), for: .normal)
        button.setTitle("UX Design", for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    let qaButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 3
        button.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1).cgColor
        button.layer.borderWidth = 1
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.setTitleColor(#colorLiteral(red: 0.737254902, green: 0.7215686275, blue: 0.7215686275, alpha: 1), for: .normal)
        button.setTitle("QA", for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    var seachBarIsEditing: Bool = false
    var filteredUsers: [User] = []
    var allUsers: [User] = [] {
        didSet {
            filteredUsers = allUsers
            tableView.reloadData()
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        self.allUsers = UserController.shared.users
        setConstraintsForMainView()
        setupTableView()
        setSearchBar()
        setConstraintsForFilterView()
    }
    
    // MARK: - Action Functions
    // FIXME: - This is where you handle the filtering
    @objc fileprivate func buttonTapped(sender: UIButton) {
        if sender.titleLabel?.textColor == #colorLiteral(red: 0.737254902, green: 0.7215686275, blue: 0.7215686275, alpha: 1) {
            sender.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            sender.setTitleColor(.white, for: .normal)
            if sender == badgedButton {
                filteredUsers = allUsers.filter {
                    return $0.hasBadged
                }
            }
        } else {
            sender.backgroundColor = .clear
            sender.setTitleColor(#colorLiteral(red: 0.737254902, green: 0.7215686275, blue: 0.7215686275, alpha: 1), for: .normal)
            if sender == badgedButton {
                filteredUsers = allUsers
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Setup Functions
    fileprivate func setupTableView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.layer.cornerRadius = 3
        tableView.layer.masksToBounds = false
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1).cgColor
        tableView.clipsToBounds = true
    }
    
    fileprivate func setSearchBar() {
        let searchBar = UISearchBar()
        searchBar.barStyle = UIBarStyle.default
        searchBar.placeholder = "Search..."
        searchBar.delegate = self
        self.searchBar = searchBar
        navigationItem.titleView = searchBar
    }
    
    fileprivate func setConstraintsForMainView() {
        view.addSubview(tableView)
        view.addSubview(filterView)
        filterView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 50)
        tableView.anchor(top: filterView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 6, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0)
    }
    
    fileprivate func setConstraintsForFilterView() {
        let stackView = UIStackView(arrangedSubviews: [allButton, badgedButton, iOSButton, uxDesignButton, qaButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8

        filterView.addSubview(stackView)
        stackView.anchor(top: filterView.topAnchor, left: filterView.leftAnchor, bottom: filterView.bottomAnchor, right: filterView.rightAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 10, paddingRight: 15, width: 0, height: 0)
    }
    
}

// MARK: - TableViewDelegate and Datasources
extension DirectoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! SearchTableViewCell
        let user = filteredUsers[indexPath.row]
        cell.student = user
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.seachBarIsEditing {
            searchBar?.resignFirstResponder()
        } else {
            let profileVC = ProfileViewController()
            profileVC.user = filteredUsers[indexPath.row]
            self.navigationController?.pushViewController(profileVC, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SearchBarDelegate
extension DirectoryViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.seachBarIsEditing = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.seachBarIsEditing = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredUsers = allUsers
        } else {
            filteredUsers = allUsers.filter {
                let name = $0.name.lowercased()
                return name.contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredUsers = allUsers
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
}
