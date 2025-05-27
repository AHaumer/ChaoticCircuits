within ChaoticCircuits;
package SimplestChaoticCircuit "as suggested by [Muthuswamy2010]"
  extends Modelica.Icons.ExamplesPackage;
  annotation (preferredView="info", Documentation(info="<html>
<p>
Although the memristor itself is discussed controversially <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Abraham2018] </a>, 
<a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Muthuswamy2010] </a> suggested the &quot;Simplest Chaotic Circuit&quot;, 
which is a series resonance circuit using a special memristor with partly negative resistance.
</p>
<p>
PhysicalModelTheoretic implements the unrealistic parameters specified in Chapter 2 directly after equation (2) of [Muthuswamy2010]: 
<code>L = 3 H</code> and <code>C = 1 F</code>, <code>&alpha; = I0 = 0.6 A</code> and <code>&beta; = R0 = 1.5 &#8486;</code>.<br>
<code>R0 = 1.55 &#8486;</code> leads to periodic results.<br>
<code>R0 = 1.50 &#8486;</code> leads to chaotic results.<br>
Plot capacitor.v vs. capacitor.i and vary memristor.R0 = oscillatorData.R0.
</p>
<p>
Appendix B.3 of [Muthuswamy2010] demonstrates the implementation of the special memristor using operational amplifiers and analog multipliers. 
Additionally, a current sensing resistor is used. Here more realistic parameters are indicated:<br>
</p>
</html>"));
end SimplestChaoticCircuit;
