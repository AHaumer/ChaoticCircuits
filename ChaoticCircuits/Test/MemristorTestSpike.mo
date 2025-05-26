within ChaoticCircuits.Test;
model MemristorTestSpike "Test the memristor with a single pulse"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Sources.TrapezoidCurrent trapezoidCurrent(
    I=2e-4,
    rising=0.1,
    width=0,
    falling=0.1,
    period=1,
    nperiod=1,
    offset=0,
    startTime=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Components.Memristor memristor(x(fixed=true)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,0})));
equation
  connect(ground.p, memristor.n)
    annotation (Line(points={{0,-20},{20,-20},{20,-10}}, color={0,0,255}));
  connect(ground.p, trapezoidCurrent.p)
    annotation (Line(points={{0,-20},{-20,-20},{-20,-10}}, color={0,0,255}));
  connect(trapezoidCurrent.n, memristor.p) annotation (Line(points={{-20,10},{-20,
          20},{20,20},{20,10}}, color={0,0,255}));
  annotation (experiment(
      StopTime=2,
      Interval=0.001,
      Tolerance=1e-06));
end MemristorTestSpike;
