within ChaoticCircuits.Components;
model Multiplier "Analog multiplier"
  parameter SI.Voltage Vscale=10 "Scaling / maximum voltage";
  Modelica.Electrical.Analog.Interfaces.PositivePin in1
    "Input pin 1" annotation (Placement(transformation(
          extent={{-110,50},{-90,70}}),   iconTransformation(extent={{-110,50},
            {-90,70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin in2
    "Input pin 2" annotation (Placement(transformation(
          extent={{-110,-70},{-90,-50}}),
                                        iconTransformation(extent={{-110,-70},{
            -90,-50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin out "Output pin"
    annotation (Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,40})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor2 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-60,-50})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=3)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Sources.Constant scaling(k=1/Vscale)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=Vscale, uMin=-Vscale)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=Vscale, uMin=-Vscale)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={80,0})));
equation
  connect(in2, voltageSensor2.p) annotation (Line(points={{-100,-60},{-100,-40},
          {-60,-40}}, color={0,0,255}));
  connect(in1, voltageSensor1.p)
    annotation (Line(points={{-100,60},{-80,60},{-80,50}}, color={0,0,255}));
  connect(ground.p, voltageSensor1.n)
    annotation (Line(points={{0,-80},{-80,-80},{-80,30}}, color={0,0,255}));
  connect(voltageSensor2.n, ground.p)
    annotation (Line(points={{-60,-60},{-60,-80},{0,-80}}, color={0,0,255}));
  connect(voltageSensor2.v, limiter2.u)
    annotation (Line(points={{-49,-50},{-42,-50}}, color={0,0,127}));
  connect(voltageSensor1.v, limiter1.u)
    annotation (Line(points={{-69,40},{-42,40}}, color={0,0,127}));
  connect(out, signalVoltage.p) annotation (Line(points={{100,0},{100,20},{80,
          20},{80,10}}, color={0,0,255}));
  connect(signalVoltage.n, ground.p)
    annotation (Line(points={{80,-10},{80,-80},{0,-80}}, color={0,0,255}));
  connect(multiProduct.y, signalVoltage.v)
    annotation (Line(points={{41.7,0},{68,0}}, color={0,0,127}));
  connect(limiter2.y, multiProduct.u[1]) annotation (Line(points={{-19,-50},{0,
          -50},{0,-2.33333},{20,-2.33333}}, color={0,0,127}));
  connect(scaling.y, multiProduct.u[2])
    annotation (Line(points={{-19,0},{0,0},{0,0},{20,0}}, color={0,0,127}));
  connect(limiter1.y, multiProduct.u[3]) annotation (Line(points={{-19,40},{0,
          40},{0,2},{20,2},{20,2.33333}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Polygon(
          points={{70,0},{-70,80},{-70,-80},{70,0}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Text(
          extent={{-40,20},{0,-40}},
          textColor={28,108,200},
          textString="*"),
        Text(
          extent={{-150,130},{150,90}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-100,60},{-70,60}}, color={0,0,255}),
        Line(points={{-100,-60},{-70,-60}}, color={0,0,255}),
        Line(points={{70,0},{100,0}}, color={0,0,255})}),        Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
This is an idealized model of an analog 4-quadrant multiplier: <code>out.v=in1.v*in2.v/Vscale</code>.
</p>
<ul>
<li>Input resistance infinite</li>
<li>Output resistance zero</li>
<li>Implicit used internal ground</li>
<li>Inputs are limited in the range [-<code>Vscale</code>, +<code>Vscale</code>]</li>
<li>Product is scaled by 1/<code>Vscale</code></li>
</ul>
</html>"));
end Multiplier;
