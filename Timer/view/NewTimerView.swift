
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
            Stepper("\(formatTime(newTimer))",
                    value: $newTimer,
                    in: 10...7200,
                    step: 60)
                .padding(.horizontal)
            
            Button("add new Timer"){
                guard !newName.isEmpty , !newEmoji.isEmpty else { return }
                let newTimer = TimerItem(name: newName, emoji: newEmoji, color: newColor, duration: newTimer, remaining: newTimer)
                
                data.timers.append(newTimer)
                
                newName = ""
                newEmoji = ""
                newColor = .primary
                dismiss()
                
                
            }
        }
    }
}

#Preview {
    NewTimerView()
        .environmentObject(TimerCollection())
}
