//
//  School.swift
//  Schools of NYC
//
//  Created by Vincent Hunter on 1/30/25.
//

import Foundation

struct School: Codable {
    let dbn: String
    let schoolName: String?
    let overviewParagraph:String?
    let schoolEmail:String?
    let academicOpportunities1:String?
    let academicOpportunities2:String?
    let neighborhood:String?
    let phoneNumber:String?
    let website:String?
    let finalGrades:String?
    let totalStudents:String?
    let schoolSports:String?
    let primaryAddressLine:String?
    let city:String?
    let zipCode:String?
    let latitude:String?
    let longitude:String?
    
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
        case schoolEmail = "school_email"
        case academicOpportunities1 = "academicopportunities_1"
        case academicOpportunities2 = "academicopportunities_2"
        case neighborhood
        case phoneNumber = "phoneNumber"
        case website
        case finalGrades
        case totalStudents = "total_students"
        case schoolSports = "school_sports"
        case primaryAddressLine = "primary_address_line_1"
        case city
        case zipCode = "zip"
        case latitude
        case longitude
        
        
    }
    
    
    
}
