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
    private let refreshControl = UIRefreshControl()
    
    let presenter = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = TBConstants.shared.baseAppColor
        refreshControl.addTarget(self, action: #selector(refreshPosts(_:)), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: TBConstants.shared.fetchingMessage)
        postsTableView.register(UINib(nibName: String(describing: PostViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PostViewCell.self))
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.refreshControl = refreshControl
        presenter.view = self
        self.refreshControl.beginRefreshing()
        presenter.loadPosts()
    }
    
    @objc private func refreshPosts(_ sender: Any) {
        presenter.currentPage = 1
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
        view.backgroundColor = TBConstants.shared.tbGrayColor
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
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        presenter.isDataLoading = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if ((postsTableView.contentOffset.y +
            postsTableView.frame.size.height) >=
            postsTableView.contentSize.height) && !presenter.isDataLoading {
            presenter.isDataLoading = true
            presenter.currentPage += presenter.currentPage
            refreshControl.beginRefreshing()
            presenter.loadPosts()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openPost(presenter.posts[indexPath.section])
    }
}

extension HomeViewController: HomeView {
    func updatePostList() {
        postsTableView.reloadData()
    }
    
    func showErrorMessage(with error: String) {
        let alert = UIAlertController(title: TBConstants.shared.alertTittle, message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func stopPullToRefresh() {
        refreshControl.endRefreshing()
    }
}
