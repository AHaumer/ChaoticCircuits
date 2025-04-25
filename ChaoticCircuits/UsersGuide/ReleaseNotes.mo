within ChaoticCircuits.UsersGuide;
class ReleaseNotes "Release Notes"
  extends Modelica.Icons.ReleaseNotes;
  annotation (preferredView="info",Documentation(info="<html>

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
