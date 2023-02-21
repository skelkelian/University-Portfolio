#include <cmath>                                                                          // abs()
#include <cstdlib>                                                                        // exit()
#include <exception>
#include <filesystem>                                                                     // exists()
#include <iomanip>                                                                        // setprecision()
#include <iostream>                                                                       // boolalpha(), showpoint(), fixed()
#include <sstream>
#include <string>                                                                         // to_string()

#include "CheckResults.hpp"
#include "GroceryItemDatabase.hpp"





namespace  // anonymous
{
  class GroceryItemDatabaseRegressionTest
  {
    public:
      GroceryItemDatabaseRegressionTest();

    private:
      void tests();

      Regression::CheckResults affirm;
  } run_groceryItemDatabase_tests;




  void GroceryItemDatabaseRegressionTest::tests()
  {
    GroceryItemDatabase & db           = GroceryItemDatabase::instance();
    std::size_t           expectedSize = 0;
    if     ( std::filesystem::exists( "Grocery_UPC_Database-Full.dat"   ) ) expectedSize = 10'837'828;
    else if( std::filesystem::exists( "Grocery_UPC_Database-Large.dat"  ) ) expectedSize = 104'366;
    else if( std::filesystem::exists( "Grocery_UPC_Database-Medium.dat" ) ) expectedSize = 10'003;
    else if( std::filesystem::exists( "Grocery_UPC_Database-Small.dat"  ) ) expectedSize = 230;
    else if( std::filesystem::exists( "Sample_GroceryItem_Database.dat" ) ) expectedSize = 15;

    affirm.is_equal( "Database construction - Expected size", expectedSize, db.size() );

    if( auto p = db.find( "00014100072331" ); p == nullptr )
    {
      affirm.is_not_equal( "Database query - existing grocery item should have been found, but it wasn't", nullptr, p );
    }
    else
    {
      GroceryItem control( "Pepperidge Farm \n          Classic Cookie Favorites",
                           "Pepperidge Farm",
                           "00014100072331",
                           14.43 );

      affirm.is_equal( "Database query - existing grocery item located", control, *p );

      // Modify the contents and verify the DB sees those changes
      p->brandName( "Modified \"Brand Name\"" );
      auto q = db.find( p->upcCode() );

      affirm.is_equal( "Database query - return pointer to grocery item in database", *p, *q );

      // Now, put it back how you found it
      *p = control;
    }

    {
      auto groceryItem = db.find( "--------------" );
      affirm.is_equal( "Database query - non-existing grocery item found when it shouldn't have been", nullptr, groceryItem );
    }
  }



  GroceryItemDatabaseRegressionTest::GroceryItemDatabaseRegressionTest()
  {
    std::clog << std::boolalpha << std::showpoint << std::fixed << std::setprecision( 2 );


    try
    {
      std::clog << "\nGroceryItem Database Regression Test:\n";
      tests();

      std::clog << affirm << '\n';
    }
    catch( const std::exception & ex )
    {
      std::clog << "FAILURE:  Regression test for \"class GroceryItem\" failed with an unhandled exception. \n\n\n"
                << ex.what() << std::endl;
    }
  }
} // namespace
