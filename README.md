# Poisson Disc Sampling
Poisson Disc Sampling GDScript for Godot. Generates evenly and randomly distributed points for a given region (rectangular, polygonal or circular) separated by a minimum distance. Points are sorted in the order of their discovery, so it can be used to create interesting animations.

Available on Godot Asset Library: https://godotengine.org/asset-library/asset/559

<img src="https://raw.githubusercontent.com/udit/assets/master/poisson-disc-sampling/polygon.gif" width=45%> <img src="https://raw.githubusercontent.com/udit/assets/master/poisson-disc-sampling/rectangle.gif" width=45%> <img src="https://raw.githubusercontent.com/udit/assets/master/poisson-disc-sampling/circle.gif" width=45%>

## How to use
* Create an instance of class `PoissonDiscSampling`
* Call `generate_points(radius: float, sample_region_shape, retries: int, start_pos: Vector2)`:
  * `radius` - minimum distance between points
  * `sample_region` - any of the following types:
    * `Rect2D` for rectangular region
    * `Array` of `Vector2` for a polygonal region
    * `Vector3` for a circular region with x, y as the position and z as the radius of the circle 
  * `retries` - number of retries to search for a valid sample point around a point. 30 is sufficient, but you can reduce it to increase performance. A very low number will give unevenly spaced distribution.
  * `start_pos` - starting position is optional. A random point inside region is selected if not specified.
  
```
var poisson_disc_sampling = PoissonDiscSampling.new()
var points = poisson_disc_sampling.generate_points(20, $Polygon2D.polygon, 30)
```


##### Further Reading 
* Core algorithm is based on Sebastian Lague's implementation : [[Unity] Procedural Object Placement (E01: poisson disc sampling)](https://youtu.be/7WcmyxyFO7o)
* [The Coding Train - Coding Challenge #33: Poisson-disc Sampling](https://youtu.be/flQgnCUxHlw)
* [Fast Poisson Disk Sampling in Arbitrary Dimensions - Robert Bridson](https://www.cct.lsu.edu/~fharhad/ganbatte/siggraph2007/CD2/content/sketches/0250.pdf)
