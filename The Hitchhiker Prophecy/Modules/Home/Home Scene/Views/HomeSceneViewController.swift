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
    private let shotAnimator = ShotAnimator()
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
        collectionViewLayoutState = HorizontalCollectionViewLayoutState(self)
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
        displayAlert(withError: error)
    }
    private func displayAlert(withError error: Error){
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        let retryAction = UIAlertAction(
            title: "Retry",
            style: .default
        ) { (_) in
            self.fetchCharacters()
        }
        if let popoverPresentationController = alert.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = self.view.bounds
        }
        alert.addAction(retryAction)
        present(alert, animated: true, completion: nil)
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

extension HomeSceneViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setShotAnimatorOriginalFrame(forCellAt: indexPath)
        router?.routeToCharacterDetailsWithCharacter(at: indexPath.item)
    }
    private func setShotAnimatorOriginalFrame(forCellAt indexPath: IndexPath){
        guard let cell = collectionView.cellForItem(at: indexPath) as? HomeCharacterCollectionViewCell else { return }
        shotAnimator.originalFrame = cell.imageViewFrameAdjusted
    }
}

extension HomeSceneViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        collectionView?.scrollToNearestCellIfHasHorizontalLayout()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        collectionView?.scrollToNearestCellIfHasHorizontalLayout()
    }
}

extension HomeSceneViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        shotAnimator
    }
}
