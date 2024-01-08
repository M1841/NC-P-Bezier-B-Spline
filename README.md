# Bézier Curve Visualization

## 1. Introduction

Bézier Curves are a type of parametric curve commonly used in computer graphics, animation and design. They were introduced by the french mathematician Pierre Bézier in the 1960s and are defined by a set of control points which provide a simple but highly versatile way of generating curves.

The widespread use of Bézier curves in graphical applications warrants gaining a deeper understanding of their properties and behaviour. This project aims to provide an interactive visualization based on manipulating the control points of a Bézier curve and observing the resulting curve.

## 2. Implementation Overview

### 2.1 Defining a Bézier Curve

Polynomials in Bernstein form are used to define Bézier curves. The Bernstein polynomials of degree $n$ are defined as follows:

$b_{n,k}(t) := \binom{n}{k}t^k(1 − t)^{n−k} = \frac{n!}{k!(n − k)!}t^k(1 − t)^{n−k}$

where $k = 0, . . . , n$ and $t ∈ [0, 1]$.

We then need a set of $n + 1$ control points $P_0, . . . , P_n ∈ R^2$ to define a Bézier curve of degree $n$. The curve is then defined as follows:

$B(t) := \sum_{k=0}^{n} b_{n,k}(t)P_k$

### 2.2. Project Structure

The MATLAB-based implementation consists of the following scripts:

-   `main.m`: The entry point of the application. It initializes the environment, prompts the user for input and calls the appropriate functions to generate the Bernstein polynomials and Bézier curve.
-   `bernstein.m`: Generates the Bernstein basis polynomials and plots them, providing insight into the fundamental components of the Bézier curve.
-   `init_controls.m`: Initializes control points and creates an interactive user interface for dynamically adjusting their positions.
-   `random_point.m`: Generates a random coordinate in the range of the project window.
-   `update_plot.m`: A callback function used to update the plot when the position of a control point is changed.

## 3. Code Breakdown

### 3.1. Global Variables

-   `n`: The degree of the Bézier curve. It is set by the user and can be any integer from 1 to 170.
-   `b`: A `n` x `length(t)` matrix containing the Bernstein basis polynomials for the given degree `n` and the range of `t` values.
-   `fig`: A handle to the figure window where the Bézier curve and the sliders are plotted.
-   `fig_axes`: A handle to the axes object where the Bézier curve is plotted.
-   `max_value`: The maximum value of the sliders. It is set to 5 by default.`
-   `p_generation_method`: A string indicating the method used to generate the control points. It can be either `linear` or `random`.
-   `p_sliders`: An array containing the handles to the slider `uicontrol` objects.

### 3.2. Program Flow

The `main.m` script prompts the user for a degree `n` and a method for generating the control points. It also initializes the `max_value` variable and the `t` vector, which is then used to call the `bernstein` function.

The `bernstein.m` script opens a figure window, computes the Bernstein basis polynomials and plots them. The program then returns to the `main.m` script, which opens a new figure window and creates an axes object, storing handles to them in `fig` and `fig_axes` respectivelly, sets the axes limits and then calls the `init_controls` function.

The `init_controls.m` script initializes variables used for the sizing and positioning of the sliders. It loops `n` times, each time generating a point based on the previously chosen method, creates two slider `uicontrol` objects for its `x` & `y` coordinates and stores their handles in the `p_sliders` array, also displaying text lables for each and adding listeners for the `ContinuousValueChange` event.

The `update_plot.m` is called whenever the position of a slider is changed. It updates `p`, the internal representation of the control points, and computes the new Bézier curve, which is then plotted. It clears the axes object before plotting the new curve, a dashed line connecting the control points, representing the polygonal approximation of the curve and the control points themselves.

## 4. Limitations

-   Due to the limited screen space, only up 9 sliders can be displayed at once. Higher degree curves can still be generated, but any point beyond $P_8$ will not be adjustable.
-   No Bernstein polynomials are displayed for $n > 170$, which could be caused by the behavior of MATLAB's `factorial` function.
-   The degree of the curve is only set once at the beginning of the program and cannot be changed without restarting the application.
-   The sliders may move to awkward positions if the window is resized.
-   The figure window updates slowly at high degrees
