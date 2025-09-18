

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
                            TimerListView()
                        }label: {
                            HStack{
                                Text(timer.emoji)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .padding(8)
                                    .background(timer.color.opacity(0.4))
                                    .cornerRadius(8)
                                VStack(alignment: .leading){
                                    Text(timer.name)
                                        .bold()
                                    Text(formatTime(timer.duration))
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .monospacedDigit()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomePageView()
        .environmentObject(TimerCollection())
}
