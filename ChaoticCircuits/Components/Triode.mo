within ChaoticCircuits.Components;
model Triode "van der Pol model of vaccum electron tube"
  extends Modelica.Electrical.Analog.Interfaces.OnePort(i(start=0));
  parameter SI.Resistance R0=31.831 "Resistance parameter";
  parameter SI.Current I0=0.2 "Current parameter";
equation
  v = R0*I0*(i/I0 - 1/3*(i/I0)^3);
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
        Line(points={{-60,40},{-30,-10},{30,10},{60,-40}},
                                                         color={28,108,200})}),
      experiment(
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Triode;
