within ChaoticCircuits.Test;
model SimpleTransistorCharacteristic
  "Characteristic of the simple small signal transistor model"
  extends Modelica.Icons.Example;
  Components.SimpleTransistor npn(Vth=0.001,
                                  vBE(start=0))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage vBE annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-20,-10})));
  Components.Staircase staircase(
    height=0.1,
    offset=0,
    nperiod=10,
    samplePeriod=0.1,
    startTime=0)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage vCE annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-10})));
  Modelica.Blocks.Sources.SawTooth sawTooth(
    amplitude=8,
    period=0.1,
    nperiod=10,
    offset=2,
    startTime=0)
    annotation (Placement(transformation(extent={{70,-20},{50,0}})));
equation
  connect(ground.p, vBE.n)
    annotation (Line(points={{10,-30},{-20,-30},{-20,-20}}, color={0,0,255}));
  connect(ground.p, npn.E)
    annotation (Line(points={{10,-30},{10,-6}}, color={0,0,255}));
  connect(vBE.p, npn.B)
    annotation (Line(points={{-20,0},{-10,0}}, color={0,0,255}));
  connect(staircase.y, vBE.v)
    annotation (Line(points={{-39,-10},{-32,-10}}, color={0,0,127}));
  connect(ground.p, vCE.n)
    annotation (Line(points={{10,-30},{30,-30},{30,-20}}, color={0,0,255}));
  connect(sawTooth.y, vCE.v)
    annotation (Line(points={{49,-10},{42,-10}}, color={0,0,127}));
  connect(npn.C, vCE.p)
    annotation (Line(points={{10,6},{10,20},{30,20},{30,0}}, color={0,0,255}));
  annotation (experiment(
      Interval=0.0001,
      Tolerance=1e-06));
end SimpleTransistorCharacteristic;
