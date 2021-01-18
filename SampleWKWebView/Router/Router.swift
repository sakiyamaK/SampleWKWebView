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
    let htmlStr = "<p><strong>コンテンポラリーダンス</strong>と食と酒が絡まりあった現代のディナーショー。4時間の日常と非日常。最後は観客も巻き込んだ都会の大人のピクニック！ダンスだけじゃなく、歌や芝居など何が起きるかわかりません。</p><p></p><p><a href=\"https://artsticker.app\" rel=\"noopener\">リンク</a><strong>太字</strong></p>"

    let next = WKWebViewViewController.make(htmlStr: htmlStr)
    show(vc: vc, next: next)
  }

}
