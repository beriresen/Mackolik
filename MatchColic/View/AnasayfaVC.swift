//
//  AnasayfaVC.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 16.02.2023.
//

import UIKit
import LZViewPager


class AnasayfaVC: UIViewController,LZViewPagerDelegate,LZViewPagerDataSource{
   
    @IBOutlet weak var anasayfaView: LZViewPager!
    private var subControllers:[UIViewController] =  []
    var selectedLig:String?
    var selectedLigKey:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewPagerProperties()

    }
    
    func viewPagerProperties(){
        anasayfaView.delegate  = self
        anasayfaView.dataSource = self
        anasayfaView.hostController = self
        
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:  "PuanDurumuVC" ) as! PuanDurumuVC
        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:  "MaclarVC" ) as! MaclarVC
        let vc3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:  "GoalKingsVC" ) as! GoalKingsVC
        vc1.title = "Puan Durumu"
        vc2.title = "Maçlar"
        vc3.title = "Gol Kralları"
        vc1.selectedLig = selectedLig
        vc1.selectedLigKey = selectedLigKey
        vc2.selectedLig = selectedLig
        vc2.selectedLigKey = selectedLigKey
        vc3.selectedLig = selectedLig
        vc3.selectedLigKey = selectedLigKey
        subControllers = [vc1,vc2,vc3]
        anasayfaView.reload()
    }
    
    func numberOfItems() -> Int {
        return self.subControllers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
       // button.setTitleColor(#colorLiteral(red: 56 , green: 101, blue: 176, alpha: 1),for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = UIColor(named: "mackolikBlue")
      //  button.backgroundColor =  UIColor(red: 56 , green: 101, blue: 176, alpha: 1)
        return button
    }
    func colorForIndicator(at index: Int) -> UIColor {
        .orange
    }
    func heightForIndicator() -> CGFloat {
        6
    }
}
