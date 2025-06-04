within ChaoticCircuits.ChuasMemristor;
model IdealCircuit "Chua's chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance R=1800 "Resistor";
  parameter SI.Capacitance C1=6.8e-9 "Capacitor 1";
  parameter SI.Capacitance C2=68.e-9 "Capacitor 2";
  //shortcut to results
  SI.Voltage v1(start=0, fixed=true)=capacitor1.v "Result c1.v";
  SI.Voltage v2(start=1e-3, fixed=true)=capacitor2.v "Result c2.v";
  SI.Current iL(start=0, fixed=true)=inductor.i "Result iL";
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
    annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-60,0})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C=C1)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={20,0})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C=C2)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-20,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
  Components.NegFCMemristor memristor(x(fixed=true))   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,0})));
equation
  connect(resistor.p, capacitor2.p)
    annotation (Line(points={{-10,40},{-20,40},{-20,10}}, color={0,0,255}));
  connect(resistor.n, capacitor1.p)
    annotation (Line(points={{10,40},{20,40},{20,10}}, color={0,0,255}));
  connect(ground.p, inductor.n)
    annotation (Line(points={{0,-40},{-60,-40},{-60,-10}}, color={0,0,255}));
  connect(ground.p, capacitor2.n)
    annotation (Line(points={{0,-40},{-20,-40},{-20,-10}}, color={0,0,255}));
  connect(ground.p, capacitor1.n)
    annotation (Line(points={{0,-40},{20,-40},{20,-10}}, color={0,0,255}));
  connect(resistor.n, memristor.p)
    annotation (Line(points={{10,40},{60,40},{60,10}}, color={0,0,255}));
  connect(ground.p, memristor.n)
    annotation (Line(points={{0,-40},{60,-40},{60,-10}}, color={0,0,255}));
  connect(inductor.p, resistor.p)
    annotation (Line(points={{-60,10},{-60,40},{-10,40}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ChuasCircuit\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-100,100},{100,68}},
          textColor={0,0,255},
          textString="Path to chaos: R = {1800, 1850, 1900, 1950, 2000} Ohm"),
                      Line(
          points={{-10,34},{10,46}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end IdealCircuit;
