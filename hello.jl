# Libs

using DataFrames
using GLM
using Statistics
using Random

# Libs

# Seed dataset

Random.seed!(42)
n_samples = 150

x1 = rand(n_samples) .* 10.
x2 = rand(n_samples) .* 5.
noise = randn(n_samples) .* 1.2
y = 2.5 .* x1 .+ 1.8 .* x2 .+ 5.0 .+ noise

df = DataFrame(X1 = x1, X2 = x2, Y = y)

# to print the dataset
# println(df)

# Seed dataset

#Train, test and split

shuffled_indices = randperm(n_samples)
train_size = Int(floor(.8 * n_samples))

train_idx = shuffled_indices[1:train_size]
test_idx = shuffled_indices[(train_size + 1):end]

train_df = df[train_idx, :]
test_df = df[test_idx, :]

#Train, test and split

# Train regression model

model = lm(@formula(Y ~ X1 + X2), train_df)

# println("="^67, "\nModel summary\n", "="^67, "\n", model)

# Train regression model

# Predictions on the test set and evaluate performance

pred = predict(model, test_df)

actuals = test_df.Y

mse = mean((pred .- actuals) .^ 2)

rmse = sqrt(mse)

ss_tot = sum((actuals .- mean(actuals)) .^ 2)
ss_res = sum((actuals .- pred) .^ 2)
test_r2 = 1. - (ss_res / ss_tot)

println("="^67, "\nTest set\n", "="^67, "\nMSE:", round(mse, digits=4))
println("RMSE:", round(rmse, digits=4), "\nTest R^2:", round(test_r2, digits=4))

# Predictions on the test set and evaluate performance

# Compare actual by predicted

res_sample = DataFrame(
    Actual = round.(actuals[1:5], digits = 2),
    Predicted = round.(pred[1:5], digits = 2),
    Residual = round.(actuals[1:5] .- pred[1:5], digits = 2),
)

println("="^67, "\nSample predictions first 5 rows")
println("="^67, res_sample)

# Compare actual by predicted

# Predict on new data point

new_point = DataFrame(X1 = [4.0], X2 = [2.5])
new_pred = predict(model, new_point)
println("="^67, "\nNew data point prediction\n", "="^67)
println("Input: X1 = 4, X2 = 2.5 \n", "Predicted Y:", round(new_pred[1], digits = 4))

# Visual

using Plots

residuals = actuals .- pred

# 1

min_val = min(minimum(actuals), minimum(pred))
max_val = max(maximum(actuals), maximum(pred))

p1 = scatter(
    actuals, pred, label="Predictions", xlabel="Actual Y",
    ylabel="Predicted Y", title="1. Actual vs. Predicted",
    legend=:topleft, color=:green, alpha=.8
)

plot!(p1, [min_val, max_val], [min_val, max_val],
    label="Ideal (y = x)", color=:yellow, linestyle=:dash, lw=2
)

# 1

# 2

p2 = scatter(
    pred, residuals, label="Residuals", xlabel="Predict Y",
    ylabel="Residuals (Actual - Pred)", title="2. Residuals vs. Predicted",
    legend=:topleft, color=:purple, alpha=.8
)

hline!(p2, [0], label="Zero Line", color=:green, linestyle=:dash,
lw=2)

# 2

# 3

p3 = histogram(
    residuals, bins=10, label="Residuals", xlabel="Residuals value",
    ylabel="Count", title="3. Error distribution", color=:teal, alpha=.8
)

vline!(p3, [0], label="Zero Mean", color=:orange, linestyle=:dash, lw=2)

# 3

# print

all_plots = plot(p1, p2, p3, layout=(1,3), size=(1200, 600))
display(all_plots)
savefig(all_plots, "regression_analysis.png")
println("\nPlots displayed and saved to 'regression_analysis.png'!")

# Visual