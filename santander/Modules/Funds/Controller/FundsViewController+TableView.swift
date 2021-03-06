//
//  FundsViewController+TableView.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

extension FundsViewController: TableViewing {
    
    public func buildTableView() {
        let sections = buildTableViewSections()
        dataSource = TableViewDataSource(sections: sections,
                                         tableView: fundsView.tableView)
        
        fundsView.tableView.dataSource = dataSource
        fundsView.tableView.delegate = dataSource
        fundsView.tableView.reloadData()
    }
    
    public func buildTableViewSections() -> [TableViewSectionBuilder] {
        var sections = [TableViewSectionBuilder]()
        sections.append(TableViewStaticSection(cellBuilders: buildIntroCellBuilders()))
        sections.append(TableViewStaticSection(cellBuilders: buildFundsRiskCellBuilders()))
        sections.append(TableViewStaticSection(cellBuilders: buildMoreInfoCellBuilders()))
        return sections
    }
    
    public func buildIntroCellBuilders() -> [TableViewCellBuilder] {
        var builders = [TableViewCellBuilder]()
        
        let headerCellBuilder =
            FundsHeaderViewCellBuilder(configuration:
                .init(title: "Fundos de investimento",
                      subtitle: "Vinci Valorem FI Multimercado"))
        
        
        let explanationTextCellBuilder =
            FundsTextCellBuilder(configuration:
                .init(titleText: "O que é?",
                      titleFont: Resource.Font.medium.of(size: 16),
                      subtitleText: """
                                        O Fundo tem por objetivo proporcionar
                                        aos seus cotistas rentabilidade no longo
                                        prazo através de investimentos.
                                    """,
                      subtitleFont: Resource.Font.light.of(size: 16)))
        
        builders.append(headerCellBuilder)
        builders.append(SeparatorInlineCellBuilder(style: .arrow, spaced: 21))
        builders.append(explanationTextCellBuilder)
        
        return builders
    }
    
    public func buildFundsRiskCellBuilders() -> [TableViewCellBuilder] {
        var builders = [TableViewCellBuilder]()
        
        let riskTextCellBuilder =
            FundsTextCellBuilder(configuration:
                .init(titleText: "Grau de risco do investimento",
                      titleFont: Resource.Font.medium.of(size: 16),
                      subtitleText: "",
                      subtitleFont: Resource.Font.light.of(size: 16)),
                                 cellHeight: 70)
        
        let thermometerCellBuilder = ThermometerViewCellBuilder()
        
        builders.append(riskTextCellBuilder)
        builders.append(thermometerCellBuilder)
        
        return builders
    }
    
    public func buildMoreInfoCellBuilders() -> [TableViewCellBuilder] {
        var builders = [TableViewCellBuilder]()
        
        let moreInfoTextCellBuilder =
            FundsTextCellBuilder(configuration:
                .init(titleText: "Mais informações sobre o investimento",
                      titleFont: Resource.Font.medium.of(size: 16),
                      subtitleText: "",
                      subtitleFont: Resource.Font.light.of(size: 16)))
        
        let headerTextCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: nil,
                      secondColumn: ("Fundo", Resource.Color.lightGray),
                      thirdColumn: ("CDI", Resource.Color.lightGray)))
        
        let monthlyTextCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("No mês", Resource.Color.lightGray),
                      secondColumn: ("0,3%", Resource.Color.black),
                      thirdColumn: ("0,3%", Resource.Color.black)))
        
        let annuallyTextCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("No ano", Resource.Color.lightGray),
                      secondColumn: ("13,01%", Resource.Color.black),
                      thirdColumn: ("12,08%", Resource.Color.black)))
        
        let twelveMonthsTextCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("12 meses", Resource.Color.lightGray),
                      secondColumn: ("17,9%", Resource.Color.black),
                      thirdColumn: ("17,6%", Resource.Color.black)))
        
        let administrationTaxCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("Taxa de administração", Resource.Color.lightGray),
                      secondColumn: nil,
                      thirdColumn: ("0,50%", Resource.Color.black)))
        
        let initialApplicationCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("Aplicação inicial", Resource.Color.lightGray),
                      secondColumn: nil,
                      thirdColumn: ("R$ 10.000,00", Resource.Color.black)))
        
        let minimalMovimentCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("Movimentação mínima", Resource.Color.lightGray),
                      secondColumn: nil,
                      thirdColumn: ("R$ 1.000,00", Resource.Color.black)))
        
        let minimunBalanceCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("Saldo mínino", Resource.Color.lightGray),
                      secondColumn: nil,
                      thirdColumn: ("R$ 5.000,00", Resource.Color.black)))
        
        let rescueCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("Resgate (valor bruto)", Resource.Color.lightGray),
                      secondColumn: nil,
                      thirdColumn: ("D+0", Resource.Color.black)))
        
        let quotaCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("Cota (valor bruto)", Resource.Color.lightGray),
                      secondColumn: nil,
                      thirdColumn: ("D+1", Resource.Color.black)))
        
        let paymentCellBuilder =
            FundsThreeColumnsCellBuilder(configuration:
                .init(firstColumn: ("Pagamento (valor bruto)", Resource.Color.lightGray),
                      secondColumn: nil,
                      thirdColumn: ("D+2", Resource.Color.black)))
        
        let resource = ("Baixar", Resource.Image.download.image)
        
        let resourceTapAction: (() -> Void) = {
            self.delegate?.navigate(to: "https://google.com")
        }
        
        let essentialsCellBuilder =
            FundsResourceCellBuilder(configuration:
                .init(title: "Essenciais", resource: resource),
                                     tapAction: resourceTapAction)
        
        let performanceCellBuilder =
            FundsResourceCellBuilder(configuration:
                .init(title: "Desempenho", resource: resource),
                                     tapAction: resourceTapAction)
        
        let complementaryCellBuilder =
            FundsResourceCellBuilder(configuration:
                .init(title: "Complementares", resource: resource),
                                     tapAction: resourceTapAction)
        
        let regulationCellBuilder =
            FundsResourceCellBuilder(configuration:
                .init(title: "Regulamento", resource: resource),
                                     tapAction: resourceTapAction)
        
        let accessionCellBuilder =
            FundsResourceCellBuilder(configuration:
                .init(title: "Adesão", resource: resource),
                                     tapAction: resourceTapAction)
        
        let buttonCellBuilder =
            FundsButtonCellBuilder(configuration: .init(title: "Investir"),
                                   tapAction: nil)
        
        builders.append(moreInfoTextCellBuilder)
        builders.append(headerTextCellBuilder)
        builders.append(monthlyTextCellBuilder)
        builders.append(annuallyTextCellBuilder)
        builders.append(twelveMonthsTextCellBuilder)
        builders.append(SeparatorInlineCellBuilder(style: .line, spaced: 21))
        builders.append(SeparatorInlineCellBuilder(spaced: 15))
        builders.append(administrationTaxCellBuilder)
        builders.append(initialApplicationCellBuilder)
        builders.append(minimalMovimentCellBuilder)
        builders.append(minimunBalanceCellBuilder)
        builders.append(rescueCellBuilder)
        builders.append(quotaCellBuilder)
        builders.append(paymentCellBuilder)
        builders.append(essentialsCellBuilder)
        builders.append(performanceCellBuilder)
        builders.append(complementaryCellBuilder)
        builders.append(regulationCellBuilder)
        builders.append(accessionCellBuilder)
        builders.append(SeparatorInlineCellBuilder(spaced: 45))
        builders.append(buttonCellBuilder)
        builders.append(SeparatorInlineCellBuilder(spaced: 42))
        
        return builders
    }
    
}
