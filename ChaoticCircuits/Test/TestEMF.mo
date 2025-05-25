within ChaoticCircuits.Test;
model TestEMF "Test rotational emf"
  extends Modelica.Icons.Example;
  Components.RotationalEMF emf(M=1, w(fixed=true))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.1)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Sources.Step ie(
    height=1,
    offset=0,
    startTime=0.05)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Electrical.Analog.Sources.StepCurrent stepCurrent(
    I=1,
    offset=0,
    startTime=0.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
equation
  connect(emf.flange, inertia.flange_a)
    annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
  connect(ie.y, emf.ie)
    annotation (Line(points={{-19,0},{-10,0}}, color={0,0,127}));
  connect(stepCurrent.n, emf.pa) annotation (Line(points={{-60,10},{-60,20},{0,20},
          {0,10}}, color={0,0,255}));
  connect(stepCurrent.p, ground.p)
    annotation (Line(points={{-60,-10},{-60,-20},{-30,-20}}, color={0,0,255}));
  connect(ground.p, emf.na)
    annotation (Line(points={{-30,-20},{0,-20},{0,-10}}, color={0,0,255}));
  annotation (experiment(
      StopTime=0.2,
      Interval=0.0001,
      Tolerance=1e-06), Documentation(info="<html>
<p>
With <code>M = 1 H</code> and excitation current of 1 A is provided starting at 0.05 s and an armature current of 1 A starting at 0.1 s. <br>
Thus a torque of <code>emf.tau = 1 N.m</code> is generated, accelerating the inertia <code>J = 0.1 kg.m<sup>2</sup></code> within 0.1 s to <code>emf.w = 1 rad/s</code> starting from standstill. <br>
Also have a look at the induce voltage which reaches <code>emf.v = 1 V</code>.
</p>
</html>"));
end TestEMF;
