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
            p { margin: 0; }
            a { color: black; }
            html * {
                font-size: \(size)pt !important;
                line-height: \(size*2)pt !important;
                font-family: \(family ?? "Helvetica"), Helvetica !important;
            }
        </style>
    </head>
    <body>
    \(self)
    </body>
</html>
"""
  }
}
