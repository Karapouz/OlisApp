//
//  ViewRouter.swift
//  Projet OLIS
//
//  Created by apprenant50 on 16/05/2022.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .home

}
enum Page {
    case home
    case stat
    case profile
    case chat
}
