function [] = secondaryTray()
[f,v,data] = plyread('secondaryTray.ply','tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255)
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

% Then plot the trisurf
for zOffset = [-0.03073,-0.03073]
    for xOffset = [0.075, 0.075]
        for yOffset = [0.225, 0.225]
            tray_h = trisurf(f,v(:,1)+xOffset,v(:,2)+yOffset, v(:,3) + zOffset ...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end
hold on;

end