within ChaoticCircuits.Components;
block SimpleLimiter "Limit the range of a signal"
  parameter Real uMax(start=1) "Upper limits of input signals";
  parameter Real uMin= -uMax "Lower limits of input signals";
  //inidcate saturation, generates events
  output Boolean satPos=u>uMax "Positive saturation";
  output Boolean satNeg=u<uMin "Negative saturation";
  extends Modelica.Blocks.Interfaces.SISO;
equation
  assert(uMax > uMin, "Limiter: Limits must be consistent.");
  y = smooth(0, min(uMax, max(uMin, u)));
  annotation (
    Documentation(info="<html>
<p>
This is derived from the MSL <a href=\"modelica://Modelica.Blocks.Nonlinear.Limiter\">Limiter</a> but avoiding <code>noEvent</code>.
</p>
</html>"),
     Icon(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}}), graphics={
    Line(points={{0,-90},{0,68}}, color={192,192,192}),
    Polygon(
      points={{0,90},{-8,70},{8,70},{0,90}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-90,0},{68,0}}, color={192,192,192}),
    Polygon(
      points={{90,0},{70,-8},{70,8},{90,0}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}),
    Text(
      extent={{-50,50},{50,70}},
          textString="%uMax",
          textColor={0,0,0}),
    Text(
      extent={{-50,-70},{50,-50}},
          textColor={0,0,0},
          textString="%uMin")}));
end SimpleLimiter;
