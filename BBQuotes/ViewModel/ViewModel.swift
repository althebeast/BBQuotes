//
//  ViewModel.swift
//  BBQuotes
//
//  Created by Alperen Sarışan on 29.01.2024.
//

import Foundation

@MainActor //model'e bu dosyanın her zaman en güçlü thread'de (cpu) da çalışması gerektiğini söylüyor
class ViewModel: ObservableObject { //bunun anlamı birşey değiştiği zaman view neyin değiştiniği anlaması için ona ayak uydurması için kullanılır.
    enum Status {
        case notStarted
        case fetching
        case success(data: (quote: Quote, character: Character))
        case failed(error: Error)
    }
    
    @Published private(set) var status: Status = .notStarted //observableObject published'de ki değişikleri görüp view'a iletir ama viewmodel harici kimse burada olanları değiştiremez

    private let controller: FetchController
    
    init(controller: FetchController) {
        self.controller = controller
    }
    
    func getData(for show: String) async {
        status = .fetching
        
        do {
            let quote = try await controller.fetchQuote(from: show)
            
            let character = try await controller.fetchCharacter(quote.character)
            
            status = .success(data: (quote, character))
        } catch {
            status = .failed(error: error)
        }
    }
}
