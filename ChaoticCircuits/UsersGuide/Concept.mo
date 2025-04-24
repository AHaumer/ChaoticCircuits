within ChaoticCircuits.UsersGuide;
class Concept "Concept"
  extends Modelica.Icons.Information;
  annotation (preferredView="info",Documentation(info="<html>
<p>
Chaotic circuits have received considerable interest in the literature because they have been applied in numerous areas 
such as secure communications, robotics, image processing or random bit generator. 
One of the most important research directions is constructing robust chaotic oscillators with simple structures. 
There are two kinds of simple chaotic oscillators: non-autonomous and autonomous oscillators.
</p>
<p>
Note that an oscillator is not a perpetuum mobile but needs energy supply either an explicitely modeled source voltage or implicitely. 
The operational amplifiers might have a supply voltage not explicitely modeled.
</p>
<p>
The default paremeters lead to periodic results. Possible parameter changes to obtain chaotic behavior are noted in the documentation of the respective subpackage. 
Note that at the beginning a transient process takes place, dependent on the initial conditions. It might be necessary to continue the simulation, 
as shown for the analytic equations of the ChaoticOscillator proposed by <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Tamasevicius2005] </a>:
</p>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/fig01.png\">
    </td>
    <td>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/fig02.png\">
    </td>
  </tr>
  <tr>
    <td>Fig. 1 a=0.75: y vs. x initial transient</td>
    <td>Fig. 2 a=0.75: y vs. x after one continuation</td>
</table>
<p>
The results meant for plotting are labeled. Normally plot one result vriable versus the other, in this example y vs. x and / or z vs. x. 
Of course the initial transient depends on the initial conditions. 
</p>
<p>
For default parameters, the results converge to a fixpoint. 
In certain parameter regions only one fixpoint is present. 
Changing parameters, it might happen that one of two fixpoitns is reached, dependent on the inintial conditions. 
This is called bifurcation and might happen mutliple times. 
In the end this leads to chaotic behaviour: Smallest differences in initial conditions lead to dramatically different results. 
Note that of course the results are strongly dependent on the implementation details of the solver, too.  
</p>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/fig03.png\">
    </td>
    <td>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/fig04.png\">
    </td>
  </tr>
  <tr>
    <td>Fig. 3 a=0.35: y vs. x initial transient</td>
    <td>Fig. 4 a=0.35: y vs. x after one continuation</td>
</table>
<p>
In these examples simple autonomous circuits are presented:
<ul>
<li>A chaotic diode circuit</li>
<li>Chua&apos;s circuit</li>
<li>A chaotic oscillator</li>
<li>Colpitts oscillator</li>
<li>Shinriki oscillator</li>
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
  <td><a href=\"modelica://ChaoticCircuits.Components.IdealizedOpAmp3Pin\">more sophisticated opAmp model</a>:
      input currents are zero, differential input voltage is zero, amplification is finite, output voltage is limited by suppply voltage</td>
  </tr>
 </tbody>
</table>
<p>
Note that for the more sophisticated OpAmp-model <a href=\"modelica://ChaoticCircuits.Components.IdealizedOpAmp3Pin\">IdealizedOpAmp3Pin</a> from this library is used 
instead of <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealizedOpAmpLimited\">IdealizedOpAmpLimited</a> from MSL 
to get rid of the implementation with <code>smooth</code> (which allows tools to avoid events!) and <code>noEvent</code> (which suppresses events!).
</p>
<p>
All circuits can be built in reality with simple electronic components. 
If an inductance is used, its resistance is modeled, too. The ohmic losses of an inductance can't be neglected.
</p>
<p>
The equations are summarized in this <a href=\"modelica://ChaoticCircuits/Resources/Documentation/ChaoticCircuits.pdf\">document</a>.
</p>
</html>"));
end Concept;
