//
//  GetCategorySelectionArea.swift
//  AccountBook
//
//  Created by 이수민 on 2023/02/01.
//

import SwiftUI
//struct StatefulPreviewWrapper<Value, Content: View>: View {
//    @State var value: Value
//    var content: (Binding<Value>) -> Content
//
//    var body: some View {
//        content($value)
//    }
//
//    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
//        self._value = State(wrappedValue: value)
//        self.content = content
//    }
//}

struct GetCategorySelectionArea: View{
    @Binding var selectedCategory: AccountCategory
    var body: some View {
        VStack{
            Picker("지출 종류를 골라주세요", selection: $selectedCategory) {
                ForEach(AccountCategory.allCases, id: \.self) { category in
                    Text(category.DisplayImoji)
                        .tag(category)
                }
            }
            .onChange(of: selectedCategory, perform: { newValue in
            })
            .pickerStyle(SegmentedPickerStyle())
        }.padding(.horizontal)
    }
}
struct GetCategorySelectionArea_Previews: PreviewProvider {
    
    static var previews: some View {
        GetCategorySelectionArea(selectedCategory: .constant(.food))
        //StatefulPreviewWrapper(.none) { GetCategorySelectionArea(selectedCategory: $0) }
    }
}
