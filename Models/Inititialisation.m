Longitude = 0;
Latitude = 0;
DayNum = 0;
TimeDiff = 0;
Radius = 50;
Solar_Constant = 1367;
LID = 35;

T_ref = 25+273.15;
R_s = 0.47804;
R_p = 65.4647;
n = 0.64611;
V_oc = 32.9;
k_Boltz = 1.380649e-23;
I_sc = 8.21;
G_ref = 1000;
q = 1.60217663e-19;
K_Isc = 0.0032;
K_Vsc = -0.1230;
NumSeries = 1;
Num_Paral = 1;
CellNum = 54;
E_g = 1.1;
I_L = 8.3257;

simData = load('SimulationOutput.mat');
t = readmatrix("Location_Data_Updated.xlsx", Sheet=num2str(LID));
LookupR = readmatrix("Data_Out.xlsx", Sheet="Lookup")
EGlobal = t(2:25, 2:end);
T_avg = transpose(t(30,2:end));

%% Solar Tracker Parameters Initialization

% Copyright 2016-2023 The MathWorks, Inc.

%% Material Properties %%

colors    = simmechanics.demohelpers.colors;
densities = simmechanics.demohelpers.densities;

%% Support %%

support.columnRadius    = 0.05;  % m
support.columnThickness = 0.005; % m
support.columnHeight    = 0.9;   % m
support.baseWidth       = 0.2;   % m
support.baseThickness   = 0.02;  % m
support.density         = densities.aluminum;
support.color           = colors.grey;

%% Slew Drive %%

% Dimensions
slewdrive.wormLeadAngle     = 10;    % deg
slewdrive.wormLength        = 0.17;  % m
slewdrive.gearOuterRadius   = 0.1;   % m
slewdrive.gearInnerRadius   = 0.03;  % m
slewdrive.gearExposedRadius = 0.06;  % m
slewdrive.housingThickness  = 0.005; % m
slewdrive.ratio             = 50;

% Internal Mechanics
slewdrive.wormRevoluteDamping = 1e-6; % N*m/(deg/s)

% Material Properties
slewdrive.wormDensity    = densities.steel;
slewdrive.gearDensity    = densities.steel;
slewdrive.housingDensity = densities.aluminum;
slewdrive.wormColor      = colors.lgrey;
slewdrive.gearColor      = [0.6 0.6 0.6]; % [r g b]
slewdrive.housingColor   = [0.1 0.6 1.0]; % [r g b]
slewdrive.housingOpacity = 0.3;

%% Drive Connection %%

driveconn.connectionRadius    = 0.05;  % m
driveconn.connectionThickness = 0.005; % m
driveconn.connectionLength    = 0.03;  % m
driveconn.bracketWidthHeight  = 0.1;   % m
driveconn.bracketThickness    = 0.15;  % m
driveconn.holeRadius          = 0.02;  % m
driveconn.holeOffset          = 0.06;  % m
driveconn.baseThickness       = 0.01;  % m
driveconn.density             = densities.aluminum;
driveconn.color               = colors.grey;

%% Frame Mount %%

framemount.bracketWidthHeight = 0.1;  % m
framemount.bracketThickness   = 0.01; % m
framemount.bracketOffset      = 0.18; % m
framemount.holeRadius         = 0.02; % m
framemount.holeOffset         = 0.06; % m
framemount.baseThickness      = 0.01; % m
framemount.density            = densities.aluminum;
framemount.mountColor         = colors.grey;
framemount.pinColor           = colors.dgrey;

%% Frame %%

frame.width          = 1;     % m
frame.height         = 1.4;   % m
frame.depth          = 0.1;   % m
frame.beamWidth      = 0.05;  % m
frame.beamThickness  = 0.01;  % m
frame.frameWidth     = 0.02;  % m
frame.frameThickness = 0.005; % m
frame.density        = densities.aluminum;
frame.beamColor      = colors.grey;
frame.frameColor     = colors.lgrey;

%% Solar Panel %%

solarpanel.width        = frame.width;
solarpanel.height       = frame.height;
solarpanel.frameWidth   = 0.02;      % m
solarpanel.frameDepth   = 0.01;      % m
solarpanel.cellDensity  = 100;       % kg/m^3
solarpanel.frameDensity = 950;       % kg/m^3
solarpanel.cellColor    = [0 0 0.5]; % [r g b]
solarpanel.frameColor   = colors.vlgrey;

%% Tracker Offsets %%

tracker1_offset = [0   0 0]; % m
tracker2_offset = [1.5 0 0]; % m
tracker3_offset = [3   0 0]; % m

%% Panel Revolute %%

panelrevolute.q0 = -60; % deg

%% Pitch Signal %%

pitchsignal.t_c = 0.2; % s

%% Yaw Signal %%

yawsignal.t_c = 0.2; % s
