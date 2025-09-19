
import SwiftUI

struct TimerListView: View {
    var emoji : String
    var name : String
    var color : Color
    var duration : TimeInterval
    
    var body: some View {
        HStack{
            Text(emoji)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(8)
                .background(color.opacity(0.4))
                .cornerRadius(8)
            VStack(alignment: .leading){
                Text(name)
                    .bold()
                Text(formatTime(duration))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .monospacedDigit()
            }
        }
    }
}


#Preview {
    TimerListView(emoji: "📚", name: "Study", color: .blue, duration: 3600)
}
