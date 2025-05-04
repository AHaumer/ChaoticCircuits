within ChaoticCircuits.Components;
block CheckLimits "Check uMin <= u <= uMax"
  parameter Real uMax(start=1) "Upper limit of input signal";
  parameter Real uMin= -uMax "Lower limit of input signal";
  parameter String assertionText="... Assertion condition reached"
    "Text to be displayed";
  parameter AssertionLevel assertionLevel=AssertionLevel.warning
    "Assertion level: warning or error";
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  assert(uMin<=u and u<=uMax, assertionText, assertionLevel);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                        Text(
        extent={{-150,100},{150,60}},
        textString="%name",
        textColor={0,0,255}), Rectangle(
          extent={{-100,20},{100,-20}},
          lineColor={255,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,10},{100,-10}},
          textColor={255,0,255},
          textString="%assertionText")}),   Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end CheckLimits;
