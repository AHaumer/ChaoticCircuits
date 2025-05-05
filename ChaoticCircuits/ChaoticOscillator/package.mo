within ChaoticCircuits;
package ChaoticOscillator "A simple chaotic oscillator for educational purposes"
  extends Modelica.Icons.ExamplesPackage;
   annotation (preferredView="info", Documentation(info="<html>
<p>
This is a simple chaotic oscillator for educational purposes as proposed by: 
</p>
<ul>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Tamasevicius2005] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Tamasevicius2007] </a></li>
</ul>
<p>
Plot y vs. x, z vs. x and z vs. y.<br>
Default parameter <code>a = 0.85</code> (i.e. <code>R2 = 9000 &#8486;</code>) of AnalyticEquations shows periodic results. <br>
Default parameter <code>a = 0.95</code> (i.e. <code>R2 = 10000 &#8486;</code>) of IdealCircuit and ImprovedCircuit shows periodic results. <br>
Change parameter <code>a = 0.40</code> (i.e. <code>R2 = 4500 k&#8486;</code>) to obtain chaotic results.
</p>
<p><b>Note</b> that initial condition = 0 is sufficient!</p>
<p>
A novel, very simple chaotic oscillator is described. It is intended for training laboratories accompanying courses on nonlinear dynamics and chaos for undergraduate, 
postgraduate and PhD students. The oscillator consists of an operational ampliﬁer, an LCR resonance loop, an extra capacitor, a diode as a nonlinear element and three auxiliary resistors. 
Chaotic oscillations are demonstrated both experimentally and numerically.
</p>
</html>"));
end ChaoticOscillator;
