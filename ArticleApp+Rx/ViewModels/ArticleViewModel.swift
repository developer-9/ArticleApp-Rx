//
//  ArticleViewModel.swift
//  ArticleApp+Rx
//
//  Created by Taisei Sakamoto on 2021/10/09.
//

import Foundation
import RxSwift
import RxCocoa

class ArticleViewModel {
    
    //MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    private let client: ArticleAPIClientProtocol
    let articles = BehaviorRelay<[Article]>(value: [])
    
    //MARK: - Lifecycle
    
    init(client: ArticleAPIClientProtocol) {
        self.client = client
    }
    
    //MARK: - Helpers
    
    func fetchArticles() {
    }
}
