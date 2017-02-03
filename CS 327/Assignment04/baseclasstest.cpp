#include <iostream>
 
using namespace std;
 
// Base class
class Shape 
{
public:
   // pure virtual function providing interface framework.
   virtual int getArea() = 0;
   void setWidth(int w)
   {
      width = w;
   }
   void setHeight(int h)
   {
      height = h;
   }
protected:
   int width;
   int height;
};
 
 class Size
 {
	 public:
		virtual int getSize() = 0;
		void setSize(int x)
	{
		size = x;
	}
	void setDiameter(int y)
	{
		diameter = y;
	}
	protected:
		int size;
		int diameter;
	
	
 };
 
 
// Derived classes
class Rectangle: public Shape, public Size
{
public:
   int getArea()
   { 
      return (width * height); 
   }
   int getSize()
   {
	   return (size + diameter);
   }
};
class Triangle: public Shape, public Size
{
public:
   int getArea()
   { 
      return (width * height)/2; 
   }
   int getSize()
   {
	   return (size + diameter)/2;
   }
};
 
int main(void)
{
   Rectangle Rect;
   Triangle  Tri;
 
   Rect.setWidth(5);
   Rect.setHeight(7);
   Rect.setSize(10);
   Rect.setDiameter(15);
   // Print the area of the object.
   cout << "Total Rectangle area: " << Rect.getArea() << endl;
   cout << "Total Rectangle size: " << Rect.getSize() << endl; 

   Tri.setWidth(5);
   Tri.setHeight(7);
   Tri.setDiameter(12);
   Tri.setSize(10);
   // Print the area of the object.
   cout << "Total Triangle area: " << Tri.getArea() << endl;
   cout << "Total Triangle size: " << Tri.getSize() << endl;

   return 0;
}