https://stackoverflow.com/questions/24122288/remove-last-character-from-string-swift-language

var str = "Hello, World"                           // "Hello, World"
str.dropLast()                                     // "Hello, Worl" (non-modifying)
str                                                // "Hello, World"
String(str.dropLast())                             // "Hello, Worl"

str.remove(at: str.index(before: str.endIndex))    // "d"
str  

------------------------------------------------------------------------------------------

extension String {

    func removeCharsFromEnd(count_:Int) -> String {
        let stringLength = count(self)

        let substringIndex = (stringLength < count_) ? 0 : stringLength - count_

        return self.substringToIndex(advance(self.startIndex, substringIndex))
    }
}
