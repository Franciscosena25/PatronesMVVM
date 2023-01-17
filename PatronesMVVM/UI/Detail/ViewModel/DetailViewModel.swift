//
//  DetailViewModel.swift
//  PatronesMVVM
//
//  Created by Francisco Sena Rivas on 11/11/22.
//

import Foundation

protocol DetailViewModelProtocol {
    func onViewsLoaded()
}

final class DetailViewModel {
    private var viewData: HerosModel
    
    private weak var viewDelegate: DetailViewProtocol?
    
    init(data: HerosModel,
         viewDelegate: DetailViewProtocol) {
        viewData = data
        self.viewDelegate = viewDelegate
        
    }
}

extension DetailViewModel: DetailViewModelProtocol {
    func onViewsLoaded() {
        viewDelegate?.update(description: viewData.description)
        viewDelegate?.update(title: viewData.name)
        viewDelegate?.update(image: viewData.photo)
    }
}
