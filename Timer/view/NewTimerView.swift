
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
            
            Text(newEmoji.isEmpty ? "🙂" : newEmoji)
                .font(.system(size: 40))
                .padding(12)
                .background(newColor.opacity(0.4))
                .cornerRadius(12)
            
            
            TextFieldStyle(label: "Add new Name", placeholder: "", newItem: $newName)
            TextFieldStyle(label: "Add new Emoji", placeholder: "", newItem: $newEmoji)
            
            //color Picker
            ColorPicker("Pick a color", selection: $newColor)
                .padding(.horizontal)
                .font(.title3)
                .bold()
            
            //time
            HStack {
                Button(action: {
                    if newTimer > 10 {
                        newTimer -= 60
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }

                Spacer()

                Text(formatTime(newTimer))
                    .font(.title)
                    .monospacedDigit()

                Spacer()

                Button(action: {
                    if newTimer < 7200 {
                        newTimer += 60
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)

            
            // Add button
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
