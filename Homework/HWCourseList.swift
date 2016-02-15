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
Filename:     HWCourseList.swift
Description:  Class that holds the data for HWCourseList
Project:      Homework
Template: /PerfectSwift/server/Entity.swift.vm
 */


import PerfectLib

class HWCourseList  {
    var id : Int!
    
    
    func toDictionary() -> Dictionary<String, JSONValue> {
		var dict =  Dictionary<String, JSONValue>()
		if(id != nil){
			dict["id"] = id
		}
		return dict        
	}
    
    
    func decode(jsonString : String) throws -> Void {
        let decoder = JSONDecoder()
        let payload = try decoder.decode(jsonString) as! JSONDictionaryType
		if(payload["id"] != nil){
     		id =  payload["id"] as! Int
		}
    }
    
	func encode() throws -> String {
        let encoder = JSONEncoder()
        let payload = try encoder.encode(toDictionary())
        return payload
    }
    
    static func encodeList(elements : Array<HWCourseList>) throws -> String {
        var payload : Array<JSONValue> = [];
        do {
        elements.forEach { hWCourseList -> () in
                payload.append(hWCourseList.toDictionary());
           
        }
        let encoder = JSONEncoder()
        let json = try encoder.encode(payload)
        return json
        }catch{
            print(error)
        }
        return ""
    }
}

/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 11.49 minutes to type the 1149+ characters in this file.
 */


