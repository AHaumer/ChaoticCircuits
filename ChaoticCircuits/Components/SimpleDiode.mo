within ChaoticCircuits.Components;
model SimpleDiode "Shockley diode equation"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter SI.Current Ids=1e-9 "Diode: saturation current";
  parameter SI.Voltage nVt=2*26e-3 "Diode: n * voltage equivalent of temperature";
equation
  i = Ids*(exp(v/nVt) - 1);
  annotation (defaultComponentName="diode",
    Icon(graphics={
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-90,0},{40,0}}, color={0,0,255}),
        Line(points={{40,0},{90,0}}, color={0,0,255}),
        Line(points={{30,40},{30,-40}}, color={0,0,255}),
        Polygon(
          points={{30,0},{-30,40},{-30,-40},{30,0}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>This is a simple diode model based on the Shockley equation <code>i = I<sub>ds</sub>*(exp(v/nV<sub>t</sub>) - 1)</code>.</p>
</html>"));
end SimpleDiode;
