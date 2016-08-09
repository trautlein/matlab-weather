function [ zipcode ] = geolocate
% This function geolocates the user using two APIs. It takes no input
% arguments and exports a zipcode. It might not always function as it
% relies off free APIs that can get overloaded by other heavier users
%%% HANS TRAUTLEIN, CS021

% this API finds the users IP address
str_api_ip = urlread('http://api.hostip.info');

% finds the ip from the larger string
str_ip = findex(str_api_ip,'<ip>','</ip>');

% concats two strings to creat good location api url
str_url_api_loc = strcat('http://freegeoip.net/xml/',str_ip);

% this API takes the IP and turns it into location information
str_api_loc = urlread(str_url_api_loc);

% finds the zipcode from the larger string
zipcode = findex(str_api_loc,'<ZipCode>','</ZipCode>');

% Below this is commented out because I ended up not using lat/long
% From this part of the code as it was available elsewhere
% finds the latitude
% lat = findex(str_api_loc,'<Latitude>','</Latitude>');

% finds the longitude
% long = findex(str_api_loc,'<Longitude>','</Longitude>');

end

