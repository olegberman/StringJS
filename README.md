# StringJS Swift Extension Library

A tiny Swift extension library that implements JavaScript String functions that we're used to.

You can read documentation on JavaScript String functions at [Mozilla Developer](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String).

The following methods behave exactly the same in most cases, in some cases they [behave differently...](https://github.com/olegberman/StringJS#behavior-differences-with-javascript-functions)

### Available functionality

* `length -> Int` (instance variable)
* `charAt(index: Int) -> String?`
* `chatCodeAt(index: Int) -> Int?`
* `concat(strings: String...) -> String`
* `fromCharCode() -> String`
* `indexOf(string: String, startFrom: Int = 0) -> Int?`
* `lastIndexOf(string: String) -> Int?`
* `match(pattern:String) -> Array<String>?`
* `replace(what:String, with:String) -> String`
* `search(what:String) -> Int?`
* `splice(start: Int) -> String?`
* `splice(start: Int, end: Int) -> String?`
* `split(withWhat:String) -> NSArray`
* `substr(var index: Int) -> String`
* `substr(var index: Int, var length: Int = 0) -> String`
* `substring(var startIndex: Int, var endIndex: Int) -> String`
* `toLocaleLowerCase() -> String`
* `toLocaleUpperCase() -> String`
* `toLowerCase() -> String`
* `toUpperCase() -> String`
* `trim() -> String`

### Behavior differences with JavaScript functions

Even though the default behaviour of __JavaScript__ function such as `indexOf` is returning __-1__ in case of not finding a substring, I've decided to take advantage of Swift optionals therefore the correct code using indexOf would be:

```swift
if let dolphinIndex = "cat dog dolphin".indexOf("dolphin", startFrom: 4) {
    dolphinIndex // 8
}
```

### Examples

See *main.swift* file for tests or take a look at quick overview here:

```swift

"Some Awesome String".length // 19

"More Awesomeness!".charAt(7) // e

"A little more awesomeness!".charCodeAt(3) // 105

"string 1, ".concat("string 2, ", "string 3, ", "string 4") // string 1, string 2, string 3, string 4

"99".fromCharCode() // à

if let dolphinIndex = "cat dog dolphin".indexOf("dolphin", startFrom: 4) {
    dolphinIndex // 8
}

if let catLastIndex = "cat dog dolphin cat".indexOf("cat", startFrom: 4) {
    catLastIndex // 16
}

let matches:[String] = "ABCDABAC".match("\\w{4}")! // [ABCD, ABAC]

"I love tea!".replace("tea", with: "coffee") // I love coffee!

"I love California".search("California")! // 7

"iPhone or Android".splice(0, end: 6) // iPhone

let companies:[AnyObject] = "apple,htc,lg,google".split(",") // ["apple", "htc", "lg", "google"]

"Yet Another String".substr(0, length: 3) // Yet

"Yet Another String".substring(4, end: 11) // Another

"привет".toLocaleUpperCase() // ПРИВЕТ

"ПРИВЕТ".toLocaleLowerCase() // привет

"hello".toUpperCase() // HELLO

"HELLO".toLowerCase() // hello

"        test         ".trim() // test

```

### Development

Send feedback at bermanoleg@gmail[dot]com.

I would love to see your commits & forks ♥!