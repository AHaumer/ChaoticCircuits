within ChaoticCircuits.Components;
model Triode "van der Pol model of vaccum electron tube"
  extends Modelica.Electrical.Analog.Interfaces.OnePort(i(start=0));
  extends Modelica.Icons.UnderConstruction;
  parameter SI.Resistance R0=31.831 "Resistance parameter";
  parameter SI.Current I0=0.2 "Current parameter";
protected
  Real i2=(i/I0)^2 "Intermedita variable";
equation
  v = R0*i*(1 - i2/3);
  //der(v)=R0*(1 - i2)*der(i);
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
        Line(points={{-60,40},{-46,0},{-40,-6},{-30,-10},{-20,-10},{-12,-8},{12,
              8},{20,10},{30,10},{38,6},{46,0},{60,-40}},
          color={28,108,200})}));
end Triode;
