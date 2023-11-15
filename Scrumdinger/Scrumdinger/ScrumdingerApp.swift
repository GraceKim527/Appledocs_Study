//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 김은혜 on 11/8/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
