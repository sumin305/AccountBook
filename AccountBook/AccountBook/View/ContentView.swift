//
//  ContentView.swift
//  AccountBook
//
//  Created by 이수민 on 2023/01/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
                .opacity(0.2)
            VStack {
                TopArea()
                Spacer()
                MainScrollView()
                Spacer()
                TotalView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
