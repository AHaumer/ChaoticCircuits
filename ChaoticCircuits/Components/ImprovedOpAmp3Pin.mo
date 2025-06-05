within ChaoticCircuits.Components;
model ImprovedOpAmp3Pin
  "Idealized operational amplifier within implicit supply"
  parameter Real V0=15000.0 "No-load amplification";
  parameter SI.Voltage Vps=+15 "Positive supply voltage";
  parameter SI.Voltage Vns=-15 "Negative supply voltage";
  parameter Boolean useFirstOrder=false "use firstOrder rise of output voltage?"
    annotation(Evaluate=true, Dialog(tab="Advanced"));
  parameter SI.Time Tau=1e-5 "Time constant of firstOrder rise of output voltage"
    annotation(Evaluate=true, Dialog(tab="Advanced", enable=useFirstOrder));
  parameter Modelica.Blocks.Types.LimiterHomotopy homotopyType=Modelica.Blocks.Types.LimiterHomotopy.Linear
    "Simplified model for homotopy-based initialization"
    annotation (Evaluate=true, Dialog(tab="Advanced", enable=useFirstOrder));
  SI.Voltage v_Input(start=0)=v_in.v "Input  voltage";
  SI.Voltage vOutput(start=0)=vOut.v "Output voltage";
  SI.Current iOutput(start=0)=-out.i "Output current";
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
        origin={-70,0})));
  Modelica.Electrical.Analog.Sources.SignalVoltage vOut annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={60,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{50,-40},{70,-20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(k=V0, T=Tau) if useFirstOrder
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Blocks.Math.Gain gain(k=V0) if not useFirstOrder
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  SimpleLimiter limiter(
    uMax=Vps,
    uMin=Vns)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
initial equation
  if useFirstOrder then
    if homotopyType==Modelica.Blocks.Types.LimiterHomotopy.UpperLimit then
      limiter.u=Vps;
    elseif homotopyType==Modelica.Blocks.Types.LimiterHomotopy.LowerLimit then
      limiter.u=Vns;
    else
      limiter.u=min(Vps, max(Vns, V0*v_in.v));
    end if;
  end if;
equation
  assert(Vps > Vns, "OpAmp: Supply must be consistent.");
  connect(in_n, v_in.n)
    annotation (Line(points={{-100,60},{-70,60},{-70,10}}, color={0,0,255}));
  connect(in_p, v_in.p) annotation (Line(points={{-100,-60},{-70,-60},{-70,-10}},
        color={0,0,255}));
  connect(ground.p, vOut.n)
    annotation (Line(points={{60,-20},{60,-10}}, color={0,0,255}));
  connect(vOut.p, out) annotation (Line(points={{60,10},{60,20},{100,20},{100,0}},
        color={0,0,255}));
  connect(v_in.v, firstOrder.u)
    annotation (Line(points={{-59,0},{-50,0},{-50,-20},{-42,-20}},
                                               color={0,0,127}));
  connect(firstOrder.y, limiter.u)
    annotation (Line(points={{-19,-20},{-10,-20},{-10,0},{8,0}},
                                              color={0,0,127}));
  connect(limiter.y, vOut.v)
    annotation (Line(points={{31,0},{48,0}}, color={0,0,127}));
  connect(v_in.v, gain.u) annotation (Line(points={{-59,0},{-50,0},{-50,20},{
          -42,20}},
                color={0,0,127}));
  connect(gain.y, limiter.u)
    annotation (Line(points={{-19,20},{-10,20},{-10,0},{8,0}},
                                                            color={0,0,127}));
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
