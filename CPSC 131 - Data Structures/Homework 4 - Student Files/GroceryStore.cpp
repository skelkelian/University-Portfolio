///////////////////////// TO-DO (1) //////////////////////////////
  /// Include necessary header files
  /// Hint:  Include what you use, use what you include
  #include <fstream>                                              // std::ws
  #include <iomanip>                                              // std::quoted
  #include <ostream>                                              // std::ostream
  #include "GroceryStore.hpp"
  #include "GroceryItemDatabase.hpp"
/////////////////////// END-TO-DO (1) ////////////////////////////






GroceryStore::GroceryStore( const std::string & persistentInventoryDB )
{
  std::ifstream fin( persistentInventoryDB );                     // Creates the stream object, and then opens the file if it can
                                                                  // The file is closed as fin goes out of scope

  // The file's inventory contents consists of a quoted UPC string followed by a quantity on hand unsigned integer separated by
  // whitespace, like this:
  //     "00044100117428"     8
  //     "00041780001566"    46
  //     "00021000043309"    35
  //     "00021000043309"     9

  ///////////////////////// TO-DO (2) //////////////////////////////
    /// While no errors have been detected and not end-of-file, read the inventory record from the input stream and then add that
    /// information to the memory resident inventory database.
    ///
    /// Hint: Since we didn't define an InventoryRecord class that defines the extraction operator (best practices says we should
    ///       have), extract the quoted string and the quantity attributes directly
    ///
    /// Hint: Just as you did in class GroceryItem, use std::quoted to read quoted strings.  Don't try to parse the quotes yourself.
    ///       See
    ///        1) https://en.cppreference.com/w/cpp/io/manip/quoted
    ///        2) https://www.youtube.com/watch?v=Mu-GUZuU31A
    // need string upc and unsigned int amount per item
    std::string temporaryUPC;
    unsigned int temporaryAmount;

    // read until end-of-file
    while( fin >> std::quoted( temporaryUPC ) >> temporaryAmount )
    {
      _inventoryDB[temporaryUPC] = temporaryAmount;
    }
  /////////////////////// END-TO-DO (2) ////////////////////////////
}                                                                 // File is closed as fin goes out of scope







GroceryStore::Inventory_DB & GroceryStore::inventory()
{ return _inventoryDB; }







GroceryStore::GroceryItemsSold GroceryStore::ringUpCustomers( const ShoppingCarts & shoppingCarts, std::ostream & receipt )
{
  GroceryItemsSold todaysSales;                                   // a collection of unique UPCs of grocery items sold
  ///////////////////////// TO-DO (3) //////////////////////////////
    ///  Ring up each customer accumulating the groceries purchased
    ///  Hint:  merge each customer's purchased groceries into today's sales.  (https://en.cppreference.com/w/cpp/container/set/merge)
//    todaysSales.merge( shoppingCarts );
    for( auto & item : shoppingCarts )
    {
        // print name
        receipt << item.first << " shopping cart contains:\n";

        // call ringUpCustemer name
        auto result = ringUpCustomer(item.second, receipt);
        for (auto it = result.begin(); it != result.end(); ++it) {
          todaysSales.insert(*(it));
        }
        /* todaysSales.merge( ringUpCustomer(item.second, receipt) ); */
    }
  /////////////////////// END-TO-DO (3) ////////////////////////////

  return todaysSales;
} // ringUpCustomers







GroceryStore::GroceryItemsSold GroceryStore::ringUpCustomer( const ShoppingCart & shoppingCart, std::ostream & receipt )
{
  auto & worldWideGroceryDatabase = GroceryItemDatabase::instance();        // Get a reference to the world wide database of all
                                                                            // groceries in the world. The database will contains a
                                                                            // full description of the item and the item's price.

  GroceryItemsSold purchasedGroceries;                                      // a collection of UPCs of the groceries purchased by this customer


  ///////////////////////// TO-DO (4) //////////////////////////////
    /// Print out a receipt containing a full description of the grocery items (obtained from the database of all groceries in the world) in
    /// the customer's shopping cart along with the total amount due. As items are being scanned, decrement the quantity on hand for
    /// that grocery item in the store's inventory.
    ///
    ///
    /// Hint:  Here's some pseudocode to get you started.
    ///       1        Initialize the amount due to zero
    ///       2        For each grocery item in the customer's shopping cart
    ///       2.1          If the item is not found in the world wide grocery item database, indicate on the receipt it's free of charge
    ///       2.2          Otherwise
    ///       2.2.1            Print the grocery item's full description on the receipt
    ///       2.2.2            Add the grocery item's price to the amount due
    ///       2.2.3            If the grocery item is something the store sells (the item is in the store's inventory)
    ///       2.2.3.1              Decrease the number of items on hand for the item sold
    ///       2.2.3.2              Add the items's UPC to the list of groceries purchased
    ///       3         Print the total amount due on the receipt
    // Initialize the amount due to zero
    double amountDue = 0;
    // For each grocery item in the customer's shopping cart
    for( auto & node : shoppingCart )
    {
      std::string UPCCode = node.first;
      GroceryItem item = node.second;
      auto f = worldWideGroceryDatabase.find( UPCCode );

      if ( f == nullptr )
      {
        receipt << "\nThis item is free of charge\n";
        // continue;
      }
      else
      {
        receipt << *f << "\n";
        amountDue += f->price();
        _inventoryDB[ UPCCode ]--;
        purchasedGroceries.insert( UPCCode );
      }
    }
//      // If the item is not found in the world wide grocery item database, indicate on the receipt it's free of charge
//      if ( item == nullptr )
//      {
//        receipt << groceryItem.first << ", (" << groceryItem.second << ") is not in the database and will not be charged.\n";
//      }
//      // If the item is found in the world wide grocery item database,
//      else
//      {
//        // Print the grocery item's full description on the receipt
//        receipt << *item << "\n";
//        // Add the grocery item's price to the amount due
//        amountDue += item->price();
//        // If the grocery item is something the store sells (the item is in the store's inventory)
//        if( auto & groceryItemUPC = inventory().at( groceryItem.first ); groceryItemUPC > 0 )
//        {
//          // Decrease the number of items on hand for the item sold
//          --groceryItemUPC;
//          // Add the items's UPC to the list of groceries purchased
//          purchasedGroceries.emplace( groceryItem.first );
//        }
//      }
//    }
    // Print the total amount due on the receipt
    receipt << "\n Total: " << amountDue << "\n";
  /////////////////////// END-TO-DO (4) ////////////////////////////

  return purchasedGroceries;
} // ringUpCustomer







void GroceryStore::reorderItems( GroceryItemsSold & todaysSales, std::ostream & reorderReport )
{
  auto & worldWideGroceryDatabase = GroceryItemDatabase::instance();    // Get a reference to the world wide database of all
                                                                        // groceries in the world. The database will contains a
                                                                        // full description of the item and the item's price.

  ///////////////////////// TO-DO (5) //////////////////////////////
    /// For each grocery item that has fallen below the reorder threshold, assume an order has been placed and now the shipment has
    /// arrived. Update the store's inventory to reflect the additional items on hand.
    ///
    /// Hint:  Here's some pseudocode to get you started.
    ///        1       For each grocery item sold today
    ///        1.1         If the grocery item is not in the store's inventory or if the number of grocery items on hand has fallen below the re-order threshold (REORDER_THRESHOLD)
    ///        1.1.1           If the grocery item is not in the world wide grocery item database,
    ///        1.1.1.1             display just the UPC
    ///        1.1.2           Otherwise,
    ///        1.1.2.1             display the grocery item's full description
    ///        1.1.3           If the grocery item is not in the store's inventory
    ///        1.1.3.1             display a notice indicating the grocery item is no longer sold in this store and will not be re-ordered
    ///        1.1.4           Otherwise,
    ///        1.1.4.1             Display the current quantity on hand and the quantity re-ordered
    ///        1.1.4.2             Increase the quantity on hand by the number of items ordered and received (LOT_COUNT)
    ///        2       Reset the list of grocery item sold today so the list can be reused again later
    ///
    /// Take special care to avoid excessive searches in your solution
    reorderReport << "Re-ordering grocery items the store is running low on.\n";
    unsigned int num = 1;
    // For each grocery item sold today
    for( auto & UPCCode : todaysSales )
    {
      //
      auto inventoryIterator = inventory().find( UPCCode );
      // If the grocery item is not in the store's inventory or if the number of grocery items on hand has fallen below the re-order threshold
      if( inventoryIterator == inventory().end() || inventoryIterator->second < REORDER_THRESHOLD )
      {
        // If the grocery item is not in the world wide grocery item database, display just the UPC
        auto databaseIterator = worldWideGroceryDatabase.find( UPCCode );
        if ( databaseIterator == nullptr )
        {
          reorderReport << UPCCode << " is no longer sold in this store and will not be re-ordered.\n";
        }
        // If the grocery item is in the world wide grocery item database, display the grocery item's full description
        else
        {
          reorderReport << num << ": {" << *databaseIterator << "}\n" << " only " << inventoryIterator->second << " remain in stock which is "
                        << REORDER_THRESHOLD - inventoryIterator->second << " unit(s) below reorder threshold (" << REORDER_THRESHOLD << "), re-ordering 20 more.\n";
          inventoryIterator->second += LOT_COUNT;
          num++;
        }
      }
    }
    // Reset the list of grocery item sold today so the list can be reused again later
    todaysSales.clear();
  /////////////////////// END-TO-DO (5) ////////////////////////////
}







GroceryStore::ShoppingCarts GroceryStore::makeShoppingCarts()
  {
    // Our store has many customers, and each (identified by name) is pushing a shopping cart. Shopping carts are structured as
    // trees of trees of grocery items.
    ShoppingCarts carts =
    {
      // first shopping cart
      { "Red Baron",        { {"00075457129000", {"milk"     }}, {"00038000291210", {"rice krispies"}}, {"00025317533003", {"hotdogs"}},
                              {"09073649000493", {"apple pie"}}, {"00835841005255", {"bread"        }}, {"00688267039317", {"eggs"   }},
                              {"00037466065908", {"Truffles" }}
                            }
      },

      // second shopping cart
      { "Peppermint Patty", { {"00813608012401", {"Cheese"      }}, {"00037466065908", {"Truffles"      }}, {"00631723300704", {"Pepperoncini"}},
                              {"00051500280645", {"Pancake Mix" }}, {"00792851355155", {"Soup"          }}, {"00898425001333", {"Sandwich"    }},
                              {"00021908501871", {"Potato Spuds"}}, {"00856414001092", {"Plantain Chips"}}, {"00036192122930", {"Applesauce"  }},
                              {"00763795931415", {"Paper Plates"}}, {"00070596000647", {"Soap"          }}, {"00079400266200", {"Deodorant"   }}
                            }
      },

      // third shopping cart
      { "Woodstock",        { {"00859013004327", {"Mint Tea"         }}, {"00041331092609", {"Spanish Omelet"}}, {"00217039300005", {"Fillet Steak"   }},
                              {"00636874220338", {"Face Exfoliate"   }}, {"00688267138973", {"Green Tea"     }}, {"00033674100066", {"Forskohlii"     }},
                              {"00891475001421", {"Candy Fruit Chews"}}, {"00688267133442", {"Coffee"        }}, {"00021000778690", {"Cheesy Potatoes"}},
                              {"00071758100823", {"Pepper"           }}, {"00041520010667", {"Mouth Wash"    }}, {"00216079600007", {"Lamb Chops"     }},
                              {"00790555051526", {"Black Beans"      }}, {"00070177862640", {"Tea Sampler"   }}, {"00018000001958", {"Cinnamon Rolls" }}
                            }
      },

      // forth shopping cart
      { "Schroeder",        { {"00072591002251", {"Peanut Butter"}}, {"00219019100001", {"Ground Beef"           }}, {"00890692002020", {"Stretch Cream" }},
                              {"00637876981630", {"Mozzarella"   }}, {"00716237183507", {"Facial Towelettes"     }}, {"00886911000052", {"Pastry Popover"}},
                              {"00084783499008", {"Massage Oil"  }}, {"00016055456747", {"Children's Fruit Drink"}}, {"00021908743325", {"Granola Cereal"}},
                              {"00688267138973", {"Green Tea"    }}
                            }
      },

      // fifth shopping cart
      { "Lucy van Pelt",    { {"00070327012116", {"Pineapple"     }}, {"00073377801839", {"Sleep Mask Blue"}}, {"00030768009670", {"Calcium Softgels"}},
                              {"00852697001422", {"Baby Food"     }}, {"00079471102414", {"Manzanillo"     }}, {"00072736013753", {"Dressing"        }},
                              {"00216210900003", {"Cheddar Cheese"}}, {"00780872310185", {"Dog Food"       }}, {"00710069086036", {"Crackers"        }},
                              {"00092657016985", {"Tea",          }}, {"00086449903065", {"Deodorant"      }}, {"00885229000198", {"Drinks"          }}
                            }
      },

      // sixth shopping cart
      { "Charlie Brown",    { {"00611508524006", {"Lump Of Coal"}}
                            }
      }
    };

    return carts;
  }  // makeShoppingCarts
