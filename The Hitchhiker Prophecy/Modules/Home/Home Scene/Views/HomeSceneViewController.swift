//
//  HomeSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class HomeSceneViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    private var characters = [HomeScene.Search.ViewModel]()
    private lazy var collectionViewHorizontalLayout: UICollectionViewFlowLayout = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.scrollDirection = .horizontal
        collectionFlowLayout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 12,
            bottom: 0,
            right: 12
        )
        collectionFlowLayout.itemSize = CGSize(
            width: collectionView.frame.width * 0.8,
            height: collectionView.frame.height
        )
        collectionFlowLayout.minimumInteritemSpacing = 0
        collectionFlowLayout.minimumLineSpacing = 24
        return collectionFlowLayout
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellsOnCollectionView()
        fetchCharacters()
    }
    private func registerCellsOnCollectionView(){
        collectionView.register(
            HomeCharacterCollectionViewCell.nib,
            forCellWithReuseIdentifier: HomeCharacterCollectionViewCell.id
        )
    }
    private func fetchCharacters(){
        activityIndicator.startAnimating()
        interactor?.fetchCharacters()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configCollectionViewAsHorizontal()
    }
    private func configCollectionViewAsHorizontal(){
        collectionView.collectionViewLayout = collectionViewHorizontalLayout
    }
}

extension HomeSceneViewController: HomeSceneDisplayView {
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        activityIndicator.stopAnimating()
        self.characters = viewModel
        collectionView.reloadData()
    }
    
    func failedToFetchCharacters(error: Error) {
        // TODO: Implement
    }
}

extension HomeSceneViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeCharacterCollectionViewCell.id,
            for: indexPath
        ) as! HomeCharacterCollectionViewCell
        cell.configure(with: characters[indexPath.row])
        return cell
    }
    
}
