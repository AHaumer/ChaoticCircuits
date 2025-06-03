within ChaoticCircuits.BaseModels;
partial model ChargeControlledMemristor "Partial charge controlled memristor model"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  Real q(final min=0, final max=1, start=0.5)
    "Internal state = dimensionless charge resp. length of doped region / total length";
  SI.Resistance Rmem "Memristor resistance";
equation
  v = Rmem*i;
  annotation (defaultComponentName="memristor",
    Icon(graphics={
        Text(
          extent={{-100,100},{100,70}},
          textColor={0,0,255},
          textString="%name"),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={170,255,213},
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
The resistance of the element depends on an inner state <code>q</code> which provides memory. 
Different functions for this dependency have been suggested. 
<code>q</code> is related to the charge: <code>der(q) = i</code>. 
</p>
<p><strong>References:</strong></p>
<ul>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Chua1971] </a></li>
<li><a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Majetta2012] </a></li>
</ul>
</html>"));
end ChargeControlledMemristor;
