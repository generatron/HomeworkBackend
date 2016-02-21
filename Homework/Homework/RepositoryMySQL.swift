/* 
Copyright (c) 2016 NgeosOne LLC
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

   
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), 
 to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

Engineered using http://www.generatron.com/

[GENERATRON]
Generator :   System Templates
Filename:     RepositoryMySQL.swift
Description:  Base Repository class
Project:      Homework
Template: /PerfectSwift/server/RepositoryMySQL.swift.vmg
 */

import PerfectLib
import MySQL

enum RepositoryError : ErrorType {
    case Select(UInt32)
    case Insert(UInt32)
    case Update(UInt32)
    case Delete(UInt32)
    case CreateTable(UInt32)
    case List(UInt32)
    case Retrieve(UInt32)
}

class RepositoryMySQL {
    let db: MySQL!
    
    init(db: MySQL) {
        self.db = db
    }
    
}


/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 3.7 minutes to type the 370+ characters in this file.
 */


