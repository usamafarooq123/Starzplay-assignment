//  
//  MoviesDetailsViewController.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import UIKit

class MoviesDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var viewModel: MoviesDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        bindViewModel()
        viewModel.viewModelDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewModelWillAppear()
    }
    
    fileprivate func bindViewModel() {

        viewModel.output = { [unowned self] output in
            //handle all your bindings here
            switch output {
            case .reload:
                reloadTableView()
            default:
                break
            }
        }
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
}

extension MoviesDetailsViewController {
    func configureAppearance() {
        tableView.register(cellType: SeasonDetailsHeaderCell.self)
        tableView.register(cellType: SeasonsEpisodesCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension MoviesDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = viewModel.cellViewModel(forRow: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier.identifier,
                                                 for: indexPath)
        (cell as? CellConfigureType )?.configureCell(with: item, delegate: self)
        return cell
    }
    
}


extension MoviesDetailsViewController: playVideoDelegate {
    func playVideo() {
        let videoURLString = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
                guard let videoURL = URL(string: videoURLString) else { return }
                
                let videoPlayerVC = VideoPlayer(videoURL: videoURL)
                present(videoPlayerVC, animated: true, completion: nil)
    }
    
    
}
