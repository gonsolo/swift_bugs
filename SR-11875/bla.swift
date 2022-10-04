import Foundation

extension Scanner {
	func comment() {
    charactersToBeSkipped = CharacterSet.whitespaces
		print("hash: ", scanString("#") as Any)
		print("comment: ", scanUpToCharacters(from: CharacterSet.newlines) as Any)
    _  = scanCharacters(from: CharacterSet.newlines)
		print("x: ", scanString("x") as Any)
    charactersToBeSkipped = CharacterSet.whitespacesAndNewlines
	}
}

func test(_ file: String) {
	guard let handle = FileHandle(forReadingAtPath: file) else { exit(0) }
	let data = handle.readDataToEndOfFile()
	guard let string = String(data: data, encoding: .utf8) else { exit(0) }
	let scanner = Scanner(string: string)
	scanner.comment()
}

print("This is resolved now.")
test("works")
test("works_also")
test("works_not")

