within ChaoticCircuits.Test;
model TestInductorReplacement "Replace inductor by OpAmp circuit"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{60,-100},{80,-80}})));
  Modelica.Electrical.Analog.Sensors.MultiSensor multiSensor2
    annotation (Placement(transformation(extent={{10,70},{30,90}})));
  Modelica.Electrical.Analog.Sources.CosineVoltage
                                                 source(V=0.1, f=10)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,-2})));
  Modelica.Electrical.Analog.Basic.Resistor ri(R=1)  annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,30})));
  Modelica.Electrical.Analog.Basic.Ground groundS
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Sensors.MultiSensor multiSensor1
    annotation (Placement(transformation(extent={{-10,70},{-30,90}})));
  ChaoticCircuits.Components.AnalyticAntoniou analyticAntoniou(vc(fixed=true,
        start=0)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,0})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{-80,-100},{-60,-80}})));
  Modelica.Blocks.Math.Harmonic harmonic_v1(f=source.f, k=1)
    annotation (Placement(transformation(extent={{-40,40},{-60,60}})));
  Modelica.Blocks.Math.Harmonic harmonic_i1(f=source.f, k=1) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-50,20})));
  ChaoticCircuits.Components.ImprovedAntoniou improvedAntoniou(vc(fixed=true,
        start=0)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,0})));
  Modelica.Blocks.Math.Harmonic harmonic_v2(f=source.f, k=1)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Modelica.Blocks.Math.Harmonic harmonic_i2(f=source.f, k=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,20})));
protected
  //additional initialization
  SI.Current is(start=0)=source.i;
equation
  connect(multiSensor2.pc, multiSensor2.pv)
    annotation (Line(points={{10,80},{10,90},{20,90}}, color={0,0,255}));
  connect(multiSensor2.pc, ri.n)
    annotation (Line(points={{10,80},{0,80},{0,40}}, color={0,0,255}));
  connect(ri.p, source.p)
    annotation (Line(points={{0,20},{0,8}},      color={0,0,255}));
  connect(source.n, groundS.p)
    annotation (Line(points={{0,-12},{0,-20}},     color={0,0,255}));
  connect(multiSensor2.nv, groundS.p)
    annotation (Line(points={{20,70},{20,-20},{0,-20}}, color={0,0,255}));
  connect(multiSensor1.pc, ri.n)
    annotation (Line(points={{-10,80},{0,80},{0,40}}, color={0,0,255}));
  connect(multiSensor1.pv,multiSensor1. pc)
    annotation (Line(points={{-20,90},{-10,90},{-10,80}}, color={0,0,255}));
  connect(multiSensor1.nv, groundS.p)
    annotation (Line(points={{-20,70},{-20,-20},{0,-20}}, color={0,0,255}));
  connect(multiSensor1.nc, analyticAntoniou.p)
    annotation (Line(points={{-30,80},{-70,80},{-70,10}}, color={0,0,255}));
  connect(analyticAntoniou.n,ground1. p)
    annotation (Line(points={{-70,-10},{-70,-80}}, color={0,0,255}));
  connect(multiSensor1.v,harmonic_v1. u)
    annotation (Line(points={{-26,69},{-26,50},{-38,50}}, color={0,0,127}));
  connect(multiSensor1.i,harmonic_i1. u)
    annotation (Line(points={{-14,69},{-14,20},{-38,20}}, color={0,0,127}));
  connect(multiSensor2.nc, improvedAntoniou.p)
    annotation (Line(points={{30,80},{70,80},{70,10}}, color={0,0,255}));
  connect(improvedAntoniou.n, ground2.p)
    annotation (Line(points={{70,-10},{70,-80}}, color={0,0,255}));
  connect(multiSensor2.v, harmonic_v2.u)
    annotation (Line(points={{26,69},{26,50},{38,50}}, color={0,0,127}));
  connect(multiSensor2.i, harmonic_i2.u)
    annotation (Line(points={{14,69},{14,20},{38,20}}, color={0,0,127}));
  annotation (experiment(
      StopTime=1.0,
      Interval=1e-04,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>
For testing we use a sinusoidal voltage source with inner resistance. We measure voltage and current and see a phase shift of 90&deg; between them.
</p>
</html>"));
end TestInductorReplacement;
