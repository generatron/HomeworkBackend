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
Filename:     HWAssignment.swift
Description:  Class that holds the data for HWAssignment
Project:      Homework
Template: /PerfectSwift/server/Entity.swift.vm
 */


import PerfectLib

class HWAssignment  {
    var dateAssigned : NSDate!
    var dateDue : NSDate!
    var id : Int!
    var isCompleted : Bool!
    var name : String!
    var type : Int!
    
    
    func toDictionary() -> Dictionary<String, JSONValue> {
		var dict =  Dictionary<String, JSONValue>()
		if(dateAssigned != nil){
			dict["dateAssigned"] = dateAssigned
		}
		if(dateDue != nil){
			dict["dateDue"] = dateDue
		}
		if(id != nil){
			dict["id"] = id
		}
		if(isCompleted != nil){
			dict["isCompleted"] = isCompleted
		}
		if(name != nil){
			dict["name"] = name
		}
		if(type != nil){
			dict["type"] = type
		}
		return dict        
	}
    
    
    func decode(jsonString : String) throws -> Void {
        let decoder = JSONDecoder()
        let payload = try decoder.decode(jsonString) as! JSONDictionaryType
		if(payload["dateAssigned"] != nil){
     		dateAssigned =  payload["dateAssigned"] as! NSDate
		}
		if(payload["dateDue"] != nil){
     		dateDue =  payload["dateDue"] as! NSDate
		}
		if(payload["id"] != nil){
     		id =  payload["id"] as! Int
		}
		if(payload["isCompleted"] != nil){
     		isCompleted =  payload["isCompleted"] as! Bool
		}
		if(payload["name"] != nil){
     		name =  payload["name"] as! String
		}
		if(payload["type"] != nil){
     		type =  payload["type"] as! Int
		}
    }
    
	func encode() throws -> String {
        let encoder = JSONEncoder()
        let payload = try encoder.encode(toDictionary())
        return payload
    }
    
    static func encodeList(elements : Array<HWAssignment>) throws -> String {
        var payload : Array<JSONValue> = [];
        do {
        elements.forEach { hWAssignment -> () in
                payload.append(hWAssignment.toDictionary());
           
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
approximately 20.25 minutes to type the 2025+ characters in this file.
 */


