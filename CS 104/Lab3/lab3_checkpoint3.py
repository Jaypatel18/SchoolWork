# what is the area of circle
def circle_area(radius):
   result = 3.14 * radius * radius
   return result
x = input ("Enter the number for radius")
y = input ("Enter the number for height")
volume_cylinder = y * circle_area(x)
print "the volume for cylinder is" , volume_cylinder
