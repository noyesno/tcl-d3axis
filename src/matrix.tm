
package provide matrix 0.1

namespace eval matrix {}

proc matrix::mul {MA MB} {
  set nr [llength $MA]  
  set nc [llength [lindex $MB 0]]  

  set result [list]

  for {set r 0} {$r<$nr} {incr r} {
    set result_row [list]

    set row [lindex $MA $r]

    for {set c 0} {$c<$nc} {incr c} {
      set col [list]
      for {set i 0} {$i<$nr} {incr i} {
        lappend col [lindex $MB $i $c]
      }

      set sum 0.0
      foreach v1 $row v2 $col {
        set sum [expr {$sum + $v1*$v2}]
      }

      lappend result_row $sum
    }

    lappend result $result_row
  }

  return $result
}

