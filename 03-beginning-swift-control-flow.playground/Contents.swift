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

var reindeerOrder = 2
if reindeerOrder == 1 {
  print("Dasher")
} else if reindeerOrder == 2 {
  print("Dancer")
} else {
  print("TODO")
}

var i = 1

print("While Loop")

// While loops: checks condition BEFORE the loop
while i < 5 {
  print(i, terminator: " ")
  i += 1
}

print("\nRepeat While Loop")

// Repeat while: checks condition AFTER the loop
i = 1
repeat {
  print(i, terminator: " ")
  i += 1
} while i < 5

print("\nFor Loops (Closed Range)")

// Closed range; includes 5
// Prints "1 2 3 4 5"
for i in 1...5 {
  print(i, terminator: " ")
}

print("\nIgnoring the constant")

// Use the underscore if you don't need the loop conastant
for _ in 1...3 {
  print("Echo!")
}

print("\nWhere Clause")

for i in 1...10 where i % 2 == 1 {
  print("\(i) is an odd number.")
}

print("\nIterating Over Arrays")

let daysOfTheWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
for day in daysOfTheWeek {
  print(day, terminator: " ")
}

print("\nIterating Over Dictionaries")

var pastries = ["cookie": "🍪", "danish": "🇩🇰", "cupcake": "🧁", "donut": "🍩", "pie": "🥧"]
for (pastry, emoji) in pastries {
  print("The emoji for \(pastry) is \(emoji)")
}

print("Break")
for day in daysOfTheWeek {
  if day == "Thursday" {
    break
  }
  print(day, terminator: " ")
}

print("\nContinue")
for day in daysOfTheWeek {
  if day == "Friday" {
    print("I'm in love", terminator: " ")
    continue
  }
  print(day, terminator: " ")
}

print("\nBreak / continue only affects the innermost loop")
// Outer loop
for i in 1...3 {
  
  // Inner loop
  for j in 1...3 {
    if i == 2 && j == 2 {
      break
    }
    print("(\(i), \(j))", terminator: " ")
  }
  print("")
}
