# Practice using ruby hashes:
# 1. Using the following hash in irb, pull out the values 3000000, and "Human". 
# 2. Create a hash representing some set of data, it could be your favorite things, grouped by category,
# or native trees in the US grouped by region, or think of any other set of data that can be represented by a Hash.

books = {
  :best_time_travel_books => [
    {
      :title => "The Time Machine", 
      :author => "H. G. Wells", 
      :category => "Fiction", 
      :rating   => (4 + 4.5 + 3 + 5 + 4.5) / 5,
      :sales    => {1895 => 3_000_000},
      :plot => {
        :year => 802701, 
        :species => ["Morlocks", "Eloi"]
      }
    },
    {
      :title => "A Connecticut Yankee in King Arthur's Court", 
      :author => "Mark Twain", 
      :category => "Fiction", 
      :rating => (4.5 + 4.5 + 2 + 5 + 4.5 + 4) / 6,
      :sales    => {1889 => 2_100_000},
      :plot => {
        :year => 528, 
        :species => ["Human"]
      }
    }
  ]
}
