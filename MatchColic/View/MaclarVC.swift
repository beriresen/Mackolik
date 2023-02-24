//
//  MaclarVC.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 17.02.2023.
//

import UIKit

class MaclarVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblLig: UILabel!
    
    var viewModel = MatchColicViewModel()
    var selectedLig:String?
    var selectedLigKey:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModelObserver()
        self.viewModel.getMaclar(lig: selectedLigKey!)
        lblLig.text = selectedLig
        
        if  selectedLigKey == "super-lig"{
            imgFlag.image = UIImage(named: "turkey")
        }else if selectedLigKey == "tff-1-lig"{
            imgFlag.image = UIImage(named: "turkey")
        }else if selectedLigKey == "ingiltere-premier-ligi"{
            imgFlag.image = UIImage(named: "england")
        }else if selectedLigKey == "uefa-konferans-ligi"{
            imgFlag.image = UIImage(named: "uefa")
        }else if selectedLigKey == "almanya-bundesliga"{
            imgFlag.image = UIImage(named: "germany")
        }else if selectedLigKey == "fransa-ligue-1"{
            imgFlag.image = UIImage(named: "france")
        }else if selectedLigKey == "ispanya-la-liga"{
            imgFlag.image = UIImage(named: "spain")
        }else if selectedLigKey == "italya-serie-a-ligi"{
            imgFlag.image = UIImage(named: "italy")
        }else if selectedLigKey == "ingiltere-sampiyonluk-ligi"{
            imgFlag.image = UIImage(named: "england")
        }else if selectedLigKey == "almanya-bundesliga-2-ligi"{
            imgFlag.image = UIImage(named: "germany")
        }else if selectedLigKey == "fransa-ligue-2"{
            imgFlag.image = UIImage(named: "france")
        }
    }
    //MARK: Tableview Delegate ve Datasource İşlemleri
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        let maclarTableViewCell = UINib(nibName: "MaclarCell", bundle: nil)
        self.tableView.register(maclarTableViewCell, forCellReuseIdentifier: "MaclarCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.maclar.value?.result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item:MaclarList = (viewModel.maclar.value?.result?[indexPath.row])!
        let cell = tableView.dequeueReusableCell(withIdentifier:"MaclarCell", for: indexPath) as! MaclarCell
        cell.lblHome.text = item.home
        cell.lblAway.text = item.away
        if item.skor == "undefined-undefined" {
            cell.lblScore.text = "v"
        }else {
            cell.lblScore.text = item.skor
            
        }
        
        let macSaati = item.date!
        let start = macSaati.index(macSaati.startIndex, offsetBy:11)
        let end = macSaati.index(macSaati.endIndex, offsetBy: -9)
        let range = start..<end
        let macSaatlerim = macSaati[range]
        cell.lblTime.text = String(macSaatlerim)
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = .white
        }
        else
        {
            cell.backgroundColor = UIColor(named: "cellGray")
        }
    }
    //MARK: - ViewModel ve Data Binding işlemleri
    fileprivate func setupViewModelObserver() {
        
        viewModel.maclar.bind { [weak self] (maclar) in
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
