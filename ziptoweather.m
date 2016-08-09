function [ weather ] = ziptoweather( zip )
%Takes the input of a US zip code and outputs it as weather
% information in a structure (w).
% %%% HANS TRAUTLEIN, CS021

% Thanks to Yahoo! Weather for the free API.
% This is my attribution.

weather.zip = zip; % puts zip into weather structure (and creates it)

% adds zip to base url to form url that the API can access
url = strcat('http://weather.yahooapis.com/forecastrss?p=',zip);

% makes a string "xml" that contains the API's information
url_str = urlread(url);

load raw_yahoo_tags.mat % loads variable 'raw'
% raw is a cell array that helps this function read the string later
% it helps find the strings we want in our output 'weather'

% loop that creates struct for each weather value desired from the url_str
for i = 1:24
    val_tag = raw{i,1}; % tag for weather element
    start_tag = raw{i,2}; % tag for string before weather element
    end_tag = raw{i,3}; % tag for string after weather element
    
    % finds the string and exports a smaller url string which
    % overwrites the old
    [data_str url_str] = findex( url_str, start_tag , end_tag);
    
    % prepares a string to be evaluated to create the struct
    eval_this = sprintf('weather.%s = ''%s'';',val_tag,data_str);
    % evaluates the above string
    eval(eval_this);
end

weather = winddir_deg_to_dir(weather); % degree to N,S,E,W,etc.



clear raw; % clears raw from 'workspace'

end