within ChaoticCircuits;
package ChuasCircuit "The Chua’s Circuit"
  extends Modelica.Icons.ExamplesPackage;

   annotation (preferredView="info", Documentation(info="<html>
<p>Chua&#39;s circuit is the most simple nonlinear circuit which shows chaotic behaviour. 
The circuit consists of linear basic elements (2 capacitors, resistor, inductor), and one nonlinear element, which is called Chua&#39;s diode.</p>
<p>Chua&#39;s diode behaves like a nonlinear resistor with 2 different slopes dv/di which are negative.
   It can be implemented with 2 operational amplifiers.
   You might try to vary the no-load amplification of the operational amplifiers.</p>
<p>
The inductor replacement uses 2 OpAmps, 4 resistors and 1 capacitor as described in <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Muthuswamy2009] </a>.
</p>
<p>
Plot v2 vs. v1, vRL vs. v1 and v2 vs. vRL. <br>
Path to chaos: R = {1850, 1800, 1750} &#8486;.
</p>
<p><b>Note</b> that an initial condition is necessary.</p>
<p><strong>References:</strong></p>
<ul>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Chua1993] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Kennedy1993a] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Zhong1985] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Berkeley] </a></li>
</ul>
</html>"));
end ChuasCircuit;
