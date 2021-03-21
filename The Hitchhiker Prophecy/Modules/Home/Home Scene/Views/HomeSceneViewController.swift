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
    private var characters = [HomeScene.Search.ViewModel]()
    private let shotAnimator = ShotAnimator()
    private var isHorizontalLayout: Bool!
    private lazy var horizontalLayout = horizontalFlowLayout(for: collectionView)
    private lazy var verticalLayout = verticalFlowLayout(for: collectionView)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellsOnCollectionView()
        fetchCharacters()
        setHorizontalCollectionViewLayoutAsDefault()
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
    private func setHorizontalCollectionViewLayoutAsDefault(){
        isHorizontalLayout = true
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout = currentCollectionViewLayout()
    }
    func currentCollectionViewLayout() -> UICollectionViewLayout {
        isHorizontalLayout ? horizontalLayout : verticalLayout
    }
    @objc func switchLayoutHandler(){
        collectionView.setCollectionViewLayout(
            otherCollectionViewLayout(),
            animated: true
        )
        self.isHorizontalLayout.toggle()
    }
    private func otherCollectionViewLayout() -> UICollectionViewLayout {
        isHorizontalLayout ? verticalLayout : horizontalLayout
    }
}
// MARK: - HomeSceneDisplayView
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
        activityIndicator.stopAnimating()
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

// MARK: - UICollectionViewDataSource
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

// MARK: - UICollectionViewDelegate
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

// MARK: - UIScrollViewDelegate
extension HomeSceneViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        collectionView?.scrollToNearestCellIfHasHorizontalLayout()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        collectionView?.scrollToNearestCellIfHasHorizontalLayout()
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension HomeSceneViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        shotAnimator
    }
}
