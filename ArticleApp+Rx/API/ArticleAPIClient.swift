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
    private let baseUrl = <#APIKey#>
    private var articleResponse: ArticleResponse?
    
    func getArticleList() -> Single<ArticleResponse> {
        return Single<ArticleResponse>.create(subscribe: { singleEvent in
            self.manager.request(self.baseUrl, method: .get).validate().responseJSON { response in
                guard let data = response.data else { return }
                do {
                    let response = try JSONDecoder().decode(ArticleResponse.self, from: data)
                    print("DEBUG: RESPONSE \(response.articles)")
                    singleEvent(.success(response))
                } catch let error {
                    print("DEBUG: \(error.localizedDescription)")
                    singleEvent(.failure(error))
                }
            }
            return Disposables.create()
        })
    }
}
