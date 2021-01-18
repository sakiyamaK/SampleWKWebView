//
//  RootViewController.swift
//  SampleWKWebView
//
//  Created by sakiyamaK on 2021/01/18.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional
import RxGesture
import NSObject_Rx

final class RootViewController: UIViewController {
  @IBOutlet weak var wKWebViewInTableViewButton: UIButton! {
    didSet {

    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    wKWebViewInTableViewButton.rx.tapGesture().when(.recognized).bind(to: Binder(self) { (vc, _) in
      Router.showWKWebViewInTableView(vc: vc)
    }).disposed(by: rx.disposeBag)

  }
}
