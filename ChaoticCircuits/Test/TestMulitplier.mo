within ChaoticCircuits.Test;
model TestMulitplier
  extends Modelica.Icons.Example;
  Components.Multiplier multiplier
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1(
    V=5,
    phase=0,
    f=50,
    offset=0,
    startTime=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,0})));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage2(
    V=5,
    phase=0.78539816339745,
    f=50,
    offset=0,
    startTime=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-20})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,-22})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
equation
  connect(sineVoltage1.p, multiplier.in1) annotation (Line(points={{-60,10},{
          -18,10},{-18,6},{-10,6}},
                               color={0,0,255}));
  connect(sineVoltage2.p, multiplier.in2) annotation (Line(points={{-40,-10},{
          -20,-10},{-20,-6},{-10,-6}},
                                  color={0,0,255}));
  connect(multiplier.out, voltageSensor.p)
    annotation (Line(points={{10,0},{40,0},{40,-12}}, color={0,0,255}));
  connect(ground.p, voltageSensor.n)
    annotation (Line(points={{0,-40},{40,-40},{40,-32}}, color={0,0,255}));
  connect(ground.p, sineVoltage2.n)
    annotation (Line(points={{0,-40},{-40,-40},{-40,-30}}, color={0,0,255}));
  connect(ground.p, sineVoltage1.n)
    annotation (Line(points={{0,-40},{-60,-40},{-60,-10}}, color={0,0,255}));
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
