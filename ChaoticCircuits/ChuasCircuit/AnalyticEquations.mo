within ChaoticCircuits.ChuasCircuit;
model AnalyticEquations "Chua's chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance RL=14 "Resistance of Inductor";
  parameter SI.Resistance R=1.9e3 "Resistor";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  //Nonlinearity
  parameter SI.Conductance Ga=757.0e-6;
  parameter SI.Conductance Gb=408.7e-6;
  parameter SI.Voltage Ve=1.166;
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
  Tau1*der(v1)  =  v2 - v1 + R*g*v1;
  g = if abs(v1) > Ve then Gb + (Ga - Gb)*Ve/abs(v1) else Ga;
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06));
end AnalyticEquations;
