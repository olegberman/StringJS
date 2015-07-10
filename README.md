# StringJS Swift Extension Library

A tiny Swift extension library that implements JavaScript String functions that we're used to.

You can read documentation on JavaScript String functions at [Mozilla Developer](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String).

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

### Behavior differences between StringJS.swift and JavaScript functions

All methods in the library behave exactly as in JavaScript the same in most cases, in some cases they behave differently..

Even though the default behavior of __JavaScript__ function such as `indexOf` is returning __-1__ in case of not finding a substring, I've decided to take advantage of Swift optionals therefore the correct code using indexOf would be:

```swift
if let index = "It tastes like vanilla bean".indexOf("vanilla") {
  NSLog("%d", index) // will output 15
} else {
  NSLog("Substring is not found!")
}
```

### Examples

See *StringJSTests/StringJSTests.swift* file for tests or take a look at them here, they describe the functionality pretty well:

```swift
func testLengthProperty() {
  let strlen = "doge".length
  XCTAssertEqual(4, strlen, "The length of word 'doge' should be equal to 4")
}

func testCharAt() {
  let word = "cat"
  // NOTE, the count starts from 0 like in arrays
  XCTAssertEqual("a", word.charAt(1), "The second char of 'car' should equal 'a'")
}

func testCharCodeAt() {
  let code = "bird".charCodeAt(2)
  XCTAssertEqual(114, code, "The character code of 'r' should equal to 114")
}

func testConcat() {
  XCTAssertEqual("family", "fam".concat("i", "l", "y"), "Concat of 'fam' + 'i' + 'l' + 'y' should equal to 'family'");
}

func testFromCharCode() {
  XCTAssertEqual("r", "114".fromCharCode(), "Char code of 114 has to be equal to 'r'")
}

func testIndexOf() {
  XCTAssertEqual(6, "coffeetea".indexOf("tea")!, "Index of 'tea' in 'coffeetea' should equal to 6")
}

func testLastIndexOf() {
  XCTAssertEqual(15, "coffeeteacoffeecoffee".lastIndexOf("c")!, "Last index of 'coffee' in 'coffeeteacoffeecoffee' should be equal to 15")
}

func testMatch() {
  XCTAssertEqual(["ABCD", "ABAC"], "ABCDABAC".match("\\w{4}")!, "Should match to '[ABCD, ABAC] array literal")
}

func testReplace() {
  XCTAssertEqual("I love coffee!", "I love tea!".replace("tea", with: "coffee"), "Should be equal to a string 'I love coffee!'")
}

func testSearch() {
  // String.search also supports regular expressions
  XCTAssertEqual(7, "I love California".search("California")!, "The index of 'California' should be equal to 7")
}

func testSplice() {
  XCTAssertEqual("iPhone", "iPhone or Android".splice(0, end: 6)!, "The string should be equal to 'iPhone' after splicing")
}

func testSplit() {
  XCTAssertEqual(["one", "two", "three"], "one,two,three".split(","), "The output array literal should equal [one, two, three]")
}

func testSubStr() {
  XCTAssertEqual("yet", "yet another string".substr(0, length: 3), "Should be equal to 'yet'")
}

func testSubString() {
  XCTAssertEqual("another", "yet another string".substring(4, end: 11), "Should be equal to 'another'")
}

func testToLocaleUpperCase() {
  XCTAssertEqual("БЕЛКА", "белка".toLocaleUpperCase(), "Uppercase of 'белка' should be equal to 'БЕЛКА' in cyrilics")
}

func testToLocaleLowerCase() {
  XCTAssertEqual("енот", "ЕНОТ".toLocaleLowerCase(), "Lowercase of 'ЕНОТ' should be equal to 'енот'")
}

func testToUpperCase() {
  XCTAssertEqual("HELLO", "hello".toUpperCase(), "The uppercase of 'hello' should be 'HELLO'")
}

func testToLowerCase() {
  XCTAssertEqual("goodbye", "GOODBYE".toLowerCase(), "The lowercase of 'GOODBYE' should be equal to 'goodbye'")
}

func testTrim() {
  XCTAssertEqual("trimmed", "   trimmed   ".trim(), "A trimmed version of '   trimmed   ' should equal to 'trimmed'")
}

```

### Development

I would love to see your commits, issues, stars and forks!
