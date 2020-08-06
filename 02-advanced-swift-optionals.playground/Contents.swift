/**
 * Copyright (c) 2020 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */


// De-sugared version of Int?
var foundIndex: Optional<Int>

// MARK: -
// Manual unwrapping optionals
let statesAndCapitals = [
  "California": "Sacramento",
  "Vermont": "Montpelier"
  // ...
]

let capital = statesAndCapitals["California"]

switch capital {
case .some(let name):
  print("Found", name)
case .none:
  print("Not found in the dictionary")
}

if case .none = capital {
  print("Not found in the dictionary")
}

if case let .some(name) = capital {
  print("Found", name)
}

// MARK: -
// Use pattern matching syntax

// In a switch statement
switch capital {
case let name?:
  print("Found", name)
case .none:
  print("Not found in dictionary")
}

// In an if statement
if case let name? = capital {
  print("Found", name)
} else {
  print("Not found in dictionary")
}

// In a loop; this will filter out the nil value
let values = [nil, 3, 1, 5]
for case let value? in values {
  print(value)
}

// MARK: -
// Flattening

let strings = ["1", "2", "3"]

if let first = strings.first {
  if let integer = Int(first) {
    print("nested let integer", integer)
  }
}

if let first = strings.first, let integer = Int(first) {
  print("single let integer", integer)
}

guard let first = strings.first, let integer = Int(first) else {
  fatalError("can't return because this statement isn't in a function")
}
print("guarded integer", integer)

// Warning produced because $0 is optional
strings.first.map(Int.init).map { print("mapped", $0) }

// Flattens the nested optional
strings.first.flatMap(Int.init).map { print("flattened", $0) }

// MARK: -
// Optional Promotion

func isValidSudokuEntry(_ digit: Int?) -> Bool {
  switch digit {
  case let value?:
    return value >= 1 && value <= 9
  case .none:
    return true // consider blank entries valid
  }
}

isValidSudokuEntry(2)            // Compiler will promote 2 to Optional(2) if needed
isValidSudokuEntry(Optional(2))  // Call the optional version
isValidSudokuEntry(.none)        // Call the optional version

// Or it will use this and not promote
 func isValidSudokuEntry(_ digit: Int) -> Bool {
   digit >= 1 && digit <= 9
 }


// MARK: -
// Compacting arrays

// In a loop; this will filter out the nil value
// let values = [nil, 3, 1, 5]
for case let value? in values {
  print(value)
}

let concrete = values.compactMap { $0 }

// MARK: -
// Use explicitly unwrapped optional

var lateBinding: Int! = 3

// You can use an implicit optional safely,
// just like normal optional
if let lateBinding = lateBinding {
  print(lateBinding + 100)
}

// Or you can use the type directly and it gets force unwrapped
// automatically so it doesn't even look like an optional.
print("add 10", lateBinding + 10)

// Equivalent to this:
print("add 10", lateBinding! + 10)


// When you assign it to another variable, it is converted to a true
// optional.
var another = lateBinding

// The below code doesn't compile because another is a true optional
// that needs to be unwrapped.
// print("add 10", another + 10)

