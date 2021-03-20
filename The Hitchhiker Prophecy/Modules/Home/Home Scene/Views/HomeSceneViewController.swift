//
//  HomeSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class HomeSceneViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    var collectionViewLayoutState: BaseCollectionViewLayoutState?
    private var characters = [HomeScene.Search.ViewModel]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellsOnCollectionView()
        fetchCharacters()
        setupCollectionViewAsHorizontalInitially()
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
    private func setupCollectionViewAsHorizontalInitially(){
        collectionViewLayoutState = VerticalCollectionViewLayoutState(self)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionViewLayoutState?.setLayout()
    }
    @objc func switchLayoutHandler(){
        collectionViewLayoutState?.switchLayout()
    }
}

extension HomeSceneViewController: HomeSceneDisplayView {
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        activityIndicator.stopAnimating()
        self.characters = viewModel
        collectionView.reloadData()
        revealChangeLayoutButton()
    }
    private func revealChangeLayoutButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Change Layout",
            style: .plain,
            target: self,
            action: #selector(switchLayoutHandler)
        )
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
