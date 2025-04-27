within ChaoticCircuits.Components;
block Staircase "Generate staircase signal"
  parameter Real height=1 "Height of each step";
  parameter Real offset=0 "Offset of output signal y";
  parameter Integer nperiod=-1
    "Number of periods (< 0 means infinite number of periods)";
  extends Modelica.Blocks.Interfaces.DiscreteBlock;
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,
            10}})));
protected
  discrete Real h(start=offset, fixed=true);
  Integer n(start=0, fixed=true);
equation
  when sampleTrigger then
    n = pre(n) + 1;
    h = pre(h) + (if nperiod<0 or nperiod>=n then height else 0);
  end when;
  y = h;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
        Polygon(
          points={{90,-70},{68,-62},{68,-78},{90,-70}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-20,0},{20,0}},
          origin={-60,-70},
          rotation=180),
        Line(points={{-10,0},{30,0}},
          origin={-40,-60},
          rotation=90),
        Line(points={{-20,0},{20,0}},
          origin={-20,-30},
          rotation=180),
        Line(points={{-20,0},{20,0}},
          origin={20,10},
          rotation=180),
        Line(points={{-20,0},{20,0}},
          origin={60,50},
          rotation=180),
        Line(points={{-10,0},{30,0}},
          origin={0,-20},
          rotation=90),
        Line(points={{-10,0},{30,0}},
          origin={40,20},
          rotation=90)}),
    Documentation(info="<html>
<p>
The Real output y is a staircase signal, i.e. summed up steps.
</p>
</html>"));
end Staircase;
