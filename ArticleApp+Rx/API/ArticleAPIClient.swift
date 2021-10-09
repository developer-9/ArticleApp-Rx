//
//  ArticleAPIClient.swift
//  ArticleApp+Rx
//
//  Created by Taisei Sakamoto on 2021/10/09.
//

import Foundation
import 
import RxSwift

protocol ArticleAPIClientProtocol {
    func getArticleList() -> Single<[Article]>
}

class ArticleAPIClient: ArticleAPIClientProtocol {
    
    func getArticleList() -> Single<[Article]> {
        return Single<[Article]>.create(subscribe: { singleEvent in
            
        })
    }
}
