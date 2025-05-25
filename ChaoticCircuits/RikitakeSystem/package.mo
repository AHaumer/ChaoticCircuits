within ChaoticCircuits;
package RikitakeSystem "Rikitake two-disc dynamo"
  extends Modelica.Icons.ExamplesPackage;

  annotation (Documentation(info="<html>
<p>
This is an implementation of the RIkitake system as described in
<a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Rikitake1958] </a> and 
<a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Rikitake1973] </a>.
</p>
<p>
The system proposed by Rikitake has been used to explain irregular reversals of the Earth’s magnetic ﬁeld.<br>
Two identical disc dynamos are coupled magnetically.
</p>
<p>
Plot x1 vs. x2. <br>
Default parameter <code>mu = 0.4</code> shows periodic results. <br>
Change  parameter <code>mu = 0.6</code> to obtain periodic results with another shape. <br>
Change  parameter <code>mu = 0.8</code> to obtain chaotic results. 
</p>
</html>"));
end RikitakeSystem;
