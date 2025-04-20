within ;
package ChaoticCircuits
  extends Modelica.Icons.ExamplesPackage;
  import Modelica.Units.SI;

   annotation (preferredView="info",
    version="1.0.0",
    versionDate="2024-10-13",
    uses(Modelica(version="4.0.0")),
    Documentation(info="<html>
<p>
Chaotic circuits have received considerable interest in the literature because they have been applied in numerous areas 
such as secure communications, robotics, image processing or random bit generator. 
One of the most important research directions is constructing robust chaotic oscillators with simple structures. 
There are two kinds of simple chaotic oscillators: non-autonomous and autonomous oscillators.
</p>
<p>
In these examples simple autonomous circuits are presented:
<ul>
<li>A chaotic diode circuit</li>
<li>Chua&apos;s circuit</li>
<li>A chaotic oscillator</li>
<li>Colpitts oscillator (only implemented as ImprovedCircuit)</li>
</ul>
All circuits are implemented in 3 versions:
<ul>
<li>AnalyticEquations: Derived from the electric circuits</li>
<li>IdealCircuit: Implemented with simple electronic components</li>
<li>ImprovedCircuit: Using more sophisticated electronic components</li>
</ul>
The main differences between IdealCircuit and ImprovedCircuit are:
</p>
<table>
  <thead>
  <tr>
  <th align=\"left\">Component</th>
  <th align=\"left\">IdealCircuit</th>
  <th align=\"left\">ImprovedCircuit</th>
  </tr>
  </thead>
  <tbody>
  <tr>
  <td>Diode model</td>
  <td>Parameterized that way that the <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.Diode2\">Shockley equation</a> is used.</td>
  <td>A more sophisticated            <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.Diode\">diode model</a> with linear continuation of the characteristic and optional temperature dependency.</td>
  </tr>
  <tr>
  <td>Operational amplifiers</td>
  <td><a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin\">ideal 3 pin model</a>: 
      input currents are zero, differential input voltage is zero, amplification is infinite, output voltage is not limited</td>
  <td><a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealizedOpAmpLimited\">more sophisticated opAmp model</a>:
      input currents are zero, differential input voltage is zero, amplification is finite, output voltage is limited by suppply voltage</td>
  </tr>
 </tbody>
</table>
<p>
The default paremeters lead to periodic results. Possible parameter changes to obtain chaotic behavior are noted in the documentaion.</p>
</p>
<p>
All circuits can be built in reality with simple electronic components. 
If an inductance is used, its resistance is modeled, too. The ohmic losses of an inductance can't be neglected.
</p>
</html>"));
end ChaoticCircuits;
