//
//  FrequenciaViewController.swift
//  Mobile
//
//  Created by Breno Aquino on 01/09/17.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit
import CVCalendar
import AMScrollingNavbar

class FrequenciaViewController: UIViewController, CVCalendarMenuViewDelegate, CVCalendarViewDelegate, CVCalendarViewAppearanceDelegate {

    @IBOutlet weak var menuCalendar: CVCalendarMenuView!
    
    @IBOutlet weak var calendarView: CVCalendarView!
    
    @IBOutlet weak var nomeMes: UILabel!
    
    var fatherNavigationController: ScrollingNavigationController!
    
    var presencasDate: [Date] = []
    var faltasDate: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.menuCalendar.delegate = self
        
        self.calendarView.delegate = self
        
        self.setFaltasPresencas()
        
        self.nomeMes.text = getMes(date: Date()).capitalized
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.calendarView.calendarAppearanceDelegate = self
        
        self.menuCalendar.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
    }
    
    func setFaltasPresencas() {
        
        let dateFormatter = DateFormatter()
        
        let presencas: [String] = ["03/08/2017", "08/08/2017", "15/08/2017", "24/08/2017", "29/08/2017", "31/08/2017"]
        
        let faltas: [String] = ["01/08/2017", "10/08/2017", "17/08/2017", "22/08/2017"]
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        for dateString in faltas {
            
            faltasDate.append(dateFormatter.date(from: dateString)!)
        }
        
        for dateString in presencas {
            
            presencasDate.append(dateFormatter.date(from: dateString)!)
        }
    }
    
    func getMes(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM"
        
        return dateFormatter.string(from: date)
    }
    
    // MARK: Mostra ou Não Mostra
    
    func shouldShowWeekdaysOut() -> Bool {
        
        return false
    }
    
    // MARK: Mostrar o Mes
    
    func presentedDateUpdated(_ date: CVDate) {
        
        if let dateConverted = date.convertedDate() {
            
            nomeMes.text = getMes(date: dateConverted).capitalized
        }
    }
    
    // MARK: Passar Para Outra Tela
    
    func didSelectDayView(_ dayView: DayView, animationDidFinish: Bool) {
        
        dayView.setDeselectedWithClearing(true)
        
        self.performSegue(withIdentifier: "segueDia", sender: dayView)
    }
    
    // MARK: Cor dos Dias (numero)
    
    func dayLabelColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        
        if status == .out {
            
            return UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.1)
            
        } else if weekDay == .tuesday || weekDay == .thursday {
            
            return UIColor.black
            
        } else {
            
            return UIColor.gray
        }
    }
    
    // MARK: Colorir e Mostrar Circulos Background
    
    func shouldAutoSelectDayOnMonthChange() -> Bool {
        
        return false
    }
    
    func preliminaryView(viewOnDayView dayView: DayView) -> UIView {
        
        let circleView = CVAuxiliaryView(dayView: dayView, rect: dayView.frame, shape: CVShape.circle)
        
        if let date = dayView.date.convertedDate() {
            
            if faltasDate.contains(date) {
                
                circleView.fillColor = UIColor(colorLiteralRed: 255/255, green: 0/255, blue: 0/255, alpha: 0.5)
                
            } else if presencasDate.contains(date) {
                
                circleView.fillColor = UIColor(colorLiteralRed: 0/255, green: 255/255, blue: 0/255, alpha: 0.5)
            }
        }
        
        return circleView
    }
    
    func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        
        if !dayView.isOut {
            
            if let date = dayView.date, let dateConverted = date.convertedDate() {
                
                if faltasDate.contains(dateConverted) || presencasDate.contains(dateConverted) {
                    
                    return true
                }
            }
        }
        
        return false
    }
    
    // MARK: Modo de Apresentacao do Calendario
    
    func presentationMode() -> CalendarMode {
        
        return .monthView
    }
    
    func firstWeekday() -> Weekday {
        
        return .sunday
    }
    
    // MARK: Tipo do Menu (dias da semana)
    
    func weekdaySymbolType() -> WeekdaySymbolType {
        
        return .veryShort
    }
    
    func dayOfWeekTextColor() -> UIColor {
        
        return .black
    }
    
    // MARK: Actions
    
    @IBAction func prevMonth(_ sender: Any) {
        
        calendarView.loadPreviousView()
    }
    
    @IBAction func nextMonth(_ sender: Any) {
        
        calendarView.loadNextView()
    }
}
