import 'dart:math';

class Rect{
	Rect(this.startX, this.endX, this.startY, this.endY);
	int startX;
	int startY;
	int endX;
	int endY;

	/// resolve the intersection between this and [operand]
	/// if no intersection, return null
	Rect? intersect(Rect operand){
		if (operand.endX < startX || operand.startX > endX ||
			operand.endY < startY || operand.startY > endY ){
			return null;
		}

		
		int rStartX = max(startX, operand.startX);
		int rStartY = max(startY, operand.startY);
		int rEndX = min(endX, operand.endX);
		int rEndY = min(endY, operand.endY);

		final ret = Rect(rStartX, rEndX, rStartY, rEndY);

		return ret;
	}

	@override
  	String toString(){
    	return "Rect(left: $startX, top: $startY, right: $endX, bottom: $endY)";
  	}
}