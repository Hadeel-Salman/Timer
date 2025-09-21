
import SwiftUI

struct NewTimerView: View {
    
    @EnvironmentObject var data : TimerCollection
    @Environment(\.dismiss) var dismiss
    
    @State private var newName : String = ""
    @State private var newEmoji : String = ""
    @State private var newColor : Color = Color.blue
    @State private var newTimer : TimeInterval = 3600
    
    var body: some View {
        VStack{
            TextFieldStyle(label: "Add new Name", placeholder: "", newItem: $newName)
            TextFieldStyle(label: "Add new Emoji", placeholder: "", newItem: $newEmoji)
            ColorPicker("Pick a color", selection: $newColor)
                .padding(.horizontal)
            HStack {
                Button(action: {
                    if newTimer > 10 {
                        newTimer -= 60
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                }

                Spacer()

                Text(formatTime(newTimer))
                    .font(.title3)
                    .monospacedDigit()

                Spacer()

                Button(action: {
                    if newTimer < 7200 {
                        newTimer += 60
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                }
            }
            .padding(.horizontal)

            Button("add new Timer"){
                guard !newName.isEmpty , !newEmoji.isEmpty else { return }
                let timerItem = TimerItem(name: newName, emoji: newEmoji, color: newColor, duration: newTimer, remaining: newTimer)
                
                data.timers.append(timerItem)
                
                newName = ""
                newEmoji = ""
                newColor = .blue
                dismiss()
                
                
            }
        }
    }
}

#Preview {
    NewTimerView()
        .environmentObject(TimerCollection())
}
