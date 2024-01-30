%Read protein sequences
clc
clear
proteinSample = fastaread('F:\ViralHost\Positive\Positive.fasta');
sampleProtein = struct2cell(proteinSample);

parfor i=1:length(sampleProtein)
    X{i} = sampleProtein{2*i};
end 

X = X'

%Convert protein sequences from cell to mat
 maxLengthCell=max(cellfun('size',X,2));  %finding the longest vector in the cell array
for i=1:length(X)
    for j=cellfun('size',X(i),2)+1:maxLengthCell
         X{i}(j)=NaN;   %zeropad the elements in each cell array with a length shorter than the maxlength
    end
end
X=cell2mat(X); %A is your matrix

%EIIP representation of protein sequences
sizeOfX = size(X,2)
lengthOfSample = size(X,1)
parfor k=1:sizeOfX
    for i=1:lengthOfSample
        switch X(i,k)
            case('A')
                numericalProteinSequence1(i,k) = 0.0373
            case('R')
                numericalProteinSequence1(i,k) = 0.0959        
            case('N')
                numericalProteinSequence1(i,k) = 0.0036        
            case('D')
                numericalProteinSequence1(i,k) = 0.1263     
            case('C')
                numericalProteinSequence1(i,k) = 0.0829    
            case('Q')
                numericalProteinSequence1(i,k) = 0.0761      
            case('E')
                numericalProteinSequence1(i,k) = 0.0058       
            case('G')
                numericalProteinSequence1(i,k) = 0.005 
            case('H')
                numericalProteinSequence1(i,k) = 0.0242     
            case('I')
                numericalProteinSequence1(i,k) = 0  
            case('L')
                numericalProteinSequence1(i,k) = 0  
            case('K')
                numericalProteinSequence1(i,k) = 0.0371
            case('M')
                numericalProteinSequence1(i,k) = 0.0823      
            case('F')
                numericalProteinSequence1(i,k) = 0.0946       
            case('P')
                numericalProteinSequence1(i,k) = 0.0198  
            case('S')
                numericalProteinSequence1(i,k) = 0.0829  
            case('T')
                numericalProteinSequence1(i,k) = 0.0941
            case('W')
                numericalProteinSequence1(i,k) = 0.0548       
            case('Y')
                numericalProteinSequence1(i,k) = 0.0516
            case('V')
                numericalProteinSequence1(i,k) = 0.0057
            otherwise
                numericalProteinSequence1(i,k) = 0
        end
    end  
end

C = numericalProteinSequence1(:,[1:400])

xlswrite('EIIPPositive.xlsx', C)
