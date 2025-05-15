within ChaoticCircuits.ChuasCircuit;
model InductorlessCircuit "Chua's chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance RL=14 "Resistance of Inductor";
  parameter SI.Resistance R=1.9e3 "Resistor";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  //Inductor replacement
  parameter SI.Voltage Vs=12 "Supply voltage, same as Chua diode";
  parameter SI.Resistance RIR1=100 "Inductor replacement R1";
  parameter SI.Resistance RIR2=1.e3 "Inductor replacement R2";
  parameter SI.Resistance RIR3=1.e3 "Inductor replacement R3";
  parameter SI.Resistance RIR4=L*RIR2/(CIR*RIR1*RIR3) "Inductor replacement R4";
  parameter SI.Capacitance CIR=100e-9 "Inductor replacement C";
  //shortcut to results
  SI.Voltage v1(start=0, fixed=true)=capacitor1.v "Result c1.v";
  SI.Voltage v2(start=1e-3, fixed=true)=capacitor2.v "Result c2.v";
  SI.Voltage vRL=resistorL.v "Result RL*L.i";
  SI.Voltage vL=resistorL.n.v "Voltage of Inductor replacement";
  SI.Current iL(start=0)=resistorL.i "Current of Inductor replacement";
  Modelica.Electrical.Analog.Basic.Resistor resistorL(R=RL)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,70})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C=C1)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={40,0})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
    annotation (Placement(transformation(extent={{10,40},{30,60}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C=C2)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270)));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  Components.ImprovedOpAmp3Pin opAmpIR1(Vps=+Vs, Vns=-Vs) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,50})));
  Components.ImprovedOpAmp3Pin opAmpIR2(Vps=+Vs, Vns=-Vs) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-30,-20})));
  Modelica.Electrical.Analog.Basic.Resistor rIR1(R=RIR1) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,70})));
  Modelica.Electrical.Analog.Basic.Resistor rIR2(R=RIR2) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,30})));
  Modelica.Electrical.Analog.Basic.Resistor rIR3(R=RIR3) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,0})));
  Modelica.Electrical.Analog.Basic.Capacitor cIR(C=CIR) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,-40})));
  Modelica.Electrical.Analog.Basic.Resistor rIR4(R=RIR4) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,-70})));
  Components.ImprovedChuaDiode improvedChuaDiode(redeclare
      ParameterSets.ChuaData chuaData) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,0})));
protected
  //further initialization
  SI.Voltage vcIR(start=0,fixed=true) = cIR.v "Initial voltage of cIR";
  SI.Current irIr2(start=0) = rIR2.i "Initial current of rIR3 at opAmp2";
equation
  connect(resistor.p, capacitor2.p)
    annotation (Line(points={{10,50},{0,50},{0,10}},      color={0,0,255}));
  connect(resistor.n, capacitor1.p)
    annotation (Line(points={{30,50},{40,50},{40,10}}, color={0,0,255}));
  connect(ground.p, capacitor2.n)
    annotation (Line(points={{20,-50},{0,-50},{0,-10}},    color={0,0,255}));
  connect(ground.p, capacitor1.n)
    annotation (Line(points={{20,-50},{40,-50},{40,-10}},color={0,0,255}));
  connect(resistor.p, resistorL.p)
    annotation (Line(points={{10,50},{0,50},{0,60}},      color={0,0,255}));
  connect(rIR1.p, opAmpIR1.in_p)
    annotation (Line(points={{-50,80},{-60,80},{-60,56}}, color={0,0,255}));
  connect(rIR1.n, rIR2.p)
    annotation (Line(points={{-50,60},{-50,40}}, color={0,0,255}));
  connect(rIR2.n, opAmpIR1.in_n)
    annotation (Line(points={{-50,20},{-60,20},{-60,44}}, color={0,0,255}));
  connect(rIR2.n, rIR3.p)
    annotation (Line(points={{-50,20},{-50,10}}, color={0,0,255}));
  connect(rIR3.n, cIR.p)
    annotation (Line(points={{-50,-10},{-50,-30}}, color={0,0,255}));
  connect(cIR.n, rIR4.p)
    annotation (Line(points={{-50,-50},{-50,-60}}, color={0,0,255}));
  connect(rIR4.n, ground.p) annotation (Line(points={{-50,-80},{0,-80},{0,-50},{
          20,-50}}, color={0,0,255}));
  connect(rIR1.p, resistorL.n)
    annotation (Line(points={{-50,80},{0,80}}, color={0,0,255}));
  connect(rIR2.p, opAmpIR2.out) annotation (Line(points={{-50,40},{-50,50},{-20,
          50},{-20,-20}}, color={0,0,255}));
  connect(rIR3.p, opAmpIR2.in_n)
    annotation (Line(points={{-50,10},{-40,10},{-40,-14}}, color={0,0,255}));
  connect(cIR.n, opAmpIR2.in_p)
    annotation (Line(points={{-50,-50},{-40,-50},{-40,-26}}, color={0,0,255}));
  connect(cIR.p, opAmpIR1.out) annotation (Line(points={{-50,-30},{-50,-20},{-80,
          -20},{-80,50}}, color={0,0,255}));
  connect(ground.p, improvedChuaDiode.n)
    annotation (Line(points={{20,-50},{80,-50},{80,-10}}, color={0,0,255}));
  connect(resistor.n, improvedChuaDiode.p)
    annotation (Line(points={{30,50},{80,50},{80,10}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ChuasCircuit\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={
        Rectangle(
          extent={{-84,84},{-16,-84}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}), Text(
          extent={{-100,94},{0,84}},
          textColor={28,108,200},
          textString="Inductor replacement"),
                      Text(
          extent={{0,-60},{102,-100}},
          textColor={0,0,255},
          textString="R = 1900 Ohm periodic
R = 1500 Ohm chaotic"),
                      Line(
          points={{10,44},{30,56}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end InductorlessCircuit;
