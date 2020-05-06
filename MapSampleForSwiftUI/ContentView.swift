//
//  ContentView.swift
//  MapSampleForSwiftUI
//
//  Created by Takuya Aso on 2020/05/06.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // 初期のlatitudeDelta，longitudeDeltaの値
    @State private var zoomValue = 0.01

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // ZStackを使ってMapの上にボタンたちをのせる
                // ボタンを右下に配置するために bottomTrailing
                ZStack(alignment: .bottomTrailing) {
                    // MapViewはMKMapViewを使う
                    MapView(zoomValue: $zoomValue)
                        .frame(height: 300.0)
                    // ここは別クラスに分けた方が良い
                    VStack {
                        // マップ拡大ボタン
                        Button(action: {
                            // latitudeDelta，longitudeDeltaの値を変化させる
                            // @Bindingを使っているのでMapViewの方で変化を受け取れる
                            self.zoomValue *= 0.5
                        }) {
                            Image(systemName: "plus.app.fill")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundColor(.gray)
                        }
                        // マップ縮小ボタン
                        Button(action: {
                            // latitudeDelta，longitudeDeltaの値を変化させる
                            // @Bindingを使っているのでMapViewの方で変化を受け取れる
                            self.zoomValue *= 2
                        }) {
                            Image(systemName: "minus.square.fill")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundColor(.gray)
                        }
                    }
                    .padding(.bottom, 24.0)
                    .padding(.trailing, 12.0)
                }
                Spacer()
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
