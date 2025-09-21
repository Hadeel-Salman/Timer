

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var data : TimerCollection
    
    func DeleteTimer(at offsets: IndexSet) {
        data.timers.remove(atOffsets: offsets)
    }

    
    var body: some View {
        NavigationStack{
            VStack{
                Text("My Timers")
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                List{
                    ForEach(data.timers) { timer in
                        NavigationLink{
                            TimerItemView(timer: timer)
                        }label: {
                            TimerListView(emoji: timer.emoji, name: timer.name, color: timer.color, duration: timer.duration)
                        }
                    }
                    .onDelete(perform: DeleteTimer)
                }
                
                Spacer()
                NavigationLink{
                    NewTimerView()
                        .navigationTitle("Add new timer")
                }label: {
                    Text("Add new")
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
