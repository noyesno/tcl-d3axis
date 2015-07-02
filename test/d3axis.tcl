
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



