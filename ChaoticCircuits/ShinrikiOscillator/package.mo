within ChaoticCircuits;
package ShinrikiOscillator "Shinriki oscillator"
  extends Modelica.Icons.ExamplesPackage;

   annotation (preferredView="info", Documentation(info="<html>
<p>
This is an implementation of the Shinriki oscillator as decribed in
<a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Lueck1995] </a> and 
<a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Shinriki1981] </a>.
</p>
<p>
Note that the operational amplifier of the NIC (negative impedance converter) need sto be modeled 
with high no-load amplification (but not infinite) and saturation of the output voltage between positive and negative supply.
</p>
<p>
Plot v1 vs. v2. <br>
Default parameter <code>R2 = 20000 &#8486;</code> shows periodic results. <br>
Change parameter <code>R2 = 8400 &#8486;</code> to obtain chaotic results. 
</p>
</html>"));
end ShinrikiOscillator;
