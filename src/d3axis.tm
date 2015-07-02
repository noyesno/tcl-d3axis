
package provide d3axis 0.1

namespace eval d3axis {
  set PI [expr {atan(1) * 4}]

  set RZ {
    { [expr { $cos}] [expr {-$sin}] 0 }
    { [expr { $sin}] [expr {+$cos}] 0 }
    { 0            0            1 }
  }

  set RX {
    { 1  0              0               }
    { 0  [expr {$cos}] [expr {-$sin}] }
    { 0  [expr {$sin}] [expr {+$cos}] }
  }
  
  set RY {
    { [expr { $cos}] 0  [expr {+$sin}] }
    { 0               1  0 }
    { [expr {-$sin}] 0  [expr {+$cos}] }
  }
  

  

  proc MR {M angle} {
    variable PI

    if {[llength $angle]==1} {
      set r  [expr {$PI*$angle/180}]
      set sin [expr {sin($r)}]
      set cos [expr {cos($r)}]
    } else {
      lassign $angle sin cos
    }

    return [subst $M]
  }

  proc rotate {vector args} {
    variable RX
    variable RY
    variable RZ

    set result $vector

    foreach {axis angle} $args {
      switch $axis {
        x -
        X {
          set MRX    [MR $RX $angle]
          set result [matrix::mul $MRX $result]
	}
	y -
	Y {
          set MRY    [MR $RY $angle]
          set result [matrix::mul $MRY $result]
	}
	z -
	Z {
          set MRZ    [MR $RZ $angle]
          set result [matrix::mul $MRZ $result]
	}
      }
    }

    return $result 
  }

}

return

 
 # rotate x angle r

 sin(r) = $y/sqrt($y*$y + $z*$z)
 cos(r) = $z/sqrt($y*$y + $z*$z)


