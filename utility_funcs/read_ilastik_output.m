function [output, output_p] = read_ilastik_output(file, channel, dth)
%This function reads an ilastik probability map an applies a threshold if
%Channel 1 -> Vessels
%Channel 2 -> Bones
%Channel 3 -> Background
%Channel 4 -> Nodules
if nargin<2
    disp('file -> ilastik probability map');
    disp('channel -> the class channel');
    disp('threshold -> if you want to threshold it');
end
ilastikprob = h5read(file, '/exported_data'); %h5 read prediction matrix
ilastikprob = permute(ilastikprob, [3 4 2 1]); %permute the matrix
output_p = ilastikprob(:,:,:,channel);%>dth(1);
%output = imreconstruct(output_p>dth(1), output_p>dth(2));

p = ilastikprob(:,:,:,4);
pmax = squeeze(max(ilastikprob(:,:,:,1:3),[],4));


ThHigh = p>=(1.1*pmax);
ThLow = p>=(0.9*pmax);
output = imreconstruct(ThLow, ThHigh);

end