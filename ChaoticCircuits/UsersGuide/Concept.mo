within ChaoticCircuits.UsersGuide;
class Concept "Concept"
  extends Modelica.Icons.Information;
  annotation (preferredView="info",Documentation(info="<html>
<p>
The default parameters lead to periodic results. Possible parameter changes to obtain chaotic behavior are noted in the documentation of the respective subpackage. <br>
<strong>Be curios</strong>, try different parameter settings to explore the path from periodic behaviour to chaos - in many cases you see bifurcation, i.e. different attractors.
</p>
<p>
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
The results meant for plotting are labeled. Normally plot one result variable versus the other, in this example y vs. x and / or z vs. x. 
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
<p>Most circuits (except Lotka-Volterra) are implemented in different flavours:</p>
<ul>
<li>AnalyticEquations: Mathematical description</li>
<li>ScaledBlocks: (if present) derived from analytic equations, using signal-oriented blocks, scaled to keep results within limits</li>
<li>IdealCircuit: Implemented with simple electronic components</li>
<li>ImprovedCircuit: Using more sophisticated electronic components</li>
</ul>
<p>The main differences between IdealCircuit and ImprovedCircuit are:</p>
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
  <td>A simple diode according to <a href=\"modelica://ChaoticCircuits.Components.SimpleDiode\">Shockley equation</a> is used.</td>
  <td>A more sophisticated        <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.Diode2\">diode model</a> with linear continuation of the characteristic and optional temperature dependency.</td>
  </tr>
  <tr>
  <td>Operational amplifiers</td>
  <td><a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin\">ideal 3 pin model</a>: 
      input currents are zero, differential input voltage is zero, amplification is infinite, output voltage is <strong>not</strong> limited</td>
  <td><a href=\"modelica://ChaoticCircuits.Components.ImprovedOpAmp3Pin\">more sophisticated opAmp model</a>:
      input currents are zero, differential input voltage is zero, amplification is finite, output voltage is limited by suppply voltage</td>
  </tr>
 </tbody>
</table>
<p>
Slightly different results of the different implementations may occur, they stem from more detials that are taken into account with the more sophistiacted implementation. <br>
Note that for the more sophisticated OpAmp-model <a href=\"modelica://ChaoticCircuits.Components.ImprovedOpAmp3Pin\">IdealizedOpAmp3Pin</a> from this library is used 
instead of <a href=\"modelica://Modelica.Electrical.Analog.Ideal.IdealizedOpAmpLimited\">IdealizedOpAmpLimited</a> from MSL 
to get rid of the implementation with <code>smooth</code> (which allows tools to avoid events when saturating!) and <code>noEvent</code> (which suppresses events!).
</p>
<p>
All circuits can be built in reality with simple electronic components. 
If an inductance is used, its resistance is modeled, too. The ohmic losses of an inductance cannot be neglected.
</p>
<p>
The equations are summarized in this <a href=\"modelica://ChaoticCircuits/Resources/Documentation/ChaoticCircuits.pdf\">document</a>.
</p>
<p>
<strong>Note</strong>: In the subdirectory Resources.Reference <strong>reference results</strong> for all examples are stored.
</p>
</html>"));
end Concept;
