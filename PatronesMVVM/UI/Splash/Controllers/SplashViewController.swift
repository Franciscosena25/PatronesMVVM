//
//  SplashViewController.swift
//  PatronesMVVM
//
//  Created by Francisco Sena Rivas on 5/11/22.
//

import UIKit

protocol SplashViewProtocol: AnyObject {
    func showLoading(_ show: Bool)
    func navigateToHome()
}

class SplashViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: SplashViewModelProtocol?
    
    private let homeStoryboardName = "Home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: llamar viewmodel
        
        viewModel = SplashViewModel(viewDelegate: self)
        viewModel?.onViewsLoaded()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }
}

extension SplashViewController: SplashViewProtocol {
    func showLoading(_ show: Bool) {
        switch show {
        case true where !activityIndicator.isAnimating:
            activityIndicator.startAnimating()
            
        case false where activityIndicator.isAnimating:
            activityIndicator.stopAnimating()
            
        default: break
            
        }
    }
    
    func navigateToHome() {
        let homeStoryBoard = UIStoryboard(name: homeStoryboardName,
                                          bundle: nil)
        
        guard let destinationViewController = homeStoryBoard.instantiateInitialViewController() as? HomeViewController else { return }
        destinationViewController.viewModel = HomeViewModel(viewDelegate: destinationViewController)   
        
        self.navigationController?.setViewControllers([destinationViewController],
                                                 animated: true)
    }
    
    
}
