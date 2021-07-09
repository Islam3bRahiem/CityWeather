//
//  BaseController.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import UIKit
import RxCocoa
import RxSwift
import Toast_Swift

protocol BaseControllerFunctions {
    func makeAlert(with message: String) 
}

class BaseController: UIViewController {

    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension BaseController: BaseControllerFunctions {
    func makeAlert(with message: String) {
        self.view.makeToast(message)
    }

}
