//
//  WebViewController.swift
//  ArticleApp+Rx
//
//  Created by Taisei Sakamoto on 2021/10/11.
//

import UIKit

class WebViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    
    private let articleUrlString: String?
    
    //MARK: - Lifecycle
    
    init?(coder: NSCoder, urlString: String?) {
        self.articleUrlString = urlString
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Helpers
}
