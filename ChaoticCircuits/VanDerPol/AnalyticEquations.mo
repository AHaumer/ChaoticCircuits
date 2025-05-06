within ChaoticCircuits.VanDerPol;
model AnalyticEquations "van der Pol equations"
  extends Modelica.Icons.Example;
  parameter Real mu=0.2 "Damping";
  parameter Real A=1.0 "Amplitude of excitation";
  parameter Real w=1.15 "Frequency of excitation";
  parameter Real kt=1000 "Time scaling";
  parameter Real x0=2 "Initial values of x";
  parameter Real y0=0 "Initial values of y";
  //shortcut to results
  Real x "Result: prop. i";
  Real y "Result: prop. der(i)";
initial equation
  x=x0;
  y=y0;
equation
  der(x)/kt=y;
  der(y)/kt=mu*(1 - x^2)*y - x + A*sin(w*time);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=1,
      Interval=1e-5,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end AnalyticEquations;
