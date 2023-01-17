//
//  SplashViewModel.swift
//  PatronesMVVM
//
//  Created by Francisco Sena Rivas on 7/11/22.
//

import Foundation


protocol SplashViewModelProtocol: AnyObject {
    func onViewsLoaded()
}

final class SplashViewModel {
    
    weak var viewDelegate: SplashViewProtocol?
    
    init(viewDelegate: SplashViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [viewDelegate] in
            //TODO: Notificar a la vista para navegar siguiente pantalla
            viewDelegate?.showLoading(false)
            viewDelegate?.navigateToHome()
        }
    }
}

extension SplashViewModel: SplashViewModelProtocol {
    func onViewsLoaded() {
        viewDelegate?.showLoading(true)
        loadData()
    }
}
