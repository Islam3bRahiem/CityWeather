//
//  StoredProperty.swift
//  OrcasTask
//
//  Created by Islam  on 7/9/21.
//

import Foundation
import UIKit

@propertyWrapper
struct StoredDefaults<T: Codable> {
    let key: String
    let defaultValue: T?
    let type: T.Type?
    init(_ key: String) {
        self.key = key
        self.defaultValue = nil
        self.type = T.self
    }
    init(_ key: String, defaultValue: T?) {
        self.key = key
        self.defaultValue = defaultValue
        self.type = T.self
    }

    var wrappedValue: T? {
        get {
            if let data = UserDefaults.standard.object(forKey: key) as? T {
                return data
            } else if let data = UserDefaults.standard.data(forKey: key) {
                return try! JSONDecoder().decode(T.self, from: data)
            }
            return nil
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.setValue(data, forKey: key)
        }
    }

    var projectedValue: Self {
        return self
    }

    func delete() {
        UserDefaults.standard.removeObject(forKey: key)
    }

}





