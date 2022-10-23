//
//  Connect2VoteApp.swift
//  Connect2Vote
//
//  Created by Ananya Garg on 10/22/22.
//

import SwiftUI
import FirebaseCore
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      UITableView.appearance().backgroundColor = UIColor(red: 0, green: 0 , blue: 0, alpha: 100)
      UIListContentView.appearance().backgroundColor = UIColor(red: 1, green: 1 , blue: 1, alpha: 100)
    FirebaseApp.configure()

    return true
  }
}



@main
struct Connect2VoteApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ParentView().environmentObject(viewRouter)
        }
    }
}


