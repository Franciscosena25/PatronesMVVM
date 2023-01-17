//
//  CellView.swift
//  PatronesMVVM
//
//  Created by Francisco Sena Rivas on 5/11/22.
//

import UIKit

class CellView: UICollectionViewCell {
    
    static var cellIdentifier: String {
        String(describing: CellView.self)
    }
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 4.0
        cellView.layer.cornerRadius = 4.0
        cellView.layer.shadowColor = UIColor.gray.cgColor
        cellView.layer.shadowOffset = .zero
        cellView.layer.shadowOpacity = 0.7
        cellView.layer.shadowRadius = 4.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        cellTitle.text = nil
    }
    
    func updateViews(data: HerosModel) {
        //TODO: Obtener datos celdas con modelos de datos
        update(image:  data.photo)
        uptade(title: data.name)
    }
    
    private func update(image: String?) {
        imageView.image = UIImage(named: image ?? "")
    }
    
    private func uptade(title: String?) {
        
        cellTitle.text = title
    }
}
