
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 16) {
                    HStack(spacing: 0) {
                        sortButton(title: "По цене", selectedIndex: 0, action: {
                            viewModel.selected = 0
                            viewModel.sortItems(by: .price)
                        })
                        Divider()
                            .frame(height: 40)
                            .background(Color.gray)
                        sortButton(title: "По стажу", selectedIndex: 1, action: {
                            viewModel.selected = 1
                            viewModel.sortItems(by: .experience)
                        })
                        Divider()
                            .frame(height: 40)
                            .background(Color.gray)
                        sortButton(title: "По рейтингу", selectedIndex: 2, action: {
                            viewModel.selected = 2
                            viewModel.sortItems(by: .rating)
                        })
                    }
                    .frame(height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 16)
                    
                    ForEach(viewModel.items, id: \.id) { item in
                        NavigationLink(destination: CardViewBoss(item: item)) {
                            CardView(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Педиатры")
            .searchable(text: $viewModel.searchText, prompt: "Поиск")
            .background(Color.bgFon)
        }
    }
    
    @ViewBuilder
    func sortButton(title: String, selectedIndex: Int, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(viewModel.isButtonSelected(index: selectedIndex) ? .white : .gray)
                Image(systemName: viewModel.isAscending && viewModel.isButtonSelected(index: selectedIndex) ? "arrow.up" : "arrow.down")
                    .foregroundColor(viewModel.isButtonSelected(index: selectedIndex) ? .white : .gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(viewModel.isButtonSelected(index: selectedIndex) ? Color.pink : Color.white)
        }
        .clipShape(Rectangle())
    }
}

    #Preview {
        HomeView()
    }
