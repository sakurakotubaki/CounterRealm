import Foundation
import RealmSwift

// カウンターのモデルを定義する
class Counter: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var count: Int = 0
}
