within ChaoticCircuits.Components;
model Multiplier "Analog multiplier"
  parameter SI.Voltage ER=10 "Scaling / maximum voltage";
  parameter Boolean useZ=false "= true, if summing input is used";
  Modelica.Electrical.Analog.Interfaces.PositivePin in1
    "Input pin 1" annotation (Placement(transformation(
          extent={{-110,50},{-90,70}}),   iconTransformation(extent={{-110,50},
            {-90,70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin in2 "Input pin 2"
                  annotation (Placement(transformation(
          extent={{-110,-70},{-90,-50}}),
                                        iconTransformation(extent={{-110,-70},{
            -90,-50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin out "Output pin"
    annotation (Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{70,-100},{90,-80}})));
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
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Sources.Constant scaling(k=1/ER)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  SimpleLimiter limiter1(uMax=ER, uMin=-ER)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  SimpleLimiter limiter2(uMax=ER, uMin=-ER)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-50}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={80,0})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin z if useZ "summing Input pin z"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
        iconTransformation(extent={{-10,-110},{10,-90}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor3 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-60})));
equation
  connect(in1, voltageSensor1.p)
    annotation (Line(points={{-100,60},{-80,60},{-80,50}}, color={0,0,255}));
  connect(ground.p, voltageSensor1.n)
    annotation (Line(points={{80,-80},{-80,-80},{-80,30}},color={0,0,255}));
  connect(voltageSensor2.n, ground.p)
    annotation (Line(points={{-60,-30},{-60,0},{-80,0},{-80,-80},{80,-80}},
                                                           color={0,0,255}));
  connect(voltageSensor2.v, limiter2.u)
    annotation (Line(points={{-49,-40},{-42,-40}}, color={0,0,127}));
  connect(voltageSensor1.v, limiter1.u)
    annotation (Line(points={{-69,40},{-42,40}}, color={0,0,127}));
  connect(out, signalVoltage.p) annotation (Line(points={{100,0},{100,20},{80,
          20},{80,10}}, color={0,0,255}));
  connect(signalVoltage.n, ground.p)
    annotation (Line(points={{80,-10},{80,-80}},         color={0,0,255}));
  connect(limiter2.y, multiProduct.u[1]) annotation (Line(points={{-19,-40},{-10,
          -40},{-10,-2.33333},{0,-2.33333}},color={0,0,127}));
  connect(scaling.y, multiProduct.u[2])
    annotation (Line(points={{-19,0},{0,0}},              color={0,0,127}));
  connect(limiter1.y, multiProduct.u[3]) annotation (Line(points={{-19,40},{-10,
          40},{-10,2},{0,2},{0,2.33333}}, color={0,0,127}));
  connect(in2, voltageSensor2.p) annotation (Line(points={{-100,-60},{-60,-60},
          {-60,-50}}, color={0,0,255}));
  connect(multiProduct.y, add.u1)
    annotation (Line(points={{21.7,0},{30,0},{30,6},{38,6}}, color={0,0,127}));
  connect(add.y, signalVoltage.v)
    annotation (Line(points={{61,0},{68,0}}, color={0,0,127}));
  connect(voltageSensor3.n, voltageSensor1.n) annotation (Line(points={{0,-50},{
          -20,-50},{-20,-80},{-80,-80},{-80,30}}, color={0,0,255}));
  connect(voltageSensor3.v, add.u2) annotation (Line(points={{11,-60},{30,-60},{
    30,-6},{38,-6}}, color={0,0,127}));
  if useZ then
    connect(voltageSensor3.p, z)
      annotation (Line(points={{0,-70},{0,-100}}, color={0,0,255}));
  else
    connect(voltageSensor3.p, voltageSensor1.n) annotation (Line(points={{0,-70},{
      0,-80},{-80,-80},{-80,30}}, color={0,0,255}));
  end if;
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
There is an optional summing input z.
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
