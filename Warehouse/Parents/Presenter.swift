//
//  Presenter.swift
//  Warehouse
//
//  Created by Алексей on 07.04.2024.
//

import UIKit


class Presenter<View: AnyObject> {

    weak var view: View?
    
    init(view: View) {
        self.view = view
    }
}

extension Presenter: Presentable where View: UIViewController {
    
    func toPresent() -> UIViewController? {
        return view
    }
}


protocol EnterNameModuleOutput {
    
    var goPrev: (() -> Void)? { get set }
    var goNext: (() -> Void)? { get set }
}

protocol EnterNamePresenterInput {
    
    func requestUpdate()
}

protocol EnterNameViewInput: AnyObject {
    
    func update(text: String)
}


class EnterNameView: View<EnterNamePresenterInput> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "some view"
    }
}

extension EnterNameView: EnterNameViewInput {
    
    func update(text: String) {
        self.title = text
    }
}

class EnterNamePresenter<View>: Presenter<View>, EnterNameModuleOutput where View: EnterNameViewInput {
    
    var goPrev: (() -> Void)?
    var goNext: (() -> Void)?
}

extension EnterNamePresenter: EnterNamePresenterInput {
    
    func requestUpdate() {
        view?.update(text: String(Int.random(in: 1...10)))
    }
}


func module(router: Router?) {
    let view = EnterNameView()
    let presenter = EnterNamePresenter(view: view)
    view.presenter = presenter
    var module: Presenter & EnterNameModuleOutput = presenter
    module.goNext = {}
    
    router?.push(module)
}



