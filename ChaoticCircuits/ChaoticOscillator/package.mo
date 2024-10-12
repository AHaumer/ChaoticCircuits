within ChaoticCircuits;
package ChaoticOscillator "A simple chaotic oscillator for educational purposes"
  extends Modelica.Icons.ExamplesPackage;
   annotation (preferredView="info", Documentation(info="<html>
<p>
This is a simple chaotic oscillator for educational purposes as proposed by: 
</p>
<ul>
<li>A. Tama&scaron;evi&ccaron;ius, G. Mykolaitis, V. Pyragas and K. Pyragas:
    <a href=\"https://www.researchgate.net/publication/230925506_A_simple_chaotic_oscillator_for_educational_purposes\">A simple chaotic oscillator for educational purposes</a>.
    European Journal of Physics 26(1):61-63 (Nov. 2005)</li>
<li>A. Tama&scaron;evi&ccaron;ius, T. Pyragiene, K. Pyragas, S. Bumeliene and M. Meskauskas:
    <a href=\"https://www.researchgate.net/publication/259216097_NUMERICAL_TREATMENT_OF_EDUCATIONAL_CHAOS_OSCILLATOR\">Numerical Treatment of Educational Chaos Oscillator</a>.
    International Journal of Bifurcation and Chaos Vol 17, No. 10 (2007), 3657-3661</li>
</ul>
<p>
Plot y vs. x, z vs. x and z vs. y.
Default parameter <code>a = 0.75</code> (i.e. <code>R2 = 8000 &#8486;</code>) of AnalyticEquations shows periodic results. 
Default parameter <code>a = 0.95</code> (i.e. <code>R2 = 10000 &#8486;</code>) of IdealCircuit and ImprovedCircuit shows periodic results. 
Change parameter <code>a = 0.35</code> (i.e. <code>R2 = 4000 k&#8486;</code>) to obtain chaotic results.
</p>
<p><b>Note</b> that initial condition = 0 is sufficient!</p>
<p>
A novel, very simple chaotic oscillator is described. It is intended for training laboratories accompanying courses on nonlinear dynamics and chaos for undergraduate, 
postgraduate and PhD students. The oscillator consists of an operational ampliﬁer, an LCR resonance loop, an extra capacitor, a diode as a nonlinear element and three auxiliary resistors. 
Chaotic oscillations are demonstrated both experimentally and numerically.
</p>
</html>"));
end ChaoticOscillator;
