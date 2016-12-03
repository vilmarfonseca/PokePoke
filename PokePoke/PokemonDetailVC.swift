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
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetails {
            
           
            //Only be called after the network call is complete!
            self.updateUI()
        }
        
    }
    
    func updateUI(){
        
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.heigth
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "Sem Evolução"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Próxima Evolução: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
    }


    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)        
    }
}
