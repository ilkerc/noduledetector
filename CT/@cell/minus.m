function C= minus(A,B)
%function C= minus(A,B)
%overloads minus (A,B) for cell arrays
% Only implements element by element subtraction
%both of the arguments can be a cell array.
% B. Tek 19 May 2008


% update 27/02/2013
% Copyright 2008-2013 F. Boray Tek.
% All rights reserved.
%
% This file is part of CT class.
%
% CT class is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% CT class is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.

% You should have received a copy of the GNU General Public License
% along with CT class.  If not, see <http://www.gnu.org/licenses/>.

if (iscell(A) && iscell(B)) % first argument is cell
    C = cell(size(A));
for i = 1: numel(A)
        C{i} = A{i}-B{i};
    end
elseif (iscell(A)&& isscalar(B)) % first argument is cell second is numeric
    C = cell(size(A));
    for i = 1: numel(A)
        C{i} = A{i}-B;
    end
elseif (iscell(B)&& isscalar(A))% second is cell first is numeric
    C = cell(size(B));
    for i = 1: numel(B)
        C{i} = B{i}-A;
    end
else
    disp('one of the arguments  array if other is scalar');
    % in fact is it ever possible to come here. 
end