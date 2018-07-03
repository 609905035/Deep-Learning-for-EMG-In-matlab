function varargout = simpleEMG(varargin)

% simpleEMG detects phasic activity in an electromyogramm 
%
% [activity]=simpleEMG(TIME,EMG [,minamp] [,statistic]); 
% TIME: column vector of time in milliseconds
% EMG: signal in any unit
% minamp: minimum amplitude of a phasic activity
% statistic (optional): statistical parameter (format: string) to compute
%                       of EMG event; Default: mean
%                       has to be a Matlab-defined function like median etc.
%
% [activity] contains the following columns:
% [start stop integral maximum_amplitude]
%
%************simple call*********************
% [activity]=simpleEMG(TIME,EMG); 
% opens a dialog box, where you set the minimum amplitude for an EMG event
% (blue line: filtered raw signal, red line: rectified raw signal)
% either mark section in raw signal or set threshold in rectified signal
%
%************call with minimum amplitude*********************
% [activity]=simpleEMG(TIME,EMG,minamp)
% no dialog box, as you named the minimum amplitude already
%
%************call with alternative statistic*********************
% [activity]=simpleEMG(TIME,EMG,'median')
% computes median of integral instead of mean
%
%************output options*********************
% [activity,varnames]=simpleEMG(TIME,EMG)
% additionally returns variable names as a cell array 
%
% [activity,varnames, minamp]=simpleEMG(TIME,EMG)
% also returns the selected minimum amplitude

% written by Robert Schleicher
% r *DOT* schleicher *AT* uni *MINUS* koeln *DOT* de 



time=varargin{1};
EMG=varargin{2};
minamp=[]; %not yet defined
statistic=@mean; %default statistic
gap=300; %accepted gap between consecutive peaks of 1 EMG reaction in ms
gap=gap/1000; %divide by 1000 as I use gap*SR to look ahead

%handle signal:remove NaNs
flag=~isnan(EMG);
EMG=EMG(flag); %remove NaNs 
time=time(flag);

SR=round(1000/nanmean(diff(time(1:100,1))));%Samplingrate...

%handle signal:filtering
[b,a] = butter(8,1/5,'high'); %worked for me to remove EOG interferences from orbicularis EMG
EMGfilt = filtfilt(b,a,EMG); 
EMGrec=abs(EMGfilt);

%%**************************************
%uncomment the following two lines if you want to use the envelope of your signal
%make sure you downloaded Envelope1.1 from Matlab file exchange before
%( see http://www.mathworks.com/matlabcentral/fileexchange/ )
%and put the file envelope.m in your working directory

%[up,down]=envelope(time,EMGrec); 
%EMGrec=up;

%%**************************************
%handle additional input parameters
if nargin>2
    switch nargin
    case 3
        if isnumeric(varargin{3}) %minimum amplitude given...
            minamp=varargin{3};
        else
            temp=varargin{4}; %could be statisticial function
        end            
    case 4
        minamp=varargin{3};
        temp=varargin{4}; %could be statisticial function    
    otherwise
    end 
    %check whether temp is a valid statistical function
    if exist('temp') && isstr(temp) %statistical parameter given
        if temp(1)=='@' %anonymous function given, e.g. '@(x)mean(x)*0.7' 
            eval(['temp=' temp ';']);           
        else %name of a function given
            temp=str2func(temp);            
        end
        if isa(temp,'function_handle');
            statistic=temp;        
        end
   end    
end 

%check whether to display GUI getlimit
if isempty(minamp);
    minamp=uigetlimit([time EMGfilt],EMGrec,'Specify Mininum EMG activity',...
    'Select area in raw signal (blue) or move limit in rectified signal (red)'...
    ,'max');
    if minamp(end)~=1
        disp('problem determining minimum amplitude')
        return
    end
    minamp=minamp(1);
    disp(['Minimum amplitude set to: ' num2str(minamp)]);
end



imax=size(EMGrec,1);%limit of while-loop
i=1;
%Output parameters
start=[];
stop=[];
integral=[];
max_amp=[];
%max_time=[]; %time point of max amp
while i<imax
    if EMGrec(i)<minamp
        i=i+1;
    else %event found
        j=i;
        flag=1;
        while flag==1
            while EMGrec(j)>=minamp 
                j=j+1; %find end;                
            end;
            flag=0;
            lookahead=round(j+(gap*SR)); %window to look ahead
            if lookahead>=imax
                lookahead=imax;
            end                
            nextone=max(find(EMGrec(j:lookahead)>=minamp)); %find last exceedance            
            if ~isempty(nextone)
                flag=1;
                j=j+nextone; %set j to first exceedance within lookahead-window                          
            end
        end
        start=[start;time(i)];
        stop=[stop;time(j)];
        integral=[integral;statistic(EMGrec(i:j))]; 
        max_amp=[max_amp;max(EMGrec(i:j))];
        %max_time=
        i=lookahead;
    end;
end;

%specify output
ret=[start stop integral max_amp];
varargout{1}=ret;
if nargout>1
    varargout{2}={'start';'stop';'integral';'max_amp'};
end
if nargout>2 %achtung, ggf. Parameter aktivieren
    varargout{2}=minamp;
    %varargout{3}=[rh lh];
end






f1=figure; %create new figure
h0=plot(time/1000, EMGrec,'b'); %filtered and rectified signal
hold;
a1=gca;
leg1=legend('filtered & rectified signal','Location','NorthWest');
a2=axes;
set(a2,'Color','none');
set(gca,'NextPlot','add')
l2=line([0 time(end)/1000],[minamp minamp],'Color','r');
for i=1:size(start,1)
    set(gca,'NextPlot','add')
    rh=fill([start(i) stop(i) stop(i) start(i)]/1000,...
            [0 0 integral(i) integral(i)],[0.6 0.6 0],'LineStyle',':','FaceAlpha',0.7);
    temp=(start(i)+(stop(i)-start(i))/2)/1000;
    lh=line([temp temp],[0 max_amp(i)],'Color','g');
end
leg2=legend('minimum activity',[func2str(statistic) ' integral'],'peak amplitude');
set(leg2,'Color','w')
linkaxes([a1 a2]);

