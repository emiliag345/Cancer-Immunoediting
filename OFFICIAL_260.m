clear;
    t0=0.00;            
    tEnd=30;       
    dt=0.001;             
    T=[t0:dt:tEnd]; 
    
    n=floor((tEnd-t0)/dt);
    NumVar = 5;
    NumActive = 1;
    probreset = 0.001 * 1/1000;
    prob = probreset;
    escaped = false;
    
    IndCancer = zeros(n+1,NumVar);
    IndImmune = zeros(n+1,NumVar);
    dead = zeros(NumVar,1);

    IndCancer(1) = 1;
    IndImmune(1001) = 1;
   
    CancerGrowthMat = zeros(NumVar,1);
    CancerSensitivityMat = zeros(NumVar,1);
    for i=1:NumVar
        raw = i + 1 + randn/2;
        CancerGrowthMat(i) = raw / 2;
        raw = NumVar + randn/2 - i;
        CancerSensitivityMat(i) = raw / 10;
    end
    for i=1:n
        if escaped == true
            break;
        end
        for j=1:NumActive
            % Cancer
            if dead(j) == 0
                if IndCancer(i,j) > 10000
                    escaped = true;
                end
                
                CancerGrowth = CancerGrowthMat(j) * (IndCancer(i,j) * (1 - IndCancer(i,j) / 20000));
                CancerKillRate = CancerSensitivityMat(j) * IndCancer(i,j) * IndImmune(i,j);
            
                if IndCancer(i,j) < 0.1
                    dead(j) = 1;
                end
                
                dCancer = CancerGrowth - CancerKillRate;
                IndCancer(i+1,j) = IndCancer(i,j)+dt*dCancer;
                
            end
            
            % Immune
            if i > 1000;
                ImmuneGrowth = IndCancer(i-1000,j) * (1 - IndImmune(i,j) / 1500);
                ImmuneKilledbyCancer = -0.0001 * IndCancer(i,j);
                ImmuneDies = -0.3 * IndImmune(i,j);
                
                dImmune = ImmuneGrowth + ImmuneKilledbyCancer + ImmuneDies;
                IndImmune(i+1,j) = IndImmune(i,j)+dt*dImmune;
            end
        end
        
        % Spawn
        if NumActive < NumVar
            prob = prob + ((1/10000) * 1/1000);
            if rand < prob
                prob
                NumActive = NumActive + 1;
                prob = probreset;
                IndCancer(i+1, NumActive) = 0.2;
                IndImmune(i+1, NumActive) = 0.2;
            end
        end
    end


figure(1)
clf;
hold on
for i=1:NumVar
   semilogy(T,IndCancer(:,i), '--', T,IndImmune(:,i));
end
  % axis([0 30 0 1000])
  legend('Tumor growth', 'Immune cell growth')
  xlabel('Time')
  ylabel('Growth')
  xlim([0 30])

figure(2);
TotalCancer = sum(IndCancer');
TotalImmune = sum(IndImmune');
semilogy(T,TotalCancer, T, TotalImmune);
legend('Total Tumor', 'Total Immunity')
xlabel('Time')
ylabel('Total cell number')
ylim([10^0 10^5])