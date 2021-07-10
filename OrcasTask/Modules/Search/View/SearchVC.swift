//
//  SearchVC.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import UIKit
import RxCocoa
import RxSwift

class SearchVC: BaseController {

    // MARK: - ...  Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var searchTxf: UITextField!
    @IBOutlet weak var searchBtn: UIButton!


    // MARK: - ...  Variables
    private lazy var viewModel: SearchViewModel = {
        let searchRepo = SearchRepositoryImpl()
        let searchUseCase = SearchUseCase(searchRepository: searchRepo)
        let viewModel = SearchViewModel(searchUseCase: searchUseCase)
        return viewModel
    }()


    // MARK: - ...  override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupResultTableView()
        bind()
    }
}

// MARK: - ...  Functions & Actions
extension SearchVC {

    private func bind() {
        viewModel.displayToastMessage.subscribe { [unowned self] (text) in
            self.makeAlert(with: text)
        }.disposed(by: disposeBag)

        viewModel.isLoading.subscribe { [unowned self] (isLoading) in
            guard let isLoading = isLoading.element else { return }
            if(isLoading){
                self.view.makeToastActivity(.center)
            } else {
                self.view.hideToastActivity()
            }
        }.disposed(by: disposeBag)

        viewModel.cities.subscribe { [unowned self] (_) in
            self.handleSearchResultListSuccess()
        }.disposed(by: disposeBag)

        viewModel.noInternetConnection.subscribe {  [unowned self] (text) in
            self.handleInternetConnectionError(text)
        }.disposed(by: disposeBag)
    }

    private func setupResultTableView(){
        resultTableView.register(nibWithCellClass: WeatherCell.self)
        resultTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.cities.bind(to: resultTableView.rx.items(cellIdentifier: String(describing: WeatherCell.self), cellType: WeatherCell.self)) { index, model, cell in
            cell.cellBind(model)
        }.disposed(by: disposeBag)
    }

    private func handleSearchResultListSuccess() {
        resultTableView.restore()
        resultTableView.reloadData()
        resultTableView.isHidden = resultTableView.isEmpty
        titleLbl.isHidden = !resultTableView.isEmpty
    }

    private func handleInternetConnectionError(_ text: String) {
        let networkScreen = NetworkFailScreen()
        networkScreen.tryAgainBtnClicked = {
            self.viewModel.searchForCity(with: self.searchTxf.text)
        }
        resultTableView.backgroundView = networkScreen
        resultTableView.isHidden = false
        titleLbl.isHidden = true
    }

    @IBAction func searchBtnClicked(_ sender: Any) {
        viewModel.searchForCity(with: searchTxf.text)
    }
}

extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
