within ChaoticCircuits;
package VanDerPol "van der Pol oscillator"
  extends Modelica.Icons.ExamplesPackage;
  annotation (preferredView="info", Documentation(info="<html>
<p>
<a href=\"https://en.wikipedia.org/wiki/Van_der_Pol_oscillator\">Wikipedia: Van der Pol oscillator</a><br>
</p>
<p>
Balthasar van der Pol reported 1927 strange phenomena about oscillations in a series resonance circuit containing a vacuum electron triode. 
Due to the nonlinear characteristic of the triode the autonomous circuit is able to maintain periodic oscillations, and with harmonic excitation it is able to produce chaos.
</p>
<p>
Note: For <code>A = 0</code> autonomous periodic solutions are obtained. <br>
      For <code>A = 1.0</code> forced periodic solutions are obtained. <br>
      For <code>A = 0.45</code> forced chaotic solutions are obtained. <br>
</p>
<p><strong>References:</strong></p>
<ul>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [VanDerPol1927] </a></li>
</ul>
</html>"));
end VanDerPol;
