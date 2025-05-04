within ChaoticCircuits.LorenzSystsem;
model AnalyticEquations "Lorenz equations for atmospheric convection"
  extends Modelica.Icons.Example;
  parameter Real sigma=10 "Prandtl";
  parameter Real rho=28 "Rayleigh";
  parameter Real beta=1/3 "height of fluid: try 8/30 for periodic solution";
  //shortcut to results
  Real x(start=0.001, fixed=true) "Result: rate of convection";
  Real y(start=0.001, fixed=true) "Result: horizontal temperature variation";
  Real z(start=0.001, fixed=true) "Result: vertical temperature variation";
equation
  der(x) = sigma*(y - x);
  der(y) = x*(rho - z) - y;
  der(z) = x*y - beta*z;
  annotation (experiment(
      StopTime=100,
      Interval=0.01,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end AnalyticEquations;
