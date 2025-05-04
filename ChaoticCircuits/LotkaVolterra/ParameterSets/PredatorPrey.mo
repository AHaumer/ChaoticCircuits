within ChaoticCircuits.LotkaVolterra.ParameterSets;
record PredatorPrey "2-dim. Lotka-Volterra"
  extends Modelica.Icons.Record;
  parameter String id="Predator-Prey";
  parameter Integer n(final min=2)=2 "Number of species";
  parameter Real r[n]={0.04, -0.09} "Reproduction rate";
  parameter Real a[n, n]={{0, 0.0125},
                          {1/1800, 0}} "Competition matrix";
  parameter Real x0[n]={700, 10} "Initial conditions";
  annotation(defaultComponentPrefixes="paramdeter", defaultComponentName="data",
    Icon(graphics={Text(
          extent={{-100,-20},{100,-40}},
          textColor={0,0,255},
          textString="%id")}));
end PredatorPrey;
