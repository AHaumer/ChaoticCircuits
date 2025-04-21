within ChaoticCircuits;
package ColpittsCircuit "The Colpitts Circuit"
  extends Modelica.Icons.ExamplesPackage;

   annotation (preferredView="info", Documentation(info="<html>
<p>Colpitts' circuit is a simple nonlinear circuit which shows chaotic behaviour, based on a transistor.</p>
<p>
Plot v1 vs. v2. 
Default parameter <code>R2 = 5000 &#8486;</code> (AnalyticEquations) resp. <code>R2 = 1000 &#8486;</code> (Improved Circuit) shows periodic results. 
Change parameter <code>R1 = 500 &#8486;</code> to obtain chaotic results. 
</p>
<p><b>Note</b> that initial condition = 0 is sufficient!</p>
<p><strong>References:</strong></p>
<ul>
<ul>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Buscarino2014] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Kennedy1994] </a></li>
</ul>
</html>"));
end ColpittsCircuit;
