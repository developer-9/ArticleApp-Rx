//
//  WebViewController.swift
//  ArticleApp+Rx
//
//  Created by Taisei Sakamoto on 2021/10/11.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa

class WebViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    
    private let webView = WKWebView(frame: .zero,
                                    configuration: WKWebViewConfiguration())
    private let articleUrlString: String?
    private let disposeBag = DisposeBag()
    
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
        
        closeButton.rx.tap.subscribe({ [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
    //MARK: - Helpers
}
