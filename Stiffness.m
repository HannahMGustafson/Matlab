function [K] = Stiffness(x,y,low,high, figure_number, colorval, locx, locy)
% Purpose: calculate and plot the stiffness of force-displacement measurements
% Inputs:
%	x = x values of signal (displacement)
% 	y = y values of signal (force)
%	low = % of the force for the start of stiffness calculation
%	high = % of the force for the end of stiffness calculation
% 	figure_number = assigned figure number
% 	colorval = RGB triplet
% 	locx = text location, x coordinate
%	loch = text location, y coordinate

% Determine the force values
ylow = max(y).*low./100;
yhigh = max(y).*high./100;

% Find the corresponding indices
[~,ylow_i] = min(abs(y-ylow));
[~,yhigh_i] = min(abs(y-yhigh));

% Fit the portion of the signal between the low and high indices, use linear fit to find stiffness
A = polyfit(x(ylow_i:yhigh_i), y(ylow_i:yhigh_i), 1);
K = A(1);

% Plot force from 300 to 900 N and stiffness
yfit = polyval(A, x(ylow_i:yhigh_i));
figure(figure_number); hold on; plot(x(ylow_i:yhigh_i), yfit, '-','color', colorval, 'linewidth', 4);
R2 = Rsquared_nofig(x(ylow_i:yhigh_i), y(ylow_i:yhigh_i));
figure(figure_number); text (locx, locy, ['R^2 = ', num2str(floor(R2*100)./100)], 'fontsize', 16);
