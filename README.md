# Cancer-Immunoediting
Modeling chemical kinetics of T-cell and cancer interaction in MATLAB

A system of ordinary differential equations was used to model the kinetics of T cell and cancer interaction during cancer immunoediting. The solutions of the system were approximated using Euler’s numerical integration method.

## Cancer kinetics
Let ![x1](https://latex.codecogs.com/gif.latex?x_i) be the number of cancer cells of variant ![](https://latex.codecogs.com/gif.latex?i). The dynamics of these cells could be modeled using the following differential equation with two functions ![](https://latex.codecogs.com/gif.latex?f_1%28x_i%29) and ![](https://latex.codecogs.com/gif.latex?f_2%28x_i%2C%20y_i%29).

![](https://latex.codecogs.com/gif.latex?%5Cfrac%7Bdx_i%7D%7Bdt%7D%3Df_1%28x_i%29-f_2%28x_i%2Cy_i%29)

![](https://latex.codecogs.com/gif.latex?f_1%28x_i%29) depicts the growth rate. To simulate autoinhibition due to nutrient consumption and negative feedback, this is modeled using a logistic differential equation with growth rate ![](https://latex.codecogs.com/gif.latex?r_i) and carrying capacity ![](https://latex.codecogs.com/gif.latex?K_1).

![](https://latex.codecogs.com/gif.latex?f_1%28x_i%29%20%3D%20r_i%20x_i%281-%5Cfrac%7Bx_i%7D%7BK_1%7D%29)

![](https://latex.codecogs.com/gif.latex?f_2%28x_i%2C%20y_i%29) depicts the rate of T cell-mediated cancer cytotoxicity. Let ![](https://latex.codecogs.com/gif.latex?y_i) be the number of T cells that is specific to cancer cells of variant ![](https://latex.codecogs.com/gif.latex?i). The cytotoxicity rate was modeled using both the number of T cells and cancer cells with the cancer cell susceptibility being ![](https://latex.codecogs.com/gif.latex?s).

![](https://latex.codecogs.com/gif.latex?f_2%28x_i%2Cy_i%29%3Ds_ix_iy_i)

## T-cell Kinetics
