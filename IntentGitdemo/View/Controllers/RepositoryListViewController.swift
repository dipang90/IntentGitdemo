//
//  RepositoryListViewController.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/14/21.
//

import UIKit
import SafariServices

class RepositoryListViewController: UIViewController {

    @IBOutlet weak var noRepositoryFoundLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let rowNib = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
            self.tableView.register(rowNib, forCellReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    lazy var refreshController: UIRefreshControl = {
        let refreshController = UIRefreshControl()
        refreshController.addTarget(self, action:
                                        #selector(self.searchRepositories),
                                    for: UIControl.Event.valueChanged)
        refreshController.tintColor = .darkGray
        return refreshController
    }()
    
    var repositories = [RepositoryItem]()
    var repositoryViewModel = RepositoryViewModel()
    var parPageCount = 10
    var pageNumeber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.repositoryViewModel.delegate = self
        self.tableView.addSubview(self.refreshController)
        self.searchBar.becomeFirstResponder()
    }
}

//MARK: - Searchbar delegate
extension RepositoryListViewController : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.searchRepositories()
        }
    }
    
    @objc func searchRepositories() {
        self.resetRepository()
        self.requestRepositoryAPI()
    }
    
    func requestRepositoryAPI()  {
        if let searchText = self.searchBar.text {
            let request = "?q=\(searchText.lowercased())&per_page=\(self.parPageCount)&page=\(self.pageNumeber)"
            self.repositoryViewModel.creatorProfile(requestString: request)
        }
    }
    
    func resetRepository()  {
        self.noRepositoryFoundLabel.isHidden = true
        self.activityIndicator.startAnimating()
        self.repositories.removeAll()
        self.pageNumeber = 1
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


//MARK: - TableView delegate & datasource
extension RepositoryListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositoryTableViewCell
        let obj = repositories[indexPath.row]
        cell.didSetRepositoryData(obj: obj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.repositories.count > 0  && indexPath.row == self.repositories.count - 1 {
            self.requestRepositoryAPI()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let obj = repositories[indexPath.row]
        if  let html = obj.htmlurl {
            let safariVC = SFSafariViewController(url: URL(string: html.encode())!)
            self.present(safariVC, animated: true, completion: nil)
            safariVC.delegate = self
        }
    }
}

extension RepositoryListViewController : SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Repository Viewmodel delegste
extension RepositoryListViewController : RepositoryViewModelDelegate {
    
    func didReceiveRepositoryResponse(repositoryResponse: RepositoryResponse?, errorMessage: String?) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.noRepositoryFoundLabel.isHidden = true
            if self.refreshController.isRefreshing {
                self.refreshController.endRefreshing()
            }
        }
                
        if let response = repositoryResponse {
            if let items = response.items {
                self.repositories += items
                self.pageNumeber = self.pageNumeber + 1
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        if self.repositories.count == 0 {
            DispatchQueue.main.async {
                self.noRepositoryFoundLabel.isHidden = false
            }
        }
    }
}
