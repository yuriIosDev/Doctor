
import Foundation

class HomeViewModel: ObservableObject {
    private let service = ServiceManager()
    
    @Published var items: [CurentUser] = []
    @Published var searchText = ""
    @Published var selected = 0
    @Published var isAscending = true
    
    init() {
        loadUsers()
    }
    
    enum SortCriteria {
        case price, experience, rating
    }
    
    func loadUsers() {
        items = service.loadUsersFromJSON() ?? []
    }
    
    func sortItems(by criteria: SortCriteria) {
        switch criteria {
        case .price:
            items.sort { (isAscending ? $0.hospital_price ?? 0 < $1.hospital_price ?? 0 : $0.hospital_price ?? 0 > $1.hospital_price ?? 0) }
        case .experience:
            items.sort { (isAscending ? $0.totalExperience < $1.totalExperience : $0.totalExperience > $1.totalExperience) }
        case .rating:
            items.sort { (isAscending ? $0.ratings_rating ?? 0 < $1.ratings_rating ?? 0 : $0.ratings_rating ?? 0 > $1.ratings_rating ?? 0) }
        }
        isAscending.toggle()
    }
    
    func isButtonSelected(index: Int) -> Bool {
        return selected == index
    }
    
    func toggleSortOrder() {
        isAscending.toggle()
    }
}
