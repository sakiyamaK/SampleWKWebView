//
//  Macro.swift
//  SampleWKWebView
//
//  Created by sakiyamaK on 2021/01/18.
//

import Foundation

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
