within ChaoticCircuits.Components;
model Triode "van der Pol model of vaccum electron tube"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter SI.Resistance R0=0.2 "Resistance parameter";
  parameter SI.Current I0=1 "Current parameter";
equation
  v = -R0*i*(1 - 1/3*(i/I0)^2);
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
          color={28,108,200})}), Documentation(info="<html>
<p>This is a simple approximation for the nonlinear resistance of a triode.</p>
<h4>Note:</h4>
<p>
If current i is prescribed, voltage v can be unambiguously determined.<br>
If voltage v is prescribed, in the range between the zero crossings the current i has 2 or 3 possible solutions.
</p>
</html>"));
end Triode;
