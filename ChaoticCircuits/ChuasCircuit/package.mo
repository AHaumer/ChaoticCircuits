within ChaoticCircuits;
package ChuasCircuit "The Chua’s Circuit"
  extends Modelica.Icons.ExamplesPackage;

   annotation (preferredView="info", Documentation(info="<html>
<p>Chua's circuit is the most simple nonlinear circuit which shows chaotic behaviour. 
The circuit consists of linear basic elements (2 capacitors, resistor, inductor), and one nonlinear element, which is called Chua's diode.</p>
<p>Chua's diode behaves like a nonlinear resistor with 2 different slopes dv/di which are negative.
   It can be implemented with 2 operational amplifiers.
   You might try to vary the no-load amplification of the operational amplifiers.</p>
<p>
Plot v2 vs. v1, vRL vs. v1 and v2 vs. vRL. 
Default parameter <code>R = 1900 &#8486;</code> shows periodic results. 
Change parameter <code>R = 1500 &#8486;</code> to obtain chaotic results.
</p>
<p><b>Note</b> that an initial condition is necessary.</p>
<p><strong>Reference:</strong></p>
<ul>
<li>Kennedy, M.P.: 
    <a href=\"https://www.researchgate.net/publication/3322339_Three_steps_to_chaos_Part_I_evolution\">Three Steps to Chaos - Part I: Evolution</a>.
    IEEE Transactions on CAS I 40 (1993)10, 640-656</li>
<li>Berkeley Electrical Engineering and Computer Science, Nonlinear Electronics Lab, 
    <a href=\"https://nonlinear.eecs.berkeley.edu/chaos/chaos.html#_Working_With_Chaos_Simulation\">Working with Chaos</a></li>
</html>"));
end ChuasCircuit;
