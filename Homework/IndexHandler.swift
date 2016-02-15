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

//
//  LoginHandler.swift
//  Authenticator
//
//  Created by Kyle Jessup on 2015-11-10.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//	This program is free software: you can redistribute it and/or modify
//	it under the terms of the GNU Affero General Public License as
//	published by the Free Software Foundation, either version 3 of the
//	License, or (at your option) any later version, as supplemented by the
//	Perfect Additional Terms.
//
//	This program is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//	GNU Affero General Public License, as supplemented by the
//	Perfect Additional Terms, for more details.
//
//	You should have received a copy of the GNU Affero General Public License
//	and the Perfect Additional Terms that immediately follow the terms and
//	conditions of the GNU Affero General Public License along with this
//	program. If not, see <http://www.perfect.org/AGPL_3_0_With_Perfect_Additional_Terms.txt>.
//

import PerfectLib

class IndexHandler: PageHandler { // all template handlers must inherit from PageHandler

	override func valuesForResponse(context: MustacheEvaluationContext, collector: MustacheEvaluationOutputCollector) throws -> MustacheEvaluationContext.MapType {
		
		var values = try super.valuesForResponse(context, collector: collector)
		
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
approximately 29.35 minutes to type the 2935+ characters in this file.
 */


