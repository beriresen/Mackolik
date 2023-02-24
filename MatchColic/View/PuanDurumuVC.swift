//
//  SiralamaVC.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 14.02.2023.
//

import UIKit

class PuanDurumuVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var lblLig: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MatchColicViewModel()
    var selectedLig:String?
    var selectedLigKey:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        lblLig.text = selectedLig
        setupTableView()
        setupViewModelObserver()
        self.viewModel.getLigSira(lig: selectedLigKey!)
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
//
//        let siralamaTableViewCell = UINib(nibName: "SiralamaCell", bundle: nil)
//        self.tableView.register(siralamaTableViewCell, forCellReuseIdentifier: "SiralamaCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.ligSira.value?.result?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item:LigSiraList = (viewModel.ligSira.value?.result?[indexPath.row])!
        let cell = tableView.dequeueReusableCell(withIdentifier:"SiralamaCell", for: indexPath) as! SiralamaCell
       cell.lblSira.text = item.rank?.description
       cell.lblTakim.text = item.team
        cell.lblOyun.text = item.play?.description
        cell.lblGalibiyet.text = item.win?.description
        cell.lblBeraberlik.text = item.draw?.description
        cell.lblMaglubiyet.text = item.lose?.description
        cell.lblAtilanGol.text = item.goalfor?.description
        cell.lblYenilenGol.text = item.goalagainst?.description
        cell.lblAveraj.text = item.goaldistance?.description
        cell.lblPuan.text = item.point?.description
        if indexPath.row == 0 {
            cell.lblSira.textColor = UIColor(named: "puanColor")
            cell.lblSira.font  = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        }
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
    fileprivate func setupViewModelObserver() {
        
        viewModel.ligSira.bind { [weak self] (ligSira) in
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
