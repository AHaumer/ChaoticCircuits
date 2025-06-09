within ChaoticCircuits;
package RLD_Circuit "Circuit Resistor-Inductor-Diode(with Capacitor)"
  extends Modelica.Icons.ExamplesPackage;
  annotation (Documentation(info="<html>
<p><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Hellen2024] </a> investigated a driven RLC resonant circuit with a diode parallel to the capacitor.</p>
<p>
Modelling the diode dynamically with junction and diffusion capacitance, the varying nonlinear capacitance is added to the fixed capacitor. 
The fixed capacitor also includes the diode&apos;s stray capacitance. 
The resistor also includes the inductor&apos;s resistance.
</p>
<p>
Setting the source frequency <code>f = w * f0</code> to <code>w = 1</code>, 
and varying the source amplitude <code>V = mu * V0</code> in the range <code>mu = 1 to 2.6 step 0.2</code>, various regions of period doubling and chaos can be observed.<br>
<code>V0</code> is a parameter of the diode&apos;s junction capacitance, and <code>f0</code> is the natural frequency of the ciruit: 
<img src=\"modelica://ChaoticCircuits/Resources/Images/RLDf0.png\">
</p>
<h4>Note:</h4>
<p>The equations for junction and diffusion capacitance are much too complicated to implement as an OpAmp-circuit.</p>
</html>"));
end RLD_Circuit;
