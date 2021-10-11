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
import Toast_Swift

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
        
        configureWebView()
        loadUrl()
        
        closeButton.rx.tap.subscribe({ [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showToastView()
    }
    
    //MARK: - Helpers
    
    private func configureWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    private func loadUrl() {
        guard let urlString = self.articleUrlString else { return }
        guard let url = URL(string: urlString) else { return }
        webView.load(URLRequest(url: url))
    }
    
    private func showToastView() {
        let originX: CGFloat = UIScreen.main.bounds.width / 2
        let originY: CGFloat = 96.0
        let showPosition = CGPoint(x: originX, y: originY)
        
        var style = ToastStyle()
        style.titleFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        style.messageFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        style.messageColor = .white
        style.backgroundColor = .darkGray
        
        view.makeToast("ニュースの記事を表示しています。", duration: 2.0, point: showPosition, title: "ご覧頂きありがとうございます", image: nil, style: style, completion: nil)
    }
}
