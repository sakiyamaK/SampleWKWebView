//
//  WKWebViewInTableViewCell.swift
//  SampleWKWebView
//
//  Created by sakiyamaK on 2021/01/18.
//

import UIKit
import SnapKit
import WebKit

final class WKWebViewInTableViewCell: UITableViewCell {

  private let BASE_URL = URL(string: "local_file_url")

  @IBOutlet private weak var webView: WKWebView! {
    didSet {
        webView.scrollView.isScrollEnabled = false
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    DLog()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
  }

  func configure(urlStr: String) {
    DLog("""
webView.frame = \(webView?.frame)
contentView.frame = \(contentView.frame)
""")
//    webView?.loadHTMLString(urlStr.htmlString(family: nil, size: 22), baseURL: BASE_URL)
  }

  static func heightFor() -> CGFloat {
    return 100
  }
}


extension WKWebViewInTableViewCell: WKUIDelegate {
}

extension WKWebViewInTableViewCell: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    DLog()
  }

  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    DLog()
  }
}
