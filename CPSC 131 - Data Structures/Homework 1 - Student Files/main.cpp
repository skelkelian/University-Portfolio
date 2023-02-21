#include<iostream>
#include<string>
#include<vector>
#include "GroceryItem.hpp"

int main()
{
    // Print program prompt
    std::cout << "Welcome to Kroger.  Place grocery items into your shopping cart by entering each item's information.\n"
                 "   enclose string entries in quotes, separate fields with comas\n"
                 "   for example:  \"00016000306707\", \"Betty Crocker\", \"Betty Crocker Double Chocolate Chunk Cookie Mix\", 17.19\n"
                 "   Enter CTL-Z (Windows) or CTL-D (Linux) to quit\n\n";

    std::vector<GroceryItem*> groceries;
    GroceryItem grocery;
    std::cout << "Enter UPC, Product Brand, Product Name, and Price\n";

    while(std::cin >> grocery)
    {
        std::cout << "Item added to cart: " << grocery;
        groceries.push_back(new GroceryItem(std::move(grocery)));
        std::cout << "\n\nEnter UPC, Product Brand, Product Name, and Price\n";
    }

    std::cout << "\n\nHere is an itemized list of the items in your shopping cart:\n";

    std::vector<GroceryItem*>::reverse_iterator it = groceries.rbegin();
    while (it != groceries.rend())
    {
        GroceryItem * grocery_temp = (*it);
        std::cout << *grocery_temp << std::endl;
        it++;
    }

    groceries.clear();

    return 0;
}
