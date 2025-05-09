within ChaoticCircuits.ChuasCircuit;
model AnalyticEquations "Chua's chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance RL=14 "Resistance of Inductor";
  parameter SI.Resistance R=1.9e3 "Resistor";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  //Nonlinearity
  parameter SI.Voltage Vs=12 "Supply voltage";
  parameter SI.Resistance R1 = 220 "NIC1: feedback resistor";
  parameter SI.Resistance R1g=2200 "NIC1: ground resistor";
  parameter SI.Resistance R2 =22e3 "NIC2: feedback resistor";
  parameter SI.Resistance R2g=3300 "NIC2: ground resistor";
  //calculated parameters
  parameter SI.Voltage VLim1=Vs*R1g/(R1g + R1) "NIC1: Left and right corner voltage";
  parameter SI.Conductance gPos1=1/R1 "NIC1: Positive differential conductance";
  parameter SI.Conductance gNeg1=-1/R1g "NIC1: Negative differential conductance";
  parameter SI.Voltage VLim2=Vs*R2g/(R2g + R2) "NIC2: Left and right corner voltage";
  parameter SI.Conductance gPos2=1/R2 "NIC2: Positive differential conductance";
  parameter SI.Conductance gNeg2=-1/R2g "NIC2: Negative differential conductance";
  parameter SI.Voltage Ve=min(VLim1, VLim2) "Inner limit";
  parameter SI.Conductance Ga=gNeg1 + gNeg2 "Inner slope";
  parameter SI.Conductance Gb=if VLim1<VLim2 then gPos1 + gNeg2 else gNeg1 + gPos2 "Intermedita slope";
  parameter SI.Conductance Gc=gPos1 + gPos2 "Outer slope";
  parameter SI.Voltage Vp=max(VLim1, VLim2) "Voltage peak";
  //Time constants
  parameter SI.Time TauL = L/RL;
  parameter SI.Time Tau1 = R*C1;
  parameter SI.Time Tau2 = R*C2;
  //shortcut to results and initialization
  SI.Voltage v1(start=0, fixed=true) "Result c1.v";
  SI.Voltage v2(start=1e-3, fixed=true) "Result c2.v";
  SI.Voltage vRL(start=0, fixed=true) "Result RL*L.i";
  SI.Conductance g;
equation
  TauL*der(vRL) =  v2 - vRL;
  Tau2*der(v2)  = -v2 + v1 - R/RL*vRL;
  Tau1*der(v1)  =  v2 - v1 - R*g*v1;
  g = if abs(v1)>Vp then (Ga - Gb)*Ve/abs(v1) + (Gb - Gc)*Vp/abs(v1) + Gc else
         if abs(v1)>Ve then (Ga - Gb)*Ve/abs(v1) + Gb else Ga;
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-80,20},{80,-20}},
          textColor={0,0,255},
          textString="R = 1900 Ohm periodic
R = 1500 Ohm chaotic")}));
end AnalyticEquations;
