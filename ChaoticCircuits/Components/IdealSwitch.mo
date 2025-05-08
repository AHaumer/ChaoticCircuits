within ChaoticCircuits.Components;
model IdealSwitch "Either short or idle"
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  parameter Boolean On "True leads to short, false to idle";
  Modelica.Electrical.Analog.Ideal.Short short if On
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.Analog.Ideal.Idle idle if not On
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
equation
  connect(short.p, p)
    annotation (Line(points={{-10,20},{-100,20},{-100,0}}, color={0,0,255}));
  connect(p, idle.p)
    annotation (Line(points={{-100,0},{-100,-20},{-10,-20}}, color={0,0,255}));
  connect(idle.n, n)
    annotation (Line(points={{10,-20},{100,-20},{100,0}}, color={0,0,255}));
  connect(short.n, n)
    annotation (Line(points={{10,20},{100,20},{100,0}}, color={0,0,255}));
  annotation (Icon(graphics={
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-90,0},{-44,0}}, color={0,0,255}),
        Ellipse(extent={{-44,4},{-36,-4}}, lineColor={0,0,255}),
        Line(points={{-37,2},{40,40}}, color={0,0,255}),
        Line(points={{40,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-100,-40},{100,-80}},
          textColor={0,0,255},
          textString="%On")}));
end IdealSwitch;
