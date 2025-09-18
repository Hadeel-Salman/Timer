
import SwiftUI

struct TimerItem: Identifiable {
    
    var id = UUID()
    var name : String
    var emoji : String
    var color : Color
    var duration : TimeInterval
    var remaining : TimeInterval
    
    var isRuning : Bool = false
    var startDate : Date?
    
}

class TimerCollection : ObservableObject {
    @Published var timers : [TimerItem] = [
        TimerItem(
                   name: "Study Session",
                   emoji: "📚",
                   color: .blue,
                   duration: 3600,
                   remaining: 3600
               ),
               TimerItem(
                   name: "Morning Meditation",
                   emoji: "🧘‍♂️",
                   color: .purple,
                   duration: 900,
                   remaining: 900
               ),
               TimerItem(
                   name: "Coffee Break",
                   emoji: "☕️",
                   color: .brown,
                   duration: 300,
                   remaining: 300
               ),
               TimerItem(
                   name: "Workout",
                   emoji: "💪",
                   color: .orange,
                   duration: 1800,
                   remaining: 1800
               ),
               TimerItem(
                   name: "Reading Time",
                   emoji: "📖",
                   color: .green,
                   duration: 2700,
                   remaining: 2700
               ),
               TimerItem(
                   name: "Cooking",
                   emoji: "👨‍🍳",
                   color: .red,
                   duration: 1200,
                   remaining: 1200
               ),
               TimerItem(
                   name: "Power Nap",
                   emoji: "😴",
                   color: .indigo,
                   duration: 1200,
                   remaining: 1200
               ),
               TimerItem(
                   name: "Walking",
                   emoji: "🚶",
                   color: .mint,
                   duration: 2400,
                   remaining: 2400
               ),
               TimerItem(
                   name: "Music Practice",
                   emoji: "🎸",
                   color: .pink,
                   duration: 2100,
                   remaining: 2100
               ),
               TimerItem(
                   name: "Evening Relax",
                   emoji: "🌅",
                   color: .yellow,
                   duration: 1500,
                   remaining: 1500
               )
    ]
    
    func addTimer(name: String , emoji: String, color: Color, duration: TimeInterval) {
        let newTimer = TimerItem(
            name: name,
            emoji: emoji,
            color: color,
            duration: duration,
            remaining: duration
        )
        timers.append(newTimer)
    }
    
    
    func removeTimer(at offsets: IndexSet)  {
        timers.remove(atOffsets: offsets)
    }
}
