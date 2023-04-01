//
//  AccountRow.swift
//  AccountBook
//
//  Created by 이수민 on 2023/02/01.
//

import SwiftUI

struct AccountRow: View{
    @StateObject var dataManager: AccountDataManager = AccountDataManager.shared
    var accountData: AccountData
    var buttonArea: some View{
        VStack{
            Button {
                
            } label: {
                Text("+")
                    .foregroundColor(.black)
            }
            .frame(width: 43, height: 43)
            .background(Color(""))
            .cornerRadius(10)
        }.padding()
    }
    var body: some View{
        HStack{
            Text(accountData.category.DisplayImoji)
                .font(.system(size: 45))
                .cornerRadius(0.3)
            VStack(alignment:  .leading){
                Text(accountData.is_expenditure ? "지출" : "수입")
                    .background(accountData.is_expenditure ? .red : .green)
                Text(accountData.title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text((accountData.is_expenditure ? "-" : "+") + dataManager.numberFormat(price: accountData.account)+"원")
                    .font(.title3)
            }
            Spacer()
            buttonArea
        }
    }
}
