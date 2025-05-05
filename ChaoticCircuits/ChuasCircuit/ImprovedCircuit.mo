within ChaoticCircuits.ChuasCircuit;
model ImprovedCircuit "Chua's chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance RL=14 "Resistance of Inductor";
  parameter SI.Resistance R=1.9e3 "Resistor";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  //parameter of Chua's diode
  parameter Real k0=15000.0 "No-load amplification of opAmps";
  parameter SI.Voltage Vs=12 "Supply voltage";
  parameter SI.Resistance R12=220 "R1 and R2";
  parameter SI.Resistance R3=2200 "R3";
  parameter SI.Resistance R45=22e3 "R4 and R5";
  parameter SI.Resistance R6=3300 "R6";
  //shortcut to results
  SI.Voltage v1(start=1e-3, fixed=true)=capacitor1.v "Result c1.v";
  SI.Voltage v2(start=0, fixed=true)=capacitor2.v "Result 2 c2.v";
  SI.Voltage vRL(start=0, fixed=true)=resistorL.v "Result RL*L.i";
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
    annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,-20})));
  Modelica.Electrical.Analog.Basic.Resistor resistorL(R=RL)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,20})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C=C1)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
    annotation (Placement(transformation(extent={{-30,30},{-10,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C=C2)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-30,-60},{-10,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R12)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={30,40})));
  Modelica.Electrical.Analog.Basic.Resistor r2(R=R12)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={30,-20})));
  Modelica.Electrical.Analog.Basic.Resistor r4(R=R45)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={70,40})));
  Modelica.Electrical.Analog.Basic.Resistor r5(R=R45)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={70,-20})));
  Modelica.Electrical.Analog.Basic.Resistor r6(R=R6)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={80,-40})));
  Components.IdealizedOpAmp3Pin opAmp1(
    V0=k0,
    Vps=Vs,
    Vns=-Vs)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={30,10})));
  Components.IdealizedOpAmp3Pin opAmp2(
    V0=k0,
    Vps=Vs,
    Vns=-Vs)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,10})));
  Modelica.Electrical.Analog.Basic.Resistor r3(R=R3)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={20,-40})));
protected
  //further initialization
  SI.Current id1(start=0)=r2.i "Initial current of r2 at opAmp1";
  SI.Current id2(start=0)=r5.i "Initial current of r5 at opAmp2";
equation
  connect(resistor.p, capacitor2.p)
    annotation (Line(points={{-30,40},{-40,40},{-40,10}}, color={0,0,255}));
  connect(resistor.n, capacitor1.p)
    annotation (Line(points={{-10,40},{0,40},{0,10}},  color={0,0,255}));
  connect(ground.p, inductor.n)
    annotation (Line(points={{-20,-40},{-80,-40},{-80,-30}},
                                                           color={0,0,255}));
  connect(ground.p, capacitor2.n)
    annotation (Line(points={{-20,-40},{-40,-40},{-40,-10}},
                                                           color={0,0,255}));
  connect(ground.p, capacitor1.n)
    annotation (Line(points={{-20,-40},{0,-40},{0,-10}}, color={0,0,255}));
  connect(r1.p, opAmp1.in_p)
    annotation (Line(points={{20,40},{20,16}}, color={0,0,255}));
  connect(opAmp1.in_n, r2.p)
    annotation (Line(points={{20,4},{20,-20}}, color={0,0,255}));
  connect(opAmp1.out, r2.n)
    annotation (Line(points={{40,10},{40,-20}}, color={0,0,255}));
  connect(opAmp1.out, r1.n)
    annotation (Line(points={{40,10},{40,40}}, color={0,0,255}));
  connect(r2.p, r3.p)
    annotation (Line(points={{20,-20},{20,-30}}, color={0,0,255}));
  connect(ground.p, r3.n) annotation (Line(points={{-20,-40},{0,-40},{0,-50},
          {20,-50}},
                 color={0,0,255}));
  connect(ground.p, r6.n) annotation (Line(points={{-20,-40},{0,-40},{0,-50},
          {80,-50}},
                 color={0,0,255}));
  connect(r5.n, opAmp2.out)
    annotation (Line(points={{60,-20},{60,10}}, color={0,0,255}));
  connect(r4.n, opAmp2.out)
    annotation (Line(points={{60,40},{60,10}}, color={0,0,255}));
  connect(r4.p, opAmp2.in_p)
    annotation (Line(points={{80,40},{80,16}}, color={0,0,255}));
  connect(opAmp2.in_n, r5.p)
    annotation (Line(points={{80,4},{80,-20}}, color={0,0,255}));
  connect(r5.p, r6.p)
    annotation (Line(points={{80,-20},{80,-30}}, color={0,0,255}));
  connect(capacitor1.p, r4.p)
    annotation (Line(points={{0,10},{0,52},{80,52},{80,40}}, color={0,0,255}));
  connect(capacitor1.p, r1.p)
    annotation (Line(points={{0,10},{0,52},{20,52},{20,40}}, color={0,0,255}));
  connect(resistor.p, resistorL.p)
    annotation (Line(points={{-30,40},{-80,40},{-80,30}}, color={0,0,255}));
  connect(resistorL.n, inductor.p)
    annotation (Line(points={{-80,10},{-80,-10}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={
        Rectangle(
          extent={{10,60},{90,-60}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}), Text(
          extent={{10,70},{90,60}},
          textColor={28,108,200},
          textString="Chua's diode"),
                      Line(
          points={{-26,30},{-14,50}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end ImprovedCircuit;
