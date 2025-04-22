within ChaoticCircuits;
package ColpittsCircuit "The Colpitts Circuit"
  extends Modelica.Icons.ExamplesPackage;

   annotation (preferredView="info", Documentation(info="<html>
<p>
Colpitts' circuit is a simple nonlinear circuit which shows chaotic behaviour, based on a transistor.<br>
<strong>Note</strong>: There are different variants of the Colpitt's oscillator. The one used in this example is based on:
</p>
<ul>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Buscarino2014] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Kennedy1994] </a></li>
</ul>
<p>
Plot v1 vs. v2. <br>
Default parameter <code>R2 = 5000 &#8486;</code> (AnalyticEquations) resp. <code>R2 = 1000 &#8486;</code> (Improved Circuit) shows nearly periodic results, 
i.e. the result varies within a narrow band. It seems that this circuit is extremely sensible. <br>
Change parameter <code>R1 = 500 &#8486;</code> to obtain chaotic results. 
</p>
<p><b>Note</b> that initial condition = 0 is sufficient!</p>
<p><b>Note</b>: The AnalyticEquation and the IdealCircuit use a simple transistor model according to the following equations:<br>
<code>i<sub>C</sub> = &beta;*i<sub>B</sub></code><br>
<code>R<sub>on</sub>*i<sub>B</sub> = if v<sub>BE</sub>&le;V<sub>th</sub> then 0 else (v<sub>BE</sub> - V<sub>th</sub>)</code>
</p>
</html>"));
end ColpittsCircuit;
