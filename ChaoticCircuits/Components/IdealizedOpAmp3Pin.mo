within ChaoticCircuits.Components;
model IdealizedOpAmp3Pin "Idealized operational amplifier within implicit supply"
  parameter Real V0=15000.0 "No-load amplification";
  parameter SI.Voltage Vps=+15 "Positive supply voltage";
  parameter SI.Voltage Vns=-15 "Negative supply voltage";
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p
    "Positive pin of the input port" annotation (Placement(transformation(
          extent={{-110,-70},{-90,-50}}), iconTransformation(extent={{-110,-70},
            {-90,-50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n
    "Negative pin of the input port" annotation (Placement(transformation(
          extent={{-110,50},{-90,70}}), iconTransformation(extent={{-110,50},{-90,
            70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin out "Output pin"
    annotation (Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{90,-10},{110,10}})));
  SI.Voltage v_in(start=0)=in_p.v - in_n.v "Input voltage difference";
  SI.Voltage v_out=out.v "Output voltage to ground";
equation
  in_p.i = 0;
  in_n.i = 0;
  v_out = if V0*v_in>Vps then Vps else if V0*v_in<Vns then Vns else V0*v_in;
  annotation (defaultComponentName="opAmp",
    Documentation(info="<html>
<p>
The idealized OpAmp with three pins has an implicit symmetrical supply and shows saturation.
</p>
<p>Idealized operational amplifier with saturation:</p>
<ul>
<li>Input currents are zero.</li>
<li>No-load amplification is high (but not infinite).</li>
<li>Output voltage is limited between positive and negative supply.</li>
</ul>
</html>",
        revisions="<html>

</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{60,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-150,130},{150,90}},
          textString="%name",
          textColor={0,0,255}),
        Polygon(
          points={{70,0},{-70,80},{-70,-80},{70,0}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Line(points={{-100,60},{-70,60}}, color={0,0,255}),
        Line(points={{-100,-60},{-70,-60}}, color={0,0,255}),
        Line(points={{70,0},{100,0}}, color={0,0,255}),
        Line(points={{-60,50},{-40,50}}, color={0,0,255}),
        Line(points={{-60,-50},{-40,-50}}, color={0,0,255}),
        Line(points={{-50,-40},{-50,-60}}, color={0,0,255})}));
end IdealizedOpAmp3Pin;
