//
//  HomeViewController.swift
//  PatronesMVVM
//
//  Created by Francisco Sena Rivas on 5/11/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func updateViews()
    
    func navigateToDetail(with data: HerosModel?)
}


class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModelProtocol?
    
    @IBOutlet weak var colletionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        viewModel?.onViewsLoaded()
    }
    
    private func configureViews() {
        colletionView.delegate = self
        colletionView.dataSource = self
    }
}

extension HomeViewController: HomeViewProtocol {
    func updateViews() {
        colletionView.reloadData()
    }
    
    func navigateToDetail(with data: HerosModel?) {
        let detailStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        
        
        guard let data = data,
                let destination = detailStoryboard.instantiateInitialViewController() as? DetailViewController else { return }
        
        destination.viewModel = DetailViewModel(data: data, viewDelegate: destination)
        
        navigationController?.pushViewController(destination, animated: true)
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.dataCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2) - 6,
               height: 200.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellView.cellIdentifier, for: indexPath) as? CellView
        
        if let data = viewModel?.data(for: indexPath.row){
            cell?.updateViews(data: data)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    //funcion para navegar a detailView
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        viewModel?.onItemSelected(at: indexPath.row)
        
    }
}
