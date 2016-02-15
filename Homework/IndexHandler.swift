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
Filename:     IndexHandler.swift
Description:  Swift Server
Project:      Homework
Template: /PerfectSwift/server/IndexHandler.swift.vmg
 */

import PerfectLib

class IndexHandler: PageHandler { 

	override func valuesForResponse(context: MustacheEvaluationContext, collector: MustacheEvaluationOutputCollector) throws -> MustacheEvaluationContext.MapType {
		
		var values = [String:Any]
		
		if let acceptStr = context.webRequest?.httpAccept() {
			if acceptStr.contains("json") {
				values["json"] = true
			}
		}
		values["name"] = "Homework"
		var routes =  Array<String>()
		
		//Routes for HWAssessment
		routes.append("GET /api/hWAssessment")
		routes.append("POST /api/hWAssessment")
		routes.append("GET /api/hWAssessment/{id}")
		routes.append("PUT /api/hWAssessment/{id}")
		routes.append("POST /api/hWAssessment/{id}")
		routes.append("DELETE /api/hWAssessment/{id}")
		//Routes for HWAssignment
		routes.append("GET /api/hWAssignment")
		routes.append("POST /api/hWAssignment")
		routes.append("GET /api/hWAssignment/{id}")
		routes.append("PUT /api/hWAssignment/{id}")
		routes.append("POST /api/hWAssignment/{id}")
		routes.append("DELETE /api/hWAssignment/{id}")
		//Routes for HWCourse
		routes.append("GET /api/hWCourse")
		routes.append("POST /api/hWCourse")
		routes.append("GET /api/hWCourse/{id}")
		routes.append("PUT /api/hWCourse/{id}")
		routes.append("POST /api/hWCourse/{id}")
		routes.append("DELETE /api/hWCourse/{id}")
		//Routes for HWCourseList
		routes.append("GET /api/hWCourseList")
		routes.append("POST /api/hWCourseList")
		routes.append("GET /api/hWCourseList/{id}")
		routes.append("PUT /api/hWCourseList/{id}")
		routes.append("POST /api/hWCourseList/{id}")
		routes.append("DELETE /api/hWCourseList/{id}")

		values["routes"] = routes;
		return values
	}
	
}


/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 17.14 minutes to type the 1714+ characters in this file.
 */


