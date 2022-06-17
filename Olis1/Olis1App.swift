//
//  Olis1App.swift
//  Olis1
//
//  Created by apprenant50 on 16/05/2022.
//

import SwiftUI

@main
struct OLISApp: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            CustomTabBar(viewRouter: viewRouter)
        }
    }
}
