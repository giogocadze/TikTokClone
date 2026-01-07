//
//  TikTokCloneApp.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//
import SwiftUI
import UIKit

@main
struct TikTokCloneApp: App {

    init() {
        let buttonAppearance = UIBarButtonItemAppearance()
        
        let emptyImage = UIImage()

        buttonAppearance.normal.backgroundImage = emptyImage
        buttonAppearance.highlighted.backgroundImage = emptyImage
        buttonAppearance.disabled.backgroundImage = emptyImage
        buttonAppearance.focused.backgroundImage = emptyImage

        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithTransparentBackground()

        navAppearance.buttonAppearance = buttonAppearance
        navAppearance.backButtonAppearance = buttonAppearance
        navAppearance.doneButtonAppearance = buttonAppearance 

        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
    }
    
    var body: some Scene {
         WindowGroup {
             RootView()
         }
     }
}




