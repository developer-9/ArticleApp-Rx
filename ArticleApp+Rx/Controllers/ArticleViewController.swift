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
        
        let viewModel = ArticleViewModel(client: ArticleAPIClient())
        viewModel.fetchArticles()
        
        tableView.rx.itemSelected.subscribe(onNext: { indexPath in
            print("DEBUG: DID SELECT ROW AT \(indexPath.row)")
        }).disposed(by: disposeBag)
        
        viewModel.articles.asObservable().bind(to: tableView.rx.items) { (tableView, row, model) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleViewCell") as! ArticleViewCell
            cell.configureCell(model)
            return cell
        }.disposed(by: disposeBag)
    }
    
    //MARK: - Helpers
    
    private func configureTableView() {
        tableView.rowHeight = ArticleViewCell.cellHeight
    }
}
