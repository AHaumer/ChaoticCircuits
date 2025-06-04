within ChaoticCircuits.ChuasMemristor;
model AnalyticEquations "Chua's chaotic Circuit with memristor"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance R=1800 "Resistor";
  parameter SI.Capacitance C1=6.8e-9 "Capacitor 1";
  parameter SI.Capacitance C2=68.e-9 "Capacitor 2";
  parameter Real alpha=-0.667e-3 "Coefficient alpha of conductance";
  parameter Real beta = 0.029e-3 "Coefficient beta  of conductance";
  parameter SI.MagneticFlux PhiRef=8200*47e-9/10 "Flux scaling parameter";
  //shortcut to results
  SI.Voltage v1(start=0, fixed=true)       "Result c1.v";
  SI.Voltage v2(start=1e-3, fixed=true)    "Result c2.v";
  SI.Current iL(start=0, fixed=true)       "Result iL";
  SI.Current iM "Aux. Result iM";
  SI.MagneticFlux phi(start=0, fixed=true) "Result memristor flux";
equation
  v2 = L*der(iL);
  C2*der(v2) + iL + (v2 - v1)/R = 0;
  C1*der(v1) + iM - (v2 - v1)/R = 0;
  iM = (alpha + 3*beta*(phi/PhiRef)^2)*v1;
  der(phi) = v1;
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ChuasMemristor\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-96,100},{94,68}},
          textColor={0,0,255},
          textString="Path to chaos: R = {1800, 1850, 1900, 1950, 2000} Ohm")}));
end AnalyticEquations;
