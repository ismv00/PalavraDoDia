//
//  VersiculoViewModel.swift
//  PalavraDoDia
//
//  Created by Igor S. Menezes on 01/11/24.
//

import Foundation

class VersiculoViewModel: ObservableObject {
    @Published var versiculos: [String] = []
    private let generator = VersiculoGenerator()
    
    init() {
        Task {
            await carregarMaisVersiculos()
        }
    }
    
    func carregarMaisVersiculos() async {
        await generator.gerarVersiculo { [weak self] versiculo in
            if let versiculo = versiculo {
                self?.versiculos.append(versiculo)
            }
        }
    }
}
