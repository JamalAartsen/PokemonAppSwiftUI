//
//  PokemonDetailService.swift
//  Pokemon-SwiftUI
//
//  Created by Jamal Aartsen on 14/08/2024.
//

import Foundation
import Requester
import Resolver

final class PokemonDetailService: PokemonDetailWorker {
    
    @Injected private var requester: APIRequesting
    
    func getDetailOfPokemon(id: Int) async -> PokemonDetail? {
        let pokemon = await fetch(id: id)
        return pokemon
    }
}

private extension PokemonDetailService {
    
    func fetch(id: Int) async -> PokemonDetail? {
        do {
            let details = try await requester.perform(GetPokemonDetailAPIRequest(identifier: .id(id)))
            
            let species = await fetchSpecies(id: id)
            
            let pokemon = try PokemonDetail.map(details, species: species)
            
            return pokemon
        } catch let error {
            print("Error fetching Pokémon: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchSpecies(id: Int) async -> [Species] {
        do {
            let response = try await requester.perform(GetSpeciesOfPokemonRequest(id: id))
            
            let id = response.evolution_chain.getId()
            
            guard let id else { return [] }
            let evolutionChain = await fetchEvolutionChain(id: id)

            return evolutionChain
        } catch let error {
            print("Error fetching Species: \(error.localizedDescription)")
            return []
        }
    }
    
    func fetchEvolutionChain(id: Int) async -> [Species] {
        do {
            let response = try await requester.perform(GetEvolutionChainOfPokemonRequest(id: id))
        
            let allEvolutions = getAllEvolutions(from: response.chain)
            
            let speciesEntity: [NamedAPIEntity] = allEvolutions.compactMap { evolution in evolution.species }
            var species: [Species] = []
            
            for kind in speciesEntity {
                // If one fails it should stop the cycle and go to the catch block. If this ever change use guard statement with 'continue'
                let pokemon = try await requester.perform(GetPokemonDetailAPIRequest(identifier: .name(kind.name)))
                let mappedPokemon = try Species.map(id: pokemon.id, name: kind.name)
                
                species.append(mappedPokemon)
            }
                
            return species
        } catch let error {
            print("Error fetching Chain evolution: \(error.localizedDescription)")
            return []
        }
    }
    
    func getAllEvolutions(from evolvesToEntity: EvolvesToEntity) -> [EvolvesToEntity] {
        var allEvolutions: [EvolvesToEntity] = []
        
        allEvolutions.append(evolvesToEntity)
        
        for speciesEntity in evolvesToEntity.evolves_to {
            let furtherEvolutions = getAllEvolutions(from: EvolvesToEntity(species: speciesEntity.species, evolves_to: speciesEntity.evolves_to))
            allEvolutions.append(contentsOf: furtherEvolutions)
        }
        
        return allEvolutions
    }
}
