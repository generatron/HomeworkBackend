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
Filename:     HomeworkServer.swift
Description:  Swift Server
Project:      Homework
Template: /PerfectSwift/server/ServerModuleInit.swift.vmg
 */

import PerfectLib

public func PerfectServerModuleInit() {
	Routing.Handler.registerGlobally()
	Routing.Routes["GET", ["/assets/*/*"]] = { _ in return StaticFileHandler() }
	Routing.Routes["GET", ["/uploads/*"]] = { _ in return StaticFileHandler() }
  
	//Routes for HWAssessment
	Routing.Routes["GET", ["/api/hWAssessment"] ] = { (_:WebResponse) in return HWAssessmentListHandler() }
	Routing.Routes["POST", ["/api/hWAssessment"] ] = { (_:WebResponse) in return HWAssessmentCreateHandler() }
	Routing.Routes["GET", "/api/hWAssessment/{id}"] = { _ in return HWAssessmentRetrieveHandler() }
	Routing.Routes["PUT", "/api/hWAssessment/{id}"] = { _ in return HWAssessmentUpdateHandler() }
	Routing.Routes["POST", "/api/hWAssessment/{id}"] = { _ in return HWAssessmentUpdateHandler() }
	Routing.Routes["DELETE", "/api/hWAssessment/{id}"] = { _ in return HWAssessmentDeleteHandler() }
	
	//Routes for HWAssignment
	Routing.Routes["GET", ["/api/hWAssignment"] ] = { (_:WebResponse) in return HWAssignmentListHandler() }
	Routing.Routes["POST", ["/api/hWAssignment"] ] = { (_:WebResponse) in return HWAssignmentCreateHandler() }
	Routing.Routes["GET", "/api/hWAssignment/{id}"] = { _ in return HWAssignmentRetrieveHandler() }
	Routing.Routes["PUT", "/api/hWAssignment/{id}"] = { _ in return HWAssignmentUpdateHandler() }
	Routing.Routes["POST", "/api/hWAssignment/{id}"] = { _ in return HWAssignmentUpdateHandler() }
	Routing.Routes["DELETE", "/api/hWAssignment/{id}"] = { _ in return HWAssignmentDeleteHandler() }
	
	//Routes for HWCourse
	Routing.Routes["GET", ["/api/hWCourse"] ] = { (_:WebResponse) in return HWCourseListHandler() }
	Routing.Routes["POST", ["/api/hWCourse"] ] = { (_:WebResponse) in return HWCourseCreateHandler() }
	Routing.Routes["GET", "/api/hWCourse/{id}"] = { _ in return HWCourseRetrieveHandler() }
	Routing.Routes["PUT", "/api/hWCourse/{id}"] = { _ in return HWCourseUpdateHandler() }
	Routing.Routes["POST", "/api/hWCourse/{id}"] = { _ in return HWCourseUpdateHandler() }
	Routing.Routes["DELETE", "/api/hWCourse/{id}"] = { _ in return HWCourseDeleteHandler() }
	
	//Routes for HWCourseList
	Routing.Routes["GET", ["/api/hWCourseList"] ] = { (_:WebResponse) in return HWCourseListListHandler() }
	Routing.Routes["POST", ["/api/hWCourseList"] ] = { (_:WebResponse) in return HWCourseListCreateHandler() }
	Routing.Routes["GET", "/api/hWCourseList/{id}"] = { _ in return HWCourseListRetrieveHandler() }
	Routing.Routes["PUT", "/api/hWCourseList/{id}"] = { _ in return HWCourseListUpdateHandler() }
	Routing.Routes["POST", "/api/hWCourseList/{id}"] = { _ in return HWCourseListUpdateHandler() }
	Routing.Routes["DELETE", "/api/hWCourseList/{id}"] = { _ in return HWCourseListDeleteHandler() }
	
	print("\(Routing.Routes.description)") 
	//Initialize PM and repositories  
	PersistenceManagerMySQL.sharedInstance
}


/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 28.77 minutes to type the 2877+ characters in this file.
 */


