///////////////////////// TO-DO (1) //////////////////////////////
  /// Include necessary header files
  /// Hint:  Include what you use, use what you include
  ///
  /// Do not put anything else in this section, i.e. comments, classes, functions, etc.  Only #include directives
  #include <string>                             // string
  #include <cstddef>                            // size_t
  #include <cctype>                             // tolower
  #include <locale>                             // locale
  #include <iostream>                           // cin / istream
  #include <utility>                            // std::pair
  #include <map>
  #include "WordFrequency.hpp"
/////////////////////// END-TO-DO (1) ////////////////////////////







// unnamed, anonymous namespace providing non-member private working area
namespace
{
  std::string sanitize( const std::string & word )
  {
    constexpr char bad_char[] = " \t\n\b\v_-\"'(){}+/*,=.!?:;";            // leading and trailing characters to be removed
    static std::locale locality;

    auto startIndex = word.find_first_not_of( bad_char );                  // start with the first non-bad character
    if( startIndex == std::string::npos ) startIndex = word.size();        // if the word contains only bad characters ...

    std::size_t count    = 0;                                              // assume the word contains only bad characters ...
    auto        endIndex = word.find_last_not_of( bad_char );              // end with the first non-bad character

    if( endIndex != std::string::npos ) count = endIndex - startIndex + 1; // number of characters to use in results

    auto result = word.substr( startIndex, count );                        // strip the leading and trailing bad characters
    for( auto & c : result ) c = std::tolower( c, locality );              // convert to lower case

    return result;
  }
}  // unnamed, anonymous namespace







// Implement WordFrequency::WordFrequency( std::istream ) - See requirements
///////////////////////// TO-DO (2) //////////////////////////////
WordFrequency::WordFrequency( std::istream & iStream )         // do i need to put void in front of this line? or should i put std::size_t infront of it? would i need to return something in this function, and if so what do i return?
{
  std::string word;
  while ( iStream >> word )
  {
    words[ sanitize( word ) ] += 1;
  }
}
/////////////////////// END-TO-DO (2) ////////////////////////////







// Implement WordFrequency::numberOfWords() const - See requirements
///////////////////////// TO-DO (3) //////////////////////////////
std::size_t WordFrequency::numberOfWords() const            // do i need to put std::size_t in front of this line?
{
  return words.size();
}
// takes no arguments and returns number of unique words
/////////////////////// END-TO-DO (3) ////////////////////////////







// Implement WordFrequency::wordCount( const std::string & ) const - See requirements
///////////////////////// TO-DO (4) //////////////////////////////
std::size_t WordFrequency::wordCount( const std::string & word ) const        // do i need to put std::size_t in front of this line?
{
  auto foundWord = words.find( sanitize( word ) );
  // if in hashtable
  if ( foundWord != words.end() )                 // using .find doesn't insert key if not found
  {
    // return how many times occurred
    return foundWord->second;
  }
  // if not in hashtable
  else
  {
    return 0;
  }
}
// he gives u word, and u tell him how many times it occurred
// if he gives word, that is not in hash table, make sure you don't add
// u have key, look up value associated with the key

// this function takes a constant reference to a standard string as a parameter and returns the frequency of
// occurrence of that sanitized word, or zero if the word is not found in the hashtable.
/////////////////////// END-TO-DO (4) ////////////////////////////







// Implement WordFrequency::mostFrequentWord() const - See requirements
///////////////////////// TO-DO (5) //////////////////////////////
std::string WordFrequency::mostFrequentWord() const        // what to do if there are two words that occur same num of times? also do i put std::string infront of this line?
{
  // initialize largestValue variable to 0 and mostFrequentKey to empty string
  int largestValue = 0;
  std::string mostFrequentKey = "";

  // loop from beginning to end of hashtable
  for ( const auto & [ key, value ] : words ) {
    // compare current value to previous largest value
    if ( value > largestValue )
    {
      // store largest key and value
      largestValue = value;
      mostFrequentKey = key;
    }
  }
  // return mostFrequentKey
  return mostFrequentKey;
}
// return most frequent word or empty string if hashtable empty
// loop from beginning to end
// check value compare values

// this function takes no arguments and returns the most frequent word or the empty string if the hashtable is empty.
/////////////////////// END-TO-DO (5) ////////////////////////////







// Implement WordFrequency::maxBucketSize() const - See requirements
///////////////////////// TO-DO (6) //////////////////////////////
  /// Hint: see the unordered_map's bucket interface at https://en.cppreference.com/w/cpp/container/unordered_map
std::size_t WordFrequency::maxBucketSize() const        // do i need to put std::size_t in front of this line?
{
  // initialize largest bucket size
  size_t largestBucketSize = 0;
  // loop from beginning to end of hashtable
  // for ( auto it = words.begin(); it != words.end(); ++it )
  for ( const auto & [ key, value ] : words )
  {
    // compare current bucket size to previous largest bucket size
    if ( words.bucket_size( words.bucket( key ) ) > largestBucketSize )
    {
      // store largest bucket size
      largestBucketSize = words.bucket_size( words.bucket( key ) );
    }
  }
  // return largest bucket size
  return largestBucketSize;
}
// loop from beginning to end to find largest bucket in hashtable

// this function taks no arguments and returns the size of the largest bucket in the hashtable.
/////////////////////// END-TO-DO (6) ////////////////////////////
