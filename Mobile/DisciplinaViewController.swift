//
//  DisciplinaViewController.swift
//  Mobile
//
//  Created by Breno Aquino on 01/09/17.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit
import SwifterSwift
import KMNavigationBarTransition
import AMScrollingNavbar

class DisciplinaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let colorsNumber = ["#fff16364",
                        "#fff58559",
                        "#fff9a43e",
                        "#ffe4c62e",
                        "#ff67bf74",
                        "#ff59a2be",
                        "#ff2093cd",
                        "#ffad62a7",
                        "#ff805781",
                        "#fff16364",
                        "#fff58559",
                        "#fff9a43e",
                        "#ffe4c62e",
                        "#ff67bf74",
                        "#ff59a2be",
                        "#ff2093cd",
                        "#ffad62a7",
                        "#ff805781",
                        "#fff16364",
                        "#fff58559",
                        "#fff9a43e",
                        "#ffe4c62e",
                        "#ff67bf74",
                        "#ff59a2be",
                        "#ff2093cd",
                        "#ffad62a7",
                        "#ff805781"]
    
    let disciplinaNome = ["Sistemas Inteligentes",
                          "Teoria os Grafos",
                          "Principios de Controle",
                          "Calculo Numerico",
                          "Programacao Orientada a Objetos",
                          "Estrutura de Dados",
                          "Banco de Dados",
                          "Compiladores",
                          "Microprocessadores",
                          "Sistemas Lineares",
                          "Gestao Ambiental",
                          "Sistemas Logicos",
                          "Sistemas de Tempo Real",
                          "Economia",
                          "Aquisicao de Dados",
                          "Seguranca do Trabalho",
                          "Calculo I",
                          "Calculo II",
                          "Calculo III",
                          "Fisica I",
                          "Fisica II",
                          "Eletromagnetismo",
                          "Circuitos Eletricos",
                          "Resistencia dos Materiais",
                          "Algoritmo",
                          "Redes de Computadores",
                          "Inteligencia Artificial"]
    
    var colors: [UIColor] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for disciplina in disciplinaNome {
            
            
        }
        
        
        for color in self.colorsNumber {
            
            self.colors.append(UIColor(hexString: color)!)
        }
        
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.gray, size: CGSize(width: 1, height: 1)), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage(color: UIColor.gray, size: CGSize(width: 1, height: 1))
        
        
        self.tableView.register(cellType: TurmaTableViewCell.self)
    }
    
    // MARK: - Prepare for Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch StoryboardSegue.Disciplina(rawValue: segue.identifier!)! {
            
        case .segueDisciplinaDetalhes:
            
            if let controller = segue.destination as? DisciplinaPageMenuViewController {
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    
                    controller.color = self.colors[indexPath.row]
                    
                    controller.nomeDisciplina = self.disciplinaNome[indexPath.row]
                }
            }
        }
    }
    
    // MARK: - TableView Methods
    
    // MARK: Config
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 27
    }
    
    // MARK: Cell
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(for: indexPath) as TurmaTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.perform(segue: StoryboardSegue.Disciplina.segueDisciplinaDetalhes)
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: Header Section
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat(35)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return CGFloat(0.01)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView.loadFromNib(named: "DisciplinaHeaderView") as! DisciplinaHeaderView
        
        view.nomeDisciplina.text = self.disciplinaNome[section]
        
        view.backgroundColor = self.colors[section]
        
        return view
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Section"
    }
    
}
