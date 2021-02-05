% Laplace Equation by Iteration

nx = 100;
ny = 100;
ni = 10;
V = zeros(nx,ny);

% dx = [V(j-1,k) -2*V(j,k) + V(j+1,k)]/4;
% dy = [V(j,k-1) -2*V(j,k) + V(j,k+1)]/4;

SidesToZero = 0;
for i = 1:ni
    
    for j = 2:nx-1    % Skipping BC rows/columns
        for k = 2:ny-1
            
%             if j==1 || k==1 || j==nx || k==ny
%                 V(j,k) = V(j,k);
%             else
%                 V(j,k) = mean(V(j-1,k) + V(j,k-1) +...
%                 V(j+1,k) + V(j,k+1));
%             end 

            V(:,1) = 1; %sets first column to 1
            V(:,ny) = 1; %sets last column to 1
            V(1,:) = 0; %sets top row to 0
            V(nx,:) = 0; %sets bottom row to 0
    
             V(j,k) = mean(V(j-1,k) + V(j,k-1) +...
                V(j+1,k) + V(j,k+1));
            
        end        
    end
    
    if mod(i,5) == 0
       figure(1)
       surf(V')
       pause(0.05)
    end
                      
end

[Ex,Ey] = gradient(V);

figure(2)
quiver(-Ey',-Ex',10)



