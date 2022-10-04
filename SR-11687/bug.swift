import Foundation
let scanner = Scanner(string: "0.5 bla")
var value = scanner.scanDouble()
print(value!)
value = scanner.scanDouble()
if value == nil { print("ok") }
print(value as Any)

