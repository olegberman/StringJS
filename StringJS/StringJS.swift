//
//  StringJS.swift
//  Swift extension of String class that implements most of JavaScript String functions
//
//  Created by Oleg Berman on 2014-07-05.
//  Copyright (c) 2014 Oleg Berman. All rights reserved.
//
//  https://github.com/olegberman/StringJS
//

import Foundation

extension String {
    
    public var length: Int { return self.bridgeToObjectiveC().length }
    
    public func charAt(index: Int) -> String {
        return String(Array(self)[index])
    }
    
    public func charCodeAt(index: Int) -> Int {
        return Int((self as NSString).characterAtIndex(index))
    }
    
    public func concat(strings: String...) -> String {
        var out = self
        for str in strings {
            out += str
        }
        return out
    }
    
    public func fromCharCode() -> String {
        return String(NSString(format: "%c", self))
    }
    
    public func indexOf(string: String, startFrom: Int = 0) -> Int? {
        var str = self
        if startFrom != 0 {
            str = str.substring(startFrom, end: self.length)
        }
        var index = str.bridgeToObjectiveC().rangeOfString(string).location
        if index == NSNotFound {
            return nil
        }
        return index + startFrom
    }
    
    public func lastIndexOf(string: String) -> Int? {
        if var index:Int? = self.indexOf(string) {
            var lastIndex:Int? = index!
            while index {
                if var loopIndex:Int? = self.indexOf(string, startFrom: index! + string.length) {
                    index = loopIndex
                    lastIndex = loopIndex
                } else {
                    index = nil
                }
            }
            return lastIndex
        } else {
            return nil
        }
    }
    
    public func localeCompare() {
        // TODO
    }
    
    public func match(pattern:String) -> Array<String>? {
        var regex = NSRegularExpression(pattern: pattern, options: nil, error: nil)
        var matches:[AnyObject] = regex.matchesInString(self, options: nil, range: NSRange(location: 0, length: self.length))
        if matches.count > 0 {
            var result:[String] = []
            for match:NSTextCheckingResult in matches as [NSTextCheckingResult] {
                result.append(self.substr(match.range.location, length: match.range.length))
            }
            return result
        } else {
            return nil
        }
    }
    
    public func replace(what:String, with:String) -> String {
        var exp = NSRegularExpression(pattern: what, options: nil, error: nil)
        return exp.stringByReplacingMatchesInString(self, options: nil, range: NSMakeRange(0, self.length), withTemplate: with)
    }
    
    public func search(what:String) -> Int? {
        var exp = NSRegularExpression(pattern: what, options: nil, error: nil)
        var match = exp.firstMatchInString(self, options: nil, range: NSMakeRange(0, self.length))
        return match.range.location
    }
    
    public func splice(start: Int) -> String? {
        return self.substring(start, end: self.length)
    }
    
    public func splice(start: Int, end: Int) -> String? {
        return self.substring(start, end: end)
    }
    
    public func split(withWhat:String) -> NSArray {
        return self.bridgeToObjectiveC().componentsSeparatedByString(withWhat)
    }
    
    public func substr(var index: Int) -> String {
        if index < 0 {
            index = self.length - abs(index)
        }
        return self.bridgeToObjectiveC().substringWithRange(NSMakeRange(index, self.length))
    }
    
    public func substr(var start: Int, var length: Int) -> String {
        length = abs(length)
        if start < 0 {
            start = self.length - abs(start)
        }
        return self.bridgeToObjectiveC().substringWithRange(NSMakeRange(start, length))
    }
    
    public func substring(var start: Int, var end: Int) -> String {
        if start < 0 { start = 0 }
        if end < 0 { end = 0 }
        if start > end {
            let _start = start
            start = end
            end = _start
        }
        end = end - start
        return self.bridgeToObjectiveC().substringWithRange(NSMakeRange(start, end))
    }
    
    public func toLocaleLowerCase() -> String {
        return self.lowercaseStringWithLocale(NSLocale.currentLocale())
    }
    
    public func toLocaleUpperCase() -> String {
        return self.uppercaseStringWithLocale(NSLocale.currentLocale())
    }
    
    public func toLowerCase() -> String {
        return self.lowercaseString
    }
    
    public func toUpperCase() -> String {
        return self.uppercaseString
    }
    
    public func trim() -> String {
        var tmp = self
        while tmp.substr(0, length: 1) == " " {
            tmp = tmp.substring(1, end: tmp.length)
        }
        while tmp.substr(0, length: 1) ==  " " {
            tmp = tmp.substring(0, end: tmp.length - 1)
        }
        return tmp
    }
    
}