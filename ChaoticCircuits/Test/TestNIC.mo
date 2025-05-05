within ChaoticCircuits.Test;
model TestNIC "Test negative impedance converter"
  extends Modelica.Icons.Example;
  parameter SI.Voltage VLim=8.870565 "Left and right corner";
  parameter SI.Conductance gPos=0.212766e-3 "Positive differential conductance";
  parameter SI.Conductance gNeg=-0.147018e-3 "Negative differential conductance";
  SI.Voltage vNIC=rampVoltage.v;
  SI.Current iNIC=if vNIC<-VLim then -VLim*gNeg + gPos*(vNIC + VLim) elseif vNIC>+VLim then +VLim*gNeg + gPos*(vNIC - VLim) else gNeg*vNIC;
  //initialization
  SI.Current iNICn(start=0)=rNICn.i "Current of resistor rNICn";
  Modelica.Electrical.Analog.Basic.Resistor rNICp(R=4700)
    annotation (Placement(transformation(extent={{10,20},{30,40}})));
  Components.IdealizedOpAmp3Pin                          opAmp
    annotation (Placement(transformation(extent={{10,10},{30,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor rNICn(R=4700)
    annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
  Modelica.Electrical.Analog.Basic.Resistor rNICg(R=6800) annotation (Placement(
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
        origin={-30,0})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-20,30})));
equation
  connect(rNICp.n, opAmp.out) annotation (Line(points={{30,30},{40,30},{40,0},{30,
          0}},      color={0,0,255}));
  connect(rNICp.p, opAmp.in_p) annotation (Line(points={{10,30},{0,30},{0,6},{10,
          6}},      color={0,0,255}));
  connect(rNICn.n, opAmp.out) annotation (Line(points={{30,-30},{40,-30},{40,0},
          {30,0}},     color={0,0,255}));
  connect(rNICn.p, opAmp.in_n) annotation (Line(points={{10,-30},{0,-30},{0,-6},
          {10,-6}},      color={0,0,255}));
  connect(rNICn.p, rNICg.p)
    annotation (Line(points={{10,-30},{0,-30},{0,-40}},      color={0,0,255}));
  connect(rNICg.n, ground.p)
    annotation (Line(points={{0,-60},{0,-70}},     color={0,0,255}));
  connect(currentSensor.n, opAmp.in_p)
    annotation (Line(points={{-10,30},{0,30},{0,6},{10,6}}, color={0,0,255}));
  connect(currentSensor.p, rampVoltage.p)
    annotation (Line(points={{-30,30},{-30,10}}, color={0,0,255}));
  connect(ground.p, rampVoltage.n)
    annotation (Line(points={{0,-70},{-30,-70},{-30,-10}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>Plot currentsensor.i vs. rampVoltage.v to see the i(v)-characteristic of the NIC (negative impedance converter).</p>
</html>"), experiment(
      StopTime=5,
      Interval=1e-3,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-80,90},{80,50}},
          textColor={28,108,200},
          textString="Note: expected results only with 
Modelica.Electrical.Analog.Ideal.IdealizedOpAmpLimited
or Components.IdealizedOpAmp3Pin")}));
end TestNIC;
