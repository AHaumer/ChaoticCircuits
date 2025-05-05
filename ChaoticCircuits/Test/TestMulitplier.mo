within ChaoticCircuits.Test;
model TestMulitplier "Test the analog multiplier"
  extends Modelica.Icons.Example;
  Components.Multiplier multiplier
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Sources.Sine sine1(
    amplitude=5,
    f=50,
    phase=0,
    offset=0,
    startTime=0)
    annotation (Placement(transformation(extent={{-90,50},{-70,70}})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=5,
    f=50,
    phase=0.78539816339745,
    offset=0,
    startTime=0)
    annotation (Placement(transformation(extent={{-90,10},{-70,30}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-30,0})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-10,-20})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,-20})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{10,-60},{30,-40}})));
  Modelica.Blocks.Sources.Constant const(k=1/multiplier.ER)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=3)
    annotation (Placement(transformation(extent={{10,30},{30,50}})));
equation
  connect(signalVoltage1.p, multiplier.in1)
    annotation (Line(points={{-30,10},{0,10},{0,6},{10,6}}, color={0,0,255}));
  connect(signalVoltage2.p, multiplier.in2) annotation (Line(points={{-10,-10},{
          0,-10},{0,-6},{10,-6}}, color={0,0,255}));
  connect(multiplier.out, voltageSensor.p)
    annotation (Line(points={{30,0},{40,0},{40,-10}}, color={0,0,255}));
  connect(ground.p, voltageSensor.n)
    annotation (Line(points={{20,-40},{40,-40},{40,-30}},color={0,0,255}));
  connect(ground.p, signalVoltage2.n)
    annotation (Line(points={{20,-40},{-10,-40},{-10,-30}}, color={0,0,255}));
  connect(ground.p, signalVoltage1.n)
    annotation (Line(points={{20,-40},{-30,-40},{-30,-10}}, color={0,0,255}));
  connect(sine1.y, signalVoltage1.v) annotation (Line(points={{-69,60},{-60,60},
          {-60,0},{-42,0}}, color={0,0,127}));
  connect(sine2.y, signalVoltage2.v) annotation (Line(points={{-69,20},{-50,20},
          {-50,-20},{-22,-20}}, color={0,0,127}));
  connect(sine2.y, multiProduct.u[1]) annotation (Line(points={{-69,20},{0,20},
          {0,37.6667},{10,37.6667}}, color={0,0,127}));
  connect(const.y, multiProduct.u[2]) annotation (Line(points={{-19,40},{-4,40},
          {-4,40},{10,40}}, color={0,0,127}));
  connect(sine1.y, multiProduct.u[3]) annotation (Line(points={{-69,60},{0,60},
          {0,42.3333},{10,42.3333}}, color={0,0,127}));
  annotation (experiment(
      StopTime=0.2,
      Interval=0.0001,
      Tolerance=1e-06), Documentation(info="<html>
<p>
Two sine voltages (e.g. representing measured voltage and current) with the same frequency but different phase shift are multiplied, thus showing the instantaneous power. 
Try different phase shifts.
</p>
<p>
Both amplitudes are choosen as 5 V, i.e. 0.5-times the maximum value (Vscale= 10 V). <br>
The result (sine squared) - arithmetic mean (i.e. real power) deduced - has an amplitude of 5 V * 5 V / Vscale = 2.5 V. <br>
Bear in mind the different scaling of the output! <br>
The arithmetic mean i.e. the real power is 5 V/&radic;2 * 5 V/&radic;2 / Vscale * cos(phase shift=45&deg;) = 5/8*&radic;2 = 0.8838834765 V.
</p>
</html>"));
end TestMulitplier;
