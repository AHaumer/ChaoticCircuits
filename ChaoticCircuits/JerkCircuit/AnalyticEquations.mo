within ChaoticCircuits.JerkCircuit;
model AnalyticEquations "The Jerk equation"
  extends Modelica.Icons.Example;
  parameter Real A=0.3 "Parameter to be varied";
  parameter Real R=1e3 "Resistance";
  parameter Real Ids=1e-12 "Diode: saturation current";
  parameter Real nVt=26e-3 "Diode: n * voltage equivalent of temperature";
  parameter Real kt=1e3 "Time scaling";
  //shortcut to results
  Real x(start=0.001, fixed=true) "Result: x";
  Real y(start=0.001, fixed=true) "Result: y=der(x)";
  Real z(start=0.001, fixed=true) "Result: z=der(y)";
equation
  der(x)/kt=y;
  der(y)/kt=z;
  der(z)/kt=-A*z - R*Ids*(exp(y/nVt) - 1) - x;
  annotation (experiment(
      StopTime=1.0,
      Interval=1e-5,
      Tolerance=1e-06), Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.JerkCircuit\">enclosing subpackage</a>.</p>
</html>"),
    Diagram(graphics={Text(
          extent={{-80,20},{80,-20}},
          textColor={0,0,255},
          textString="A = 0.3 periodic
A = 1.0 chaotic")}));
end AnalyticEquations;
