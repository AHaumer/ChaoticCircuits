within ChaoticCircuits.ChuasCircuit;
model IdealCircuit "Chua's chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance RL=14 "Resistance of Inductor";
  parameter SI.Resistance R=1.9e3 "Resistor";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  //shortcut to results
  SI.Voltage v1(start=0, fixed=true)=capacitor1.v "Result c1.v";
  SI.Voltage v2(start=1e-3, fixed=true)=capacitor2.v "Result 2 c2.v";
  SI.Voltage vRL(start=0, fixed=true)=resistorL.v "Result RL*L.i";
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
    annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-40,-20})));
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
  Components.IdealChuaDiode idealChuaDiode(redeclare
      ChaoticCircuits.ParameterSets.ChuaData chuaData) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,0})));
equation
  connect(resistor.p, capacitor2.p)
    annotation (Line(points={{10,40},{0,40},{0,10}},      color={0,0,255}));
  connect(resistor.n, capacitor1.p)
    annotation (Line(points={{30,40},{40,40},{40,10}}, color={0,0,255}));
  connect(ground.p, inductor.n)
    annotation (Line(points={{20,-40},{-40,-40},{-40,-30}},color={0,0,255}));
  connect(ground.p, capacitor2.n)
    annotation (Line(points={{20,-40},{0,-40},{0,-10}},    color={0,0,255}));
  connect(ground.p, capacitor1.n)
    annotation (Line(points={{20,-40},{40,-40},{40,-10}},color={0,0,255}));
  connect(resistor.n, idealChuaDiode.p)
    annotation (Line(points={{30,40},{80,40},{80,10}}, color={0,0,255}));
  connect(ground.p, idealChuaDiode.n)
    annotation (Line(points={{20,-40},{80,-40},{80,-10}}, color={0,0,255}));
  connect(resistor.p, resistorL.p)
    annotation (Line(points={{10,40},{-40,40},{-40,30}},  color={0,0,255}));
  connect(resistorL.n, inductor.p)
    annotation (Line(points={{-40,10},{-40,-10}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ChuasCircuit\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-80,100},{80,70}},
          textColor={0,0,255},
          textString="R = 1900 Ohm periodic
R = 1500 Ohm chaotic"),
                      Line(
          points={{10,34},{30,46}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end IdealCircuit;
