//
//  pokemon.swift
//  Sport
//
//  Created by Yuliya on 21/04/2023.
//

import Foundation

/*
import Foundation
import CoreData
import UIKit

protocol StorageManagerProtocol {
    func getPokemonsFromDataBase() -> [PokemonEntity]
    func savePokemonsToDatabase(pokemons: [PokemonModel])
    func deletePokemonsFromDataBase()
}

public final class PokemonStorageManager: StorageManagerProtocol {
    
    public static let shared = PokemonStorageManager()
    
    private init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    func getPokemonsFromDataBase() -> [PokemonEntity] {
        
        let request = NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching")
        }
        return []
    }
    
    func savePokemonsToDatabase(pokemons: [PokemonModel]) {
        
        for item in pokemons {
            guard let pokemonEntity = NSEntityDescription.insertNewObject(forEntityName: "PokemonEntity", into: context) as? PokemonEntity else { return }
            pokemonEntity.name = item.name
            pokemonEntity.url = item.url
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                print("Core Data Error: \(error), \(error.userInfo)")
            }
        }
    }
    
    func deletePokemonsFromDataBase() {
        
        let request = NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
        do {
            let result = try context.fetch(request)
            for item in result {
                context.delete(item)
            }
            try context.save()
        } catch let error as NSError {
            print("Could not fetch or delete. \(error), \(error.userInfo)")
        }
    }
}


//

func applicationWillTerminate(_ application: UIApplication) {
    self.saveContext()
}

//    MARK: - Core Data stack

lazy var persistentContainer: NSPersistentContainer = {
    
    let managedObjectModelName = "PokemonModel"
    let container = NSPersistentContainer(name: managedObjectModelName)
    container.loadPersistentStores { _, error in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    return container
}()

//    MARK: - Core Data saving support

func saveContext() {
    let context = persistentContainer.viewContext
    guard context.hasChanges else { return }
    do {
        try context.save()
    } catch let error as NSError {
        fatalError("Unresolved error \(error), \(error.userInfo)")
    }
}
*/
