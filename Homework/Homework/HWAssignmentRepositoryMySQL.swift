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
Filename:     HWAssignmentRepositoryMySQL.swift
Description:  Persistence code for for HWAssignment
Project:      Homework
Template: /PerfectSwift/server/EntityRepositoryMySQL.swift.vm
 */


import MySQL
class HWAssignmentRepositoryMySQL : RepositoryMySQL {
func createTable() throws ->  Int {
   let rs = try db.query("CREATE TABLE IF NOT EXISTS HWAssignment (dateAssigned Date, dateDue Date, id BIGINT(20) NOT NULL AUTO_INCREMENT, isCompleted BIT, name VARCHAR(255), type INT(10), PRIMARY KEY (id))")
   let errorCode = db.errorCode()
        if errorCode > 0 {
            throw RepositoryError.CreateTable(errorCode)
      }
      return 0;
}
func insert(entity: HWAssignment) throws -> Int {
       	let sql = "INSERT INTO HWAssignment(dateAssigned,dateDue,isCompleted,name,type) VALUES ( ?, ?, ?, ?, ?)"
       	let db = PersistenceManagerMySQL.sharedInstance.connect();
       	let statement = MySQLStmt(db)
		defer {
			statement.close()
			db.close();
		}
		let prepRes = statement.prepare(sql)
		if(prepRes){

		if(entity.dateAssigned != nil){
			statement.bindParam(entity.dateAssigned.SQLDateString)
		}else{
			statement.bindParam()
		}
		

		if(entity.dateDue != nil){
			statement.bindParam(entity.dateDue.SQLDateString)
		}else{
			statement.bindParam()
		}
		

		if(entity.isCompleted != nil){
			statement.bindParam(entity.isCompleted)
		}else{
			statement.bindParam()
		}
		

		if(entity.name != nil){
			statement.bindParam(entity.name)
		}else{
			statement.bindParam()
		}
		

		if(entity.type != nil){
			statement.bindParam(entity.type)
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
    
	func update(entity: HWAssignment) throws -> Int {
        guard let id = entity.id else {
            return 0
        }
        
        let sql = "UPDATE HWAssignment SET dateAssigned= ? ,dateDue= ? ,isCompleted= ? ,name= ? ,type= ? WHERE id = ?"
PersistenceManagerMySQL.sharedInstance.checkConnection();
let statement = MySQLStmt(db)
		defer {
			statement.close()
		}
		let prepRes = statement.prepare(sql)
		
		if(prepRes){		

		if(entity.dateAssigned != nil){
			statement.bindParam(entity.dateAssigned.SQLDateString)
		}else{
			statement.bindParam()
		}
		

		if(entity.dateDue != nil){
			statement.bindParam(entity.dateDue.SQLDateString)
		}else{
			statement.bindParam()
		}
		

		if(entity.isCompleted != nil){
			statement.bindParam(entity.isCompleted)
		}else{
			statement.bindParam()
		}
		

		if(entity.name != nil){
			statement.bindParam(entity.name)
		}else{
			statement.bindParam()
		}
		

		if(entity.type != nil){
			statement.bindParam(entity.type)
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
	    let sql = "DELETE FROM hWAssignment WHERE id = \(id)"
	    let queryResult = db.query(sql)
	    return id;
	}
    
    func retrieve(id: Int) throws -> HWAssignment? {
        let sql = "SELECT dateAssigned,dateDue,id,isCompleted,name,type FROM HWAssignment WHERE id = \(id)"
        PersistenceManagerMySQL.sharedInstance.checkConnection();
		let queryResult = db.query(sql)
		 if(queryResult){
        let results = db.storeResults()!
  		let hWAssignment = HWAssignment()
        while let row = results.next() {
			hWAssignment.dateAssigned = (row[0] as String).SQLStringDate();

hWAssignment.dateDue = (row[1] as String).SQLStringDate();

	hWAssignment.id = Int(row[2]);
	
			if(row[3] == "1"){
			   	hWAssignment.isCompleted = Bool(true);
			}else{
				hWAssignment.isCompleted = Bool(false);
			}

	hWAssignment.name = String(row[4]);
	
	hWAssignment.type = Int(row[5]);
	
            print(row)
        }
        results.close()
	    return hWAssignment;
	    }else{
				print(" \(db.errorCode()) \(db.errorMessage())")
				let errorCode = db.errorCode()
				if errorCode > 0 {
				    throw RepositoryError.Retrieve(errorCode)
				}
			}
			return nil;
    }
    
    func list() throws -> [HWAssignment]  {
        let sql = "SELECT dateAssigned,dateDue,id,isCompleted,name,type FROM HWAssignment "
        PersistenceManagerMySQL.sharedInstance.checkConnection();
        var entities = [HWAssignment]()
         let queryResult = db.query(sql)
        if(queryResult){

		let results = db.storeResults()!
  
        while let row = results.next() {
        	let hWAssignment = HWAssignment()
			hWAssignment.dateAssigned = (row[0] as String).SQLStringDate();

hWAssignment.dateDue = (row[1] as String).SQLStringDate();

	hWAssignment.id = Int(row[2]);
	
			if(row[3] == "1"){
			   	hWAssignment.isCompleted = Bool(true);
			}else{
				hWAssignment.isCompleted = Bool(false);
			}

	hWAssignment.name = String(row[4]);
	
	hWAssignment.type = Int(row[5]);
	
			entities.append(hWAssignment)
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
approximately 57.94 minutes to type the 5794+ characters in this file.
 */


