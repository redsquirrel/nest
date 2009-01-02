require 'solver'

# http://en.wikipedia.org/wiki/Sudoku
wiki = [
"53  7    
6  195   
 98    6 
8   6   3
4  8 3  1
7   2   6
 6    28 
   419  5
    8  79",
    
"534678912
672195348
198342567
859761423
426853791
713924856
961537284
287419635
345286179"
]

# http://www.websudoku.com/?level=2&set_id=3350218628
medium = [
" 4   7 3 
  85  1  
 15 3  9 
5   7 21 
  6   8  
 81 6   9
 2  4 57 
  7  29  
 5 7   8 ",
 
"942187635
368594127
715236498
593478216
476921853
281365749
829643571
137852964
654719382"
]

# http://www.websudoku.com/?level=4&set_id=470872047
evil = [
"  53 694 
 3 1    6
       3 
7  9     
 1  3  2 
     2  7
 6       
8    7 5 
 436 81  ",
 
"285376941
439125786
176849235
752981364
618734529
394562817
567213498
821497653
943658172"
]

[wiki, medium, evil].each do |start, solved|

  answer = solve(start)

  if answer == solved
    puts "PASS"
  else
    puts "FAIL\nExpected\n#{solved}\nBut got\n#{answer}"
  end
end