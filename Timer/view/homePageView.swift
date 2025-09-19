

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var data : TimerCollection
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("My Timers")
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                List{
                    ForEach(data.timers) { timer in
                        NavigationLink{
                            //direction
                        }label: {
                            TimerListView(emoji: timer.emoji, name: timer.name, color: timer.color, duration: timer.duration)
                        }
                    }
                }
                
                Spacer()
                NavigationLink{
                    NewTimerView()
                        .navigationTitle("Add new timer")
                }label: {
                    Button("Add new"){
                        NewTimerView()
                    }
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(32)
                    .padding([.top, .leading, .trailing])
                }
            }
        }
    }
}


#Preview {
    HomePageView()
        .environmentObject(TimerCollection())
}
