//
//  HomeViewController.swift
//  TaleBook
//
//  Created by Andrés Guzmán on 30/10/19.
//  Copyright © 2019 Andres Felipe Guzman Lopez. All rights reserved.
//

import UIKit
import SafariServices

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
    
    private func openPost(_ post: SocialMediaPost) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: post.link, configuration: config)
        present(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.posts.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TBConstants.shared.cellSeparatorHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = PostCellViewModel(with: presenter.posts[indexPath.section])
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostViewCell.self), for: indexPath) as! PostViewCell
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openPost(presenter.posts[indexPath.section])
    }
}

extension HomeViewController: HomeView {
    func updatePostList() {
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
        }
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
