//
//  HomeViewController.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    
    let presenter = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.register(UINib(nibName: String(describing: PostViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PostViewCell.self))
        postsTableView.delegate = self
        postsTableView.dataSource = self
        presenter.view = self
        presenter.loadPosts()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostViewCell.self), for: indexPath) as! PostViewCell
        
        return cell
    }
}

extension HomeViewController: HomeView {
    func updatePostList() {
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
        }
        // TODO: Update tableview with the new data.
    }
    
    func showErrorMessage(with error: String) {
        // TODO: Implement this functionality
    }
    
    func showLoadingView() {
        // TODO: Implement this functionality
    }
    
    func hideLoadingView() {
        // TODO: Implement this functionality
    }
}
