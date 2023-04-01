//
//  TopArea.swift
//  AccountBook
//
//  Created by 이수민 on 2023/02/01.
//

import SwiftUI

struct InputAccountModal: View{
    var dataManager: AccountDataManager = AccountDataManager.shared
    func addAcountData() -> Bool {
        let acData = AccountData(category: selectedCategory, title: memo, account: money, is_expenditure: isBool)
        let result = dataManager.add(AccountData: acData)
        return !result
    }
    @Binding var isPresented: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var money: String = ""
    @State private var memo: String = ""
    @State private var selectedCategory: AccountCategory = .none
    @State private var isBool : Bool = true
    var body: some View {
        VStack(alignment: .leading){
            TopButton
            InputArea
            Spacer()
        }.padding()
    }
    
    var TopButton: some View {
        VStack{
            Button {
                dismiss()
            } label: {
                Text("돌아가기")
            }
        }.padding()
    }
    
    var InputArea: some View{
        VStack{
            HStack{
                Button {
                    isBool = true
                } label: {
                    Text("지출")
                        .font(.title)
                        .foregroundColor(.red)
                        .padding()
                        .background(isBool ? .green : .white)
                        .cornerRadius(20)
                }
                Button {
                    isBool = false
                } label: {
                    Text("수입")
                        .font(.title)
                        .foregroundColor(.red)
                        .padding()
                        .background(isBool ? .white : .green)
                        .cornerRadius(20)
                }
            }.padding(.trailing)
            HStack{
                Text("얼마나 쓰셨나요?")
                    .font(.title)
                Spacer()
                Button {
                    let result = addAcountData()
                    isPresented = result
                } label: {
                    Image(systemName: "arrow.up")
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                }
            }
            TextField("금액 입력", text: $money)
                .keyboardType(.decimalPad)
                .font(.title)
            Text("")
            TextField("메모 입력", text: $memo)
                .font(.title)
            Text("")
            Picker("지출 종류를 골라주세요", selection: $selectedCategory){
                ForEach(AccountCategory.allCases,id: \.self) { category in
                    Text(category.DisplayImoji)
                        .tag(category)
                }
            }.pickerStyle(.segmented)
            Text("")
            HStack{
                Text("오늘은~~")
                Spacer()
            }
            Text(selectedCategory.Display)
                .font(.title)
        }.padding()
    }
}
struct TopArea: View{
    @State private var isShowModal = false
    @StateObject var dataManager: AccountDataManager = AccountDataManager.shared
    //값을 가지고 있는 데이터 Original data
    //@Binding //값을 공통으로 유지하고 싶을때 state를 가리킴
    var body: some View {
        VStack{
            VStack{
                Button {
                    self.isShowModal = true
                } label: {
                    Text("💵💵💵")
                        .font(.system(size: 33.3))
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .sheet(isPresented: self.$isShowModal) {
                    InputAccountModal(isPresented:  self.$isShowModal)
                }
                
            }
            .background(.white)
            .cornerRadius(20)
            Button {
                dataManager.acDataList = []
            } label: {
                Text("Clear")
                    .foregroundColor(.red)
            }
        }.padding(.horizontal)
    }
}

struct TopArea_Previews: PreviewProvider {
    static var previews: some View {
        TopArea()
    }
}
