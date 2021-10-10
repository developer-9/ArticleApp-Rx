//
//  ArticleViewCell.swift
//  ArticleApp+Rx
//
//  Created by Taisei Sakamoto on 2021/10/09.
//

import UIKit
import AlamofireImage

class ArticleViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let cellHeight: CGFloat = 80.0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    //MARK: - Initializer
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.contentMode = .scaleAspectFill
    }
    
    //MARK: - Helpers
    
    func configureCell(_ model: Article) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        
        guard let urlString = model.urlToImage else { return }
        thumbnailImageView.af.setImage(withURL: URL(string: urlString) ?? URL(string: "https://fontawesome.com/v5.15/icons/expand?style=solid")!)
    }
}
