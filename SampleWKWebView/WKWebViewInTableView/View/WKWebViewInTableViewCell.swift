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

  private let localBaseURL = URL(string: "local_file_url")
//  private let observerKey = "webView.scrollView.contentSize"
  private var observeLoading: NSKeyValueObservation?
  var tapLink: ((URL) -> Void)?

  private static var mock: WKWebViewInTableViewCell = R.nib.wkWebViewInTableViewCell.firstView(owner: nil, options: nil)!
  private var loadCompletion: ((CGFloat) -> Void)?

  @IBOutlet private weak var webViewBottomConstraint: NSLayoutConstraint!
  @IBOutlet private weak var webViewTopConstraint: NSLayoutConstraint!
  @IBOutlet private weak var webViewHeightConstraint: NSLayoutConstraint!
  private var cellHeight: CGFloat {
    webViewHeightConstraint.constant +
      webViewTopConstraint.constant +
      webViewBottomConstraint.constant
  }
  @IBOutlet private weak var webView: WKWebView! {
    didSet {
      webView.scrollView.isScrollEnabled = false
      webView.uiDelegate = self
      webView.navigationDelegate = self
    }
  }

  override func prepareForReuse() {
    super.prepareForReuse()
  }

  func configure(htmlStr: String, loadCompletion: ((CGFloat) -> Void)? = nil) {
    self.loadCompletion = loadCompletion
    webView?.loadHTMLString(htmlStr.htmlString(family: nil, size: 22), baseURL: localBaseURL)
    self.observeLoading = webView.observe(\.scrollView.contentSize, options: [.new]) {[weak self] (webView, change) in
      let newHeight = webView.scrollView.subviews.first!.frame.height
      if self?.webViewHeightConstraint.constant != newHeight {
        self?.webViewHeightConstraint.constant = newHeight
        self?.setNeedsLayout()
        self?.layoutIfNeeded()
        self?.loadCompletion?(self?.cellHeight ?? 0)
      }
    }
  }

  static func heightFor(width: CGFloat, htmlStr: String, loadCompletion: ((CGFloat) -> Void)? = nil ) {
    mock.frame = CGRect(origin: .zero, size: CGSize.init(width: width, height: 1))
    mock.setNeedsLayout()
    mock.layoutIfNeeded()
    mock.configure(htmlStr: htmlStr, loadCompletion: loadCompletion)
  }
}

extension WKWebViewInTableViewCell: WKUIDelegate {
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    DLog("---- finish -------")
  }

  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
  }
}

extension WKWebViewInTableViewCell: WKNavigationDelegate {
  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    DLog(navigationAction.request.url)
    if let url = navigationAction.request.url, url != localBaseURL {
      tapLink?(url)
      return decisionHandler(.cancel)
    }
    return decisionHandler(.allow)
  }

}
