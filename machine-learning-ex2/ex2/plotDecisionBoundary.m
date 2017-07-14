function plotDecisionBoundary(theta, X, y)
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   a either 
%   1) Mx3 matrix, where the first column is an all-ones column for the 
%      intercept.
%   2) MxN, N>3 matrix, where the first column is all-ones

% Plot Data
plotData(X(:,2:3), y);
hold on

if size(X, 2) <= 3
% way 1 to plot linear decision line
    % Only need 2 points to define a line, so choose two endpoints
   plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

    % Calculate the decision boundary line
    plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));

    % Plot, and adjust axes for better viewing
   plot(plot_x, plot_y)
    
    % Legend, specific for the exercise
    %way 2 by using contour
    u = linspace(30, 100, 50);
    v = linspace(30, 100, 50);
     z = zeros(length(u), length(v));
    
     for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) =[1, u(i), v(j)]*theta;
        end
    end
    %important to taranspose z so contour can map u(i), v(j) to correct z(ij) 
    %in other word to have same mapping as z(i,j) =[1, u(i), v(j)]*theta;
    z=z';
    % [0, 0] means draw only line when the value of z is 0.
    %% [0, 2, 5] means draw only line when the value of z is 0 or 2 or 5.\
    %% [0:5] means draw only line when the value of z is 0 to 5.
    contour(u, v, z, [0, 0], 'LineWidth', 2)
    legend('Admitted', 'Not admitted', 'Decision Boundary')
    axis([30, 100, 30, 100])
else
    % Here is the grid range
    u = linspace(-1, 1.5, 50);
    v = linspace(-1, 1.5, 50);

    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j))*theta;
        end
    end
    z = z'; % important to transpose z before calling contour

    % Plot z = 0
    % Notice you need to specify the range [0, 0]
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end
hold off

end
