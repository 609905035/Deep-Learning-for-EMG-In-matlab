function [Y,Xf,Af] = FixArmRimNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 18-May-2018 16:33:24.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = Qx16 matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = Qx4 matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0.0331656821072;0.0305959042162;0.0396258197725;0.0366940423846;0.0420869328082;0.0395838618279;0.110751710832;0.112121962011;0.106433078647;0.104355148971;0.15074326098;0.150765880942;0.0477795526385;0.0454844497144;0.039904370904;0.0359512865543];
x1_step1.gain = [24.5872893085342;23.7604191532141;23.8151080958544;25.4608725474884;26.9955562274534;28.6195793905733;10.0394165595699;8.82050252807468;8.17184918952084;7.98286468299224;16.4087031904839;16.7372620633112;15.0296281402836;14.6044813024295;17.7222973830589;15.927356165962];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.7050214848731042316;0.96188484047796429799;1.038495807369713031;0.18238865262665232558;-0.56514133320130532923;0.55286747918516487843;-0.92598789470313258576;-1.2732431687385403762;1.3872365642288650989;1.3858757814193736202];
IW1_1 = [0.10385239921105411665 -1.1629279954353100024 0.63428206566704237179 0.36380036223656297967 0.22228602243522563309 0.49905231096879587582 -0.18280607719499925023 -0.88129222296832399053 -0.32776098254215518812 -0.39012658467244909488 0.33695888620846448092 1.0242786570539501589 0.29023352076877290129 -0.88866757008503471926 1.0056075847175236504 0.31943386666107664862;-0.62996383914700582185 -0.2608647004230333355 -0.24827638672163809819 -1.0715432673926763574 0.5646865948434340865 -0.08960444331529876516 0.34694650848161934231 -0.22107616639691121674 -0.38329156249036877568 0.24471572043817807485 -0.17912759356955892942 1.0759195314699789847 -1.0054769552855786774 -0.24813792847398907782 1.0717603293923423369 0.91568506741204469535;-0.38215491885432556485 0.68313234858952698314 -0.59619489267304504043 0.38425661399722665923 -0.89982209395567225307 -0.68553751468112511525 0.42697064978221205278 -0.075752673535855935549 -0.30488518277156023695 0.26439596310936580581 -0.1913627596974131484 -0.79724992387974957797 -0.5606807462409125753 0.81917334511631967331 -0.50036310655489757426 -0.29141563266863595993;-0.11783742165144858727 -0.57313352424199714985 -0.71441655850556085028 -0.96625344861054618395 0.34980658960995131279 -1.623904638107471099 0.86129770025255680821 0.9208474609752449469 -0.83661726129525126883 -0.52477731676556427232 -0.23050176670732230866 -0.052321513516715933978 0.23067191698150302237 0.48893259296298419159 1.6054506527808283245 1.9375426809423434982;-0.63629237292126428205 -0.92268370169809399428 -0.13253986551625154822 0.51705597993044583038 0.39929618781256726034 -0.062114109945132875423 -0.56978879972653728725 -0.50185807016007066839 -0.10063502181220615461 -0.024500739412874731477 -0.31691652331098058015 0.98528755924958122403 -0.44685293661466940485 -1.0517092228169409029 0.10764537092565271137 0.069345073690974062819;-0.074089382829145566944 1.607019230263388776 -0.54933704083295487042 -0.44143455123648556171 -0.6492652493984775175 -0.85041553702594085973 1.051246406833060032 0.15126985564446665533 -0.081607518759792857521 -1.4301297456799100249 -0.60656435776542916294 -2.0041922117558805816 1.3580916771035445034 1.7019199216840690259 -0.73068791364364282792 -0.72590144265249345601;0.28567786441535725217 1.1682992357089030389 0.29446187160554720963 1.1089620166374154486 1.2146820648909253393 1.3112386259682493606 -0.66197832675334322694 -1.4538700167178966183 0.32543937546567941466 0.87296570562381003988 0.39376657712590218408 -0.28921279882477629597 0.75367568640314130946 -0.21197543048723474501 -0.24181633730810386806 -1.6737918276369907478;-0.58009122730653561728 0.60316456936238549424 -0.42613014938204546445 -0.66540683302777714481 -0.4200102001125651241 -0.25327500843612316128 0.25077521995730944759 0.009976384734729107015 0.23330059420368670642 1.0799487346122647047 0.63937622386590697854 0.88867679944821276194 -0.076020699648956358008 -0.9051118125380419599 -0.047920626029801627332 -0.19599506533291932708;0.12565040918894648803 0.40052424489063581658 -0.19567204627344675361 -0.48483802171972611994 -0.098748377482680380068 -0.49496461125570478945 -0.47807641473613626815 -0.69238471897331244076 -0.66768035442024076254 -0.0087584840591310979957 0.00061378526682623335553 -0.16292454809433046248 -0.65807266429066879621 0.12161738310524267126 -0.44178186907817373896 -0.30147584282866701777;0.47526465880630014427 0.82396540110210447772 0.31547735038437857424 0.66248587004977788073 0.32458321118619065659 -0.12972679626594690871 0.055279923952079368377 0.61196071041093857978 -0.74780177168502670604 -1.0906302469797166665 0.068231861102518415185 -0.14635325766308723838 -0.27113427863717354249 0.15869403540813020737 0.24549896214484107082 0.29521665723070023013];

% Layer 2
b2 = [0.10578594606079309848;-0.86075285953157421037;-0.37607875970983428715;-0.78041640837101911021];
LW2_1 = [-1.3339458554245089417 -2.4023375161931279642 0.40781273665338607648 -2.6836227219830988133 -1.004290238174518457 3.3086934339848288467 3.3247896857753893585 -0.12268418945304718215 -1.1102442766989890632 -0.16389526142077173732;-0.83060490684210053214 0.59312314283453237973 0.35848932349315110191 -1.6086845582351907424 1.4302318169981078633 -1.4824285164902180068 -1.5021331779425064479 2.6652534655325181845 0.29483673878276756009 -1.6369699194105833406;-0.33399142005472964856 0.36110851896156503926 0.0030804471313138790875 3.6149372332622435877 -0.36661987635432252697 1.7184446288837051942 -3.2811693897056057878 -1.5155447776496426826 0.12755569776929095993 0.45073681738179283141;2.3128477358761565519 0.1050061500475059223 -2.2392636513703267909 -0.73637311719940179433 1.3310648866408389956 -3.6327201624518199452 1.8289723897255028007 -1.1760093407612270955 -0.12848167518137035281 0.86571643415027854651];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},1); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    X{1,ts} = X{1,ts}';
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = softmax_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Output 1
    Y{1,ts} = a2;
    Y{1,ts} = Y{1,ts}';
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
    Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Competitive Soft Transfer Function
function a = softmax_apply(n,~)
if isa(n,'gpuArray')
    a = iSoftmaxApplyGPU(n);
else
    a = iSoftmaxApplyCPU(n);
end
end
function a = iSoftmaxApplyCPU(n)
nmax = max(n,[],1);
n = bsxfun(@minus,n,nmax);
numerator = exp(n);
denominator = sum(numerator,1);
denominator(denominator == 0) = 1;
a = bsxfun(@rdivide,numerator,denominator);
end
function a = iSoftmaxApplyGPU(n)
nmax = max(n,[],1);
numerator = arrayfun(@iSoftmaxApplyGPUHelper1,n,nmax);
denominator = sum(numerator,1);
a = arrayfun(@iSoftmaxApplyGPUHelper2,numerator,denominator);
end
function numerator = iSoftmaxApplyGPUHelper1(n,nmax)
numerator = exp(n - nmax);
end
function a = iSoftmaxApplyGPUHelper2(numerator,denominator)
if (denominator == 0)
    a = numerator;
else
    a = numerator ./ denominator;
end
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end
