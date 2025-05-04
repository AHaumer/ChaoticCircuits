within ChaoticCircuits.MathematicalModels;
model LotkaVolterra2D "2-dimensional Predator-Prey model"
  extends Modelica.Icons.Example;
  parameter Real hares_growth=0.04 "Natural growth rate of hares";
  parameter Real hares_deathr=0.0005 "Death rate of hares due to foxes";
  parameter Real foxes_growth=0.1 "Efficiency in growing foxes from hares";
  parameter Real foxes_deathr=0.09 "Natural death rate of foxes";
  //shortcut to results
  Real hares(start=700, fixed=true) "Number of hares";
  Real foxes(start= 10, fixed=true) "Number of foxes";
equation
  der(hares) = hares_growth*hares - hares_deathr*hares*foxes;
  der(foxes) = foxes_growth*hares_deathr*hares*foxes - foxes_deathr*foxes;
  annotation (
    experiment(
      StopTime=1000,
      Interval=1,
      Tolerance=1e-06), Documentation(info="<html>
<p>
<a href=\"https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations\">Wikipedia: Lotka-Volterra equations</a>
</p>
<p>
Note: For predator-prey models up to 3 species no chaotic solutions are possible.
</p>
</html>"));
end LotkaVolterra2D;
