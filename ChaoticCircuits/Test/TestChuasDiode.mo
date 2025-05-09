within ChaoticCircuits.Test;
model TestChuasDiode "Test OpAmp-implementation of Chuas diode"
  extends Modelica.Icons.Example;
  parameter Real k0=15000.0 "No-load amplification of opAmps";
  parameter SI.Voltage Vs=12 "Supply voltage";
  parameter Real k0=15000.0 "No-load amplification of opAmps";
  parameter SI.Voltage Vs=12 "Supply voltage";
  parameter SI.Resistance R1 = 220 "NIC1: feedback resistor";
  parameter SI.Resistance R1g=2200 "NIC1: ground resistor";
  parameter SI.Resistance R2 =22e3 "NIC2: feedback resistor";
  parameter SI.Resistance R2g=3300 "NIC2: ground resistor";
  //calculated parameters
  parameter SI.Voltage VLim1=Vs*R1g/(R1g + R1) "NIC1: Left and right corner voltage";
  parameter SI.Conductance gPos1=1/R1 "NIC1: Positive differential conductance";
  parameter SI.Conductance gNeg1=-1/R1g "NIC1: Negative differential conductance";
  parameter SI.Voltage VLim2=Vs*R2g/(R2g + R2) "NIC2: Left and right corner voltage";
  parameter SI.Conductance gPos2=1/R2 "NIC2: Positive differential conductance";
  parameter SI.Conductance gNeg2=-1/R2g "NIC2: Negative differential conductance";
  parameter SI.Voltage Ve=min(VLim1, VLim2) "Inner limit";
  parameter SI.Conductance Ga=gNeg1 + gNeg2 "Inner slope";
  parameter SI.Conductance Gb=if VLim1<VLim2 then gPos1 + gNeg2 else gNeg1 + gPos2 "Intermedita slope";
  parameter SI.Conductance Gc=gPos1 + gPos2 "Outer slope";
  parameter SI.Voltage Vp=max(VLim1, VLim2) "Voltage peak";
  Modelica.Electrical.Analog.Sources.SineVoltage source(V=Vs, f=10) annotation
    (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={20,40})));
  Modelica.Electrical.Analog.Basic.Resistor r1a(R=R1) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={40,20})));
  Modelica.Electrical.Analog.Basic.Resistor r1b(R=R1) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={40,-20})));
  Modelica.Electrical.Analog.Basic.Resistor r2a(R=R2) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={80,20})));
  Modelica.Electrical.Analog.Basic.Resistor r2b(R=R2) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={80,-20})));
  Modelica.Electrical.Analog.Basic.Resistor r2g(R=R2g) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={90,-40})));
  Components.IdealizedOpAmp3Pin opAmp1(
    V0=k0,
    Vps=Vs,
    Vns=-Vs)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={40,0})));
  Components.IdealizedOpAmp3Pin opAmp2(
    V0=k0,
    Vps=Vs,
    Vns=-Vs)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={80,0})));
  Modelica.Electrical.Analog.Basic.Resistor r1g(R=R1g) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={30,-40})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-20,40})));
  Components.IdealNIC idealNIC1(
    Vs=Vs,
    R=R1,
    Rg=R1g) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-60,0})));
  Components.IdealNIC idealNIC2(
    Vs=Vs,
    R=R2,
    Rg=R2g) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,0})));
protected
  //initialization
  SI.Current iNIC1n(start=0) = r1b.i "NIC1";
  SI.Current iNIC2n(start=0) = r2b.i "NIC2";
equation
  connect(r1a.p, opAmp1.in_p)
    annotation (Line(points={{30,20},{30,6}},
                                            color={0,0,255}));
  connect(opAmp1.in_n, r1b.p)
    annotation (Line(points={{30,-6},{30,-20}},
                                              color={0,0,255}));
  connect(opAmp1.out, r1b.n)
    annotation (Line(points={{50,0},{50,-20}}, color={0,0,255}));
  connect(opAmp1.out, r1a.n)
    annotation (Line(points={{50,0},{50,20}}, color={0,0,255}));
  connect(r1b.p, r1g.p)
    annotation (Line(points={{30,-20},{30,-30}},
                                               color={0,0,255}));
  connect(r2b.n, opAmp2.out)
    annotation (Line(points={{70,-20},{70,0}}, color={0,0,255}));
  connect(r2a.n, opAmp2.out)
    annotation (Line(points={{70,20},{70,0}}, color={0,0,255}));
  connect(r2a.p, opAmp2.in_p)
    annotation (Line(points={{90,20},{90,6}}, color={0,0,255}));
  connect(opAmp2.in_n, r2b.p)
    annotation (Line(points={{90,-6},{90,-20}}, color={0,0,255}));
  connect(r2b.p, r2g.p)
    annotation (Line(points={{90,-20},{90,-30}}, color={0,0,255}));
  connect(r1g.n, r2g.n) annotation (Line(points={{30,-50},{30,-60},{90,-60},{90,
          -50}},
        color={0,0,255}));
  connect(r1g.n, ground.p)
    annotation (Line(points={{30,-50},{30,-60},{0,-60}}, color={0,0,255}));
  connect(ground.p, source.n)
    annotation (Line(points={{0,-60},{0,-10}}, color={0,0,255}));
  connect(source.p,currentSensor1. p)
    annotation (Line(points={{0,10},{0,40},{10,40}},
                                             color={0,0,255}));
  connect(currentSensor2.p,currentSensor1. p)
    annotation (Line(points={{-10,40},{10,40}},color={0,0,255}));
  connect(idealNIC2.p, currentSensor2.n)
    annotation (Line(points={{-40,10},{-40,40},{-30,40}}, color={0,0,255}));
  connect(currentSensor2.n, idealNIC1.p)
    annotation (Line(points={{-30,40},{-60,40},{-60,10}}, color={0,0,255}));
  connect(idealNIC1.n, ground.p)
    annotation (Line(points={{-60,-10},{-60,-60},{0,-60}}, color={0,0,255}));
  connect(ground.p, idealNIC2.n)
    annotation (Line(points={{0,-60},{-40,-60},{-40,-10}}, color={0,0,255}));
  connect(r1a.p, r2a.p) annotation (Line(points={{30,20},{30,40},{90,40},{90,20}},
        color={0,0,255}));
  connect(r1a.p,currentSensor1. n)
    annotation (Line(points={{30,20},{30,40}}, color={0,0,255}));
  annotation (experiment(
      Interval=0.0001,
      Tolerance=1e-06), Documentation(info="<html>
<p>Plot currentsensor1.i and currentSensor2.i vs. source.v to see the i(v)-characteristic of Chuas diode, consisting of two NICs (negative impedance converter).</p>
</html>"));
end TestChuasDiode;
