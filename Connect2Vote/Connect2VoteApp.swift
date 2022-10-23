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


