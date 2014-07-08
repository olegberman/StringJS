# StringJS Swift Library
A tiny Swift library that let's you work with strings in Swift as it was JavaScript

### Available functionality

* `length -> Int` (instance variable)
* `charAt(index: Int) -> String?`
* `chatCodeAt(index: Int) -> Int?`
* `concat(strings: String...) -> String`
* `fromCharCode() -> String`
* `indexOf(string: String, startFrom: Int = 0) -> Int?`
* `lastIndexOf(string: String) -> Int?`
* `substr(var index: Int, var length: Int = 0) -> String`
* `substring(var startIndex: Int, var endIndex: Int) -> String`
* `toLocaleLowerCase() -> String`
* `toLocaleUpperCase() -> String`
* `toLowerCase() -> String`
* `toUpperCase() -> String`

### Heads up

Even though the default behaviour of __JavaScript__ function such as `indexOf` is returning __-1__ in case of not finding a substring, I've decided to take advantage of Swift optionals therefore the correct code using indexOf would be something like

```swift
if let dolphinIndex = "cat dog dolphin".indexOf("dolphin", startFrom: 4) {
    NSLog(String(dolphinIndex)) // 8
}
```

### More examples

There's *main.swift* file with a bunch of tests that you can explore, here's a quick overview

```swift
// get the length of a string

NSLog(String("Some Awesome String".length)) // 19

// get the character in a string by its index

NSLog("More Awesomeness!".charAt(7)!) // e

// concatenate strings as in JavaScript

NSLog("string 1, ".concat("string 2, ", "string 3, ", "string 4")) // string 1, string 2, string 3, string 4
    
// extract substring by index (String.substr equivalent in JS)

NSLog("Yet Another String".substr(0, length: 3)) // Yet

// extract substring by index (String.substring equivalent in JS)

NSLog("Yet Another String".substring(4, endIndex: 11)) // Another

```

### Development

I will add the remaining functionality within several days from now, but I would love all of you to fork & commit! Also I would love to hear some feedback at bermanoleg@gmail[dot]com.

