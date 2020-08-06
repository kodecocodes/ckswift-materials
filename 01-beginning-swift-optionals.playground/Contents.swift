/**
 * Copyright (c) 2019 Razeware LLC
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


// Creates an optional Int, defaults to nil
var foundIndex: Int?

// You can set an optional to a value...
foundIndex = 42

// Or you can set it to nil!
foundIndex = nil

// Test data
let array = Array(0...100)

// Comment this if you want the program to crash
foundIndex = 42

// Force unwrapping
// Avoid this; it will crash if foundIndex is nil!
let unwrappedIndex: Int = foundIndex!
print(array[unwrappedIndex])

// Safely unwrap with if let
if let unwrappedIndex = foundIndex {
  // Only executes this line if foundIndex isn't nil
  print(array[unwrappedIndex])
}

// You can also shadow the Int? with an Int w/ the same name
if let foundIndex = foundIndex {
  print(array[foundIndex])
}

// Use guard let to exit early from a func if there is no value to unwrap
func printElement() {
  guard let foundIndex = foundIndex else {
    return
  }
  // Only executes this line if foundIndex isn't nil
  print(array[foundIndex])
}

// Safely unwrap in a functional way with map
foundIndex.map { print($0) }

// Test data
struct Address {
  var phoneNumber: String?
}
struct Person {
  var address: Address?
}
var person: Person?

// Comment this if you want the program to crash
person = Person(address: Address(phoneNumber: "123-123-1234"))

// Use optional chaining to safely test nested optionals
if let number = person?.address?.phoneNumber {
  print(number)
}

// Avoid this; it will crash if any of these optionals are nil!
if let number = person!.address!.phoneNumber {
  print(number)
}

person = Person(address: nil)

// Use the nil coalescing operator for a fallback value
let number = person?.address?.phoneNumber ?? "867-5309"
print(number)

// Test data
struct Door {
  var doorName: String
  public var description: String { return doorName }
}
let frontDoor: Door? = Door(doorName: "Front")
let sideDoor: Door? = Door(doorName: "Side")
let backDoor: Door? = nil

// Returns first non-nil element (or nil if all are nil)
let door = frontDoor ?? sideDoor ?? backDoor
if let door = door {
  print(door)
}

let anotherDoor = backDoor ?? Door(doorName: "Trap")

