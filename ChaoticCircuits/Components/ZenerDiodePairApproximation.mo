within ChaoticCircuits.Components;
model ZenerDiodePairApproximation "Approximation"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter SI.Voltage Vbt=3.3 "Break-through voltage";
  parameter Real a=1.0862e-3 "Coefficient a [A/V]";
  parameter Real b=-0.1615e-3 "Coefficient b [A/V^3]";
  parameter Real c=0.3021e-3 "Coefficient c [A/V^5]";
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort;
equation
  i = if abs(v)<Vbt then 0 else
    sign(v)*(a*(abs(v) - Vbt) + b*(abs(v) - Vbt)^3 + c*(abs(v) - Vbt)^5);
  LossPower=v*i;
  annotation (defaultComponentName="zDiodePair",
    Icon(graphics={
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-90,0},{40,0}}, color={0,0,255}),
        Line(points={{40,0},{90,0}}, color={0,0,255}),
        Line(points={{-20,40},{-20,-40}},
                                        color={0,0,255}),
        Polygon(
          points={{-20,0},{-80,40},{-80,-40},{-20,0}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-20,-40},{-30,-40}},
                                         color={28,108,200}),
        Line(points={{20,-40},{30,-40}}, color={28,108,200}),
        Polygon(
          points={{20,0},{80,40},{80,-40},{20,0}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{20,40},{20,-40}}, color={0,0,255})}),
    Documentation(info="<html>
<p>This is an approximation for a Zener diode pair as described in <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Lueck1995] </a>.</p>
</html>"));
end ZenerDiodePairApproximation;
