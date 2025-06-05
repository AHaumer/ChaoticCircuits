within ChaoticCircuits.Test;
model TestOpAmpTriode "Test OpAmp to model triode characteristic"
  extends Modelica.Icons.Example;
  constant SI.Voltage unitV=1;
  Real x = source.v/unitV;
  Real y = 1 - x^2;
  parameter SI.Resistance R=10e3;
  Modelica.Electrical.Analog.Sources.RampVoltage source(
    V=6,
    duration=1,
    offset=-3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-18})));
  Components.Multiplier multiplier(out(i(start=0)))
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Components.ImprovedOpAmp3Pin opAmp
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Electrical.Analog.Basic.Resistor r(R=R)
    annotation (Placement(transformation(extent={{40,10},{20,30}})));
  Modelica.Electrical.Analog.Basic.Resistor rx2(R=R/10)
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constOne(V=-1) annotation
    (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-20})));
  Modelica.Electrical.Analog.Basic.Resistor rx1(R=R)
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor result annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,-20})));
equation
  connect(source.p, multiplier.in2)
    annotation (Line(points={{-50,-8},{-50,4},{-40,4}}, color={0,0,255}));
  connect(source.p, multiplier.in1)
    annotation (Line(points={{-50,-8},{-50,16},{-40,16}}, color={0,0,255}));
  connect(opAmp.in_n, r.n)
    annotation (Line(points={{20,6},{20,20}},   color={0,0,255}));
  connect(r.p, opAmp.out)
    annotation (Line(points={{40,20},{40,0}},
                                            color={0,0,255}));
  connect(multiplier.out, rx2.p)
    annotation (Line(points={{-20,10},{-10,10}}, color={0,0,255}));
  connect(rx2.n, opAmp.in_n)
    annotation (Line(points={{10,10},{10,6},{20,6}},    color={0,0,255}));
  connect(constOne.p, rx1.p)
    annotation (Line(points={{-20,-10},{-10,-10}}, color={0,0,255}));
  connect(rx1.n, opAmp.in_n)
    annotation (Line(points={{10,-10},{10,6},{20,6}},    color={0,0,255}));
  connect(source.n, ground.p)
    annotation (Line(points={{-50,-28},{-50,-40}}, color={0,0,255}));
  connect(ground.p, constOne.n)
    annotation (Line(points={{-50,-40},{-20,-40},{-20,-30}}, color={0,0,255}));
  connect(ground.p, opAmp.in_p)
    annotation (Line(points={{-50,-40},{20,-40},{20,-6}},   color={0,0,255}));
  connect(opAmp.out, result.p)
    annotation (Line(points={{40,0},{40,-10}}, color={0,0,255}));
  connect(ground.p, result.n)
    annotation (Line(points={{-50,-40},{40,-40},{40,-30}}, color={0,0,255}));
  annotation (experiment(
      StopTime=1.0,
      Interval=0.0001,
      Tolerance=1e-06));
end TestOpAmpTriode;
