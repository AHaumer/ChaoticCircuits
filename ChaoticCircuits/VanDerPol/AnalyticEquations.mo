within ChaoticCircuits.VanDerPol;
model AnalyticEquations "van der Pol equations"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter Real mu=0.2 "Damping";
  parameter Real A=1.0 "Amplitude of excitation";
  parameter Real w=1.2 "Frequency of excitation";
  parameter SI.AngularVelocity w0=2*pi*1000 "Time scaling / natural eigen frequency";
  //initial values
  parameter Real x0=2 "Initial value of x";
  parameter Real y0=-1/7.5 "Initial value of y";
  parameter Real z0=0 "Initial value of z";
  //shortcut to results
  Real e=A*sin(w*w0*time) "Excitation";
  Real x(start=x0, fixed=true) "Result: prop. i";
  Real y(start=y0, fixed=true) "Result: prop. der(i)";
  Real z(start=z0, fixed=true) "Result: prop. vc";
equation
  der(x)/w0=y;
  der(y)/w0=mu*(1 - x^2)*y - x + e;
  der(z)/w0=x;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={
                      Text(
          extent={{-80,30},{80,-30}},
          textColor={0,0,255},
          textString="A = 0 autononmous
A = 0.45 chaotic
A = 1.00 periodic",
          horizontalAlignment=TextAlignment.Left)}),
    experiment(
      StopTime=0.2,
      Interval=0.2e-5,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end AnalyticEquations;
