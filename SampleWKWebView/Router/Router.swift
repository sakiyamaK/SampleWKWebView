//
//  Router.swift
//  SampleWKWebView
//
//  Created by sakiyamaK on 2021/01/16.
//

import UIKit

final class Router {
  private static func show(vc: UIViewController, next: UIViewController) {
    if let nav = vc.navigationController {
      nav.pushViewController(next, animated: true)
    } else {
      vc.present(next, animated: true, completion: nil)
    }
  }

  static func showRoot(window: UIWindow?) {
    let vc = R.storyboard.root.instantiateInitialViewController()!
    let rootVC = UINavigationController(rootViewController: vc)
    window?.rootViewController = rootVC
    window?.makeKeyAndVisible()
  }

  static func showWKWebViewInTableView(vc: UIViewController) {
    let next = R.storyboard.wkWebViewInTableView.instantiateInitialViewController()!
    show(vc: vc, next: next)
  }

  static func showWKWebView(vc: UIViewController) {

    let next = WKWebViewViewController.make(htmlStr: Const.htmlStr2)
    show(vc: vc, next: next)
  }

}
