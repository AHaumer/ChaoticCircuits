within ChaoticCircuits.Components;
model ImprovedOpAmp3Pin
  "Idealized operational amplifier within implicit supply"
  parameter Real V0=15000.0 "No-load amplification";
  parameter Modelica.Units.SI.Time Tr=1e-5 "Rise time 10%-90% of output voltage";
  parameter SI.Voltage Vps=+15 "Positive supply voltage";
  parameter SI.Voltage Vns=-15 "Negative supply voltage";
  parameter Modelica.Blocks.Types.LimiterHomotopy homotopyType=Modelica.Blocks.Types.LimiterHomotopy.Linear
    "Simplified model for homotopy-based initialization"
    annotation (Evaluate=true, Dialog(group="Initialization"));
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p
    "Positive pin of the input port" annotation (Placement(transformation(
          extent={{-110,-70},{-90,-50}}), iconTransformation(extent={{-110,-70},
            {-90,-50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n
    "Negative pin of the input port" annotation (Placement(transformation(
          extent={{-110,50},{-90,70}}), iconTransformation(extent={{-110,50},{-90,
            70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin out "Output pin"
    annotation (Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor v_in annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,0})));
  Modelica.Electrical.Analog.Sources.SignalVoltage vOut annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={80,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(k=V0, T=Tr/log(9))
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  SimpleLimiter limiter(
    uMax=Vps,
    uMin=Vns)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
initial equation
  if homotopyType==Modelica.Blocks.Types.LimiterHomotopy.UpperLimit then
    firstOrder.y=Vps;
  elseif homotopyType==Modelica.Blocks.Types.LimiterHomotopy.LowerLimit then
    firstOrder.y=Vns;
  else
    firstOrder.y=V0*v_in.v;
  end if;
equation
  connect(in_n, v_in.n)
    annotation (Line(points={{-100,60},{-80,60},{-80,10}}, color={0,0,255}));
  connect(in_p, v_in.p) annotation (Line(points={{-100,-60},{-80,-60},{-80,-10}},
        color={0,0,255}));
  connect(ground.p, vOut.n)
    annotation (Line(points={{80,-20},{80,-10}}, color={0,0,255}));
  connect(vOut.p, out) annotation (Line(points={{80,10},{80,20},{100,20},{100,0}},
        color={0,0,255}));
  connect(v_in.v, firstOrder.u)
    annotation (Line(points={{-69,0},{-42,0}}, color={0,0,127}));
  connect(firstOrder.y, limiter.u)
    annotation (Line(points={{-19,0},{18,0}}, color={0,0,127}));
  connect(limiter.y, vOut.v)
    annotation (Line(points={{41,0},{68,0}}, color={0,0,127}));
  annotation (defaultComponentName="opAmp",
    Documentation(info="<html>
<p>
The idealized OpAmp with three pins has an implicit symmetrical supply and shows saturation.
</p>
<p>Idealized operational amplifier with saturation:</p>
<ul>
<li>Input currents are zero.</li>
<li>No-load amplification is high (but not infinite).</li>
<li>Rise time is low (but not zero).</li>
<li>Output voltage is limited between positive and negative supply.</li>
</ul>
<p>
It should be easy to add a small input parallel conductance and a small output series resistance.
</p>
</html>",
        revisions="<html>

</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{60,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-150,130},{150,90}},
          textString="%name",
          textColor={0,0,255}),
        Polygon(
          points={{70,0},{-70,80},{-70,-80},{70,0}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Line(points={{-100,60},{-70,60}}, color={0,0,255}),
        Line(points={{-100,-60},{-70,-60}}, color={0,0,255}),
        Line(points={{70,0},{100,0}}, color={0,0,255}),
        Line(points={{-60,50},{-40,50}}, color={0,0,255}),
        Line(points={{-60,-50},{-40,-50}}, color={0,0,255}),
        Line(points={{-50,-40},{-50,-60}}, color={0,0,255}),
    Line(points={{-68,-30},{-38,-30},{-18,30},{12,30}})}));
end ImprovedOpAmp3Pin;
