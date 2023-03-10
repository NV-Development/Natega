//
//  HomeAssembler.swift
//  Natega
//
//  Created by Nikola Veljanovski on 17.12.22.
//

import Foundation

protocol HomeAssembler {
    func resolve() -> HomeView
}

class HomeViewAssembler: HomeAssembler { }

extension HomeViewAssembler {
    func resolve() -> HomeView {
        let apiClient = KatamerosAPI()
        let repository = KatamerosRepository(apiClient: apiClient)
        let feastCase = LoadFeastInfoUseCase(repository: repository)
        let viewModel = HomeViewModel(feastInfoCase: feastCase)
        return HomeView(viewModel: viewModel)
    }
}
