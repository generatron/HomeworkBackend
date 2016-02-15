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
Filename:     Config.swift
Description:  Server Configuration
Project:      Homework
Template: /PerfectSwift/server/Config.swift.vmg
 */
import PerfectLib

class Config {

	static let serverPort = 9000
    static let sessionName = "session"
    static let sessionExpires = 60
    static let uploadDirPath = PerfectServer.staticPerfectServer.homeDir() + "webroot/uploads/"
    static let uploadDirUrl = "/uploads/"
    
	//SQLite Configuration
    static let modelName = "Homework"
    static let dbPath = PerfectServer.staticPerfectServer.homeDir() + serverSQLiteDBs + modelName
    
    //MySQL Configuration
    static let HOST = "127.0.0.1"
    static let USER = "perfect"
    static let PASSWORD = "perfect123"
    static let SCHEMA = "Homework"
    
    
}


/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 6.47 minutes to type the 647+ characters in this file.
 */


