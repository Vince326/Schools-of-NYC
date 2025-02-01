//
//  ViewController.swift
//  Schools of NYC
//
//  Created by Vincent Hunter on 1/27/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //API Call to get schools
        let api : SchoolAPILogic = SchoolAPI()
        api.fetchSchools {result in
            switch result {
            case .success(let schools):
                if let schools = schools {
                    print("Found Schools: \(schools.count)")
                }
                break
            case .failure(let error):
                print("Error retrieving schools: \(error.localizedDescription)")
                break
            }
        }
    }


}

