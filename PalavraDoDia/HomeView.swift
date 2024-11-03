//
//  ContentView.swift
//  PalavraDoDia
//
//  Created by Igor S. Menezes on 01/11/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = VersiculoViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.versiculos.indices, id: \.self) { index in
                        Text(viewModel.versiculos[index])
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .onAppear {
                                if index == viewModel.versiculos.count - 1 {
                                    Task {
                                        await viewModel.carregarMaisVersiculos()
                                    }
                                }
                            }
                    }
                }
            }
            .navigationTitle("Versículos Devocionais")
        }
    }
}


#Preview {
    HomeView()
}
