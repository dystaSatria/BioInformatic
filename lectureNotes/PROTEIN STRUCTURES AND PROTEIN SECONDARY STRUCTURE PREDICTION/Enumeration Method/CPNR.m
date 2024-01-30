%Read protein sequences
clc
clear
proteinSample = fastaread('E:\KLU\Dersler\Biyoenformatik\Hafta 8\Veriler\E.fasta');
sampleProtein = struct2cell(proteinSample);

%Eliminate the protein information (header)
parfor i=1:length(sampleProtein)
    X{i} = sampleProtein{2*i};
end 

%Transpose the sequences
X = X'

%Convert protein sequences from cell to mat
 maxLengthCell=max(cellfun('size',X,2));  %finding the longest vector in the cell array
for i=1:length(X)
    for j=cellfun('size',X(i),2)+1:maxLengthCell
         X{i}(j)=NaN;   %zeropad the elements in each cell array with a length shorter than the maxlength
    end
end
X=cell2mat(X); %A is your matrix

%CPNR representation of protein sequences
sizeOfX = size(X,2)
lengthOfSample = size(X,1)
parfor k=1:sizeOfX
    for i=1:lengthOfSample
        switch X(i,k)
            case('A')
                numericalProteinSequence1(i,k) = 35
            case('R')
                numericalProteinSequence1(i,k) = 47        
            case('N')
                numericalProteinSequence1(i,k) = 41        
            case('D')
                numericalProteinSequence1(i,k) = 59     
            case('C')
                numericalProteinSequence1(i,k) = 11    
            case('Q')
                numericalProteinSequence1(i,k) = 29      
            case('E')
                numericalProteinSequence1(i,k) = 61       
            case('G')
                numericalProteinSequence1(i,k) = 43 
            case('H')
                numericalProteinSequence1(i,k) = 17     
            case('I')
                numericalProteinSequence1(i,k) = 53  
            case('L')
                numericalProteinSequence1(i,k) = 23  
            case('K')
                numericalProteinSequence1(i,k) = 67
            case('M')
                numericalProteinSequence1(i,k) = 1      
            case('F')
                numericalProteinSequence1(i,k) = 3       
            case('P')
                numericalProteinSequence1(i,k) = 7  
            case('S')
                numericalProteinSequence1(i,k) = 31  
            case('T')
                numericalProteinSequence1(i,k) = 13
            case('W')
                numericalProteinSequence1(i,k) = 2       
            case('Y')
                numericalProteinSequence1(i,k) = 5
            case('V')
                numericalProteinSequence1(i,k) = 19
            otherwise
                numericalProteinSequence1(i,k) = 0
        end
    end  
end

%Cut the sequence
C = numericalProteinSequence1(:,[1:500])

%Convert to the excel
xlswrite('CPNRRepE.xlsx', C)
