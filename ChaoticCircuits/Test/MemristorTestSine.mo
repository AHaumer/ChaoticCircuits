within ChaoticCircuits.Test;
model MemristorTestSine "Test the memristor with sinusoidal voltage"
  extends Modelica.Icons.Example;
  SI.Current iScaled=1e4*memristor.i "For comparison";
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=1.2, f=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Components.DriftMemristor memristor(q(fixed=true)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,0})));
equation
  connect(sineVoltage.n, ground.p)
    annotation (Line(points={{-20,-10},{-20,-20},{0,-20}}, color={0,0,255}));
  connect(sineVoltage.p, memristor.p) annotation (Line(points={{-20,10},{-20,20},
          {20,20},{20,10}}, color={0,0,255}));
  connect(ground.p, memristor.n)
    annotation (Line(points={{0,-20},{20,-20},{20,-10}}, color={0,0,255}));
  annotation (experiment(
      StopTime=3,
      Interval=0.001,
      Tolerance=1e-06));
end MemristorTestSine;
