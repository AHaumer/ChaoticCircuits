within ChaoticCircuits.MathematicalModels;
model Roessler "Roessler system"
  extends Modelica.Icons.Example;
  parameter Real a=0.2 "Coefficient a";
  parameter Real b=0.2 "Coefficient b";
  parameter Real c=1.0 "Coefficient c=5.7 for chaos";
  //shortcut to results
  Real x(start=0.001, fixed=true) "Result x";
  Real y(start=0.001, fixed=true) "Result y";
  Real z(start=0.001, fixed=true) "Result z";
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
<a href=\"https://en.wikipedia.org/wiki/R%C3%B6ssler_attractor\">Wikipedia: Roessler attractor</a>
</p>
<p>
Note: For <code>c = 1</code> periodic solutions are obtained. 
      For <code>c = 5.7</code> chaotic solutions are obtained. 
</p>
</html>"));
end Roessler;
