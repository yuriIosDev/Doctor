

import SwiftUI

struct ContentView: View {
    
    @State var selectionPage: String = ""
    var body: some View {
        TabView(selection: $selectionPage) {
            HomeView()
                .tabItem {
                    Image (systemName: "house.fill")
                    Text ("Главная")
                }
            Text("100")
                .tabItem {
                    Image (systemName: "calendar")
                    Text ("Приемы")
                }
            Text("102")
                .tabItem {
                    Image (systemName: "message.fill")
                    Text ("Чат")
                }
                .badge(1)
            Text("505")
                .tabItem {
                    Image (systemName: "person.fill")
                    Text ("Профиль")
                }
        }
    }
}
#Preview {
        ContentView()
}
