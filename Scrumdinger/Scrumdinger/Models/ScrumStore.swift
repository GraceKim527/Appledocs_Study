//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by 김은혜 on 12/6/23.
//

import SwiftUI

@MainActor
class ScrumStore: ObservableObject {
    // ObservableObject :: 외부 모델 데이터를 SwiftUI 뷰에 연결하기 위한 클래스 제약 프로토콜
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        // 파일 관리자 호출
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
    
    // 비동기 함수 load() 선언
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
