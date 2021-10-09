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
    
    private let disposeBag = DisposeBag()
    
    private let client: ArticleAPIClientProtocol
    let articles = BehaviorRelay<[Article]>(value: [])
    
    init(client: ArticleAPIClientProtocol) {
        self.client = client
    }
}
