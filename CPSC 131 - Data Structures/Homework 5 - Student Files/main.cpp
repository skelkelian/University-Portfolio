#include <cstddef>                                                                            // size_t
#include <fstream>                                                                            // ifstream
#include <iostream>                                                                           // cout

#include "CheckResults.hpp"
#include "WordFrequency.hpp"






int main()
{
  Regression::CheckResults affirm( std::cout );
  affirm.policy = Regression::CheckResults::ReportingPolicy::ALL;


  // Test set 1 - Frankenstein
  {
    std::cout << "Test results for:\n\"Frankenstein or The Modern Prometheus by Mary Shelley.txt\"\n\n";

    std::ifstream fin( "Frankenstein or The Modern Prometheus by Mary Shelley.txt" );
    affirm.is_true( "Find and open \"Frankenstein or The Modern Prometheus by Mary Shelley.txt\"", fin.is_open() );

    WordFrequency Frankenstein( fin );
    affirm.is_equal( "numberOfWords: Frankenstein   ",    7195U, Frankenstein.numberOfWords()                   );
    affirm.is_equal( "wordCount: Frankenstein       ",      24U, Frankenstein.wordCount( "Frankenstein"       ) );
    affirm.is_equal( "wordCount: life               ",     114U, Frankenstein.wordCount( "life"               ) );
    affirm.is_equal( "wordCount: feared             ",      13U, Frankenstein.wordCount( "feared"             ) );
    affirm.is_equal( "wordCount: the                ",    4187U, Frankenstein.wordCount( "the"                ) );
    affirm.is_equal( "wordCount: nonexistent        ",       0U, Frankenstein.wordCount( "non-existent-!word" ) );
    affirm.is_equal( "mostFrequentWord: Frankenstein",    "the", Frankenstein.mostFrequentWord()                );

    std::size_t size = Frankenstein.maxBucketSize();
    affirm.is_equal( "maxBucketSize: Frankenstein   ", (size - 5 <= 2 ? size : 6U ), size);   // expecting 5, 6, or 7 to allow a little wiggle room for different library implementations
                                                                                              // Programming note: intentionally using unsigned subtraction allowing negative number to wrap
                                                                                              // around to become very large positive numbers
  }

  std::cout << "\n\n";






  // Test set 2 - Sleepy Hollow
  {
    std::cout << "Test results for:\n\"The Legend of Sleepy Hollow by Washington Irving.txt\"\n\n";

    WordFrequency sleepyHollow;
    affirm.is_equal( "numberOfWords: Sleepy Hollow   ",   3231U, sleepyHollow.numberOfWords()                   );
    affirm.is_equal( "wordCount: Ichabod             ",     45U, sleepyHollow.wordCount( "Ichabod"            ) );
    affirm.is_equal( "wordCount: the                 ",    917U, sleepyHollow.wordCount( "the"                ) );
    affirm.is_equal( "wordCount: nonexistent         ",      0U, sleepyHollow.wordCount( "non-existent-!word" ) );
    affirm.is_equal( "mostFrequentWord: Sleepy Hollow",   "the", sleepyHollow.mostFrequentWord()                );

    std::size_t size = sleepyHollow.maxBucketSize();
    affirm.is_equal( "maxBucketSize: Sleepy Hollow   ", ( size - 4 <= 2 ? size : 5U ), size );// expecting 4, 5, or 6 to allow a little wiggle room for different library implementations
                                                                                              // Programming note: intentionally using unsigned subtraction allowing negative number to wrap
                                                                                              // around to become very large positive numbers
  }

  std::cout << "\n\n";






  // Test set 3 - Hunger Games
  {
    std::cout << "Test results for:\n\"The Hunger Games by Suzanne Collins.txt\"\n\n";

    std::ifstream fin( "The Hunger Games by Suzanne Collins.txt" );
    affirm.is_true( "Find and open \"The Hunger Games by Suzanne Collins.txt\"", ! fin.is_open() );

    WordFrequency hungerGames;
    affirm.is_equal( "numberOfWords: Hunger Games    ",   0U, hungerGames.numberOfWords()                   );
    affirm.is_equal( "wordCount: the                 ",   0U, hungerGames.wordCount( "the"                ) );
    affirm.is_equal( "wordCount: nonexistent         ",   0U, hungerGames.wordCount( "non-existent-!word" ) );
    affirm.is_equal( "mostFrequentWord: Hunger Games ",   "", hungerGames.mostFrequentWord()                );

    std::size_t size = hungerGames.maxBucketSize();
    affirm.is_equal( "maxBucketSize: Hunger Games    ", 0U, size );
  }






  std::cout << "\n\n\n" << affirm << '\n';
  return 0;
}
