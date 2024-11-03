//
//  PalavraDoDiaApp.swift
//  PalavraDoDia
//
//  Created by Igor S. Menezes on 01/11/24.
//

import SwiftUI
import UserNotifications

@main
struct PalavraDoDiaApp: App {
    
    init () {
        solicitarPermissaoDeNotificacao()
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
    
    func solicitarPermissaoDeNotificacao () {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error  = error {
                print("Erro ao solicitar permissão: \(error.localizedDescription)")
            }
            
            print(granted ? "Permissão concedida" : "Permissão negada")
        }
    }
}
