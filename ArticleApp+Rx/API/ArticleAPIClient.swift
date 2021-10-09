//
//  ArticleAPIClient.swift
//  ArticleApp+Rx
//
//  Created by Taisei Sakamoto on 2021/10/09.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

protocol ArticleAPIClientProtocol {
    func getArticleList() -> Single<ArticleResponse>
}

class ArticleAPIClient: ArticleAPIClientProtocol {
    
    private let manager = AF
    private let baseUrl = ""
    private var articleResponse: ArticleResponse?
    
    func getArticleList() -> Single<ArticleResponse> {
        return Single<ArticleResponse>.create(subscribe: { singleEvent in
            self.manager.request(baseUrl, method: .get).validate().responseJSON { response in
                guard let data = response.data else { return }
                do {
                    self.articleResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
                }
            }
            return Disposables.create()
        })
    }
}
