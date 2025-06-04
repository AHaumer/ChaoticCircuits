within ChaoticCircuits.UsersGuide;
class Overview "Overview"
  extends Modelica.Icons.Information;
  annotation (preferredView="info",Documentation(info="<html>
<p>
Chaotic circuits have received considerable interest in the literature because they have been applied in numerous areas 
such as secure communications, robotics, image processing or random bit generator. 
One of the most important research directions is constructing robust chaotic oscillators with simple structures. 
There are two kinds of simple chaotic oscillators: non-autonomous and autonomous oscillators. 
Autonomous systems show oscillations without excitation, otherwise excitation (besides energy supply) is needed. 
Note that an oscillator is not a perpetuum mobile but needs energy supply either an explicitely modeled source voltage or implicitely. 
The operational amplifiers might have a supply voltage not explicitely modeled. 
</p>
<p>In these examples simple systems are presented:</p>
<table>
  <tbody>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.LotkaVolterra\">Lotka-Volterra</a></td>
  <td><img src=\"modelica://ChaoticCircuits/Resources/Images/LotkaVolterra.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.VanDerPol\">Van der Pol oscillator</a></td>
  <td><img src=\"modelica://ChaoticCircuits/Resources/Images/VanDerPol.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.LorenzSystem\">Lorenz system</a></td>
  <td><img src=\"modelica://ChaoticCircuits/Resources/Images/Lorenz.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.RoesslerSystem\">Roessler system</a></td>
  <td><img src=\"modelica://ChaoticCircuits/Resources/Images/Roessler.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.ChuasCircuit\">Chua&apos;s circuit</a></td>
  <td>nonlinear conductor (two NICs) with partly negative slope<br>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/Chua.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.ChaoticDiode\">Chaotic diode circuit</a></td>
  <td><a href=\"modelica://ChaoticCircuits.UsersGuide.References\">[Pham2016]</a> A simple chaotic circuit with a light-emitting diode<br>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/ChaoticDiode.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.ChaoticOscillator\">Chaotic oscillator</a></td>
  <td><a href=\"modelica://ChaoticCircuits.UsersGuide.References\">[Tamasevicius2005]</a> A simple chaotic oscillator for educational purposes<br>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/ChaoticOscillator.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.ColpittsCircuit\">Colpitts circuit</a></td>
  <td>using a transistor (npn)<br>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/Colpitt.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.ShinrikiOscillator\">Shinriki oscillator</a></td>
  <td>two antiparallel Z-diodes and nonlinear conductor (NIC) with partly negative slope<br>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/Shinriki.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.JerkCircuit\">Jerk circuit</a></td>
  <td><img src=\"modelica://ChaoticCircuits/Resources/Images/Jerk.png\"></td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.RikitakeSystem\">Rikitake system</a></td>
  <td><img src=\"modelica://ChaoticCircuits/Resources/Images/Rikitake.png\">
      Two coupled disc dynamos</td>
  </tr>
  <tr>
  <td><a href=\"modelica://ChaoticCircuits.ChuasMemristor\">Chuas Circuit with memristor</a></td>
  <td>Replacing Chua&apos;s diode with a memristor<br>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/ChuasMemristor.png\"></td>
  </tr>
 </tbody>
</table>
</html>"));
end Overview;
