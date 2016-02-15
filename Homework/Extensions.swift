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
Filename:     Extensions.swift
Description:  BaseRequestHandler
Project:      Homework
Template: /PerfectSwift/server/Extensions.swift.vmg
 */

import PerfectLib

//
//  extension.swift
//  SwiftBBS
//
//  Modified from original Created by Takeo Namba on 2016/01/16.
//	Copyright GrooveLab
//

import OpenSSL
import PerfectLib

extension WebResponse {
    func render(templatePath: String, values: MustacheEvaluationContext.MapType) throws -> String {
        let fullPath = "Templates/" + templatePath
        let file = File(fullPath)
        
        try file.openRead()
        defer { file.close() }
        let bytes = try file.readSomeBytes(file.size())
        
        let parser = MustacheParser()
        let str = UTF8Encoding.encode(bytes)
        let template = try parser.parse(str)
        
        let context = MustacheEvaluationContext(map: values)
        context.filePath = file.path()
        let collector = MustacheEvaluationOutputCollector()
        try template.evaluatePragmas(context, collector: collector, requireHandler: false)
        template.evaluate(context, collector: collector)
        return collector.asString()
    }
    
    func renderHTML(templatePath: String, values: MustacheEvaluationContext.MapType) throws {
        let responsBody = try render(templatePath, values: values)
        appendBodyString(responsBody)
        addHeader("Content-type", value: "text/html")
    }
    
    func outputJson(values: [String:JSONValue]) throws {
        addHeader("content-type", value: "application/json")
        let encoded = try JSONEncoder().encode(values)
        appendBodyString(encoded)
    }
    
    func outputJson(data: String) throws {
        addHeader("content-type", value: "application/json")
        appendBodyString(data)
    }
    
}

extension WebRequest {
    var action: String {
        return urlVariables["action"] ?? "index"
    }
    var acceptJson: Bool {
        return httpAccept().contains("application/json")
    }
}

extension String {

    
    var sha1: String {
        return self.dynamicType.base64(utf8.sha1)
    }
    
    static func base64(a: [UInt8]) -> String {
        let bio = BIO_push(BIO_new(BIO_f_base64()), BIO_new(BIO_s_mem()))
        
        BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL)
        BIO_write(bio, a, Int32(a.count))
        BIO_ctrl(bio, BIO_CTRL_FLUSH, 0, nil)
        
        var mem = UnsafeMutablePointer<BUF_MEM>()
        BIO_ctrl(bio, BIO_C_GET_BUF_MEM_PTR, 0, &mem)
        BIO_ctrl(bio, BIO_CTRL_SET_CLOSE, Int(BIO_NOCLOSE), nil)
        BIO_free_all(bio)
        
        let txt = UnsafeMutablePointer<UInt8>(mem.memory.data)
        let ret = UTF8Encoding.encode(GenerateFromPointer(from: txt, count: mem.memory.length))
        free(mem.memory.data)
        return ret
    }
    
    func SQLStringDate() -> NSDate {
        let dateFormat = NSDateFormatter ()
        dateFormat.dateFormat = "YYYY-MM-dd"
        return dateFormat.dateFromString(self)!
    }
}

extension String.UTF8View {
    var sha1: [UInt8] {
        let bytes = UnsafeMutablePointer<UInt8>.alloc(Int(SHA_DIGEST_LENGTH))
        defer { bytes.destroy() ; bytes.dealloc(Int(SHA_DIGEST_LENGTH)) }
        
        SHA1(Array<UInt8>(self), (self.count), bytes)

        var r = [UInt8]()
        for idx in 0..<Int(SHA_DIGEST_LENGTH) {
            r.append(bytes[idx])
        }
        return r
    }
}

extension NSDate {
    var SQLDateString : String {
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "YYYY-MM-dd"
        return dateFormat.stringFromDate(self);
    }
}





/* 
[STATS]
It would take a person typing  @ 100.0 cpm, 
approximately 34.49 minutes to type the 3449+ characters in this file.
 */


