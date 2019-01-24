function [AI2out,y] = supplier(tspan,IPTGLuxS,IPTGMtn)
iOD600 = 0.5;
mu = 0.01;
Kd =  0.02;
Ki = 0.9;
Knat = 0.1;
kin = 0.0008;
kout = 0.045;
kp = 0.009;
ks = 0.008;
km = 0.009;
iAI2out = 50;
iAI2in = 0;
iSRH = 0;
SAH = 0.08;
protein = @(t,IPTG) (iOD600.*exp(-Kd.*t).*(exp((mu+Kd).*t)-1).*(IPTG*Ki+Knat))./(mu+Kd);
LuxS = @(t) protein(t,IPTGLuxS);
Mtn = @(t) protein(t,IPTGMtn*0.1);
[t,y] = ode45(@(t,y) impl(t,y),tspan,[iAI2out iAI2in iSRH]);
AI2out = y(:,1);
    function dydt = impl(t,y)
    dydt = zeros(3,1);
    dydt(1) = -kin*y(1)+kout*y(2);
    dydt(2) = kin*y(1)-kout*y(2)-kp*y(2)+ks*LuxS(t)*y(3);
    dydt(3) = km*Mtn(t)*SAH;
    %dydt(1) = -kin*y(3)*y(1)+kout*y(2);
    %dydt(2) = kin*y(3)*y(1)-kout*y(2)-kp*y(4)*y(2);
    %dydt(3) = (knat+ki*IPTGLuxS)*exp(t*mu)*iOD600-kd*y(3);
    %dydt(4) = (knat+ki*IPTGK)*exp(t*mu)*iOD600-kd*y(4);
    end
end

