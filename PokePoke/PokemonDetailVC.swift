//
//  PokemonDetailVC.swift
//  PokePoke
//
//  Created by Vilmar Fonseca on 01/12/16.
//  Copyright © 2016 Vilmar Fonseca. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
        
    }


}
