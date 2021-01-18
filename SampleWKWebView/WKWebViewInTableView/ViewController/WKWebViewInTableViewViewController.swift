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


final class WKWebViewInTableViewViewController: UIViewController {

  let htmlStr = "<p><strong>コンテンポラリーダンス</strong>と食と酒が絡まりあった現代のディナーショー。4時間の日常と非日常。最後は観客も巻き込んだ都会の大人のピクニック！ダンスだけじゃなく、歌や芝居など何が起きるかわかりません。</p><p></p><p><a href=\"https://artsticker.app\" rel=\"noopener\">リンク</a><strong>太字</strong></p>"

  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(R.nib.wkWebViewInTableViewCell)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.reloadData()
  }
}

extension WKWebViewInTableViewViewController: UITableViewDelegate {

}

extension WKWebViewInTableViewViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    DLog()
    let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.wkWebViewInTableViewCell, for: indexPath)!
    cell.configure(urlStr: self.htmlStr)
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    WKWebViewInTableViewCell.heightFor()
  }
}

extension WKWebViewInTableViewViewController: UITableViewDataSourcePrefetching {
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    DLog()
  }

}
