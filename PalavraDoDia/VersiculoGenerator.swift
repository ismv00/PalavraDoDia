//
//  VersiculoGenerator.swift
//  PalavraDoDia
//
//  Created by Igor S. Menezes on 01/11/24.
//

import Foundation
import SwiftUI
import GoogleGenerativeAI

class VersiculoGenerator {
    private var generativeModel: GenerativeModel?
    
    init() {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API Key não encontrada no Info.plist")
        }
        
        // Inicialize o modelo Gemini com a chave de API
        generativeModel = GenerativeModel(
            name: "gemini-1.5-flash",
            apiKey: apiKey
        )
    }
    
    // Função para gerar o versículo devocional
    func gerarVersiculo(completion: @escaping (String?) -> Void) async {
        let prompt = "Gere um versículo devocional bíblico."

        do {
            if let response = try await generativeModel?.generateContent(prompt),
               let versiculo = response.text {
                completion(versiculo)
            } else {
                completion("Erro ao gerar versículo.")
            }
        } catch {
            print("Erro ao gerar conteúdo: \(error.localizedDescription)")
            completion("Erro ao gerar versículo.")
        }
    }
}
