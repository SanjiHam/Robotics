function Brobot_simulation()
clf
clc

%% Plot Brobot          
scale = 0.5;
workspace = [-1.2 1.2 -1.2 1.2 -0.6 1]; %boundary of the working environment 

Brobot = plotBrobot;
T = transl(0.25,0,0.15);
q = Brobot.ikcon(T);

Brobot.plot(q,'workspace',workspace,'scale',scale); %plotting the robot
hold on;
%% SAFETY FEATURES
%Laser
laser;

%Stop Button
stopButton;

%Object Placement
[f,v,data] = plyread('stop.ply','tri');
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue]/255;
hold on;
for zOffset = [-0.05073,-0.05073]
    for xOffset =  [0,0]  
        for yOffset = [0.25,0.25]
            trisurf(f,v(:,1)+ xOffset,v(:,2)+ yOffset,v(:,3) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

%Fire Extinguisher
fireExtinguisher;

hold on;

%Caution Poster
cautionPoster;

%% BACKGROUND
% Walls & Floor
room;

%Table 
[f,v,bottomH] = plyread('table.ply','tri');

%Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [bottomH.vertex.red, bottomH.vertex.green, bottomH.vertex.blue] / 255;

for zOffset = [-.15, -.15]
    for yOffset = [0, 0]
    platform_h = trisurf(f,v(:,1),v(:,2)+yOffset, v(:,3) + zOffset ...
        ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
    end
end
hold on;

%% Movement
% s = 20;
% T1 = transl(-0.25,0.18,0.15);
% q1 = Brobot.ikcon(T1);
% qMatrix = jtraj(q,q1,s);
% Brobot.animate(qMatrix);
% 
% T2 = transl(-0.25,0.18,0.05);
% q2 = Brobot.ikcon(T2);
% qMatrix = jtraj(q1,q2,s);
% Brobot.animate(qMatrix);
% 
% T3 = transl(-0.25,0.18,0.15);
% q3 = Brobot.ikcon(T3);
% qMatrix = jtraj(q2,q3,s);
% Brobot.animate(qMatrix);
% 
% T4 = transl(0.22,0.15,0.15);
% q4 = Brobot.ikcon(T4);
% qMatrix = jtraj(q3,q4,s);
% Brobot.animate(qMatrix);
% 
% T5 = transl(0.22,0.15,0.05);
% q5 = Brobot.ikcon(T5);
% qMatrix = jtraj(q4,q5,s);
% Brobot.animate(qMatrix);
% 
% T6 = transl(0.22,0.15,0.15);
% q6 = Brobot.ikcon(T6);
% qMatrix = jtraj(q5,q6,s);
% Brobot.animate(qMatrix);

end