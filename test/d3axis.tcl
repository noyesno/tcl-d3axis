
lappend auto_path [file dir [file dir [info script]]]/src

package require matrix
package require d3axis






set NV {-0.494 -0.626 0.604}

puts "NV = $NV"

puts "d3axis::rotate $NV Y -45 Z 90"
puts [d3axis::rotate $NV Y -45 Z 90]
puts ""
puts "d3axis::rotate $NV Z 90 Y -45"
puts [d3axis::rotate $NV Z 90 Y -45]
puts ""

set NV {0 0.70710678 0.70710678}

puts "d3axis::rotate $NV Y -45 Z 90"
puts [d3axis::rotate $NV Y -45 Z 90]
puts ""

puts "d3axis::rotate $NV X 45"
puts [d3axis::rotate $NV X 45]
puts ""
puts "d3axis::rotate $NV X 90"
puts [d3axis::rotate $NV X 90]
puts ""


set NXYZ {0 -1 1}
puts "NXYZ = $NXYZ"
puts "d3axis::rotate \$NXYZ X -90"
puts [d3axis::rotate $NXYZ X 90]
puts ""

puts "d3axis::rotate {1 0 0} X 45 = [d3axis::rotate {1 0 0} X 45]"
puts "d3axis::rotate {0 1 0} X 45 = [d3axis::rotate {0 1 0} X 45]"
puts "d3axis::rotate {0 0 1} X 45 = [d3axis::rotate {0 0 1} X 45]"



proc z2x {VZ V} {
  lassign $VZ x y z 
  
  set xsin [expr {$y/sqrt($y*$y+$z*$z)}]
  set xcos [expr {$z/sqrt($y*$y+$z*$z)}]
  set ysin [expr {-$x/sqrt($x*$x+$y*$y+$z*$z)}]
  set ycos [expr {sqrt($y*$y+$z*$z)/sqrt($x*$x+$y*$y+$z*$z)}]
  # puts "xsin = $xsin, xcos = $xcos"
  # puts "ysin = $ysin, ycos = $ycos"
  set result [d3axis::rotate $V X [list $xsin $xcos] Y [list $ysin $ycos]]
  puts "$VZ / $V = $result"
}

proc z2x {VZ V {RZ ""}} {
  lassign $VZ x y z 
  
  set xsin [expr {-$y/sqrt($y*$y+$z*$z)}]
  set xcos [expr {$z/sqrt($y*$y+$z*$z)}]

  set ysin [expr {$x/sqrt($x*$x+$y*$y+$z*$z)}]
  set ycos [expr {sqrt($y*$y+$z*$z)/sqrt($x*$x+$y*$y+$z*$z)}]
  # puts "xsin = $xsin, xcos = $xcos"
  # puts "ysin = $ysin, ycos = $ycos"

  set result $V



  if {$RZ ne ""} {
    set result [d3axis::rotate $result Z $RZ]
  }

  set result [d3axis::rotate $result Y [list $ysin $ycos] X [list $xsin $xcos]]


  puts "($V) = ($result)"

  return $result
}

proc z2x {VZ V {RZ ""}} {
  lassign $VZ x y z 
  
  set xsin [expr {-$y/sqrt($y*$y+$z*$z)}]
  set xcos [expr {$z/sqrt($y*$y+$z*$z)}]

  set ysin [expr {$x/sqrt($x*$x+$y*$y+$z*$z)}]
  set ycos [expr {sqrt($y*$y+$z*$z)/sqrt($x*$x+$y*$y+$z*$z)}]
  # puts "xsin = $xsin, xcos = $xcos"
  # puts "ysin = $ysin, ycos = $ycos"

  set result $V



  if {$RZ ne ""} {
    set result [d3axis::rotate $result Z $RZ]
  }

  set result [d3axis::rotate $result Y [list $ysin $ycos] X [list $xsin $xcos]]


  puts "($V) = ($result)"

  return $result
}



set ZC {0.577350269 0.577350269 0.577350269}
puts "XC = [z2x $ZC {1 0 0}]"
puts "YC = [z2x $ZC {0 1 0}]"
puts "ZC = [z2x $ZC {0 0 1}]"
puts "S  = [z2x $ZC {106.157 -44.537 247.338}]"

set NV {0 -0.70710678 0.70710678}

puts "NXYZ = $NV"
puts "BXYZ = ?"

z2x $NV {1 0 0}
z2x $NV {0 1 0}
z2x $NV {0 0 1}

#------------------------------------------------------#

set NV {0.577350269 0.577350269 0.577350269}
puts "NXYZ = $NV"
puts "BXYZ = ?"

z2x $NV {1 0 0}
z2x $NV {0 1 0}
z2x $NV {0 0 1}

z2x $NV {0.7071068 -0.7071068 0} 

set V0 {217.632 154.647  56.122}
set V2 {106.157 -44.537 247.338}

set V1 [z2x $NV $V0]
puts "V0 = $V0"
puts "V1 = $V1"
puts "V2 = $V2"
lassign $V2 x2 y2 z2
lassign $V1 x1 y1 z1
lassign $V0 x0 y0 z0

foreach V [list $V0 $V1 $V2] {
  lassign $V x y z
  puts "$V # L = [expr {$x*$x + $y*$y + $z*$z}]"
}

#-- set rz        [expr {atan2($y2,$x2) - atan2($y1,$x1)}]
set rz        [expr {atan2($y1,$x1) - atan2($y2,$x2)}]
set rz_angle  [expr $rz/$d3axis::PI*180]

puts "rz = $rz [expr $rz/$d3axis::PI*180]"
puts "rz_angle  = $rz_angle"

z2x $NV {1 0 0} [expr {-$rz_angle}]
z2x $NV {0 1 0} [expr {-$rz_angle}]
z2x $NV {0 0 1} [expr {-$rz_angle}]
z2x $NV $V2     [expr {-$rz_angle}]
z2x $NV $V2     [expr {$rz_angle}]




