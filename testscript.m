% handles.weather.latitude = '37.72';
% handles.weather.longitude = '-92.31';
% 
% rad_xmin = num2str(str2double(handles.weather.longitude) - 4);
% rad_ymin = num2str(str2double(handles.weather.latitude) - 4);
% rad_xmax = num2str(str2double(handles.weather.longitude) + 4);
% rad_ymax = num2str(str2double(handles.weather.latitude) + 4);
% 
% 
% fullURL = sprintf('http://mesonet.agron.iastate.edu/GIS/radmap.php?layers[]=nexrad&width=300&height=300&bbox=%s,%s,%s,%s', ...
%     rad_xmin, rad_ymin, rad_xmax, rad_ymax);
% urlwrite(fullURL,'radar.png');

% x = [1,1.3];
% y_low = [str2double(weather.lowtemp_t),str2double(weather.lowtemp_tom)];
% y_high = [str2double(weather.hightemp_t),str2double(weather.hightemp_tom)];
% 
% bar1 = bar(x, y_high, 'FaceColor', 'r', 'EdgeColor', 'r');
% set(bar1, 'BarWidth', 0.6);
% hold on;
% bar2 = bar(x,y_low,'FaceColor','b','EdgeColor','b');
% set(bar2, 'BarWidth', 0.6);
% title('Temperature');
% set(gca,'XTick',[0])
% set(gca,'YTick',[10:5:100])
% axis([.85 1.45 min(y)-30 max(y)+10])
% xlabel('   Today                         Tomorrow')
% hold off


url = sprintf('http://api.wunderground.com/api/721c46a4109dc188/animatedradar/image.gif?centerlat=%s&centerlon=%s&radius=100&width=280&height=280&newmaps=1', ...
    handles.weather.latitude, handles.weather.longitude);
