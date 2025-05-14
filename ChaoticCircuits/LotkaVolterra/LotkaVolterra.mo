within ChaoticCircuits.LotkaVolterra;
model LotkaVolterra "n-dimensional Predator-Prey model"
  extends Modelica.Icons.Example;
  replaceable ParameterSets.PredatorPrey                                    data
    constrainedby ChaoticCircuits.LotkaVolterra.ParameterSets.PredatorPrey
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,
            20},{10,40}})));
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
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.LotkaVolterra\">enclosing subpackage</a>.</p>
</html>"),
    Diagram(graphics={Text(
          extent={{-100,0},{100,-20}},
          textColor={0,0,255},
          textString="2-dimensional parameter set PredatorPrey leads to periodic results.
4-dimensional parameter set LotkaVolterra leads to chaotic results.")}));
end LotkaVolterra;
