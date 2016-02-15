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
Filename:     BaseRequestHandler.swift
Description:  BaseRequestHandler
Project:      Homework
Template: /PerfectSwift/server/BaseRequestHandler.swift.vmg
 */
import PerfectLib
class BaseRequestHandler: RequestHandler {
    enum ActionResponse {
        case Output(templatePath: String?, values: [String: Any])
        case Redirect(url: String)
        case Error(status: Int, message: String)
    }
    
    var request: WebRequest!
    var response: WebResponse!
    
    
    func handleRequest(request: WebRequest, response: WebResponse) {
        //  initialize
        self.request = request
        self.response = response
        
        defer {
            response.requestCompletedCallback()
        }
        
        //do {
            //try response.getSession(Config.sessionName, withConfiguration: SessionConfiguration(Config.sessionName, expires: Config.sessionExpires))
        //} catch (let e) {
        //    print(e)
        //}
    }
    
 
}

/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 8.38 minutes to type the 838+ characters in this file.
 */


