
import SwiftUI

@main
struct TimerApp: App {
    
    @StateObject var data = TimerCollection()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomePageView()
            }
            .environmentObject(data)
        }
    }
}
