//
//  BaseViewModel.swift
//  OrcasTask
//
//  Created by Islam  on 7/7/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModel {

}

class BaseViewModel: ViewModel {
    var isLoading: PublishSubject<Bool> = .init()
    var displayToastMessage: PublishSubject<String> = .init()
    var noInternetConnection: PublishSubject<String> = .init()
}
