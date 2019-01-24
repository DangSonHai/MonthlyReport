public protocol Appliable {}

public extension Appliable {
    @discardableResult
    public func apply(closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

public protocol Runnable {}

public extension Runnable {
    @discardableResult
    public func run<T>(closure: (Self) -> T) -> T {
        return closure(self)
    }
}

extension NSObject: Appliable {}
extension NSObject: Runnable {}

let view = UIView().apply {
    $0.backgroundColor = .red
    $0.frame = .init(x: 0, y: 0, width: 200, height: 200)
}