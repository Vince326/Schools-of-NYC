//
//  ViewController.swift
//  Schools of NYC
//
//  Created by Vincent Hunter on 1/27/25.
//

import UIKit
import Combine
import PureLayout

class SchoolListViewController: UIViewController {
    
    private let schoolsViewModel : SchoolsViewModel = SchoolsViewModel()
    private var cancellables =  Set<AnyCancellable>()
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpBinders()
        schoolsViewModel.fetchSchools()
        
        let titleStr = "schools.title".localized()
        //API Call to get schools
//        let api : SchoolAPILogic = SchoolAPI()
//        api.fetchSchools {result in
//            switch result {
//            case .success(let schools):
//                if let schools = schools {
//                    print("Found Schools: \(schools.count)")
//                }
//                break
//            case .failure(let error):
//                print("Error retrieving schools: \(error.localizedDescription)")
//                break
//            }
//        }
    }
    
    private func setUpCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: view.frame.size.width, height: Constants.cellHeight)
        collectionViewLayout.headerReferenceSize = CGSize(width: view.frame.size.width, height: Constants.sectionHeight)
        collectionViewLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        guard let collectionView = collectionView else {
            return
        }
        view.addSubview(collectionView)
        collectionview.autoPinEdgesToSuperviewEdges()
        collectionview.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        
        //Setup and customize flow layout
        collectionView.register(SchoolCollectionViewLayoutCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    
    private func setUpBinders() {
        schoolsViewModel.$schools
            .receive(on: RunLoop.main)
            .sink { schools in
                if let schools = schools {
                    print("Found Schools: \(schools.count) schools")
                }
            }
        
            .store(in: &cancellables)
        
        schoolsViewModel.$error
            .receive(on: RunLoop.main)
            .sink {  [weak self] error in
                if let error = error {
                    let alert = UIAlertController(title: "Error", message: "Couldn't retrieve schools \(error.localizedDescription)", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    
                    self?.present(alert, animated: true)
                    return
                }
            }
            .store(in: &cancellables)
        
        
    }


}

