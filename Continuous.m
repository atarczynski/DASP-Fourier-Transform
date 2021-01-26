function FrTr=Continuous(Signal,Interval,Freq,varargin)
% FrTr=Continuous(Signal, Interval, Freq)
% Calculates Fourier Transform of a truncated signal.
%       Input
% Signal - handle function producing samples of the signal at specified
%          time instants. This function is called only ones with the vector
%          of all sampling instatns as the argument. The units of the
%          sampling instants must be the same as for definign the Interval
% Interval-Is a two element vector defining the interval to which the
%          processed signal is truncated
% Freq -   is a vector of frequencies for which the Fourier transform is
%          to be estimated. The frequencies must use unit that is inverse
%          of the unit used for defining Interval, i.e. s & Hz, ms & kHz
%          etc. 
% varargin-list of additional arguments that would be used by the numerical
%          integration function. It can be used to set up waypoints,
%          AbsTol, and ReTol. The ArrayValued parameter is set
%          automatically
% Created by Andrzej Tarczynski on 23/01/2021
%
fun=@(t)Signal(t).*exp(-2j*pi*Freq*t);
ArVal=length(Freq(:))>1;
FrTr=integral(fun,Interval(1),Interval(2),'ArrayValued',ArVal,varargin{:});