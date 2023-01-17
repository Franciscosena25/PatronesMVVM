//
//  HomeViewModel.swift
//  PatronesMVVM
//
//  Created by Francisco Sena Rivas on 9/11/22.
//

import Foundation

protocol HomeViewModelProtocol {
    var dataCount: Int { get }
    
    func onViewsLoaded()
    
    func data(for index: Int) -> HerosModel?
    
    func onItemSelected(at index: Int)
}



final class HomeViewModel {
    private weak var viewDelegate: HomeViewProtocol?
    private var viewData = [HerosModel]()
    
    init(viewDelegate: HomeViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewData = herosData.compactMap {
            HerosModel(photo: $0.photo, description: $0.description, name: $0.name)
            
        }
        viewDelegate?.updateViews()
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func data(for index: Int) -> HerosModel? {
        guard index < dataCount else { return nil }
        return viewData[index]
    }
    
    var dataCount: Int {
        viewData.count
    }
    
    func onViewsLoaded() {
        loadData()
    }
    
    func onItemSelected(at index: Int) {
        guard let data = data(for: index) else { return }
        
        //TODO: Notificamos a la vista que navegue a la siguiente pantalla
        
        viewDelegate?.navigateToDetail(with: data)
    }
    
}
