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
Filename:     PersistenceManagerMySQL.swift
Description:  MySQL PersistenceManager: an Adapter to deal with persistence layer
Project:      Homework
Template: /PerfectSwift/server/PersistenceManagerMySQL.swift.vmg
 */

import PerfectLib
import MySQL

class PersistenceManagerMySQL {
	static let sharedInstance = PersistenceManagerMySQL()
    var mysql = MySQL ()
        var hWAssessmentRepository :  HWAssessmentRepositoryMySQL! 
	    var hWAssignmentRepository :  HWAssignmentRepositoryMySQL! 
	    var hWCourseRepository :  HWCourseRepositoryMySQL! 
	    var hWCourseListRepository :  HWCourseListRepositoryMySQL! 
	    init() {
    	// Connect to Database.
    	let datasource : GeneratronDataSource = Config.sharedInstance.datasources["mysql"]!
    	
    	do {
    		
 			 
        	 let connect = mysql.connect (datasource.host, user:datasource.user, password: datasource.password)
        if (connect)
        {
            let selectedSchema = mysql.selectDatabase (datasource.schema)
            if (selectedSchema)
            {
			
			//Variables for HWAssessment
			hWAssessmentRepository = HWAssessmentRepositoryMySQL(db:self.mysql);
			try hWAssessmentRepository.createTable()
			
			//Variables for HWAssignment
			hWAssignmentRepository = HWAssignmentRepositoryMySQL(db:self.mysql);
			try hWAssignmentRepository.createTable()
			
			//Variables for HWCourse
			hWCourseRepository = HWCourseRepositoryMySQL(db:self.mysql);
			try hWCourseRepository.createTable()
			
			//Variables for HWCourseList
			hWCourseListRepository = HWCourseListRepositoryMySQL(db:self.mysql);
			try hWCourseListRepository.createTable()
}
}

    	} catch (let e){
        	print("Failure connecting to MYSQL DB")
        	print(e)
    	}
    	
    }
    
    func checkConnection() -> Bool {
    	let sql = "SELECT 1"
		let queryResult = db.query(sql)
		if(!queryResult){
			 return  mysql.connect (datasource.host, user:datasource.user, password: datasource.password)
		}
		return queryResult
    }
}


/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 18.37 minutes to type the 1837+ characters in this file.
 */


