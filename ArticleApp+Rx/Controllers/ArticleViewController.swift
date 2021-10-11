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
        
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            let url = viewModel.articles.value[indexPath.row].url
            let sb = UIStoryboard(name: "WebView", bundle: nil)
            let vc = sb.instantiateInitialViewController { coder in
                WebViewController(coder: coder, urlString: url)
            }
            guard let vc = vc else { return }
            self?.present(vc, animated: true, completion: nil)
            self?.tableView.deselectRow(at: indexPath, animated: true)
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
