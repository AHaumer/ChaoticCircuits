within ChaoticCircuits.MathematicalModels;
model Lorenz "Lorenz equations for atmospheric convection"
  extends Modelica.Icons.Example;
  parameter Real sigma=10 "Prandtl";
  parameter Real rho=28 "Rayleigh";
  parameter Real beta=8/3 "height of fluid: try 8/30 for periodic solution";
  Real x(start=0.001, fixed=true);
  Real y(start=0.001, fixed=true);
  Real z(start=0.001, fixed=true);
equation
  der(x) = sigma*(y - x);
  der(y) = x*(rho - z) - y;
  der(z) = x*y - beta*z;
  annotation (experiment(
      StopTime=100,
      Interval=0.01,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>
<a href=\"http://en.wikipedia.org/wiki/Lorenz_attractor\">Wikipedia: Lorenz attractor</a>
</p>
</html>"));
end Lorenz;
