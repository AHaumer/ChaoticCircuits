within ChaoticCircuits.MathematicalModels;
model Lorenz "Lorenz equations for atmospheric convection"
  extends Modelica.Icons.Example;
  parameter Real a=0.2 "Coefficient a";
  parameter Real b=0.2 "Coefficient b";
  parameter Real c=5.7 "Coefficient b";
  Real x(start=0.001, fixed=true);
  Real y(start=0.001, fixed=true);
  Real z(start=0.001, fixed=true);
equation
  der(x) = -y - z;
  der(y) = x + a*y;
  der(z) = b + (x - c)*z;
  annotation (experiment(
      StopTime=1000,
      Interval=0.1,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>
<a href=\"http://en.wikipedia.org/wiki/Lorenz_attractor\">Wikipedia: Lorenz attractor</a
</p>
</html>"));
end Lorenz;
