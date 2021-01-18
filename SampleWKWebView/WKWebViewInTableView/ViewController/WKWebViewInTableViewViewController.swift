//
//  WKWebViewInTableViewController.swift
//  SampleWKWebView
//
//  Created by sakiyamaK on 2021/01/18.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional
import RxGesture
import SafariServices

final class WKWebViewInTableViewViewController: UIViewController {

  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(R.nib.wkWebViewInTableViewCell)
    }
  }

  private var height: CGFloat = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    WKWebViewInTableViewCell.heightFor(width: self.view.frame.width, htmlStr: Const.htmlStr2, loadCompletion: {[weak self] (height) in
      DLog(height)
      self?.height = height
      self?.tableView.reloadData()
    })
  }
}

extension WKWebViewInTableViewViewController: UITableViewDelegate {

}

extension WKWebViewInTableViewViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.wkWebViewInTableViewCell, for: indexPath)!
    cell.configure(htmlStr: Const.htmlStr2)
    cell.tapLink = {[weak self] url in
      let vc = SFSafariViewController(url: url)
      self?.navigationController?.present(vc, animated: true, completion: nil)
    }
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    self.height
  }
}
