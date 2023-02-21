#include <algorithm>                                                                      // max()
#include <cmath>                                                                          // abs()
#include <cstddef>                                                                        // size_t
#include <iomanip>                                                                        // setprecision(), setw()
#include <iostream>                                                                       // cerr, ,clog, fixed(), showpoint(), left(), right()
#include <map>
#include <queue>
#include <stack>
#include <stdexcept>                                                                      // invalid_argument, out_of_range
#include <string>                                                                         // stod()

#include "GroceryItem.hpp"
#include "GroceryItemDatabase.hpp"



namespace
{
  // Output some observed behavior.
  // Call this function from within the carefully_move_grocery_items functions, just before kicking off the recursion and then just after each move.

  // trace()
  void trace( std::stack<GroceryItem> const & sourceCart, std::stack<GroceryItem> const & destinationCart, std::stack<GroceryItem> const & spareCart, std::ostream & s = std::clog )
  {
    // Count and label the number of moves
    static std::size_t move_number = 0;

    // First time called will bind parameters to copies
    struct LabeledCart
    {
      std::string             label;
      std::stack<GroceryItem> cart;
    };
    static std::map<std::stack<GroceryItem> const *, LabeledCart> groceryCarts = { { &sourceCart,      { "Broken Cart",  {} } },
                                                                                   { &destinationCart, { "Working Cart", {} } },
                                                                                   { &spareCart,       { "Spare Cart",   {} } }
                                                                                 };

    // Interrogating the stacks is a destructive process, so local copies of the parameters are made to work with.  The
    // carefully_move_grocery_items algorithm will swap the order of the arguments passed to this functions, but they will always be
    // the same objects - just in different orders. When outputting the stack contents, keep the original order so we humans can
    // trace the movements easier.  A container (std::map) indexed by the object's identity (address) is created so the canonical
    // order remains the same from one invocation to the next.
    groceryCarts[&sourceCart]     .cart = sourceCart;
    groceryCarts[&destinationCart].cart = destinationCart;
    groceryCarts[&spareCart]      .cart = spareCart;


    // Determine the height of the tallest stack
    std::size_t tallestStackSize = std::max( { groceryCarts[&sourceCart]     .cart.size(),
                                               groceryCarts[&destinationCart].cart.size(),
                                               groceryCarts[&spareCart]      .cart.size() } );


    // Print the header and underline it
    s << "After " << std::setw( 3 ) << move_number++ << " moves:     "  << std::left;                       // print the move number
    for( auto && [key, currentCart] : groceryCarts ) s << std::setw( 25 ) << currentCart.label;             // print the column labels
    s << std::right << "\n                     " << std::string( 25 * groceryCarts.size(), '-' ) << '\n';   // underline the labels



    // Print the stack's contents
    for( ; tallestStackSize > 0;  --tallestStackSize )                                                      // for each grocery item in a cart
    {
      s << std::string( 21, ' ' );                                                                          // output a left margin to keep things lined up

      for( auto && [key, currentCart] : groceryCarts )                                                      // for each grocery item cart
      {
        if( currentCart.cart.size() == tallestStackSize )                                                   // if the current cart is this tall, print the top grocery item
        {
          auto name = currentCart.cart.top().productName();
          if( name.size() > 23 ) name[21] = name[22] = name[23] = '.';                                      // replace last few characters of long names with "..."
          s << std::left << std::setw( 25 ) << name.substr( 0, 23 ) << std::right;
          currentCart.cart.pop();
        }
        else s << std::string( 25, ' ' );                                                                   // otherwise, nothing to print in this cart so print whitespace instead
      }
      s << '\n';
    }
    s << std::string( 21, ' ' ) << std::string( 25 * groceryCarts.size(), '=' ) << "\n\n\n\n\n\n\n";        // display a distinct marker between moves
  }  // trace()







  // carefully_move_grocery_items() - recursive
  /*********************************************************************************************************************************
  ** A recursive algorithm to carefully move grocery items from a broken cart to a working cart is given as follows:
  ** START
  ** Procedure carefully_move_grocery_items (number_of_items_to_be_moved, broken_cart, working_cart, spare_cart)
  **
  **    IF number_of_items_to_be_moved == 1, THEN
  **       move top item from broken_cart to working_cart
  **       trace the move
  **
  **    ELSE
  **       carefully_move_grocery_items (number_of_items_to_be_moved-1, broken_cart, spare_cart, working_cart)
  **       move top item from broken_cart to working_cart
  **       trace the move
  **       carefully_move_grocery_items (number_of_items_to_be_moved-1, spare_cart, working_cart, broken_cart)
  **
  **    END IF
  **
  ** END Procedure
  ** STOP
  **
  ** As a side note, the efficiency class of this algorithm is exponential.  That is, the Big-O is O(2^n).
  *********************************************************************************************************************************/
  void carefully_move_grocery_items( std::size_t quantity, std::stack<GroceryItem> & broken_cart, std::stack<GroceryItem> & working_cart, std::stack<GroceryItem> & spare_cart )
  {
    ///////////////////////// TO-DO (1) //////////////////////////////
      /// Implement the algorithm above.

      // base
      if ( quantity == 1 )
      {
        // move top item from broken_cart to working_cart (don't forget to pop from broken_cart)
        working_cart.push( broken_cart.top() );
        broken_cart.pop();

        // trace
        trace( broken_cart, working_cart, spare_cart );
      }
      else
      {
        carefully_move_grocery_items( quantity - 1, broken_cart, spare_cart, working_cart );

        // visit
        // move top item from broken_cart to working_cart (don't forget to pop from broken_cart)
        working_cart.push( broken_cart.top() );
        broken_cart.pop();

        //trace
        trace( broken_cart, working_cart, spare_cart );

        // recurse
        carefully_move_grocery_items( quantity - 1, spare_cart, working_cart, broken_cart );
      }

    /////////////////////// END-TO-DO (1) ////////////////////////////
  }



  // carefully_move_grocery_items() - starter
  void carefully_move_grocery_items( std::stack<GroceryItem> & from, std::stack<GroceryItem> & to )
  {
    ///////////////////////// TO-DO (2) //////////////////////////////
      /// Implement the starter function for the above algorithm.  If the "from" cart contains grocery items, move those grocery
      /// items to the "to" cart while ensuring the breakable grocery items are always on top of the nonbreakable grocery items,
      /// just like they already are in the "from" cart.  That is, call the above carefully_move_grocery_items function to start
      /// moving grocery items recursively.  Call the above trace function just before calling carefully_move_grocery_items to get a
      /// starting point reference in the movement report.

        // check if original cart (from cart) has items in it, and if they do then move it to the 'to' cart
        if ( !from.empty() )
        {
          // new cart
          std::stack<GroceryItem> temporary_cart;

          // trace function
          trace( from, to, temporary_cart );

          // move grocery items recursively
          carefully_move_grocery_items( from.size(), from, to, temporary_cart );
        }
    /////////////////////// END-TO-DO (2) ////////////////////////////
  }
}    // namespace




// main()
int main( int argc, char * argv[] )
{
  // Snag an empty cart as I enter the grocery store
  ///////////////////////// TO-DO (3) //////////////////////////////
    /// Create an empty grocery item cart as a stack of grocery items and call it myCart.
    std::stack<GroceryItem> myCart;
  /////////////////////// END-TO-DO (3) ////////////////////////////




  // Shop for a while placing grocery items into my grocery item cart
  ///////////////////////// TO-DO (4) //////////////////////////////
    /// Put the following grocery items into your cart with the heaviest grocery item on the bottom and the lightest grocery item on
    /// the top according to the ordering given in the table below
    ///
    ///      UPC Code         Name             Brand
    ///      --------------   -------------    ---------------
    ///      00688267039317   eggs             any                     <=== lightest item, put this on the top so heavy items wont break them
    ///      00835841005255   bread            any
    ///      09073649000493   apple pie        any
    ///      00025317533003   hotdogs          Applegate Farms
    ///      00038000291210   rice krispies    Kellogg's
    ///      00075457129000   milk             any                     <===  heaviest item, put this on the bottom
    myCart.push(GroceryItem("milk", "", "00075457129000"));
    myCart.push(GroceryItem("rice krispies", "Kellogg's", "00038000291210"));
    myCart.push(GroceryItem("hotdogs", "Applegate Farms", "00025317533003"));
    myCart.push(GroceryItem("apple pie", "", "09073649000493"));
    myCart.push(GroceryItem("bread", "", "00835841005255"));
    myCart.push(GroceryItem("eggs", "", "00688267039317"));
  /////////////////////// END-TO-DO (4) ////////////////////////////




  // A wheel on my cart has just broken and I need to move grocery items to a new cart that works
  ///////////////////////// TO-DO (5) //////////////////////////////
    /// Create an empty grocery item cart as a stack of grocery items and call it workingCart.  Then carefully move the grocery
    /// items in your now broken cart to this working cart by calling the above carefully_move_grocery_items function with two
    /// arguments.
    std::stack<GroceryItem> workingCart;
    carefully_move_grocery_items( myCart, workingCart );
  /////////////////////// END-TO-DO (5) ////////////////////////////




  // Time to checkout and pay for all this stuff.  Find a checkout line and start placing grocery items on the counter's conveyor belt
  ///////////////////////// TO-DO (6) //////////////////////////////
    /// Create an empty checkout counter as a queue of grocery items and call it checkoutCounter.  Then remove the grocery items
    /// from your working cart and place them on the checkout counter, i.e., put them in this checkoutCounter queue.
    std::queue<GroceryItem> checkoutCounter;
    while ( !workingCart.empty() )
    {
      checkoutCounter.push(workingCart.top());
      workingCart.pop();
    }
  /////////////////////// END-TO-DO (6) ////////////////////////////




  // Now add it all up and print a receipt
  double amountDue = 0.0;
  GroceryItemDatabase & worldWideDatabase = GroceryItemDatabase::instance();              // Get a reference to the world wide database of grocery items. The database
                                                                                          // contains the full description and price of the grocery item.

  ///////////////////////// TO-DO (7) //////////////////////////////
    /// For each grocery item in the checkout counter queue, find the grocery item by UPC in the world wide grocery item database.
    /// If the grocery item on the counter is found in the database then accumulate the amount due and print the grocery item's full
    /// description and price on the receipt (i.e. write the grocery item's full description and price to standard output).
    /// Otherwise, print a message on the receipt that a description and price for the grocery item wasn't found and there will be
    /// no charge.

    while ( !checkoutCounter.empty() )
    {
      if ( worldWideDatabase.find( checkoutCounter.front().upcCode() ) != nullptr ) // fix to check if in database
      {
        amountDue += worldWideDatabase.find( checkoutCounter.front().upcCode() )->price();
        std::cout << "Found price of " << checkoutCounter.front() << ", and it has been added to the receipt.\n";
      }
      else
      {
        std::cout << "Price of list: " << amountDue << ". Did not find price for " << checkoutCounter.front() << ", thus there will be no charge and the item will be removed.\n";
      }
      checkoutCounter.pop();
    }
    
    // while checkoutCounter not empty
      // find grocery item by upc in world wide database
      // if found
        // add price of item to amountDue
        // std::cout << "Product Name: " << GroceryItem::productName << Brand Name: " << GroceryItem::brandName << UPC Code: " << GroceryItem::upcCode << Price: " << GroceryItem::price
      // else
        // std::cout<< did not find price of item and there will be no charge

    // one by one, we want to pick item and scan upc code, write to receipt, and accumulate total
  /////////////////////// END-TO-DO (7) ////////////////////////////



  // Now check the receipt - are you getting charged the correct amount?
  // You can either pass the expected total when you run the program by supplying a parameter, like this:
  //    program 35.89
  // or if no expected results is provided at the command line, then prompt for and obtain expected result from standard input
  double expectedAmountDue = 0.0;
  if( argc >= 2 )
  {
    try
    {
      expectedAmountDue = std::stod( argv[1] );
    }
    catch( std::invalid_argument & ) {}                                                   // ignore anticipated bad command line argument
    catch( std::range_error &      ) {}                                                   // ignore anticipated bad command line argument
  }
  else
  {
    std::cout << "What is your expected amount due?  ";
    std::cin  >> expectedAmountDue;
  }


  std::cout << std::fixed << std::setprecision( 2 ) << std::showpoint
            << std::string( 25, '-' )  << '\n'
            << "Total  $" << amountDue << "\n\n\n";


  if( std::abs(amountDue - expectedAmountDue) < 1E-4 ) std::clog << "PASS - Amount due matches expected\n";
  else                                                 std::clog << "FAIL - You're not paying the amount you should be paying\n";

  return 0;
}
