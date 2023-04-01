//
//  TotalView.swift
//  AccountBook
//
//  Created by 이수민 on 2023/02/01.
//

import SwiftUI

struct TotalView: View{
    @StateObject var dataManager: AccountDataManager = AccountDataManager.shared
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Text("지출")
                    Spacer()
                    Text(dataManager.numberFormat(price: dataManager.getBottom()[0])).font(.system(size: 15)).frame(alignment: .trailing).foregroundColor(.blue)
                    Text("원")
                }.padding(.horizontal)
                HStack{
                    Text("수입")
                    Spacer()
                    Text(dataManager.numberFormat(price: dataManager.getBottom()[1])).font(.system(size: 15)).frame(alignment: .trailing).foregroundColor(.blue)
                    Text("원")
                }.padding(.horizontal)
                HStack{
                    Text("총 자산")
                    Spacer()
                    Text(dataManager.numberFormat(price: dataManager.getBottom()[2])).font(.system(size: 15)).frame(alignment: .trailing).foregroundColor(.blue)
                    Text("원")
                }.padding(.horizontal)
            }
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal)
        }
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView()
    }
}
