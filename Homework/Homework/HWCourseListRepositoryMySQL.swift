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
Filename:     HWCourseListRepositoryMySQL.swift
Description:  Persistence code for for HWCourseList
Project:      Homework
Template: /PerfectSwift/server/EntityRepositoryMySQL.swift.vm
 */


import MySQL
class HWCourseListRepositoryMySQL : RepositoryMySQL {
func createTable() throws ->  Int {
   let rs = try db.query("CREATE TABLE IF NOT EXISTS HWCourseList (id BIGINT(20) NOT NULL AUTO_INCREMENT, PRIMARY KEY (id))")
   let errorCode = db.errorCode()
        if errorCode > 0 {
            throw RepositoryError.CreateTable(errorCode)
      }
      return 0;
}
func insert(entity: HWCourseList) throws -> Int {
       	let sql = "INSERT INTO HWCourseList() VALUES ()"
       	PersistenceManagerMySQL.sharedInstance.checkConnection();
       	let statement = MySQLStmt(db)
		defer {
			statement.close()
		}
		let prepRes = statement.prepare(sql)
		if(prepRes){

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
    
	func update(entity: HWCourseList) throws -> Int {
        guard let id = entity.id else {
            return 0
        }
        
        let sql = "UPDATE HWCourseList SET  WHERE id = ?"
PersistenceManagerMySQL.sharedInstance.checkConnection();
let statement = MySQLStmt(db)
		defer {
			statement.close()
		}
		let prepRes = statement.prepare(sql)
		
		if(prepRes){		
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
	    let sql = "DELETE FROM hWCourseList WHERE id = \(id)"
	    let queryResult = db.query(sql)
	    return id;
	}
    
    func retrieve(id: Int) throws -> HWCourseList? {
        let sql = "SELECT id FROM HWCourseList WHERE id = \(id)"
        PersistenceManagerMySQL.sharedInstance.checkConnection();
		let queryResult = db.query(sql)
		 if(queryResult){
        let results = db.storeResults()!
  		let hWCourseList = HWCourseList()
        while let row = results.next() {
				hWCourseList.id = Int(row[0]);
	
            print(row)
        }
        results.close()
	    return hWCourseList;
	    }else{
				print(" \(db.errorCode()) \(db.errorMessage())")
				let errorCode = db.errorCode()
				if errorCode > 0 {
				    throw RepositoryError.Retrieve(errorCode)
				}
			}
			return nil;
    }
    
    func list() throws -> [HWCourseList]  {
        let sql = "SELECT id FROM HWCourseList "
        PersistenceManagerMySQL.sharedInstance.checkConnection();
        var entities = [HWCourseList]()
         let queryResult = db.query(sql)
        if(queryResult){

		let results = db.storeResults()!
  
        while let row = results.next() {
        	let hWCourseList = HWCourseList()
				hWCourseList.id = Int(row[0]);
	
			entities.append(hWCourseList)
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
approximately 35.97 minutes to type the 3597+ characters in this file.
 */


