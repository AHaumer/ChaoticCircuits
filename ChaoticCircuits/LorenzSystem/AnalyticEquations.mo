within ChaoticCircuits.LorenzSystem;
model AnalyticEquations "Lorenz equations for atmospheric convection"
  extends Modelica.Icons.Example;
  parameter Real sigma=10 "Prandtl";
  parameter Real rho=28 "Rayleigh";
  parameter Real beta=1/3 "height of fluid: try 8/3 for chaotic solution";
  //scaling
  parameter SI.Time Tau=1 "Scaling time";
  //shortcut to results
  Real x(start=0.001, fixed=true) "Result: rate of convection";
  Real y(start=0.001, fixed=true) "Result: horizontal temperature variation";
  Real z(start=0.001, fixed=true) "Result: vertical temperature variation";
equation
  Tau*der(x) = sigma*(y - x);
  Tau*der(y) = x*(rho - z) - y;
  Tau*der(z) = x*y - beta*z;
  annotation (experiment(
      StopTime=100,
      Interval=0.01,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"),
    Diagram(graphics={Text(
          extent={{-80,20},{80,-20}},
          textColor={0,0,255},
          textString="beta = 1/3 periodic
beta = 8/3 chaotic")}));
end AnalyticEquations;
