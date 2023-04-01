//
//  MainScrollView.swift
//  AccountBook
//
//  Created by 이수민 on 2023/02/01.
//

import SwiftUI

struct MainScrollView: View{
    @StateObject var dataManager: AccountDataManager = AccountDataManager.shared
    @State var acCategory: AccountCategory = .none

    var body: some View{
        VStack{
            List{
                ForEach(Array(dataManager.getList(Category: acCategory).enumerated()), id:\.offset) {idx, data in
                    AccountRow(accountData: data)
                }.onDelete(perform: deleteItem)
                
            }.listStyle(PlainListStyle())
                .frame(width: .infinity)
                .background(.white)
                .cornerRadius(20)
                .padding()
            GetCategorySelectionArea(selectedCategory: $acCategory)
        }
    }
    
    
    func deleteItem(at offsets: IndexSet) -> () {
        dataManager.acDataList.remove(atOffsets: offsets)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(dataManager.acDataList), forKey: AccountDataManager.ACCOUNT_DATA_LIST_KEY)
    }
    
}


struct MainScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MainScrollView()
    }
}
