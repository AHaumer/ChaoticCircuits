within ChaoticCircuits.Components;
model IdealNIC "Ideal model of a negative impedance converter"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  replaceable parameter ParameterSets.NIC.NICData nicData constrainedby
    ChaoticCircuits.ParameterSets.NIC.NICData annotation (choicesAllMatching=
        true, Placement(transformation(extent={{-80,60},{-60,80}})));
equation
  i = if v<-nicData.VLim then +nicData.ILim + nicData.gPos*(v + nicData.VLim)
  elseif v>+nicData.VLim then -nicData.ILim + nicData.gPos*(v - nicData.VLim)
  else nicData.gNeg*v;
  annotation (Icon(graphics={
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-60,-40},{-30,20},{30,-20},{60,40}},
                                                         color={28,108,200})}),
      experiment(
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>This is a simple algebraic model of a Negative Impedance Converter.</p>
<h4>Note:</h4>
<p>
If voltage v is prescribed, the current i can be unambiguously determined.<br>
If current i is prescribed, in the range between the zero crossings the voltage v has 2 or 3 possible solutions. 
In that case, the <a href=\"modelica://ChaoticCircuits.Components.HystereticNIC\">HystereticNIC</a> has to be used.
</p>
</html>"));
end IdealNIC;
