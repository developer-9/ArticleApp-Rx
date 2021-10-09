//
//  ArticleViewCell.swift
//  ArticleApp+Rx
//
//  Created by Taisei Sakamoto on 2021/10/09.
//

import UIKit

class ArticleViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let cellHeight: CGFloat = 80.0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    //MARK: - Helpers
    
    private func configureCell() {
        titleLabel.text = "Test title"
        descriptionLabel.text = "test description"
        thumbnailImageView.image = UIImage(systemName: "pencil.and.outline")
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.contentMode = .scaleAspectFill
    }
}
