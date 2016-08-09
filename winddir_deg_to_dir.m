function [ weather ] = winddir_deg_to_dir( weather )
%Turns the wind from a degree to a direction (e.g. N)
%%% HANS TRAUTLEIN, CS021


weather.winddir = str2num(weather.winddir);

% this nested if/elseif tree finds the direction of the wind
if weather.winddir > 337.5 || weather.winddir <= 22.5;
    weather.winddir = 'N';
elseif weather.winddir > 22.5 && weather.winddir <= 67.5;
    weather.winddir = 'NE';
elseif weather.winddir > 67.5 && weather.winddir <= 112.5;
    weather.winddir = 'E';
elseif weather.winddir > 112.5 && weather.winddir <= 157.5;
    weather.winddir = 'SE';
elseif weather.winddir > 157.5 && weather.winddir <= 202.5;
    weather.winddir = 'S';
elseif weather.winddir > 202.5 && weather.winddir <= 247.5;
    weather.winddir = 'SW';
elseif weather.winddir > 247.5 && weather.winddir <= 292.5;
    weather.winddir = 'W';
elseif weather.winddir > 292.5 && weather.winddir <= 337.5;
    weather.winddir = 'NW';
end


end