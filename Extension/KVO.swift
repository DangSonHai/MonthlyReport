public func observe<Value>(_ keyPath: KeyPath<Self, Value>, options: NSKeyValueObservingOptions = [], changeHandler: @escaping (Self, NSKeyValueObservedChange<Value>) -> Void) -> NSKeyValueObservation {
    let result = NSKeyValueObservation(object: self as! NSObject, keyPath: keyPath) { (obj, change) in
        let notification = NSKeyValueObservedChange(kind: change.kind, newValue: change.newValue as? Value, oldValue: change.oldValue as? Value, indexes: change.indexes, isPrior: change.isPrior)
        changeHandler(obj as! Self, notification)
    }
    result.start(options)
    return result
}

class Hoge {
    let scrollView = UIScrollView()
    var observation: NSKeyValueObservation?

    setUp() {
        observation = scrollView.observe(\.contentOffset) { view, change in
            print("move to (x: \(change.newValue!.x), y: \(change.newValue!.y))")
        }
    }

    tearDown() {
        observation.invalidate()
        // もしくは
        // observation = nil
        // もしくは自身(Hoge)の解放
    }
}
