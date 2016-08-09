function [ data_str, new_str ] = findex( str, start_tag, end_tag )
%Takes a starting string, starting tag, and ending tag and find the
%string inbetween the two tags. It will then export a new string
%which is the minus that that came before the ending tag.
%%% HANS TRAUTLEIN, CS021

%indexes the first item after the string that was searched for
index_s = strfind(str, start_tag) + length(start_tag);
index_s = index_s(1);
%index last item before the tag
index_e = strfind(str(index_s:end), end_tag) - 2;
index_e = index_e(1);

%the beginning index for the new string we will create soon
new_str_begin = index_s + index_e;

%this is the string  between the two tags
data_str = str(index_s:new_str_begin);

%this is our new string with the old part subtracted
new_str = str(new_str_begin:end);

end