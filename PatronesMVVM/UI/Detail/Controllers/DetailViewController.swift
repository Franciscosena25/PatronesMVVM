//
//  DetailViewController.swift
//  PatronesMVVM
//
//  Created by Francisco Sena Rivas on 6/11/22.
//

import UIKit

protocol DetailViewProtocol: AnyObject{
    func update(image: String?)
    func update(description: String?)
    func update(title: String?)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailLabel: UILabel!

    @IBOutlet weak var detailTextDescription: UITextView!
    
    var viewModel: DetailViewModelProtocol?
    
    var characterDataModel: HerosModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.onViewsLoaded()
    }
    
}

extension DetailViewController: DetailViewProtocol {
     func update(image: String?) {
        detailImage.image = UIImage(named: image ?? "")
    }
    
     func update(title: String?) {
        detailLabel.text = title
    }
    
     func update(description: String?) {
        detailTextDescription.text = description
    }
}
