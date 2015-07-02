A Tcl Package for 3D Axis Transform
===================================

Usage
-----

``` tcl
d3axis::rotate [list $x $y $z] X 45 Y 90 Z45
```

``` tcl
puts "d3axis::rotate {1 0 0} X 45 = [d3axis::rotate {1 0 0} X 45]"
puts "d3axis::rotate {0 1 0} X 45 = [d3axis::rotate {0 1 0} X 45]"
puts "d3axis::rotate {0 0 1} X 45 = [d3axis::rotate {0 0 1} X 45]"
```
