within ChaoticCircuits.Components;
block Limiter "Limit the range of a signal"
  parameter Real uMax(start=1) "Upper limits of input signals";
  parameter Real uMin= -uMax "Lower limits of input signals";
  parameter Boolean useSmooth=false "= true, if smooth() is used for saturation";
  parameter Modelica.Blocks.Types.LimiterHomotopy homotopyType=Modelica.Blocks.Types.LimiterHomotopy.Linear
    "Simplified model for homotopy-based initialization"
    annotation (Evaluate=true, Dialog(group="Initialization"));
  //inidcate saturation, should generate events
  output Boolean satPos=u>uMax "Positive saturation";
  output Boolean satNeg=u<uMin "Negative saturation";
  extends Modelica.Blocks.Interfaces.SISO;
protected
  Real simplifiedExpr = (if homotopyType == Modelica.Blocks.Types.LimiterHomotopy.Linear
     then u else if homotopyType == Modelica.Blocks.Types.LimiterHomotopy.UpperLimit
     then uMax else if homotopyType == Modelica.Blocks.Types.LimiterHomotopy.LowerLimit
     then uMin else 0) "Simplified expression for homotopy-based initialization";
equation
  assert(uMax >= uMin, "Limiter: Limits must be consistent. " +
                       "However, uMax (=" + String(uMax) + ") < uMin (=" + String(uMin) + ")");
  if useSmooth then
    if homotopyType == Modelica.Blocks.Types.LimiterHomotopy.NoHomotopy then
      y = smooth(0, min(uMax, max(uMin, u)));
    else
      y = homotopy(actual = smooth(0, min(uMax, max(uMin, u))), simplified=simplifiedExpr);
    end if;
  else
    if homotopyType == Modelica.Blocks.Types.LimiterHomotopy.NoHomotopy then
      y = min(uMax, max(uMin, u));
    else
      y = homotopy(actual = min(uMax, max(uMin, u)), simplified=simplifiedExpr);
    end if;
  end if;
  annotation (
    Documentation(info="<html>
<p>
This is derived from the MSL <a href=\"modelica://Modelica.Blocks.Nonlinear.Limiter\">Limiter</a> but avoiding <code>noEvent</code> 
and letting the user choose to use <code>smooth</code> (which allows the tool to avoid events when limits are reached).
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
end Limiter;
