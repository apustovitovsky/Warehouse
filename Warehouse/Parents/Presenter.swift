//
//  Presenter.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import UIKit


class Presenter<ViewType: AnyObject> {
    weak var view: ViewType?
    
    init(view: ViewType?) {
        self.view = view
    }
}


extension Presenter: Module where ViewType: UIViewController {
    func toPresent() -> UIViewController? {
        return view
    }
}

//
//protocol EnterNameModuleOutput: AnyObject {
//    var goPrev: (() -> Void)? { get set }
//    var goNext: (() -> Void)? { get set }
//}
//
//protocol EnterNamePresenterInput: AnyObject {
//    func requestUpdate()
//}
//
//protocol EnterNameViewInput: AnyObject {
//    func update(text: String)
//}
//
//
//class EnterNameView: View<EnterNamePresenterInput> {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "some view"
//    }
//}
//
//extension EnterNameView: EnterNameViewInput {
//    func update(text: String) {
//        self.title = text
//    }
//}
//
//class EnterNamePresenter<T>: Presenter<T>, EnterNameModuleOutput where T: EnterNameViewInput {
//    var goPrev: (() -> Void)?
//    var goNext: (() -> Void)?
//}
//
//extension EnterNamePresenter: EnterNamePresenterInput {
//    func requestUpdate() {
//        view?.update(text: String(Int.random(in: 1...10)))
//    }
//}
//
//
//func module(router: Router?) {
//    let view = EnterNameView()
//    let presenter = EnterNamePresenter(view: view)
//    view.presenter = presenter
//    var module: Presenter & EnterNameModuleOutput = presenter
//    module.goNext = {}
//    router?.push(module)
//}



