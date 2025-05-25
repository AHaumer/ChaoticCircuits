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
        rotation=90,
        origin={-40,20})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C=C1)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={40,0})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
    annotation (Placement(transformation(extent={{10,30},{30,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C=C2)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270)));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{10,-60},{30,-40}})));
  Components.ImprovedChuaDiode improvedChuaDiode(redeclare
      ParameterSets.ChuaData chuaData) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,0})));
  Components.ImprovedAntoniou improvedAntoniou(vc(fixed=true))
                                               annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-40,-20})));
equation
  connect(resistor.p, capacitor2.p)
    annotation (Line(points={{10,40},{0,40},{0,10}},      color={0,0,255}));
  connect(resistor.n, capacitor1.p)
    annotation (Line(points={{30,40},{40,40},{40,10}}, color={0,0,255}));
  connect(ground.p, capacitor2.n)
    annotation (Line(points={{20,-40},{0,-40},{0,-10}},    color={0,0,255}));
  connect(ground.p, capacitor1.n)
    annotation (Line(points={{20,-40},{40,-40},{40,-10}},color={0,0,255}));
  connect(ground.p, improvedChuaDiode.n)
    annotation (Line(points={{20,-40},{80,-40},{80,-10}}, color={0,0,255}));
  connect(resistor.n, improvedChuaDiode.p)
    annotation (Line(points={{30,40},{80,40},{80,10}}, color={0,0,255}));
  connect(ground.p, improvedAntoniou.n)
    annotation (Line(points={{20,-40},{-40,-40},{-40,-30}}, color={0,0,255}));
  connect(resistorL.n, improvedAntoniou.p) annotation (Line(points={{-40,10},{
          -40,-6},{-40,-10},{-40,-10}}, color={0,0,255}));
  connect(resistor.p, resistorL.p)
    annotation (Line(points={{10,40},{-40,40},{-40,30}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ChuasCircuit\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Line(
          points={{10,34},{30,46}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open}),
                      Text(
          extent={{-80,100},{80,70}},
          textColor={0,0,255},
          textString="R = 1900 Ohm periodic
R = 1500 Ohm chaotic")}));
end InductorlessCircuit;
