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
Filename:     HWCourseRepositoryMySQL.swift
Description:  Persistence code for for HWCourse
Project:      Homework
Template: /PerfectSwift/server/EntityRepositoryMySQL.swift.vm
 */


import MySQL
class HWCourseRepositoryMySQL : RepositoryMySQL {
func createTable() throws ->  Int {
   let rs = try db.query("CREATE TABLE IF NOT EXISTS HWCourse (id BIGINT(20) NOT NULL AUTO_INCREMENT, name VARCHAR(255), period INT(10), PRIMARY KEY (id))")
   let errorCode = db.errorCode()
        if errorCode > 0 {
            throw RepositoryError.CreateTable(errorCode)
      }
      return 0;
}
func insert(entity: HWCourse) throws -> Int {
       	let sql = "INSERT INTO HWCourse(name,period) VALUES ( ?, ?)"
       	PersistenceManagerMySQL.sharedInstance.checkConnection();
       	let statement = MySQLStmt(db)
		defer {
			statement.close()
		}
		let prepRes = statement.prepare(sql)
		if(prepRes){

			//It's transformable, not supported at the moment
   			//statement.bindParam(entity.color.id)
		

		if(entity.name != nil){
			statement.bindParam(entity.name)
		}else{
			statement.bindParam()
		}
		

		if(entity.period != nil){
			statement.bindParam(entity.period)
		}else{
			statement.bindParam()
		}
		

			let execRes = statement.execute()
			if(execRes){
				entity.id = Int(statement.insertId()) ;
				return entity.id
			}else{
				print("\(statement.errorCode()) \(statement.errorMessage()) - \(db.errorCode()) \(db.errorMessage())")
				let errorCode = db.errorCode()
				if errorCode > 0 {
				    throw RepositoryError.Insert(errorCode)
				}
			}
				
			statement.close()
	}        
 	return 0
	}
    
	func update(entity: HWCourse) throws -> Int {
        guard let id = entity.id else {
            return 0
        }
        
        let sql = "UPDATE HWCourse SET name= ? ,period= ? WHERE id = ?"
PersistenceManagerMySQL.sharedInstance.checkConnection();
let statement = MySQLStmt(db)
		defer {
			statement.close()
		}
		let prepRes = statement.prepare(sql)
		
		if(prepRes){		

			//It's transformable, not supported at the moment
   			//statement.bindParam(entity.color.id)
		

		if(entity.name != nil){
			statement.bindParam(entity.name)
		}else{
			statement.bindParam()
		}
		

		if(entity.period != nil){
			statement.bindParam(entity.period)
		}else{
			statement.bindParam()
		}
		
			statement.bindParam(entity.id)
			let execRes = statement.execute()
			if(!execRes){
				print("\(statement.errorCode()) \(statement.errorMessage()) - \(db.errorCode()) \(db.errorMessage())")
				let errorCode = db.errorCode()
				if errorCode > 0 {
				    throw RepositoryError.Update(errorCode)
				}
			}
	
			statement.close()
		}
        
		return 0
    }
    
	func delete(id: Int) throws -> Int {
	PersistenceManagerMySQL.sharedInstance.checkConnection();
	    let sql = "DELETE FROM hWCourse WHERE id = \(id)"
	    let queryResult = db.query(sql)
	    return id;
	}
    
    func retrieve(id: Int) throws -> HWCourse? {
        let sql = "SELECT id,name,period FROM HWCourse WHERE id = \(id)"
        PersistenceManagerMySQL.sharedInstance.checkConnection();
		let queryResult = db.query(sql)
		 if(queryResult){
        let results = db.storeResults()!
  		let hWCourse = HWCourse()
        while let row = results.next() {
				hWCourse.id = Int(row[0]);
	
	hWCourse.name = String(row[1]);
	
	hWCourse.period = Int(row[2]);
	
            print(row)
        }
        results.close()
	    return hWCourse;
	    }else{
				print(" \(db.errorCode()) \(db.errorMessage())")
				let errorCode = db.errorCode()
				if errorCode > 0 {
				    throw RepositoryError.Retrieve(errorCode)
				}
			}
			return nil;
    }
    
    func list() throws -> [HWCourse]  {
        let sql = "SELECT id,name,period FROM HWCourse "
        PersistenceManagerMySQL.sharedInstance.checkConnection();
        var entities = [HWCourse]()
         let queryResult = db.query(sql)
        if(queryResult){

		let results = db.storeResults()!
  
        while let row = results.next() {
        	let hWCourse = HWCourse()
				hWCourse.id = Int(row[0]);
	
	hWCourse.name = String(row[1]);
	
	hWCourse.period = Int(row[2]);
	
			entities.append(hWCourse)
            print(row)
        }
        results.close()
        return entities
			}else{
				print(" \(db.errorCode()) \(db.errorMessage())")
				let errorCode = db.errorCode()
				if errorCode > 0 {
				    throw RepositoryError.List(errorCode)
				}
				return [];
			}
			
    }
}

/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 44.12 minutes to type the 4412+ characters in this file.
 */


