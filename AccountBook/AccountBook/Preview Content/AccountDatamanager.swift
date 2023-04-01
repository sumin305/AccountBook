import Foundation
//userdefault
//개인 설정값 저장

class AccountDataManager: ObservableObject {
    static let ACCOUNT_DATA_LIST_KEY: String = "ACCOUNT_DATA_LIST_KEY"
    static let shared = AccountDataManager()
    
    @Published var acDataList: [AccountData] = []
    
//    func getDummyData() -> [AccountData] {
    //        return []
    //    }
    //
    func numberFormat(price: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let intValue = Int(price) {
            let num = NSNumber(value: intValue)
            if let result = numberFormatter.string(from: num) {
                return result
            }
        }
        return price
    }
    init() {
        if let data = UserDefaults.standard.value(forKey: AccountDataManager.ACCOUNT_DATA_LIST_KEY) as? Data{
            let accountList = try?
            PropertyListDecoder().decode([AccountData].self, from: data)
            if let list = accountList {
                acDataList = list
            }
        }
    }
    func getList(Category acCate: AccountCategory) -> [AccountData] {
        if acDataList.isEmpty {
            return []
        }
        var returnList: [AccountData] = acDataList
        if acCate != .none {
            returnList = []
            for acData in acDataList{
                if acData.category == acCate {
                    returnList.append(acData)
                }
            }
        }
        
        return returnList
    }
    
    func getBottom() -> [String] {
        if acDataList.isEmpty{
            return ["0", "0", "0"]
        }
        var total : [Int] = [0,0,0]
        for data in acDataList {
            if data.is_expenditure{
                total[0] += Int(data.account) ?? 0
            }else{
                total[1] += Int(data.account) ?? 0
            }
        }
        total[2] = total[1] - total[0]
        return total.map{String($0)}
    }
    
    func add(AccountData acData: AccountData?) -> Bool {
        if let data = acData {
            acDataList.insert(data,at:0)
            
            UserDefaults.standard.set(try?
                                      PropertyListEncoder().encode(acDataList),
                                      forKey: AccountDataManager.ACCOUNT_DATA_LIST_KEY)
            return UserDefaults.standard.synchronize()
        }
        return false
    }
}
