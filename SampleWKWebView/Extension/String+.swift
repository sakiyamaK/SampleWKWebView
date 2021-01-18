//
//  String+.swift
//  SampleWKWebView
//
//  Created by sakiyamaK on 2021/01/18.
//

import UIKit

extension String {
  func htmlString(family: String?, size: CGFloat) -> String {
    return """
<!doctype html>
<html>
    <head>
        <style>
            html * {
              margin: 0px;
              padding: 0px;
              font-size: \(size)pt !important;
              line-height: \(size*2)pt !important;
              font-family: \(family ?? "Helvetica"), Helvetica !important;
            }
            a { color: black; }
        </style>
    </head>
    <body>
    \(self)
    </body>
</html>
"""
  }
}
