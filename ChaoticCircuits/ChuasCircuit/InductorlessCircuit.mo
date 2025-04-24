within ChaoticCircuits.ChuasCircuit;
model InductorlessCircuit "Chua's chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance RL=14 "Resistance of Inductor";
  parameter SI.Resistance R=1.9e3 "Resistor";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  //parameter of Chua's diode
  parameter Real k0=15000.0 "No-load amplification of opAmps";
  parameter SI.Voltage Vs=9 "Supply voltage of opAmps";
  parameter SI.Resistance R12=220 "R1 and R2";
  parameter SI.Resistance R3=2200 "R3";
  parameter SI.Resistance R45=22e3 "R4 and R5";
  parameter SI.Resistance R6=3300 "R6";
  //Inductor replacement
  parameter SI.Resistance R7=100 "R7";
  parameter SI.Resistance R8=1.e3 "R8";
  parameter SI.Resistance R9=1.e3 "R9";
  parameter SI.Resistance R10=L*R8/(C9*R7*R9) "R10";
  parameter SI.Capacitance C9=100e-9 "C9";
  //shortcut to results
  SI.Voltage vRL=resistorL.v "Result RL*L.i";
  SI.Voltage v1(start=0, fixed=true)=capacitor1.v "Result c1.v";
  SI.Voltage v2(start=1e-3, fixed=true)=capacitor2.v "Result c2.v";
  SI.Voltage vL=resistorL.n.v "Voltage of Inductor replacement";
  SI.Current iL(start=0)=resistorL.i "Current of Inductor replacement";
  //initialization
  SI.Voltage vc9(start=0, fixed=true)=c9.v "Initial voltage of c9";
  SI.Current id1(start=0)=r2.i "Initial current of r2 at opAmp1";
  SI.Current id2(start=0)=r5.i "Initial current of r5 at opAmp2";
  SI.Current id3(start=0)=r8.i "Initial current of r8 at opAmp3";
  Modelica.Electrical.Analog.Basic.Resistor resistorL(R=RL)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,70})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C=C1)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={20,0})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C=C2)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={0,-2})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R12)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={40,40})));
  Modelica.Electrical.Analog.Basic.Resistor r2(R=R12)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={40,-20})));
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
        origin={40,10})));
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
        origin={30,-40})));
  Components.IdealizedOpAmp3Pin opAmp3(
    V0=k0,
    Vps=Vs,
    Vns=-Vs)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,50})));
  Components.IdealizedOpAmp3Pin opAmp4(
    V0=k0,
    Vps=Vs,
    Vns=-Vs)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-30,-20})));
  Modelica.Electrical.Analog.Basic.Resistor r7(R=R7)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,70})));
  Modelica.Electrical.Analog.Basic.Resistor r8(R=R8)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,30})));
  Modelica.Electrical.Analog.Basic.Resistor r9(R=R9)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,0})));
  Modelica.Electrical.Analog.Basic.Capacitor c9(C=C9)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,-40})));
  Modelica.Electrical.Analog.Basic.Resistor r10(R=R10)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,-70})));
equation
  connect(resistor.p, capacitor2.p)
    annotation (Line(points={{0,50},{0,8}},               color={0,0,255}));
  connect(resistor.n, capacitor1.p)
    annotation (Line(points={{20,50},{20,10}},         color={0,0,255}));
  connect(ground.p, capacitor2.n)
    annotation (Line(points={{10,-50},{0,-50},{0,-12}},    color={0,0,255}));
  connect(ground.p, capacitor1.n)
    annotation (Line(points={{10,-50},{20,-50},{20,-10}},color={0,0,255}));
  connect(r1.p, opAmp1.in_p)
    annotation (Line(points={{30,40},{30,16}}, color={0,0,255}));
  connect(opAmp1.in_n, r2.p)
    annotation (Line(points={{30,4},{30,-20}}, color={0,0,255}));
  connect(opAmp1.out, r2.n)
    annotation (Line(points={{50,10},{50,-20}}, color={0,0,255}));
  connect(opAmp1.out, r1.n)
    annotation (Line(points={{50,10},{50,40}}, color={0,0,255}));
  connect(r2.p, r3.p)
    annotation (Line(points={{30,-20},{30,-30}}, color={0,0,255}));
  connect(ground.p, r3.n) annotation (Line(points={{10,-50},{30,-50}},
                 color={0,0,255}));
  connect(ground.p, r6.n) annotation (Line(points={{10,-50},{80,-50}},
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
    annotation (Line(points={{20,10},{20,50},{80,50},{80,40}},
                                                             color={0,0,255}));
  connect(capacitor1.p, r1.p)
    annotation (Line(points={{20,10},{20,50},{30,50},{30,40}},
                                                             color={0,0,255}));
  connect(resistor.p, resistorL.p)
    annotation (Line(points={{0,50},{0,60}},              color={0,0,255}));
  connect(r7.p, opAmp3.in_p)
    annotation (Line(points={{-50,80},{-60,80},{-60,56}}, color={0,0,255}));
  connect(r7.n, r8.p)
    annotation (Line(points={{-50,60},{-50,40}}, color={0,0,255}));
  connect(r8.n, opAmp3.in_n)
    annotation (Line(points={{-50,20},{-60,20},{-60,44}}, color={0,0,255}));
  connect(r8.n, r9.p)
    annotation (Line(points={{-50,20},{-50,10}}, color={0,0,255}));
  connect(r9.n, c9.p)
    annotation (Line(points={{-50,-10},{-50,-30}}, color={0,0,255}));
  connect(c9.n, r10.p)
    annotation (Line(points={{-50,-50},{-50,-60}}, color={0,0,255}));
  connect(r10.n, ground.p) annotation (Line(points={{-50,-80},{-10,-80},{-10,-50},
          {10,-50}}, color={0,0,255}));
  connect(r7.p, resistorL.n)
    annotation (Line(points={{-50,80},{0,80}}, color={0,0,255}));
  connect(r8.p, opAmp4.out) annotation (Line(points={{-50,40},{-50,50},{-20,50},
          {-20,-20}}, color={0,0,255}));
  connect(r9.p, opAmp4.in_n)
    annotation (Line(points={{-50,10},{-40,10},{-40,-14}}, color={0,0,255}));
  connect(c9.n, opAmp4.in_p)
    annotation (Line(points={{-50,-50},{-40,-50},{-40,-26}}, color={0,0,255}));
  connect(c9.p, opAmp3.out) annotation (Line(points={{-50,-30},{-50,-20},{-80,-20},
          {-80,50}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Line(
          points={{4,40},{16,60}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open}),
        Rectangle(
          extent={{24,60},{90,-60}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}), Text(
          extent={{20,70},{100,60}},
          textColor={28,108,200},
          textString="Chua's diode"),
        Rectangle(
          extent={{-84,84},{-16,-84}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}), Text(
          extent={{-100,94},{0,84}},
          textColor={28,108,200},
          textString="Inductor replacement")}));
end InductorlessCircuit;
