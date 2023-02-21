///////////////////////// TO-DO (1) //////////////////////////////
  /// Include necessary header files
  /// Hint:  Include what you use, use what you include
  ///
  /// Do not put anything else in this section, i.e. comments, classes, functions, etc.  Only #include directives

  #include <filesystem>
  #include <fstream>
  #include <string>
  #include <iterator>

  #include "GroceryItemDatabase.hpp"
  #include "GroceryItem.hpp"

/////////////////////// END-TO-DO (1) ////////////////////////////



// Return a reference to the one and only instance of the database
GroceryItemDatabase & GroceryItemDatabase::instance()
{
  std::string filename;

  // Look for a prioritized list of database files in the current working directory to use
  // Don't forget to #include <filesystem> to get visibility to the exists() function
  if     ( filename = "Grocery_UPC_Database-Full.dat"  ;   std::filesystem::exists( filename ) ) /* intentionally empty*/ ;
  else if( filename = "Grocery_UPC_Database-Large.dat" ;   std::filesystem::exists( filename ) ) /* intentionally empty*/ ;
  else if( filename = "Grocery_UPC_Database-Medium.dat";   std::filesystem::exists( filename ) ) /* intentionally empty*/ ;
  else if( filename = "Grocery_UPC_Database-Small.dat" ;   std::filesystem::exists( filename ) ) /* intentionally empty*/ ;
  else if( filename = "Sample_GroceryItem_Database.dat";   std::filesystem::exists( filename ) ) /* intentionally empty*/ ;
  else     filename.clear();

  static GroceryItemDatabase theInstance( filename );
  return theInstance;
}




// Construction
GroceryItemDatabase::GroceryItemDatabase( const std::string & filename )
{
  std::ifstream fin( filename, std::ios::binary );

  // The file contains GroceryItems separated by whitespace.  A GroceryItem has 4 pieces of data delimited with a comma.  (This
  // exactly matches the previous assignment as to how GroceryItems are read)
  //
  //       Field            Type            Notes
  //  1.   UPC Code         String          Unique identifier (primary key), always enclosed in double quotes
  //  2.   Brand Name       String          May contain spaces, always enclosed in double quotes
  //  3.   Product Name     String          May contain spaces, always enclosed in double quotes
  //  4.   Price            Floating Point  In dollars
  //
  //  Example:
  //    "00024600017008",   "Morton",         "Morton Kosher Salt Coarse",                                    15.17
  //    "00033674100066",   "Nature's Way",   "Nature's Way Forskohlii - 60 Ct",                               6.11
  //    "00041520893307",   "Smart Living",   "Smart Living 10.5\" X 8\" 3 Subject Notebook College Ruled",   18.98
  //
  //  Note: double quotes within the string are escaped with the backslash character
  //

  ///////////////////////// TO-DO (2) //////////////////////////////
    /// Hint:  Use your GroceryItem's extraction operator to read GroceryItems, don't reinvent that here.
    ///        Read grocery items until end of file pushing each grocery item into the data store as they're read.

    while( fin >> temporaryItem )
    {
        newDatabase.push_back( temporaryItem );
    }
    std::cout << "Database size = " << newDatabase.size() << std::endl;

  /////////////////////// END-TO-DO (2) ////////////////////////////

  // Note:  The file is intentionally not explicitly closed.  The file is closed when fin goes out of scope - for whatever
  //        reason.  More precisely, the object named "fin" is destroyed when it goes out of scope and the file is closed in the
  //        destructor. See RAII
}









///////////////////////// TO-DO (3) //////////////////////////////
  /// Implement the rest of the interface, including functions find (recursively) and size
  ///
  /// See the SinglyLinkedList's extended interface in our Sequence Container Implementation Examples (SinglyLinkedList.hpp) for a
  /// recursive find function example. Instead of starting at the head of the list, you want to start at the beginning of your data
  /// store.
  ///
  /// Programming note:  An O(n) operation, like searching an unsorted vector, would not generally be implemented recursively.  The
  ///                    depth of recursion may be greater than the program's function call stack size.  But for this programming
  ///                    exercise, getting familiar with recursion is a goal.

  // Public
  GroceryItem * GroceryItemDatabase::find( const std::string & isbn )
  {
      return find( newDatabase.begin(), isbn );           // Kick off the recursion starting at the beginning of newDatabase
  }

  // Private
  GroceryItem * GroceryItemDatabase::find( std::vector<GroceryItem>::iterator current, const std::string & isbn )
  {
      // Base Case - reached the end of the vector without finding what we're looking for
      if( newDatabase.end() == current ) return nullptr;              // return nullptr if didn't find what you're looking for

      // Visit - found what we're looking for in the current node
      if( current->upcCode() == isbn ) return &(*current);            // dereference iterator, then get pointer to current

      // Recurse - keep looking on in a smaller vector
      return find( std::next(current), isbn );
  }

  std::size_t GroceryItemDatabase::size() const
  {
      return newDatabase.size();
  }

/////////////////////// END-TO-DO (3) ////////////////////////////
