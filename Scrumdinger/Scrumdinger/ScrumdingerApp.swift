//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 김은혜 on 11/8/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
