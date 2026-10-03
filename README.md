This repo about simple test for Julia to do a simple machine learning

<strong>Requirements:</strong>

<h6>DataFrames, GLM</h6>

<strong>For python developers:</strong>
Dots like .* or .+ to apply mathematical on array or a vector

<strong>using</strong> is the way Julia to import a lib

X1, X2 and Y they are the names for the columns in the table

<strong>@formula</strong> to transforms other code before it runs this
syntax used in R

<strong>~</strong> to treat it as function

<strong>The model acutally learned and got 19.477 from 19.5
which mean it off by .023</strong>

<strong>The output:</strong>

Test set

MSE:1.5196
RMSE:1.2327
Test R^2:0.9749

Sample predictions first 5 rows
5×3 DataFrame
 Row │ Actual   Predicted  Residual
     │ Float64  Float64    Float64
─────┼──────────────────────────────
   1 │   24.72      24.59      0.13
   2 │   12.56      13.47     -0.91
   3 │   16.08      16.13     -0.05
   4 │   12.98      12.12      0.86
   5 │   30.64      30.08      0.55

<table>

<tr>
 <td>
  Row
 </td>
 <td>
  Actual
 </td>
 <td>
  Predicted
 </td>
 <td>
  Residual
 </td>
</tr>
<tr>
 <td>
  1
 </td>
 <td>
  24.72
 </td>
 <td>
  24.59
 </td>
 <td>
  0.13
 </td>
</tr>
<tr>
 <td>
  2
 </td>
 <td>
  12.56
 </td>
 <td>
  13.47
 </td>
 <td>
  -0.91
 </td>
</tr>
<tr>
 <td>
  3
 </td>
 <td>
  16.08
 </td>
 <td>
  16.13
 </td>
 <td>
  -0.05
 </td>
</tr>
<tr>
 <td>
  4
 </td>
 <td>
  12.98
 </td>
 <td>
  12.12
 </td>
 <td>
  0.86
 </td>
</tr>
<tr>
 <td>
  5
 </td>
 <td>
  30.64
 </td>
 <td>
  30.08
 </td>
 <td>
  0.55
 </td>
</tr>
 
</table>

New data point prediction

Input: X1 = 4, X2 = 2.5 
Predicted Y:19.477

<strong>The End</strong>
