%{
criticalSection = img_rot(370:450,:);
C = corner(img_rot);
figure, imshow(criticalSection);
%figure, imagesc(criticalSection);
hold on
plot(C(:,1),C(:,2),'r*');

%}


%{
ranges = [];
rangeWidth = 25;%in px
for i = 1:size(centroids)
  ranges = [ranges; [centroids(i,1)-rangeWidth centroids(i,1)+rangeWidth] ];
end
plot(ranges(:,1), 10, 'r+');plot(ranges(:,2), 10, 'r+');
hold off
%}