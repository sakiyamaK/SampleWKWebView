//
//  Macro.swift
//  SampleWKWebView
//
//  Created by sakiyamaK on 2021/01/18.
//

import Foundation

enum Const {
  static let htmlStr = "<p><strong>コンテンポラリーダンス</strong>と食と酒が絡まりあった現代のディナーショー。4時間の日常と非日常。最後は観客も巻き込んだ都会の大人のピクニック！ダンスだけじゃなく、歌や芝居など何が起きるかわかりません。</p><p></p><p><a href=\"https://artsticker.app\" rel=\"noopener\">リンク</a><strong>太字</strong></p>"

  static let htmlStr2 = String.init(repeating: htmlStr, count: 3)
}

//デバッグビルドでしか出ないよ
func DLog(_ obj: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
  var filename: NSString = file as NSString
  filename = filename.lastPathComponent as NSString
  if let obj = obj {
    print("[File:\(filename) Func:\(function) Line:\(line)] : \(obj)")
  } else {
    print("[File:\(filename) Func:\(function) Line:\(line)]")
  }
}

//リリースビルドでも出るよ
func ALog(_ obj: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
  var filename: NSString = file as NSString
  filename = filename.lastPathComponent as NSString
  if let obj = obj {
    debugPrint("[File:\(filename) Func:\(function) Line:\(line)] : \(obj)")
  } else {
    debugPrint("[File:\(filename) Func:\(function) Line:\(line)]")
  }
}
