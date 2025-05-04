within ChaoticCircuits.Components;
model Multiplier "Analog multiplier"
  parameter SI.Voltage ER=10 "Scaling / maximum voltage";
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
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-40})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=3)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.Constant scaling(k=1/ER)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=ER, uMin=-ER)
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=ER, uMin=-ER)
    annotation (Placement(transformation(extent={{-20,-30},{0,-50}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={80,0})));
  CheckLimits checkLimits1(
    uMax=ER,
    uMin=-ER,
    assertionText="Multiplier: u1 limited")
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  CheckLimits checkLimits2(
    uMax=ER,
    uMin=-ER,
    assertionText="Multiplier: u2 limited")
    annotation (Placement(transformation(extent={{-20,-50},{0,-70}})));
equation
  connect(in1, voltageSensor1.p)
    annotation (Line(points={{-100,60},{-80,60},{-80,50}}, color={0,0,255}));
  connect(ground.p, voltageSensor1.n)
    annotation (Line(points={{0,-80},{-80,-80},{-80,30}}, color={0,0,255}));
  connect(voltageSensor2.n, ground.p)
    annotation (Line(points={{-60,-30},{-60,0},{-80,0},{-80,-80},{0,-80}},
                                                           color={0,0,255}));
  connect(voltageSensor2.v, limiter2.u)
    annotation (Line(points={{-49,-40},{-22,-40}}, color={0,0,127}));
  connect(voltageSensor1.v, limiter1.u)
    annotation (Line(points={{-69,40},{-22,40}}, color={0,0,127}));
  connect(out, signalVoltage.p) annotation (Line(points={{100,0},{100,20},{80,
          20},{80,10}}, color={0,0,255}));
  connect(signalVoltage.n, ground.p)
    annotation (Line(points={{80,-10},{80,-80},{0,-80}}, color={0,0,255}));
  connect(multiProduct.y, signalVoltage.v)
    annotation (Line(points={{61.7,0},{68,0}}, color={0,0,127}));
  connect(limiter2.y, multiProduct.u[1]) annotation (Line(points={{1,-40},{20,
          -40},{20,-2.33333},{40,-2.33333}},color={0,0,127}));
  connect(scaling.y, multiProduct.u[2])
    annotation (Line(points={{1,0},{40,0}},               color={0,0,127}));
  connect(limiter1.y, multiProduct.u[3]) annotation (Line(points={{1,40},{20,40},
          {20,2},{40,2},{40,2.33333}},    color={0,0,127}));
  connect(voltageSensor1.v, checkLimits1.u) annotation (Line(points={{-69,40},{
          -40,40},{-40,60},{-22,60}}, color={0,0,127}));
  connect(voltageSensor2.v, checkLimits2.u) annotation (Line(points={{-49,-40},
          {-36,-40},{-36,-60},{-22,-60}}, color={0,0,127}));
  connect(in2, voltageSensor2.p) annotation (Line(points={{-100,-60},{-60,-60},
          {-60,-50}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-90,90},{90,-90}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,130},{150,90}},
          textString="%name",
          textColor={0,0,255}),
        Line(
          points={{-20,20},{20,-20}},
          color={0,0,255},
          thickness=0.5),
        Line(
          points={{-20,-20},{20,20}},
          color={0,0,255},
          thickness=0.5)}),                                      Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
This is an idealized model of an analog 4-quadrant multiplier: <code>out.v=in1.v*in2.v/E<sub>R</sub></code>.
</p>
<ul>
<li>Input resistance infinite</li>
<li>Output resistance zero</li>
<li>Implicitely used internal ground</li>
<li>Inputs are limited in the range [-<code>E<sub>R</sub></code>, +<code>E<sub>R</sub></code>]</li>
<li>Output is scaled by 1/<code>E<sub>R</sub></code></li>
</ul>
</html>"));
end Multiplier;
