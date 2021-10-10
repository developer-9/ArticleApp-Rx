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
    let isLoading = BehaviorRelay<Bool>(value: false)
    let isError = BehaviorRelay<Bool>(value: false)
    let articles = BehaviorRelay<[Article]>(value: [])
    
    //MARK: - Lifecycle
    
    init(client: ArticleAPIClientProtocol) {
        self.client = client
    }
    
    //MARK: - Helpers
    
    func fetchArticles() {
        
        executeStartRequest(true)
        
        client.getArticleList().subscribe { articleResponse in
            self.articles.accept(articleResponse.articles)
            self.isLoading.accept(false)
            
        } onFailure: { error in
            self.executeStartRequest(false)
            print("DEBUG: ERROR \(error.localizedDescription)")
        }.disposed(by: disposeBag)
    }
    
    private func executeStartRequest(_ bool: Bool) {
        isLoading.accept(bool)
        isError.accept(!bool)
    }
}
