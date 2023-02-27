//
//  ViewController.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 13.02.2023.
//

import UIKit
import LZViewPager
class LiglerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MatchColicViewModel()
    var vc = AnasayfaVC()
    var selectedLig:String?
    var selectedLigKey:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModelObserver()
        self.viewModel.getLigList()
        
    }
    
    //MARK: Tableview Delegate ve Datasource İşlemleri
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        let ligListTableViewCell = UINib(nibName: "LigListCell", bundle: nil)
        self.tableView.register(ligListTableViewCell, forCellReuseIdentifier: "LigListCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return (viewModel.ligList.value?.result?.count ?? 0) - 19
        return (viewModel.ligList.value?.result?.count ?? 0) - 19
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item:LigListResult = (viewModel.ligList.value?.result?[indexPath.row])!
        let cell = tableView.dequeueReusableCell(withIdentifier:"LigListCell", for: indexPath) as! LigListCell
        cell.lblLig.text = item.league
        if  item.key == "super-lig"{
            cell.imgFlag.image = UIImage(named: "turkey")
        }else if item.key == "tff-1-lig"{
            cell.imgFlag.image = UIImage(named: "turkey")
        }else if item.key == "ingiltere-premier-ligi"{
            cell.imgFlag.image = UIImage(named: "england")
        }else if item.key == "uefa-konferans-ligi"{
            cell.imgFlag.image = UIImage(named: "uefa")
        }else if item.key == "almanya-bundesliga"{
            cell.imgFlag.image = UIImage(named: "germany")
        }else if item.key == "fransa-ligue-1"{
            cell.imgFlag.image = UIImage(named: "france")
        }else if item.key == "ispanya-la-liga"{
            cell.imgFlag.image = UIImage(named: "spain")
        }else if item.key == "italya-serie-a-ligi"{
            cell.imgFlag.image = UIImage(named: "italy")
        }else if item.key == "ingiltere-sampiyonluk-ligi"{
            cell.imgFlag.image = UIImage(named: "england")
        }else if item.key == "almanya-bundesliga-2-ligi"{
            cell.imgFlag.image = UIImage(named: "germany")
        }else if item.key == "fransa-ligue-2"{
            cell.imgFlag.image = UIImage(named: "france")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item:LigListResult = (viewModel.ligList.value?.result?[indexPath.row])!
        selectedLigKey = item.key
        selectedLig = item.league
        performSegue(withIdentifier: "toAnasayfaVC", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AnasayfaVC
        if let selectedLig = selectedLig,let selectedLigKey = selectedLigKey {
            vc.selectedLig = selectedLig
            vc.selectedLigKey = selectedLigKey
            
        }
    }
    
    //MARK: - ViewModel ve Data Binding işlemleri
    fileprivate func setupViewModelObserver() {
        
        viewModel.ligList.bind { [weak self] (ligList) in
            DispatchQueue.main.async {
                self!.tableView.reloadData()
            }
        }
        
        viewModel.isLoading.bind { [weak self] (isLoading) in
            guard let isLoading = isLoading else { return }
            DispatchQueue.main.async { [self] in
                isLoading ? self?.indicatorView.startAnimating() : self?.indicatorView.stopAnimating()
                self?.indicatorView.isHidden = !isLoading
            }
        }
        
        viewModel.alertItem.bind{ [weak self] (alert) in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: self?.viewModel.alertItem.value?.title ?? "Uyarı",
                                              message: self?.viewModel.alertItem.value?.message ?? "Bir Hata Oluştu",
                                              preferredStyle: .alert)
                let okButton = UIAlertAction(title: self?.viewModel.alertItem.value?.dismissButton ?? "Tamam", style: .default)
                alert.addAction(okButton)
                self?.present(alert, animated: true)
            }
        }
    }
}

