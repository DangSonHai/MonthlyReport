enum MyEnum {
    case None
    case Simple(text: String)
    case Advanced(x: Int, y: Int)
}

func ==(lhs: MyEnum, rhs: MyEnum) -> Bool {
    switch (lhs, rhs) {
    case (.None, .None):
        return true
    case let (.Simple(v0), .Simple(v1)):
        return v0 == v1
    case let (.Advanced(x0, y0), .Advanced(x1, y1)):
        return x0 == x1 && y0 == y1
    default:
        return false
    }
}
