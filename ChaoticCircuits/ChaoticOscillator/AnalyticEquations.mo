within ChaoticCircuits.ChaoticOscillator;
model AnalyticEquations
  "A simple chaotic oscillator for educational purposes"
  extends Modelica.Icons.Example;
  import Modelica.Utilities.Streams.print;
  //time constant and dimensionless parameters
  parameter SI.Current I0=Vs/R0 "Estimated supply current";
  parameter SI.Time Tau=sqrt(L*C) "Time constant";
  parameter SI.Impedance Z=sqrt(L/C) "Characteristic impedance (rho)";
  parameter Real k=Z/R*a + 1 + RL/R "Amplification";
  parameter Real a=0.85;
  parameter Real b=Z*I0/nVt;
  parameter Real c=Z*Ids/nVt;
  parameter Real e=Cs/C "epsilon";
  //components
  parameter SI.Resistance R =1.0e3 "Resistor r";
  parameter SI.Resistance R1=10.e3 "Resistor r1";
  parameter SI.Resistance R2=R1*(k - 1) "Resistor r2 (tunable)";
  parameter SI.Resistance R0=20.e3 "Resistor r0";
  parameter SI.Voltage Vs=12 "Supply voltage";
  parameter SI.Inductance L=100e-3 "Inductor";
  parameter SI.Resistance RL=50 "Resistance of Inductor";
  parameter SI.Capacitance C =100e-9 "Capacitor c";
  parameter SI.Capacitance Cs=15.e-9 "Capacitor c*";
  //diode
  parameter SI.Current Ids=1e-9 "Diode: saturation current";
  parameter SI.Voltage nVt=2*26e-3 "Diode: n * voltage equivalent of temperature";
  //shortcut to results
  Real x(start=0, fixed=true) "Result capacitor.v / nVt";
  Real y(start=0, fixed=true) "Result inductor.i *Z/nVt";
  Real z(start=0, fixed=true) "Result c*.v / nVt";
equation
  Tau*der(x) = y;
  Tau*der(y) = a*y - x - z;
  Tau*e*der(z) = b + y - c*(exp(z) - 1);
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-80,20},{80,-20}},
          textColor={0,0,255},
          textString="a = 0.85 periodic
a = 0.40 chaotic")}));
end AnalyticEquations;
