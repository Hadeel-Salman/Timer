
import SwiftUI

struct TimerItemView: View {
    
    @EnvironmentObject var data : TimerCollection
    var timer : TimerItem
    
    var body: some View {
        VStack(alignment: .leading){
                Text(timer.emoji)
                    .font(.system(size: 40))
                    .padding(12)
                    .background(timer.color.opacity(0.4))
                    .cornerRadius(12)
            
            Text("\(timer.name) for \(formatTime(timer.duration))")
                .bold()
        }
    }
}

#Preview {
    NavigationStack{
        TimerItemView(
            timer: TimerItem(
            name: "Study Session",
            emoji: "📚",
            color: .blue,
            duration: 3600,
            remaining: 3600
            )
        )
        .environmentObject(TimerCollection())
    }
}
