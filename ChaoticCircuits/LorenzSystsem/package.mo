within ChaoticCircuits;
package LorenzSystsem "System developed by E.Lorenz"
  extends Modelica.Icons.ExamplesPackage;
  annotation (preferredView="info", Documentation(info="<html>
<p>
<a href=\"http://en.wikipedia.org/wiki/Lorenz_attractor\">Wikipedia: Lorenz attractor</a><br>
Developed 1963 by Edward Lorenz to model atmospheric convection.<br>
x is proportional to the rate of convection, y to the horizontal temperature variation and z to the vertical temperature variation. <br>
&sigma; depicts the Prandtl number, &rho; the Rayleigh number and &beta; the physical dimensions.<br>
The original parameters were:        <code>&sigma;=10,&rho;=28,&beta;=8/3</code>. <br>
Note: For <code>&beta;=1/3</code> periodic results are obtained.<br>
Note: We could scale the time by factor k<sub>t</sub> in ScaledBlocks and ImprovedCircuit (i.e. accelerate k<sub>t</sub>&lt;1 or slow down k<sub>t</sub>&gt;1 the simulation), 
but we woudl to take that time scale into account when comparing with the AnalyticEquations.
</p>
</html>"));
end LorenzSystsem;
