//
//  AppDelegate.swift
//  SampleWKWebView
//
//  Created by sakiyamaK on 2021/01/16.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    IQKeyboardManager.shared.enable = true
    window = UIWindow()
    Router.showRoot(window: window)
    return true
  }
}

