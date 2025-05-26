within ChaoticCircuits.UsersGuide;
class ReleaseNotes "Release Notes"
  extends Modelica.Icons.ReleaseNotes;
  annotation (preferredView="info",Documentation(info="<html>

<h5>Version x.x.x, 20xx-xx-xx Anton Haumer</h5>
<ul>
  <li>Memristor modeling</li>
</ul>

<h5>Version 2.2.0, 2025-05-25 Anton Haumer</h5>
<ul>
  <li>Implemented Rikitake system (used to explain irregular reversals of the Earth’s magnetic ﬁeld)</li>
  <li>Fixed a bug in ChuasCircuit.InductorlessCircuit</li>
</ul>

<h5>Version 2.1.1, 2025-05-23 Anton Haumer</h5>
<ul>
  <li>Implemented {Analytic, Ideal, Improved}Antoniou = Inductor replacement</li>
  <li>Test of OpAmp Rise Time</li>
  <li>Improved OpAmp equivalent to future MSL solution</li>
</ul>

<h5>Version 2.0.0, 2025-05-14 Anton Haumer</h5>
<ul>
  <li>Implemented choice of smooth()-saturation of OpAmp</li>
  <li>Implemented HystereticNIC for prescribed current</li>
</ul>

<h5>Version 1.9.0, 2025-05-11 Anton Haumer</h5>
<ul>
  <li>Substantially improved documentation</li>
  <li>Clarify usage of scaling parameters</li>
  <li>Harmonize naming of results</li>
</ul>

<h5>Version 1.8.0, 2025-05-10 Anton Haumer</h5>
<ul>
  <li>Finished OpAmp-circuits of van der Pol</li>
  <li>Improved documentation: marked signals on diagram layer of OpAmp-circuits (VanDerPol, Lorenz, Roessler)</li>
</ul>

<h5>Version 1.7.0, 2025-05-09 Anton Haumer</h5>
<ul>
  <li>Implemented van der Pol oscillator (the translation to opAmp-circuits is under construction)</li>
  <li>Implemented parameter records for NIC and ChuaDiode with consistent parameter calculation</li>
  <li>Implemented ImprovedNIC and ImprovedChuaDiode (built from 2 NICs)</li>
  <li>Implemented IdealNIC (negative impedance converter for ShinrikiOscillator) and IdealChuaDiode (built from 2 NICs)</li>
  <li>Implemented Jerk Circuit</li>
</ul>

<h5>Version 1.6.0, 2025-05-05 Anton Haumer</h5>
<ul>
  <li>Test examples for all components</li>
  <li>Limiter without noEvent and smoot but with warning when saturating, used in IdealizedOpAmp3Pin and Multiplier</li>
  <li>Moved Roessler to an own subpackage with different implementations - subpackage MathematicalModels is no longer present</li>
  <li>Moved PredatorPrey and newly implemented n-dimensional LotkaVolterra to an own subpackage LotkaVolterra</li>
</ul>

<h5>Version 1.5.0, 2025-05-04 Anton Haumer</h5>
<ul>
  <li>Added a model of an ideal analog 4-quadrant multiplier.</li>
  <li>Moved LorenzSystem from MathematicalModelis to an own subpackage with different implementations of the same system.</li>
</ul>

<h5>Version 1.4.0, 2025-04-29 Anton Haumer</h5>
<ul>
  <li>Enhanced SimpleTransistor model (slope of iC at high vCE: Early-effect)</li>
  <li>Added a collection of famous MathematicalModels.</li>
</ul>

<h5>Version 1.3.2, 2025-04-28 Anton Haumer</h5>
<ul>
  <li>Enhanced SimpleTransistor model (saturation of iC at low vCE)</li>
  <li>Test example for SimpleTransistor</li>
</ul>

<h5>Version 1.3.1, 2025-04-25 Anton Haumer</h5>
<ul>
  <li>Usage of Components.SimpleDiode in ChaoticOscillator.IdealCircuit instead of Modelica.Electrical.Analog.Semiconductors.Diode</li>
  <li>Corrected some small bugs and improved documentation</li>
</ul>

<h5>Version 1.3.0, 2025-04-24 Anton Haumer</h5>
<ul>
  <li>Removed unused Components.SimpleZenerDiode</li>
  <li>Replaced usage of Modelica.Electrical.Analog.Ideal.IdealizedOpAmpLimited by Components.IdealizedOpAmp3Pin</li>
</ul>

<h5>Version 1.2.0, 2025-04-23 Anton Haumer</h5>
<ul>
  <li>Implemented ShinrikiOscillator</li>
</ul>

<h5>Version 1.1.2, 2025-04-22 Anton Haumer</h5>
<ul>
  <li>Improved documentation</li>
</ul>

<h5>Version 1.1.1, 2025-04-21 Anton Haumer</h5>
<ul>
  <li>Included comparisonSignals and referenceResults (periodic results with initial transients) in Resources.Reference</li>
</ul>

<h5>Version 1.1.0, 2025-04-21 Anton Haumer</h5>
<ul>
  <li>Finished ColpíttsCircuit including Components.SimpleTransistor</li>
  <li>Implemented Components.SimpleDiode (Shockley equation)</li>
  <li>Simplified initialization</li>
</ul>

<h5>Version 1.0.0, 2024-12-10 Anton Haumer</h5>
<ul>
  <li>Initial release</li>
</ul>

</html>"));
end ReleaseNotes;
