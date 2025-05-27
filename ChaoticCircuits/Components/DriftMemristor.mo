within ChaoticCircuits.Components;
model DriftMemristor "Memristor Nonlinear Drift Model"
  extends ChaoticCircuits.BaseModels.BaseMemristor(q(start=0.3144654088050));
  parameter SI.Resistance Ron =100  "Resistance if completely (x=1) on";
  parameter SI.Resistance Roff=16e3 "Resistance if completely (x=0) off";
  parameter SI.Length D=1e-8 "Total length of device";
  parameter SI.Mobility muv=1e-14 "Dopant mobility";
  parameter Integer P=10 "Exponent of Biolek window function";
  Real fw "Window function (Biolek)";
equation
  Rmem = Ron*q + Roff*(1 - q);
  der(q) = muv/D^2*Ron*i*fw;
  fw = 1 - (q - (if -i<0 then 0 else 1))^(2*P);
  annotation (defaultComponentName="memristor",
    Icon(graphics={
        Line(points={{0,30},{0,-40}}, color={0,0,0}),
        Line(points={{-64,-30},{-64,-40}}, color={0,0,0}),
        Line(points={{-64,-40},{0,-40}}, color={0,0,0}),
        Polygon(
          points={{0,-40},{-10,-36},{-10,-44},{0,-40}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),   Documentation(info="<html>
<p>
The memristor is called the 4<sup>th</sup> missing component besides resistor, capacitor and inductor. 
The resistance of the element depends on an inner state which provides memory. 
Different functions for this dependency have been suggested. 
In this implementation, the formula of [Biolek2009] as shown by [Majetta2012] is used. 
<code>q</code> is related to the charge: <code>der(q) = i</code>. 
</p>
<p><strong>References:</strong></p>
<ul>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Chua1971] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Biolek2009] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Biolek2015] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Joglekar2009] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Majetta2012] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Maurer2014] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Oguz2018] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Yakopcic2011] </a></li>
</ul>
</html>"));
end DriftMemristor;
