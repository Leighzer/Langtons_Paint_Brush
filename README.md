# Langtons_Paint_Brush
A program that uses langtons ant to sketch random drawings.

At first what is drawn are the cells with their corresponding bit values. I randomize them all so you always get a new drawing. Once the ant visits the cell, it draws over the bit value with a color instead. These bit values are still toggled on and off properly according to the rules of langton's ant, the bits just aren't on display anymore, instead it is the random color.

The ant first starts with the color black, then as time goes on the colors randomly shift by a small delta randomly each iteration. As the ant moves he paints over the cells with this randomly shifting color. That is the basic behavior of the sketch so sit back and enjoy the ants art as he goes on flipping bits!


Controls:

a - this button increases the amount of iterations are run before the next draw by 10

b - this button decrease the amount of iterations are run before the next draw by 10

z - this button increases the amount of iterations are run before the next draw by 10000

x - this button sets the amount of iterations to run before next draw back to 1

p - this button saves a screenshot

r - this button resets the sketch with an all new random slate


