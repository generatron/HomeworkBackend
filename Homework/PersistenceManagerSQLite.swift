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
Filename:     PersistenceManagerSQLite.swift
Description:  SQLite PersistenceManager: an Adapter to deal with persistence layer
Project:      Homework
Template: /PerfectSwift/server/PersistenceManager.swift.vmg
 */

import PerfectLib
class PersistenceManagerSQLite {
	static let sharedInstance = PersistenceManagerSQLite()
	
    var db: SQLite!
        var hWAssessmentRepository :  HWAssessmentRepository! 
	    var hWAssignmentRepository :  HWAssignmentRepository! 
	    var hWCourseRepository :  HWCourseRepository! 
	    var hWCourseListRepository :  HWCourseListRepository! 
	    init() {
    	// Create our SQLite database.
    	do {
        	db = try SQLite(Config.dbPath) 
			
			//Variables for HWAssessment
			hWAssessmentRepository = HWAssessmentRepository(db:self.db);
			try hWAssessmentRepository.createTable()
			
			//Variables for HWAssignment
			hWAssignmentRepository = HWAssignmentRepository(db:self.db);
			try hWAssignmentRepository.createTable()
			
			//Variables for HWCourse
			hWCourseRepository = HWCourseRepository(db:self.db);
			try hWCourseRepository.createTable()
			
			//Variables for HWCourseList
			hWCourseListRepository = HWCourseListRepository(db:self.db);
			try hWCourseListRepository.createTable()
    	} catch (let e){
        	print("Failure creating database at " + Config.dbPath)
        	print(e)
    	}
    }
}


/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 11.81 minutes to type the 1181+ characters in this file.
 */


