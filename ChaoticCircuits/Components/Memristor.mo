within ChaoticCircuits.Components;
model Memristor "Memristor model"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter SI.Resistance Ron =100  "Resistance if completely (x=1) on";
  parameter SI.Resistance Roff=16e3 "Resistance if completely (x=0) off";
  parameter SI.Length D=1e-8 "Total length of device";
  parameter Real muv=1e-14 "Dopant mobility";
  parameter Integer P=10 "Exponent of Biolek window function";
  Real x(final min=0, final max=1, start=0.3144654088050)
    "Internal state = length of doped region / total length";
  Real fw "Window function (Biolek)";
  SI.Resistance Rmem = Ron*x + Roff*(1 - x) "Memristor resistance";
equation
  v = Rmem*i;
  der(x) = muv/D^2*Ron*i*fw;
  fw = 1 - (x - (if i>=0 then 0 else 1))^(2*P);
  annotation (Icon(graphics={
        Text(
          extent={{-100,100},{100,70}},
          textColor={0,0,255},
          textString="%name"),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-70,30},{-64,-30}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-58,0},{-58,-20},{-38,-20},{-38,20},{-18,20},{-18,
              -20},{2,-20},{2,20},{22,20},{22,-20},{42,-20},{42,20},{62,20},{62,
              0},{90,0}}, color={0,0,255})}), Documentation(info="<html>
<p>
The memristor is called the 4<sup>th</sup> missing component besides resistor, capacitor and inductor. 
The resistance of the element depends on an inner state which provides memory. 
Different functions for this dependency have been suggested. 
In this implementation, the formula of [Biolek2009] as shown by [Majetta2012] is used.
</p>
<p><strong>References:</strong></p>
<ul>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Chua1971] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Biolek2009] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Biolek2015] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Majetta2012] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Maurer2014] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Muthuswamy2010] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Oguz2018] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Yakopcic2011] </a></li>
</ul>
</html>"));
end Memristor;
