from PIL import Image
import matplotlib.pyplot as plt
import numpy as np

points =[]
fig = plt.figure()


def onClick(event):
    if event.xdata != None and event.ydata != None:
        points.append([event.xdata, event.ydata])
        event.inaxes.scatter(event.xdata,event.ydata)
    fig.canvas.draw()

def calculateDisparity():
    array1 = np.array(points[::2])
    array2 = np.array(points[1::2])
    xdisp1 = array1[:, 0]
    xdisp2 = array2[:, 0]
    ydisp1 = array1[:, 1]
    ydisp2 = array2[:, 1]
    xdisp = xdisp1 - xdisp2
    ydisp = ydisp1 - ydisp2
    print(xdisp)
    print(ydisp)
    print("Disparity in images", xdisp)

fig.canvas.mpl_connect('button_press_event', onClick)
for index, i in enumerate([5,1]):
    ax = fig.add_subplot(1,2,index+1)
    image = Image.open('images/scene1.row3.col%i.ppm' %i)
    implot = plt.imshow(image)

fig2 = plt.figure()
image1 =Image.open('images/scene1.row3.col3.ppm')
plt.imshow(image1, cmap='gray')
plt.show()
calculateDisparity()
