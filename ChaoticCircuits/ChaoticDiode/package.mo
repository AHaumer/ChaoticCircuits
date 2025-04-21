within ChaoticCircuits;
package ChaoticDiode "A simple chaotic circuit with a light-emitting diode"
  extends Modelica.Icons.ExamplesPackage;

   annotation (preferredView="info", Documentation(info="<html>
<p>
This is a simple chaotic example with a light-emitting diode (and 4 operational amplifiers) as described in 
<a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Pham2016] </a>.
</p>
<p>A novel simple autonomous optoelectronic chaotic circuit is presented in this work. 
Interestingly, the circuit is based on a single optoelectronic element, a light-emitting diode. 
The mathematical model of the circuit is described by three first-order ordinary differential equations 
which contain six terms with two parameters and an exponential nonlinearity. 
The proposed circuit is easy to be implemented by using common cheap components. 
The circuit can exhibit complex dynamical behavior like chaos despite of its simplicity. 
Therefore, it is a potential candidate for chaos-based engineering applications or is intended for educational purposes.</p>
<p>In this model, the proposed circuit is modeled using components from the Modelica Standard Library:</p>
<p>
<ul>
<li>opAmp1 and opAmp2 are configured as integrators.</li>
<li>opAmp3 adds 3 signals (from opAmp1, opAmp4 and his own output) and integrates.</li>
<li>opAmp4 works as gain with the diode as nonlinear input resistance.</li>
</ul>
</p>
<p>
The parameters as calculated as described in the paper:
Choosing the time constant Tau and the capacitance C as well as the dimensionless parameters a and b, 
all resistances are caculated using the parameters of the diode nVt and Ids.<p>
</p>
<p>
Plot x[2] vs. x[1], x[3] vs. x[1] and x[3] vs. x[2]. 
Default parameter <code>b = 1.5</code> (i.e. <code>Rb = 6666.67 &#8486;</code>) shows periodic results. 
Change parameter <code>b = 1.0</code> (i.e. <code>Rb = 10 k&#8486;</code>) to obtain chaotic results.
</p>
<p><b>Note</b> that an initial condition is necessary.</p>
<p><b>Note</b>: In detail, the results of this model may differ from the results shown in the mentioned paper, 
especially in the region of chaotic results, because the diode model is similar but more detailed than the pure Shockley equation 
used in the paper <pre>(<code>i = Ids*(exp(v/nVt) - 1)</code>)</pre> and the opAmp is modeled in more detail with finite gain and limited output.
</p>
</html>"));
end ChaoticDiode;
