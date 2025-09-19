

import SwiftUI

struct TextFieldStyle: View {
    
    var label : String
    var placeholder : String
    @Binding var newItem : String
    
    var body: some View {
        VStack{
            Text(label)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
            TextField(placeholder,text: $newItem)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.horizontal)
    }
}

#Preview {
    TextFieldStyle(label: "label", placeholder: "placeholder", newItem: .constant(""))
        .environmentObject(TimerCollection())
}
