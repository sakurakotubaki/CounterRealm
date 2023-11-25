import SwiftUI

struct ContentView: View {
    // @ObservedObject var realmManagerは、RealmManagerクラスのインスタンスを生成
    @ObservedObject var realmManager = RealmManager()

    var body: some View {
        VStack {
            // 現在のカウントを表示
            Text("Count: \(realmManager.counters.last?.count ?? 0)")
                .font(.largeTitle)

            // カウントアップボタン
            Button(action: {
                // カウントを1増やす
                let newCount = (realmManager.counters.last?.count ?? 0) + 1
                // カウントを追加
                realmManager.addCounter(count: newCount)
            }) {
                // 追加ボタンのデザイン
                Text("カウントアップ")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            // リセットボタンのデザイン
            Button(action: {
                // if letでlastCounterIdがnilでないことを確認
                if let lastCounterId = realmManager.counters.last?.id {
                    // カウンターをリセット
                    realmManager.resetCounter(id: lastCounterId)
                }
            }) {
                // リセットボタンのデザイン
                Text("リセット")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

