function [v, w] = calcVel(x, y, imgWidth, imgHeight)
    % Parameters
    centerX = imgWidth/2;  % Horizontal center of the image
    %maxAngularSpeed = 0.3;     % Maximum angular velocity (rad/s)
    %maxLinearSpeed = 0.2;    % Maximum linear velocity (m/s)
    
    % Proportional constants (tune these)
    angularGain = 0.005;  % Gain for angular velocity
    linearGain = 0.002;   % Gain for linear velocity
    
    % Horizontal deviation (for angular velocity)
    deltaX = x - centerX;  % How far is the blob from the center (x direction)

    % Calculate the angular velocity (w)
    w = -angularGain*deltaX;
        
    if deltaX < 100
        w = 0;
    end     
    
    % Limit the angular velocity to the maximum allowed
    %w = max(min(w, maxAngularSpeed), -maxAngularSpeed);
    
    % Calculate linear velocity (v)
    distanceFromBottom = imgHeight - y;  % How far is the blob from the bottom (y direction)
    
    % Linear velocity is proportional to how far the blob is vertically
    v = linearGain*distanceFromBottom;
    
    % Limit the linear velocity to the maximum allowed
    %v = min(v, maxLinearSpeed);
    
    % Stop if blob is very close
    if distanceFromBottom < 100  % Example: stop if too close
        v = 0;
        
    end
end
