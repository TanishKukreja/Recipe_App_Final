//
//  ViewController.swift
//  Recipe_App_Final
//
//  Created by Tanish_MAC on 07/03/23.
//

import UIKit

struct JsonStruct {
    let strIngredient: String
    let strDescription: String
    let idIngredient: String
}

class ViewController: UINavigationController {
    var containerView = UIView()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    var arrdata = [JsonStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Recipe App"
        getData()
        tableView.dataSource = self
        tableView.delegate = self
        setupView()

    }
    
    private func setupView() {
        self.view.addSubview(containerView)
        containerView.addSubview(tableView)
        
        containerView.backgroundColor = .white
        containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant:  0).isActive = true
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor , constant:  0).isActive = true
        tableView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant:  0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func getData(){
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?i=list")
        URLSession.shared.dataTask(with: url!){
            (data,
             response,error) in
            guard let data = data else { return }
            do{
                if error ==  nil {
                    let value = try JSONSerialization.jsonObject(with: data)
                    if let value = value as? [String: Any], let meals = value["meals"] as? [[String: Any]] {
                        meals.forEach({
                            guard let strIngredient = $0["strIngredient"] as? String,
                                  let strDescription = $0["strDescription"] as? String,
                                  let idIngredient = $0["idIngredient"] as? String else { return }
                            let dataModel = JsonStruct(strIngredient: strIngredient, strDescription: strDescription, idIngredient: idIngredient)
                            self.arrdata.append(dataModel)
                        })
                    }
                }
                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            }
                            catch{
                                print("error in gettin json data")
                            }
                        }.resume()
                    }
                    
                }

                extension ViewController: UITableViewDataSource, UITableViewDelegate {
                    
                    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
                    {
                        return arrdata.count
                    }
                    
                    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
                        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
                        cell.textLabel?.text = self.arrdata[indexPath.row].strIngredient
                        return cell
                    }
                    
                    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                        let vc = DescriptionViewController()
                        vc.titleLabel.text = self.arrdata[indexPath.row].strIngredient
                        vc.descriptionLabel.text = self.arrdata[indexPath.row].strDescription
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
