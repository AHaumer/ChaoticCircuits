within ChaoticCircuits.Components;
model DynamicDiode
  "Dynamic diode model including junction and diffusion capacitance"
  extends Modelica.Electrical.Analog.Interfaces.OnePort(v(start=0));
  replaceable parameter ParameterSets.DynamicDiode.DynamicDiodeData data
    constrainedby ChaoticCircuits.ParameterSets.DynamicDiode.DynamicDiodeData
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,60},{10,80}})));
  SI.Current id "Diode current";
  SI.Current ic "Capacitive current";
  SI.ElectricCharge q "Charge of capacitors";
  SI.Capacitance Cj "Junction capacitance";
  SI.Capacitance Cd "Diffusion capacitance";
equation
  i = id + ic;
  id = data.Ids*(exp(v/data.nVt) - 1);
  ic = der(q);
  q = (Cj + Cd)*v;
  Cj = data.C0*smooth(1, if v<data.fc*data.V0 then 1/(1 - v/data.V0)^data.m else
    (1 - data.fc*(1 + data.m) + data.m*v/data.V0)/((1 - data.fc)^(1 + data.m)));
  Cd = data.TauT*data.Ids/data.nVt*exp(v/data.nVt);
  annotation (Icon(graphics={
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-90,0},{-30,0}},color={0,0,255}),
        Line(points={{40,0},{90,0}}, color={0,0,255}),
        Line(points={{30,40},{30,-40}}, color={0,0,255}),
        Polygon(
          points={{30,0},{-30,40},{-30,-40},{30,0}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{40,40},{40,-40}}, color={0,0,255})}),
    Documentation(info="<html>
<p>This is a dynamic diode model according to <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Tietze2019] </a>:</p>
<ul>
<li>Shockley-equation</li>
<li>Junction capacitance  C<sub>J</sub></li>
<li>Diffusion capacitance C<sub>D</sub></li>
</ul>
<img src=\"modelica://ChaoticCircuits/Resources/Images/DynamicDiodeFormula.png\">
<img src=\"modelica://ChaoticCircuits/Resources/Images/DynamicDiodeCapacitance.png\">
<h4>Note:</h4>
<p>
High current injection and breakthrough are not taken into account.<br>
This model might not be suited for all experiments i.e. boundary conditions, but it works as expected for the RLD - circuit.
</p>
</html>"));
end DynamicDiode;
