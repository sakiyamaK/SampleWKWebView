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
  private let BASE_URL = URL(string: "localFile")

  private var htmlStr: String!

  @IBOutlet private weak var webView: WKWebView! {
    didSet {
//      webView.scrollView.isScrollEnabled = false
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
//    let str = "https://www.google.com/search?q=うんこ".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//    webView.load(URLRequest(url: URL(string: str)!))
    let htmlStr = self.htmlStr.htmlString(family: nil, size: 20)
    DLog(htmlStr)
    webView.loadHTMLString(htmlStr.htmlString(family: nil, size: 20), baseURL: nil)

    self.addObserver(self, forKeyPath: "webView.scrollView.contentSize", options: .prior, context: nil)
    DLog(
      """
webView: \(webView.frame.size)
webView.scrollView: \(webView.scrollView.frame.size)
webView.scrollView.contentSize: \(webView.scrollView.contentSize)
"""
    )
  }

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "webView.scrollView.contentSize" {
      DLog(webView.scrollView.contentSize)
    }
  }
}

extension WKWebViewViewController: WKUIDelegate {
}

extension WKWebViewViewController: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    DLog()
  }

  func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
    DLog()
  }

  func webViewDidClose(_ webView: WKWebView) {
    DLog()
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    DLog(
"""
webView: \(webView.frame.size)
webView.scrollView: \(webView.scrollView.frame.size)
webView.scrollView.contentSize: \(webView.scrollView.contentSize)
"""
      )
  }

  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    DLog()
  }
//  func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
//    DLog()
//  }

//  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//    DLog()
//  }
//
//  func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
//    DLog()
//  }
//
//  func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
//    DLog()
//  }
//
//  @available(iOS 13.0, *)
//  func webView(_ webView: WKWebView, contextMenuDidEndForElement elementInfo: WKContextMenuElementInfo) {
//    DLog()
//  }
//
//  @available(iOS 13.0, *)
//  func webView(_ webView: WKWebView, contextMenuWillPresentForElement elementInfo: WKContextMenuElementInfo) {
//    DLog()
//  }
//
//  func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
//    DLog()
//    return true
//  }
//
//  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//    DLog()
//  }
//
////  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
////    DLog()
////  }
////
////  func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
////    DLog()
////  }
//
////  func webView(_ webView: WKWebView, authenticationChallenge challenge: URLAuthenticationChallenge, shouldAllowDeprecatedTLS decisionHandler: @escaping (Bool) -> Void) {
////    DLog()
////  }
//
////  func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
////    DLog()
////  }
//
//  func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
//    DLog()
//  }
//
//  func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
//    DLog()
//  }
//
//  func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//    DLog()
//    return webView
//  }


//  @available(iOS 13.0, *)
//  func webView(_ webView: WKWebView, contextMenuForElement elementInfo: WKContextMenuElementInfo, willCommitWithAnimator animator: UIContextMenuInteractionCommitAnimating) {
//    DLog()
//  }
//
//  @available(iOS 13.0, *)
//  func webView(_ webView: WKWebView, contextMenuConfigurationForElement elementInfo: WKContextMenuElementInfo, completionHandler: @escaping (UIContextMenuConfiguration?) -> Void) {
//    DLog()
//  }
//
//  @available(iOS 13.0, *)
//  func webView(_ webView: WKWebView, previewingViewControllerForElement elementInfo: WKPreviewElementInfo, defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
//    DLog()
//    return nil
//  }
//  @available(iOS 13.0, *)
//  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
//    DLog()
//  }
}
