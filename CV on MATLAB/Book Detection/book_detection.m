close all;
clear all;
clc;

%% Read Images
% Object
I1 = imread('book.jpg');
figure;
imshow(I1);
title('Object');
% Scene
I2 = imread('cluttered_books.jpg');
figure;
imshow(I2);
title('Scene');

%% Set to Gray Scale
gray1 = rgb2gray(I1);
gray2 = rgb2gray(I2);

%% Detect Features
points1 = detectSURFFeatures(gray1);
points2 = detectSURFFeatures(gray2);

%% Extract Features
[feats1,validpts1] = extractFeatures(gray1,points1);
[feats2,validpts2] = extractFeatures(gray2,points2);

%% Display Features
figure;
imshow(I1);
hold on;
plot(validpts1.selectStrongest(100),'showOrientation',true);
title('Detected Features');

%% Match Features
index_pairs = matchFeatures(feats1,feats2,'Prenormalized',true);
matched_pts1 = validpts1(index_pairs(:, 1));
matched_pts2 = validpts2(index_pairs(:, 2));
figure;
showMatchedFeatures(I1,I2,matched_pts1,matched_pts2,'montage');
title('Initial Matches');

% Define location of object in image
boxPolygon = [1, 1;...                           % top-left
             size(I1, 2), 1;...                  % top-right
             size(I1, 2), size(I1, 1);...        % bottom-right
             1, size(I1, 1);...                  % bottom-left
             1, 1];                               % top-left again to close the polygon

%% Remove outliers while estimating geometric transform using RANSAC
[tform, inlieroints1, inlieroints2] = estimateGeometricTransform(matched_pts1,matched_pts2,'affine');
figure;
showMatchedFeatures(I1,I2,inlieroints1,inlieroints2,'montage');
title('Filtered Matches');

%% Use estimated transfor to locate object
newBoxPolygon = transformPointsForward(tform, boxPolygon);

%% Overlat the detected location of object in Image I2
figure;
imshow(I2);
hold on;
line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'g', 'LineWidth', 5);
title('Detected Object');




