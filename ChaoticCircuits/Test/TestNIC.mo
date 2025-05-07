within ChaoticCircuits.Test;
model TestNIC "Test negative impedance converter"
  extends Modelica.Icons.Example;
  parameter SI.Voltage Vs=15 "Supply voltage";
  parameter SI.Resistance R=4700 "NIC pos and neg feedback resistance";
  parameter SI.Resistance Rg=6800 "NIC resistance to ground";
  Modelica.Electrical.Analog.Basic.Resistor rPos(R=R)
    annotation (Placement(transformation(extent={{30,20},{10,40}})));
  Components.IdealizedOpAmp3Pin                          opAmp(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{10,10},{30,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor rNeg(R=R)
    annotation (Placement(transformation(extent={{30,-40},{10,-20}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
  Modelica.Electrical.Analog.Basic.Resistor rg(R=Rg) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-50})));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(
    V=30,
    duration=5,
    offset=-15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-20})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-20,30})));
  Components.IdealNIC idealNIC(
    Vs=Vs,
    R=R,
    Rg=Rg) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,0})));
protected
  //initialization
  SI.Current iNICn(start=0) = rNeg.i "Current of resistor rNICn";
equation
  connect(rg.n, ground.p)
    annotation (Line(points={{0,-60},{0,-70},{-40,-70}}, color={0,0,255}));
  connect(currentSensor.n, opAmp.in_p)
    annotation (Line(points={{-10,30},{0,30},{0,6},{10,6}}, color={0,0,255}));
  connect(currentSensor.p, rampVoltage.p)
    annotation (Line(points={{-30,30},{-40,30},{-40,-10}},
                                                 color={0,0,255}));
  connect(ground.p, rampVoltage.n)
    annotation (Line(points={{-40,-70},{-40,-30}},         color={0,0,255}));
  connect(rampVoltage.p, idealNIC.p) annotation (Line(points={{-40,-10},{-40,30},
          {-60,30},{-60,10}}, color={0,0,255}));
  connect(ground.p, idealNIC.n)
    annotation (Line(points={{-40,-70},{-60,-70},{-60,-10}}, color={0,0,255}));
  connect(rg.p, opAmp.in_n)
    annotation (Line(points={{0,-40},{0,-6},{10,-6}}, color={0,0,255}));
  connect(rNeg.n, opAmp.in_n) annotation (Line(points={{10,-30},{0,-30},{0,-6},
          {10,-6}}, color={0,0,255}));
  connect(rNeg.p, opAmp.out) annotation (Line(points={{30,-30},{40,-30},{40,0},
          {30,0}}, color={0,0,255}));
  connect(opAmp.out, rPos.p)
    annotation (Line(points={{30,0},{40,0},{40,30},{30,30}}, color={0,0,255}));
  connect(rPos.n, opAmp.in_p)
    annotation (Line(points={{10,30},{0,30},{0,6},{10,6}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>Plot currentsensor.i vs. rampVoltage.v to see the i(v)-characteristic of the NIC (negative impedance converter).</p>
</html>"), experiment(
      StopTime=5,
      Interval=1e-3,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-80,100},{80,60}},
          textColor={28,108,200},
          textString="Note: opAmp model including output saturation 
Modelica.Electrical.Analog.Ideal.IdealizedOpAmpLimited
or Components.IdealizedOpAmp3Pin")}));
end TestNIC;
