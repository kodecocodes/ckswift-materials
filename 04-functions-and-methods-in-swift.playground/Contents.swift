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

import CoreGraphics

// MARK: -
// Packaging up actions into a named unit
func doSomething() {
  print("Do something")
  print("And do it very well")
  print("Hide the complexity as an implementation detail")
  print("Improve upon it and test it in isolation")
}

doSomething()
doSomething()

// MARK: -
// An input and an output
func isPrime(number: Int) -> Bool {
  guard number > 1 else {
    return false
  }

  var i = 2
  while i <= number / 2 {
    if number.isMultiple(of: i) {
      return false
    }
    i += 1
  }
  return true
}

// You can now use the function to find primes less than 100
for i in 1...100 {
  if isPrime(number: i) {
    print(i, terminator: " ")
  }
}

// Are there better ways of finding primes?  Yes, but now you have
// isolated the solution to something that can be improved and
// tested independently.

// This function is pure, because it doesn't have any side effects.
// In other words, every time you call it with the same input,
// it has the same output.


// MARK: -
// Making functions read fluently
// Internal and external parameters, default parmeters
// Use past tense -ed, or gerund -ing for functions that don't make a new value
// rather than mutating the value

/// Rotate an xy-point around an arbitrary center point by an angle measured in radians.
func rotatedPoint(_ point: CGPoint, by radians: CGFloat, about center: CGPoint = .zero) -> CGPoint {

  // don't worry so much about the implementation

    point.applying(
      CGAffineTransform.identity.rotated(by: quarterTurn, about: center)
    )
//  Initial implementation
//  point.applying(
//    CGAffineTransform.identity
//      .translatedBy(x: center.x, y: center.y)
//      .rotated(by: radians)
//      .translatedBy(x: -center.x, y: -center.y)
//  )
}

let center = CGPoint(x: 100, y: 100)
let point = CGPoint(x: 150, y: 100)
let quarterTurn = CGFloat.pi / 2

// Clarity at the call-site.  This is the Swift way
rotatedPoint(point, by: quarterTurn, about: center)

// MARK: -
// Extending existing types with new functions
// Functions that act on an instance of a type are called methods.
extension CGAffineTransform {
  func rotated(by radians: CGFloat, about center: CGPoint) -> Self {
    self
      .translatedBy(x: center.x, y: center.y)
      .rotated(by: radians)
      .translatedBy(x: -center.x, y: -center.y)
  }
}

// Refactor rotated point (above)

// Extend point to make it more natural, "self" is passed to the function
// under the hood.
extension CGPoint {
  func rotated(by radians: CGFloat, about center: CGPoint = .zero) -> CGPoint {
    self.applying(CGAffineTransform.identity.rotated(by: radians,
                                                     about: center ) )
  }
}

point
point.rotated(by: quarterTurn)
point.rotated(by: quarterTurn, about: center)
point.rotated(by: quarterTurn, about: point)


// MARK: -
// inout parameters


func rotatePoint(_ point: inout CGPoint, by radians: CGFloat, about center: CGPoint = .zero) {
  point = point.rotated(by: radians, about: center)
}

var modifiablePoint = CGPoint(x: 100, y: 0)

rotatePoint(&modifiablePoint, by: quarterTurn)


// MARK: -
// mutating method

// Another example
extension CGPoint {
  mutating func rotate(by radians: CGFloat, about center: CGPoint = .zero) {
    self = self.rotated(by: radians, about: center)
  }
}

// point.rotate(by: quarterTurn) // ERROR: point is constant
modifiablePoint.rotate(by: quarterTurn)
