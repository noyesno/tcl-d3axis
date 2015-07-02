
package provide d3axis 0.1

namespace eval d3axis {
  set PI [expr {atan(1) * 4}]

  set RX {
    { 1  0              0               }
    { 0  [expr cos($r)] [expr -sin($r)] }
    { 0  [expr sin($r)] [expr +cos($r)] }
  }
  
  set RY {
    { [expr  cos($r)] 0  [expr +sin($r)] }
    { 0               1  0 }
    { [expr -sin($r)] 0  [expr +cos($r)] }
  }
  
  set RZ {
    { [expr  cos($r)] [expr -sin($r)] 0 }
    { [expr  sin($r)] [expr +cos($r)] 0 }
    { 0               0               1 }
  }

  proc rotate {vector args} {
    variable PI
    variable RX
    variable RY
    variable RZ

    set result $vector

    foreach {axis angle} $args {
      switch $axis {
        x -
        X {
          set r      [expr {$PI*$angle/180}]
          set MRX    [subst $RX]
          set result [matrix::mul $MRX $result]
	}
	y -
	Y {
          set r   [expr {$PI*$angle/180}]
          set MRY [subst $RY]
          set result [matrix::mul $MRY $result]
	}
	z -
	Z {
          set r   [expr {$PI*$angle/180}]
          set MRZ [subst $RZ]
          set result [matrix::mul $MRZ $result]
	}
      }
    }

    return $result 
  }

}
