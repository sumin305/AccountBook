import Foundation

struct AccountData: Codable{
    
    var category: AccountCategory = .none
    var title: String = ""
    var account: String = "0"
    var date: Date = Date()
    var is_expenditure: Bool = true
    
    init(category: AccountCategory, title: String, account: String, is_expenditure: Bool) {
        self.category = category
        self.title = title
        self.account = account
        self.is_expenditure = is_expenditure
    }

}
enum AccountCategory: String, CaseIterable, Codable{
    case none
    case saving
    case drink
    case food
    case transport
    
    var id: AccountCategory { self }
    
    var DisplayImoji: String {
        switch self{
            case .saving: return "💰"
            case .drink: return "☕️"
            case .food: return "🍱"
            case .transport: return "🚘"
            default: return "💸"
        }
    }
    var Display: String{
        switch self{
            case .saving: return "돈 아끼기 좋은날"
            case .drink: return "마시기 좋은날"
            case .food: return "먹기 좋은날"
            default: return "돈 쓰기 좋은날"
        }
    }
}
