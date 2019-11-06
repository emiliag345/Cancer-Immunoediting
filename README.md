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

Let ![](https://latex.codecogs.com/gif.latex?y_i) be the number of T cells that is specific to cancer cells of variant ![](https://latex.codecogs.com/gif.latex?i). 

![](https://latex.codecogs.com/gif.latex?%5Cfrac%7Bdy_i%7D%7Bdt%7D%3Dg_1%28x_i%2Cy_i%29-g_2%28x_i%29-g_3%28y_i%29)

![](https://latex.codecogs.com/gif.latex?g_1%28x_i%2Cy_i%29) depicts the expansion of T cells. To simulate the time required for clonal selection and expansion, the growth of these cells was modeled using a delayed differential equation based on the number of cancer cells and rate constant ![](https://latex.codecogs.com/gif.latex?p). The carrying capacity of T cells ![](https://latex.codecogs.com/gif.latex?K_2) was defined to be significantly lower than ![](https://latex.codecogs.com/gif.latex?K_1) to reflect physiological conditions.

![](https://latex.codecogs.com/gif.latex?g_1%3Dpx_%7Bi%2Ct-1%7D%281-%5Cfrac%7By_i%7D%7BK_2%7D%29)

![](https://latex.codecogs.com/gif.latex?g_2%28x_i%29)  depicts cancer-mediated immunosuppression by the induction of apoptosis with the aggressiveness being ![](https://latex.codecogs.com/gif.latex?q_1).

![](https://latex.codecogs.com/gif.latex?g_2%3Dq_1x_i)

![](https://latex.codecogs.com/gif.latex?g_3%28y_i%29) is the rate of T cell contraction after antigenic stimulation. The T cell population decays with constant ![](https://latex.codecogs.com/gif.latex?u).

![](https://latex.codecogs.com/gif.latex?g_3%3Duy_i)
