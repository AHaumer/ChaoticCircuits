within ChaoticCircuits.ChuasCircuit;
model AnalyticEquations "Chua's chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance RL=14 "Resistance of Inductor";
  parameter SI.Resistance R=1850 "Resistor";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  //Nonlinearity
  parameter ParameterSets.ChuaData chuaData
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
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
  g = if abs(v1)>chuaData.Vp then (chuaData.Ga - chuaData.Gb)*chuaData.Ve/abs(v1) + (chuaData.Gb - chuaData.Gc)*chuaData.Vp/abs(v1) + chuaData.Gc else
      if abs(v1)>chuaData.Ve then (chuaData.Ga - chuaData.Gb)*chuaData.Ve/abs(v1) + chuaData.Gb else chuaData.Ga;
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ChuasCircuit\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-80,20},{80,-20}},
          textColor={0,0,255},
          textString="Path to chaos: R = {1850, 1800, 1750} Ohm")}));
end AnalyticEquations;
