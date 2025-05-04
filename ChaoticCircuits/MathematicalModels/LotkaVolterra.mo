within ChaoticCircuits.MathematicalModels;
model LotkaVolterra "n-dimensional Predator-Prey model"
  extends Modelica.Icons.Example;
  replaceable ChaoticCircuits.ParameterSets.LotkaVolterraVano data
    constrainedby ChaoticCircuits.ParameterSets.LotkaVolterra2D
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,20},{10,40}})));
  final parameter Integer n=data.n "Number of species";
  Real x[n](start=data.x0, each fixed=true) "Species";
equation
  for i in 1:n loop
    der(x[i])=data.r[i]*x[i]*(1 - sum({data.a[i,j]*x[j] for j in 1:n}));
  end for;
  annotation (
    experiment(
      StopTime=1000,
      Interval=0.1,
      Tolerance=1e-06), Documentation(info="<html>
<p>
<a href=\"https://en.wikipedia.org/wiki/Competitive_Lotka%E2%80%93Volterra_equations\">Wikipedia: Competitive Lotka-Volterra equations</a>
</p>
<p><strong>References:</strong></p>
<ul>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Vano2006] </a></li>
</ul>
</html>"));
end LotkaVolterra;
