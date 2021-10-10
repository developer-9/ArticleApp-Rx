//
//  ArticleViewController.swift
//  ArticleApp+Rx
//
//  Created by Taisei Sakamoto on 2021/10/08.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleViewController: UIViewController {
    
    //MARK: - Properties
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        let client = ArticleAPIClient()
        client.getArticleList().subscribe { articleResponse in
            print(("DEBUG: AAA \(articleResponse)"))
        } onFailure: { error in
            print("DEBUG: ERROR \(error.localizedDescription)")
        }.disposed(by: disposeBag)
    }
    
    //MARK: - Helpers
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = ArticleViewCell.cellHeight
    }
}

//MARK: - UITableViewDataSource

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleViewCell", for: indexPath) as! ArticleViewCell
        return cell
    }
}

//MARK: - UITableViewDelegate

extension ArticleViewController: UITableViewDelegate {
    
}
