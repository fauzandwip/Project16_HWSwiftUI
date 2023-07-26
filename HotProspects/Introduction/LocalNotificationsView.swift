//
//  LocalNotificationsView.swift
//  HotProspects
//
//  Created by Fauzan Dwi Prasetyo on 26/07/23.
//

import SwiftUI
import UserNotifications

struct LocalNotificationsView: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                let center = UNUserNotificationCenter.current()
                
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            .padding()
            .background(.teal)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            Button("Schedule Notification") {
                let center = UNUserNotificationCenter.current()
                
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                center.add(request)
            }
            .padding()
            .background(.teal)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
}

struct LocalNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationsView()
    }
}
