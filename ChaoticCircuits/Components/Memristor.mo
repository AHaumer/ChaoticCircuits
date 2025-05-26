within ChaoticCircuits.Components;
model Memristor "Memristor model"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Icons.UnderConstruction;

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
