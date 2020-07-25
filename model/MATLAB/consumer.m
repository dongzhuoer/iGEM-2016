function [AI2out,y] = consumer(tspan,IPTGACDB,IPTGFG,IPTGK)
if IPTGACDB
    iOD600 = 0.5;
    mu = 0.0056;
else  
    iOD600 = 0.5;
    mu = 0.0044;
end
Kd =  0.02;
Ki = 0.9;
Knat = 0.1;
kin = 0.008;
kout = 0.045;
kp = 0.009;
kq = 0.009;
kd = 0.02;
iAI2out = 50;
iAI2in = 0;
iAI2P = 0;
protein = @(t,IPTG) (iOD600.*exp(-Kd.*t).*(exp((mu+Kd).*t)-1).*(IPTG*Ki+Knat))./(mu+Kd);
ACDB = @(t) protein(t,IPTGACDB);
FG = @(t) protein(t,IPTGFG);
K = @(t) protein(t,IPTGK);
[t,y] = ode45(@(t,y) impl(t,y),tspan,[iAI2out iAI2in iAI2P]);
AI2out = y(:,1);
    function dydt = impl(t,y)
    dydt = zeros(3,1);
    dydt(1) = -kin*ACDB(t)*y(1)+kout*y(2);
    dydt(2) = kin*ACDB(t)*y(1)-kout*y(2)-kp*K(t)*y(2)+kq*K(t)*y(3);
    dydt(3) = kp*K(t)*y(2)-kq*K(t)*y(3)-kd*FG(t)*y(3);
    %dydt(1) = -kin*y(3)*y(1)+kout*y(2);
    %dydt(2) = kin*y(3)*y(1)-kout*y(2)-kp*y(4)*y(2);
    %dydt(3) = (knat+ki*IPTGACDB)*exp(t*mu)*iOD600-kd*y(3);
    %dydt(4) = (knat+ki*IPTGK)*exp(t*mu)*iOD600-kd*y(4);
    end
end

