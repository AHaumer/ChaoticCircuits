within ChaoticCircuits.Components;
model HystereticNIC "Ideal model of a negative impedance converter"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  replaceable parameter ParameterSets.NIC.NICData nicData constrainedby
    ChaoticCircuits.ParameterSets.NIC.NICData annotation (choicesAllMatching=
        true, Placement(transformation(extent={{-80,60},{-60,80}})));
  parameter Boolean pre_rh_start=false "Value of pre(rh) at initial time";
  Boolean rh "Right / high branch of (outer) characteristic";
initial equation
  pre(rh) = pre_rh_start;
equation
  rh = not pre(rh) and i > +nicData.ILim or pre(rh) and i >= -nicData.ILim;
  v = if rh then +nicData.VLim + (i + nicData.ILim)/nicData.gPos else
                  -nicData.VLim + (i - nicData.ILim)/nicData.gPos;
  annotation (Icon(graphics={
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,140,72},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-60,-40},{-30,20},{30,-20},{60,40}},
                                                         color={0,140,72})}),
      experiment(
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>This is a simple algebraic model of a Negative Impedance Converter.</p>
<h4>Note:</h4>
<p>
This is the hysteretic version of the <a href=\"modelica://ChaoticCircuits.Components.IdealNIC\">IdealNIC</a> suitable for prescribed current i. 
The inner part of the characteristic with negative slope is omitted. 
The voltage v jumps when the right / upper or left / lower corner is reached to the other branch. 
</p>
</html>"));
end HystereticNIC;
