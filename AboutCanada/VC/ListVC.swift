//
//  ListVC.swift
//  AboutCanada
//
//  Created by Dinny Anand on 31/03/2020.
//  Copyright © 2020 Dinny Anand. All rights reserved.
//

import UIKit
import Alamofire

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
     var canadaList : [Row] = [] {
               didSet {updateUI()}
     }
    var mainView: CListView! { return self.view as? CListView }
        
     override func loadView() {
            self.view = CListView(frame: UIScreen.main.bounds)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = self.mainView.tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CanadaTVC.self, forCellReuseIdentifier: "cellId")
         getApiData()
    }
    
    func getApiData(){
        AF.request(kBaseUrl,method: .post).response { response in
            guard let dataJson = response.data else { return }
            let responseStrInISOLatin = String(data: dataJson, encoding: String.Encoding.isoLatin1)
            guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                  print("could not convert data to UTF-8 format")
                  return
             }
            do {
                guard let _ = try JSONSerialization.jsonObject(with: modifiedDataInUTF8Format, options: .mutableContainers) as? [String: Any] else {return}
                let decoder = JSONDecoder()
                guard let canadaData = try? decoder.decode(CanadaModel.self, from: modifiedDataInUTF8Format) else { return }
                self.canadaList = (canadaData.rows)!
                 DispatchQueue.main.async() {
                        if canadaData.title.count>0 {
                            self.title = canadaData.title
                        }
                }
                self.updateUI()
            }catch {
                    debugPrint(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 10;
       }

    func numberOfSections(in tableView: UITableView) -> Int {
           return self.canadaList.count
        }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let header = UIView()
           header.backgroundColor = UIColor.clear
           return header
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CanadaTVC
                 cell.backgroundColor = UIColor.white
                 cell.tag = indexPath.section
                 let canadaRow = self.canadaList[indexPath.section]
                 cell.titleLabel.text = canadaRow.title
                 cell.descriptionLabel.text = canadaRow.description
                 cell.canadaImageView.imageFromUrl(canadaRow.imageHref)
                 if cell.canadaImageView.image == nil {
                       cell.canadaImageView.image = UIImage(systemName: "exclamationmark")
                 }
                 cell.makeRoundCorners(byRadius: 10)
                 return cell
    }
    
    private func updateUI() {
              DispatchQueue.main.async() {
                  self.tableView.reloadData()
                   self.tableView.invalidateIntrinsicContentSize()
                   self.tableView.layoutIfNeeded()
              }
           }

}
