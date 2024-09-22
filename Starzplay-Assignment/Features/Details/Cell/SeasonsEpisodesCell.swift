//
//  SeasonsEpisodesCell.swift
//  Starzplay-Assignment
//
//  Created by usama farooq on 21/09/2024.
//

import UIKit

class SeasonsEpisodesCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: playVideoDelegate?
    
    var viewModel: SeasonsEpisodesViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView.register(cellType: EpisodeCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.register(cellType: SeasonsCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func bindViewModel() {
        self.viewModel.output = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .reload:
                tableView.reloadData()
            case .reloadCollectionView:
                collectionView.reloadData()
            }
        }
    }
}

extension SeasonsEpisodesCell: CellConfigureType {
    
    func configureCell(with data: CellIdentifierType, delegate: playVideoDelegate) {
        guard let viewModel = data as? SeasonsEpisodesViewModel else { return }
        self.delegate = delegate
        self.viewModel = viewModel
        bindViewModel()
        viewModel.fetchEpisodes()
        collectionView.reloadData()
    }
    
}

// UICollectionView DataSource and Delegate
extension SeasonsEpisodesCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.seasonsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: SeasonsCell.self, for: indexPath)
        let item = viewModel.itemSeasonCell(row: indexPath.row)
        cell.configure(with: item.0.name, isSelected: item.1)
        return cell
    }
    
    // Handle season selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectSeason(at: indexPath.row)
    }

    // CollectionView layout for 3 cells per row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let spacing: CGFloat = 10
        let totalSpacing = (spacing * 2) + (spacing * 2 / 3)
        let width = (screenWidth - totalSpacing) / 3
        return CGSize(width: width, height: 50)
    }
}

extension SeasonsEpisodesCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.episodesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: EpisodeCell.self, for: indexPath)
        let item = viewModel.itemEpisodeCell(row: indexPath.row)
        cell.configure(thumbnailUrl: item.thumbnail, episodeTitle: item.episodeTitle)
        return cell
    }
}
