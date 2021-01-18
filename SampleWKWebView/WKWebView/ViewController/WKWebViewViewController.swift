//
//  WKWebViewViewController.swift
//  SampleWKWebView
//
//  Created by sakiyamaK on 2021/01/18.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa
import RxOptional
import RxGesture

final class WKWebViewViewController: UIViewController {
  private let BASE_URL = URL(string: "local_file_url")

  private var htmlStr: String!

  @IBOutlet private weak var webView: WKWebView! {
    didSet {
      webView.uiDelegate = self
      webView.navigationDelegate = self
    }
  }

  static func make(htmlStr: String) -> WKWebViewViewController {
    let vc = R.storyboard.wkWebView.instantiateInitialViewController()!
    vc.htmlStr = htmlStr
    return vc
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    webView.load(URLRequest(url: URL(string: "https://google.com")!))
//    webView.loadHTMLString(htmlStr.htmlString(family: nil, size: 20), baseURL: BASE_URL)
  }
}

extension WKWebViewViewController: WKUIDelegate {
}

extension WKWebViewViewController: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    DLog()
  }

  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    DLog()
  }
}

