//
//  StringsHelper.swift
//  Schools of NYC
//
//  Created by Vincent Hunter on 2/5/25.
//

import Foundation


extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
        
    }
    
    func localized(params: CVarArg...) -> String {
        return String(format: localized(), params)
    }
}
