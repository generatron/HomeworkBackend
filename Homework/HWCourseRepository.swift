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
Filename:     HWCourseRepository.swift
Description:  Persistence code for for HWCourse
Project:      Homework
Template: /PerfectSwift/server/EntityRepository.swift.vm
 */


import MySQL
class HWCourseRepository : RepositoryMySQL {
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
       	
       	let statement = MySQLStmt(db)
		defer {
			statement.close()
		}
		let prepRes = statement.prepare(sql)
		if(prepRes){
	statement.bindParam(entity.color_id)
	statement.bindParam(entity.id)
	statement.bindParam(entity.name)
	statement.bindParam(entity.period)


let execRes = statement.execute()
if(!execRes){
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

let statement = MySQLStmt(db)
		defer {
			statement.close()
		}
		let prepRes = statement.prepare(sql)
		
		if(prepRes){		
	statement.bindParam(entity.color_id)
	statement.bindParam(entity.id)
	statement.bindParam(entity.name)
	statement.bindParam(entity.period)

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
    
	func delete(entity: HWCourse) throws -> Int {
	    guard let id = entity.id else {
	        return 0
	    }
	    
	    let sql = "DELETE FROM hWCourse WHERE id = ?"
	    let statement = MySQLStmt(db)
		defer {
			statement.close()
		}
		let prepRes = statement.prepare(sql)
		
		if(prepRes){
			//HARDCODED might not exist, assuming it does, need to retrieve PK
			statement.bindParam(entity.id)
			
			let execRes = statement.execute()
	        if(!execRes){
				print("\(statement.errorCode()) \(statement.errorMessage()) - \(db.errorCode()) \(db.errorMessage())")
				let errorCode = db.errorCode()
				if errorCode > 0 {
	    			throw RepositoryError.Delete(errorCode)
				}
				statement.close()
			}
				
		}
		return 0
	}
    
    func retrieve(id: Int) throws -> HWCourse? {
        let sql = "SELECT id,name,period FROM HWCourse"
       	let statement = MySQLStmt(db)
		defer {
			statement.close()
		}
		let prepRes = statement.prepare(sql)
		
		if(prepRes){
			//HARDCODED might not exist, assuming it does, need to retrieve PK
			statement.bindParam(entity.id)
			
			let execRes = statement.execute()
            if(!execRes){
            	let result = statement.results()
            	
            	let ok = results.forEachRow {
				e in
				print(e.flatMap({ (a:Any?) -> Any? in
					return a!
				}))
				}
			
				print("\(statement.errorCode()) \(statement.errorMessage()) - \(db.errorCode()) \(db.errorMessage())")
				let errorCode = db.errorCode()
				if errorCode > 0 {
	    			throw RepositoryError.Delete(errorCode)
				}
				statement.close()
			}
				
		}
	    return entity;
    }
    
    func list() throws -> [HWCourse] {
        let sql = "SELECT * FROM hWCourse "
        var entities = [HWCourse]()
        var columns = [Any]()
        try db.forEachRow(sql, doBindings: { (stmt:SQLiteStmt) -> () in
            //nothing to see here
        }) { (stmt:SQLiteStmt, r:Int) -> () in
                let entity =  HWCourse()
		entity.color = stmt.columnInt64(0)
		entity.id = stmt.columnInt64(1)
		entity.name = stmt.columnText(2)
		entity.period = stmt.columnInt64(3)
        	    entities.append(entity)
        }
        return entities
    }
}

/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 42.03 minutes to type the 4203+ characters in this file.
 */


