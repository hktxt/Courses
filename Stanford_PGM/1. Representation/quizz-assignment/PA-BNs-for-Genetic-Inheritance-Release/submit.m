function submit(part)
  addpath('./lib');

  conf.assignmentKey = 'haijvkP8EeaOwRI5GO98Xw';
  conf.itemName = 'BNs for Genetic Inheritance';

  conf.partArrays = { ...
    { ...
      '6qJ5F', ...
      { 'phenotypeGivenGenotypeMendelianFactor.m' }, ...
      'phenotypeGivenGenotypeMendelianFactor', ...
    }, ...
    { ...
      'YW7hB', ...
      { 'phenotypeGivenGenotypeMendelianFactor.m' }, ...
      'phenotypeGivenGenotypeMendelianFactor (Test)', ...
    }, ...
    { ...
      '4SCHR', ...
      { 'phenotypeGivenGenotypeFactor.m' }, ...
      'phenotypeGivenGenotypeFactor', ...
    }, ...
    { ...
      'dMfG8', ...
      { 'phenotypeGivenGenotypeFactor.m' }, ...
      'phenotypeGivenGenotypeFactor (Test)', ...
    }, ...
    { ...
      'sVijF', ...
      { 'genotypeGivenAlleleFreqsFactor.m' }, ...
      'genotypeGivenAlleleFreqsFactor', ...
    }, ...
    { ...
      '7ccHc', ...
      { 'genotypeGivenAlleleFreqsFactor.m' }, ...
      'genotypeGivenAlleleFreqsFactor (Test)', ...
    }, ...
    { ...
      'YTHBY', ...
      { 'genotypeGivenParentsGenotypesFactor.m' }, ...
      'genotypeGivenParentsGenotypesFactor', ...
    }, ...
    { ...
      'mFn3B', ...
      { 'genotypeGivenParentsGenotypesFactor.m' }, ...
      'genotypeGivenParentsGenotypesFactor (Test)', ...
    }, ...
    { ...
      'wCUvg', ...
      { 'constructGeneticNetwork.m' }, ...
      'constructGeneticNetwork', ...
    }, ...
    { ...
      'wyMoY', ...
      { 'constructGeneticNetwork.m' }, ...
      'constructGeneticNetwork (Test)', ...
    }, ...
    { ...
      'flSZ2', ...
      { 'phenotypeGivenCopiesFactor.m' }, ...
      'phenotypeGivenCopiesFactor', ...
    }, ...
    { ...
      'GfmuH', ...
      { 'phenotypeGivenCopiesFactor.m' }, ...
      'phenotypeGivenCopiesFactor (Test)', ...
    }, ...
    { ...
      'JmkmK', ...
      { 'constructDecoupledGeneticNetwork.m' }, ...
      'constructDecoupledGeneticNetwork', ...
    }, ...
    { ...
      'J0R6g', ...
      { 'constructDecoupledGeneticNetwork.m' }, ...
      'constructDecoupledGeneticNetwork (Test)', ...
    }, ...
    { ...
      'dpFFP', ...
      { 'constructSigmoidPhenotypeFactor.m' }, ...
      'constructSigmoidPhenotypeFactor', ...
    }, ...
    { ...
      'nBdS8', ...
      { 'constructSigmoidPhenotypeFactor.m' }, ...
      'constructSigmoidPhenotypeFactor (Test)', ...
    }, ...
  };

  conf.output = @output;
  submitWithConfiguration(conf);

end

function out = output(partIdx, auxstring)

  if partIdx == 1
    isDominant = 1;
    genotypeVar = 1;
    phenotypeVar = 3;
    pggmf(1) = phenotypeGivenGenotypeMendelianFactor(isDominant, genotypeVar, phenotypeVar);
    pggmf(1) = SortFactorLaterVars(pggmf(1));
    out = SerializeFactorsFg(pggmf);
  elseif partIdx == 2
    isDominant = 0;
    genotypeVar = 1;
    phenotypeVar = 3;
    pggmf(1) = phenotypeGivenGenotypeMendelianFactor(isDominant, genotypeVar, phenotypeVar);
    pggmf(1) = SortFactorLaterVars(pggmf(1));
    out = SerializeFactorsFg(pggmf);
  elseif partIdx == 3
    alphaList = [0.8; 0.6; 0.1];
    genotypeVar = 1;
    phenotypeVar = 3;
    pggf(1) = phenotypeGivenGenotypeFactor(alphaList, genotypeVar, phenotypeVar);
    pggf(1) = SortFactorLaterVars(pggf(1));
    out = SerializeFactorsFg(pggf);
  elseif partIdx == 4
    alphaList = [0.2; 0.5; 0.9];
    genotypeVar = 1;
    phenotypeVar = 3;
    pggf(1) = phenotypeGivenGenotypeFactor(alphaList, genotypeVar, phenotypeVar);
    pggf(1) = SortFactorLaterVars(pggf(1));
    out = SerializeFactorsFg(pggf);
  elseif partIdx == 5
    alleleFreqs = [0.1; 0.9];
    genotypeVar = 1;
    ggaff(1) = genotypeGivenAlleleFreqsFactor(alleleFreqs, genotypeVar);
    out = SerializeFactorsFg(ggaff);
  elseif partIdx == 6
    alleleFreqs = [0.98; 0.02];
    genotypeVar = 1;
    ggaff(1) = genotypeGivenAlleleFreqsFactor(alleleFreqs, genotypeVar);
    out = SerializeFactorsFg(ggaff);
  elseif partIdx == 7
    alleleList = {'F', 'f'};
    genotypeVarChild = 3;
    genotypeVarParentOne = 1;
    genotypeVarParentTwo = 2;
    ggpgf(1) = genotypeGivenParentsGenotypesFactor(length(alleleList), genotypeVarChild, genotypeVarParentOne, genotypeVarParentTwo);
    ggpgf(1) = SortFactorLaterVars(ggpgf(1));
    out = SerializeFactorsFg(ggpgf);
  elseif partIdx == 8
    alleleList = {'A', 'a', 'n'};
    genotypeVarChild = 3;
    genotypeVarParentOne = 1;
    genotypeVarParentTwo = 2;
    ggpgf(1) = genotypeGivenParentsGenotypesFactor(length(alleleList), genotypeVarChild, genotypeVarParentOne, genotypeVarParentTwo);
    ggpgf(1) = SortFactorLaterVars(ggpgf(1));
    out = SerializeFactorsFg(ggpgf);
  elseif partIdx == 9
    alleleFreqs = [0.1; 0.9];
    alphaList = [0.8; 0.6; 0.1];
    pedigree = struct('parents', [0,0;1,3;0,0;1,3;2,6;0,0;2,6;4,9;0,0]);
    pedigree.names = {'Ira','James','Robin','Eva','Jason','Rene','Benjamin','Sandra','Aaron'};
    cgn = constructGeneticNetwork(pedigree, alleleFreqs, alphaList);
    for i = 1:length(cgn)
        cgn(i) = SortFactorLaterVars(cgn(i));
    end
    out = SerializeFactorsFg(sortStruct(cgn));
  elseif partIdx == 10
    alleleFreqs = [0.1; 0.9];
    alphaList = [0.8; 0.6; 0.1];
    pedigree = struct('parents', [0,0;0,0;2,1;0,0;2,1;0,0;0,0;3,4;5,7;5,6]);
  pedigree.names = {'Alan','Vivian','Alice','Larry','Beth','Henry','Leon','Frank','Amy', 'Martin'};
    cgn = constructGeneticNetwork(pedigree, alleleFreqs, alphaList);
    for i = 1:length(cgn)
        cgn(i) = SortFactorLaterVars(cgn(i));
    end
    out = SerializeFactorsFg(sortStruct(cgn));
  elseif partIdx == 11
    alphaListThree = [0.8; 0.6; 0.1; 0.5; 0.05; 0.01];
    phenotypeVar = 3;
    genotypeVarMotherCopy = 1;
    genotypeVarFatherCopy = 2;
    numAlleles = 3;
    pgpaf(1) = phenotypeGivenCopiesFactor(alphaListThree, numAlleles, genotypeVarMotherCopy, genotypeVarFatherCopy, phenotypeVar);
    pgpaf(1) = SortFactorLaterVars(pgpaf(1));
    out = SerializeFactorsFg(pgpaf);
  elseif partIdx == 12
    alphaListThree = [0.001; 0.009; 0.3; 0.2; 0.75; 0.95];
    phenotypeVar = 3;
    genotypeVarMotherCopy = 1;
    genotypeVarFatherCopy = 2;
    numAlleles = 3;
    pgpaf(1) = phenotypeGivenCopiesFactor(alphaListThree, numAlleles, genotypeVarMotherCopy, genotypeVarFatherCopy, phenotypeVar);
    pgpaf(1) = SortFactorLaterVars(pgpaf(1));
    out = SerializeFactorsFg(pgpaf);
  elseif partIdx == 13
    pedigree = struct('parents', [0,0;1,3;0,0;1,3;2,6;0,0;2,6;4,9;0,0]);
    pedigree.names = {'Ira','James','Robin','Eva','Jason','Rene','Benjamin','Sandra','Aaron'};
    alphaListThree = [0.8; 0.6; 0.1; 0.5; 0.05; 0.01];
    alleleFreqsThree = [0.1; 0.7; 0.2];
    cdgn = constructDecoupledGeneticNetwork(pedigree, alleleFreqsThree, alphaListThree);
    for i = 1:length(cdgn)
        cdgn(i) = SortFactorLaterVars(cdgn(i));
    end
    out = SerializeFactorsFg(sortStruct(cdgn));
  elseif partIdx == 14
    pedigree = struct('parents', [0,0;0,0;2,1;0,0;2,1;0,0;0,0;3,4;5,7;5,6]);
  pedigree.names = {'Alan','Vivian','Alice','Larry','Beth','Henry','Leon','Frank','Amy', 'Martin'};
    alphaListThree = [0.8; 0.6; 0.1; 0.5; 0.05; 0.01];
    alleleFreqsThree = [0.1; 0.7; 0.2];
    cdgn = constructDecoupledGeneticNetwork(pedigree, alleleFreqsThree, alphaListThree);
    for i = 1:length(cdgn)
        cdgn(i) = SortFactorLaterVars(cdgn(i));
    end
    out = SerializeFactorsFg(sortStruct(cdgn));
  elseif partIdx == 15
    alleleWeights = {[3, -3], [0.9, -0.8]};
    phenotypeVar = 3;
    geneCopyVarParentOneList = [1; 2];
    geneCopyVarParentTwoList = [4; 5];
    cspf(1) = constructSigmoidPhenotypeFactor(alleleWeights, geneCopyVarParentOneList, geneCopyVarParentTwoList, phenotypeVar);
    cspf(1) = SortFactorLaterVars(cspf(1));
    out = SerializeFactorsFg(cspf);
  elseif partIdx == 16
    alleleWeights = {[0.01, -.2], [1, -.5]};
    phenotypeVar = 3;
    geneCopyVarParentOneList = [1; 2];
    geneCopyVarParentTwoList = [4; 5];
    cspf(1) = constructSigmoidPhenotypeFactor(alleleWeights, geneCopyVarParentOneList, geneCopyVarParentTwoList, phenotypeVar);
    cspf(1) = SortFactorLaterVars(cspf(1));
    out = SerializeFactorsFg(cspf);
  end
end

function out = SerializeFactorsFg(F)
% Serializes a factor struct array into the .fg format for libDAI
% http://cs.ru.nl/~jorism/libDAI/doc/fileformats.html
%
% To avoid incompatibilities with EOL markers, make sure you write the
% string to a file using the appropriate file type ('wt' for windows, 'w'
% for unix)

lines = cell(5*numel(F) + 1, 1);

lines{1} = sprintf('%d\n', numel(F));
lineIdx = 2;
for i = 1:numel(F)
  lines{lineIdx} = sprintf('\n%d\n', numel(F(i).var));
  lineIdx = lineIdx + 1;
  
  lines{lineIdx} = sprintf('%s\n', num2str(F(i).var(:)')); % ensure that we put in a row vector
  lineIdx = lineIdx + 1;
  
  lines{lineIdx} = sprintf('%s\n', num2str(F(i).card(:)')); % ensure that we put in a row vector
  lineIdx = lineIdx + 1;
  
  lines{lineIdx} = sprintf('%d\n', numel(F(i).val));
  lineIdx = lineIdx + 1;
  
  % Internal storage of factor vals is already in the same indexing order
  % as what libDAI expects, so we don't need to convert the indices.
  vals = [0:(numel(F(i).val) - 1); F(i).val(:)'];
  lines{lineIdx} = sprintf('%d %0.8g\n', vals);
  lineIdx = lineIdx + 1;
end

out = sprintf('%s', lines{:});

end

function out = SerializePedigree(pedigree)
% SerializePedigree Serializes a pedigree into a text string.

numPeople = numel(pedigree.names);

lines = cell(2*numPeople + 1, 1);

lines{1} = sprintf('%d\n', numPeople);
lineIdx = 2;
for i = 1:numPeople
  lines{lineIdx} = sprintf('%s\n', pedigree.names{i});
  lineIdx = lineIdx + 1;
end

for i = 1:numPeople
  lines{lineIdx} = sprintf('%d %d\n', pedigree.parents(i, 1), pedigree.parents(i, 2));
  lineIdx = lineIdx + 1;
end

out = sprintf('%s', lines{:});
end

function G = SortFactorLaterVars(F)
% SortFactorLaterVars Returns the input factor with a sorted variable
% ordering but leaves the first variable alone.
%   
% SortFactorLaterVars(F) returns a new factor that contains exactly the same
% variables and values but in which the variables are ordered differently
% (the ordering is as specified in the .var field). Specifically, the
% returned factor will have its first variable  ordered in ascending order.
%
% For instance, if F.var = [3 1 2], and G = SortFactorVars(F), tnen 
% G.var = [1 2 3], and G.card, G.val will have been appropriately reordered
% (from F.card and F.val) with respect to this sorted variable ordering.
%

if (numel(F.var) > 1)
  laterVars = F.var(2:end);
  [slVars, lorder] = sort(laterVars);
  G.var = [F.var(1) slVars];
  
  order = [1 (lorder+1)];
  
  G.card = F.card(order);  
  G.val = zeros(numel(F.val), 1); 

  assignmentsInF = IndexToAssignment(1:numel(F.val), F.card);
  assignmentsInG = assignmentsInF(:, order);
  G.val(AssignmentToIndex(assignmentsInG, G.card)) = F.val;
  
else % nothing to do
  G = F;
end

end

function sListSorted = sortStruct(sList)

for i = 1 : length(sList)
  S{i} = sprintf('%d%d%f', sList(i).var, sList(i).card, sList(i).val);  
end

[S I] = sort(S);
sListSorted = sList(I);

end