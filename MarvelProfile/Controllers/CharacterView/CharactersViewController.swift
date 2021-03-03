//
//  CharactersViewController.swift
//  MarvelProfile
//
//  Created by Eduardo Jordan on 1/3/21.
//

import UIKit

class CharactersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var viewModel = ViewModelCharacter()
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
        configureView()
        bind()
    }
    
    func setupNavBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "LogoMarvel")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    func setupTableView() {
        tableView.rowHeight = 250
        tableView.backgroundColor = UIColor.black
    }
    
   func configureView() {
        activity.startAnimating()
        activity.isHidden = false
        viewModel.retrieveData()
    }
    
    func bind() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self!.tableView.reloadData()
                self!.activity.stopAnimating()
                self?.activity.isHidden = true
            }
        }
    }
    
}
